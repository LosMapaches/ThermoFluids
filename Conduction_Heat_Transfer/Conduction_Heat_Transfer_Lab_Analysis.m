%% Conduction Heat Transfer Lab

format compact
format long
close all
clear
clc

%% Data

load('Data')

%% Equations

% Power
syms P I V
P=I.*V;

% Cross-Sectional Area
syms area r
area=pi.*r.^2;

% Thermal Conductivity
syms q a temp1 temp2 point1 point2
k=-q./a.*((temp2-temp1)./(point2-point1)).^-1;

% Overal Heat Transfer
syms X1 X2 X3 K1 K2 K3 R1 R2
Q=-(temp2-temp1)./(X1./(K1.*a)+X2./(K2.*a)+X3./(K3.*a)+R1+R2);

%% Area

Area=PropError(area,[r],[Diameter/2],[Diameter_error]);

%% Heat Transfer

q_dot = PropError(P,[I V],[Current,Voltage],[Current_error,Voltage_error]);

%% Thermal Contact Resistance

Thermal_Resistance=abs(temp1-temp2)./q;

%% Control without thermal paste

% Temperature Errors
% This value was taken as the difference between the last good temperature
% reading and the twentyeth value from that point 

for i=1:6
Control_no_Paste_Temperature_error(i)=abs(Control_no_Paste(length(Control_no_Paste),i+1)-Control_no_Paste(length(Control_no_Paste)-20,i+1));
end

Slope_Control_no_Paste_Temperature=Control_no_Paste_Temperature_error/40;

% Graph Points

Table_Control_no_Paste=[...
    p1 Control_no_Paste(length(Control_no_Paste),2);...
    p2 Control_no_Paste(length(Control_no_Paste),3);...
    p3 Control_no_Paste(length(Control_no_Paste),4);...
    p4 Control_no_Paste(length(Control_no_Paste),5);...
    p5 Control_no_Paste(length(Control_no_Paste),6);...
    p6 Control_no_Paste(length(Control_no_Paste),7);...
    ];

Table_Control_no_Paste_fit1=polyfit(Table_Control_no_Paste(1:2,1),Table_Control_no_Paste(1:2,2),1);
Table_Control_no_Paste_line1=@(x) Table_Control_no_Paste_fit1(1)*x+Table_Control_no_Paste_fit1(2);

Table_Control_no_Paste_fit2=polyfit(Table_Control_no_Paste(3:4,1),Table_Control_no_Paste(3:4,2),1);
Table_Control_no_Paste_line2=@(x) Table_Control_no_Paste_fit2(1)*x+Table_Control_no_Paste_fit2(2);

Table_Control_no_Paste_fit3=polyfit(Table_Control_no_Paste(5:6,1),Table_Control_no_Paste(5:6,2),1);
Table_Control_no_Paste_line3=@(x) Table_Control_no_Paste_fit3(1)*x+Table_Control_no_Paste_fit3(2);

Figure_Control_no_Paste=figure;
hold on
errorbar(Table_Control_no_Paste(:,1),Table_Control_no_Paste(:,2),Control_no_Paste_Temperature_error,'*b')

fplot(Table_Control_no_Paste_line1,[0 x1],'--r')
line([x1 x1], [0 Table_Control_no_Paste_line1(x1)],'Color','k')

fplot(Table_Control_no_Paste_line2,[x1 x1+x2],'--r')
line([x1+x2 x1+x2], [0 Table_Control_no_Paste_line2(x1+x2)],'Color','k')

fplot(Table_Control_no_Paste_line3,[x1+x2 x1+x2+x3],'--r')
line([x1+x2+x3 x1+x2+x3], [0 Table_Control_no_Paste_line3(x1+x2+x3)],'Color','k')

legend('Data','1^{st} Order Fit','Interfaces','Location','Best')
ylabel('Temperature [^{\circ}C]')
xlabel('Distance [m]')
grid minor
grid on
hold off

% k factor

k_Control_no_Paste_line1= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_Control_no_Paste(1,2),Table_Control_no_Paste(2,2),Table_Control_no_Paste(1,1),Table_Control_no_Paste(2,1)],[q_dot{1,3},Area{1,3},Control_no_Paste_Temperature_error(1),Control_no_Paste_Temperature_error(2),p1_error,p2_error]);
k_Control_no_Paste_line2= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_Control_no_Paste(3,2),Table_Control_no_Paste(4,2),Table_Control_no_Paste(3,1),Table_Control_no_Paste(4,1)],[q_dot{1,3},Area{1,3},Control_no_Paste_Temperature_error(3),Control_no_Paste_Temperature_error(4),p3_error,p4_error]);
k_Control_no_Paste_line3= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_Control_no_Paste(5,2),Table_Control_no_Paste(6,2),Table_Control_no_Paste(5,1),Table_Control_no_Paste(6,1)],[q_dot{1,3},Area{1,3},Control_no_Paste_Temperature_error(5),Control_no_Paste_Temperature_error(6),p5_error,p6_error]);

% Thermal contact resistance

Control_no_Paste_Thermal_Resitance1=PropError(Thermal_Resistance,[temp1,temp2,q],[Table_Control_no_Paste_line1(x1),Table_Control_no_Paste_line2(x1),q_dot{1,1}],[Control_no_Paste_Temperature_error(2),Control_no_Paste_Temperature_error(3),q_dot{1,3}]);
Control_no_Paste_Thermal_Resitance2=PropError(Thermal_Resistance,[temp1,temp2,q],[Table_Control_no_Paste_line2(x1+x2),Table_Control_no_Paste_line3(x1+x2),q_dot{1,1}],[Control_no_Paste_Temperature_error(4),Control_no_Paste_Temperature_error(5),q_dot{1,3}]);

% Overall Heat Transfer

Control_no_Paste_Q_with_R=PropError(Q,[a,temp1,temp2,K1,K2,K3,X1,X2,X3,R1,R2],[Area{1,1},Table_Control_no_Paste(1,2),Table_Control_no_Paste(6,2),k_Control_no_Paste_line1{1,1},k_Control_no_Paste_line2{1,1},k_Control_no_Paste_line3{1,1},x1,x2,x3,Control_no_Paste_Thermal_Resitance1{1,1},Control_no_Paste_Thermal_Resitance2{1,1}],[Area{1,3},Control_no_Paste_Temperature_error(1),Control_no_Paste_Temperature_error(6),k_Control_no_Paste_line1{1,3},k_Control_no_Paste_line2{1,3},k_Control_no_Paste_line3{1,3},x1_error,x2_error,x3_error,Control_no_Paste_Thermal_Resitance1{1,3},Control_no_Paste_Thermal_Resitance2{1,3}]);
Control_no_Paste_Q_without_R=PropError(Q,[a,temp1,temp2,K1,K2,K3,X1,X2,X3,R1,R2],[Area{1,1},Table_Control_no_Paste(1,2),Table_Control_no_Paste(6,2),k_Control_no_Paste_line1{1,1},k_Control_no_Paste_line2{1,1},k_Control_no_Paste_line3{1,1},x1,x2,x3,0,0],[Area{1,3},Control_no_Paste_Temperature_error(1),Control_no_Paste_Temperature_error(6),k_Control_no_Paste_line1{1,3},k_Control_no_Paste_line2{1,3},k_Control_no_Paste_line3{1,3},x1_error,x2_error,x3_error,Control_no_Paste_Thermal_Resitance1{1,3},Control_no_Paste_Thermal_Resitance2{1,3}]);

%% Control with thermal paste on both sides

% Temperature Errors
% This value was taken as the difference between the last good temperature
% reading and the twentyeth value from that point 

for i=1:6
Control_2_Paste_Temperature_error(i)=abs(Control_2_Paste(length(Control_2_Paste),i+1)-Control_2_Paste(length(Control_2_Paste)-20,i+1));
end

Slope_Control_2_Paste_Temperature=Control_2_Paste_Temperature_error/40;

% Graph Points

Table_Control_2_Paste=[...
    p1 Control_2_Paste(length(Control_2_Paste),2);...
    p2 Control_2_Paste(length(Control_2_Paste),3);...
    p3 Control_2_Paste(length(Control_2_Paste),4);...
    p4 Control_2_Paste(length(Control_2_Paste),5);...
    p5 Control_2_Paste(length(Control_2_Paste),6);...
    p6 Control_2_Paste(length(Control_2_Paste),7);...
    ];

Table_Control_2_Paste_fit1=polyfit(Table_Control_2_Paste(1:2,1),Table_Control_2_Paste(1:2,2),1);
Table_Control_2_Paste_line1=@(x) Table_Control_2_Paste_fit1(1)*x+Table_Control_2_Paste_fit1(2);

Table_Control_2_Paste_fit2=polyfit(Table_Control_2_Paste(3:4,1),Table_Control_2_Paste(3:4,2),1);
Table_Control_2_Paste_line2=@(x) Table_Control_2_Paste_fit2(1)*x+Table_Control_2_Paste_fit2(2);

Table_Control_2_Paste_fit3=polyfit(Table_Control_2_Paste(5:6,1),Table_Control_2_Paste(5:6,2),1);
Table_Control_2_Paste_line3=@(x) Table_Control_2_Paste_fit3(1)*x+Table_Control_2_Paste_fit3(2);

Figure_Control_2_Paste=figure;
hold on
errorbar(Table_Control_2_Paste(:,1),Table_Control_2_Paste(:,2),Control_2_Paste_Temperature_error,'*b')

fplot(Table_Control_2_Paste_line1,[0 x1],'--r')
line([x1 x1], [0 Table_Control_2_Paste_line1(x1)],'Color','k')

fplot(Table_Control_2_Paste_line2,[x1 x1+x2],'--r')
line([x1+x2 x1+x2], [0 Table_Control_2_Paste_line2(x1+x2)],'Color','k')

fplot(Table_Control_2_Paste_line3,[x1+x2 x1+x2+x3],'--r')
line([x1+x2+x3 x1+x2+x3], [0 Table_Control_2_Paste_line3(x1+x2+x3)],'Color','k')

legend('Data','1^{st} Order Fit','Interfaces','Location','Best')
ylabel('Temperature [^{\circ}C]')
xlabel('Distance [m]')
grid minor
grid on
hold off

% k factor

k_Control_2_Paste_line1= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_Control_2_Paste(1,2),Table_Control_2_Paste(2,2),Table_Control_2_Paste(1,1),Table_Control_2_Paste(2,1)],[q_dot{1,3},Area{1,3},Control_2_Paste_Temperature_error(1),Control_2_Paste_Temperature_error(2),p1_error,p2_error]);
k_Control_2_Paste_line2= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_Control_2_Paste(3,2),Table_Control_2_Paste(4,2),Table_Control_2_Paste(3,1),Table_Control_2_Paste(4,1)],[q_dot{1,3},Area{1,3},Control_2_Paste_Temperature_error(3),Control_2_Paste_Temperature_error(4),p3_error,p4_error]);
k_Control_2_Paste_line3= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_Control_2_Paste(5,2),Table_Control_2_Paste(6,2),Table_Control_2_Paste(5,1),Table_Control_2_Paste(6,1)],[q_dot{1,3},Area{1,3},Control_2_Paste_Temperature_error(5),Control_2_Paste_Temperature_error(6),p5_error,p6_error]);

% Thermal contact resistance

Control_2_Paste_Thermal_Resitance1=PropError(Thermal_Resistance,[temp1,temp2,q],[Table_Control_2_Paste_line1(x1),Table_Control_2_Paste_line2(x1),q_dot{1,1}],[Control_2_Paste_Temperature_error(2),Control_2_Paste_Temperature_error(3),q_dot{1,3}]);
Control_2_Paste_Thermal_Resitance2=PropError(Thermal_Resistance,[temp1,temp2,q],[Table_Control_2_Paste_line2(x1+x2),Table_Control_2_Paste_line3(x1+x2),q_dot{1,1}],[Control_2_Paste_Temperature_error(4),Control_2_Paste_Temperature_error(5),q_dot{1,3}]);

% Overall Heat Transfer

Control_2_Paste_Q_with_R=PropError(Q,[a,temp1,temp2,K1,K2,K3,X1,X2,X3,R1,R2],[Area{1,1},Table_Control_2_Paste(1,2),Table_Control_2_Paste(6,2),k_Control_2_Paste_line1{1,1},k_Control_2_Paste_line2{1,1},k_Control_2_Paste_line3{1,1},x1,x2,x3,Control_2_Paste_Thermal_Resitance1{1,1},Control_2_Paste_Thermal_Resitance2{1,1}],[Area{1,3},Control_2_Paste_Temperature_error(1),Control_2_Paste_Temperature_error(6),k_Control_2_Paste_line1{1,3},k_Control_2_Paste_line2{1,3},k_Control_2_Paste_line3{1,3},x1_error,x2_error,x3_error,Control_2_Paste_Thermal_Resitance1{1,3},Control_2_Paste_Thermal_Resitance2{1,3}]);
Control_2_Paste_Q_without_R=PropError(Q,[a,temp1,temp2,K1,K2,K3,X1,X2,X3,R1,R2],[Area{1,1},Table_Control_2_Paste(1,2),Table_Control_2_Paste(6,2),k_Control_2_Paste_line1{1,1},k_Control_2_Paste_line2{1,1},k_Control_2_Paste_line3{1,1},x1,x2,x3,0,0],[Area{1,3},Control_2_Paste_Temperature_error(1),Control_2_Paste_Temperature_error(6),k_Control_2_Paste_line1{1,3},k_Control_2_Paste_line2{1,3},k_Control_2_Paste_line3{1,3},x1_error,x2_error,x3_error,Control_2_Paste_Thermal_Resitance1{1,3},Control_2_Paste_Thermal_Resitance2{1,3}]);

%% TS1

% Temperature Errors
% This value was taken as the difference between the last good temperature
% reading and the twentyeth value from that point 

for i=1:6
TS1_Temperature_error(i)=abs(TS1(length(TS1),i+1)-TS1(length(TS1)-20,i+1));
end

Slope_TS1_Temperature=TS1_Temperature_error/40;

% Graph Points

Table_TS1=[...
    p1 TS1(length(TS1),2);...
    p2 TS1(length(TS1),3);...
    p3 TS1(length(TS1),4);...
    p4 TS1(length(TS1),5);...
    p5 TS1(length(TS1),6);...
    p6 TS1(length(TS1),7);...
    ];

Table_TS1_fit1=polyfit(Table_TS1(1:2,1),Table_TS1(1:2,2),1);
Table_TS1_line1=@(x) Table_TS1_fit1(1)*x+Table_TS1_fit1(2);

Table_TS1_fit2=polyfit(Table_TS1(3:4,1),Table_TS1(3:4,2),1);
Table_TS1_line2=@(x) Table_TS1_fit2(1)*x+Table_TS1_fit2(2);

Table_TS1_fit3=polyfit(Table_TS1(5:6,1),Table_TS1(5:6,2),1);
Table_TS1_line3=@(x) Table_TS1_fit3(1)*x+Table_TS1_fit3(2);

Figure_TS1=figure;
hold on
errorbar(Table_TS1(:,1),Table_TS1(:,2),TS1_Temperature_error,'*b')

fplot(Table_TS1_line1,[0 x1],'--r')
line([x1 x1], [0 Table_TS1_line1(x1)],'Color','k')

fplot(Table_TS1_line2,[x1 x1+x2],'--r')
line([x1+x2 x1+x2], [0 Table_TS1_line2(x1+x2)],'Color','k')

fplot(Table_TS1_line3,[x1+x2 x1+x2+x3],'--r')
line([x1+x2+x3 x1+x2+x3], [0 Table_TS1_line3(x1+x2+x3)],'Color','k')

legend('Data','1^{st} Order Fit','Interfaces','Location','Best')
ylabel('Temperature [^{\circ}C]')
xlabel('Distance [m]')
grid minor
grid on
hold off

% k factor

k_TS1_line1= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_TS1(1,2),Table_TS1(2,2),Table_TS1(1,1),Table_TS1(2,1)],[q_dot{1,3},Area{1,3},TS1_Temperature_error(1),TS1_Temperature_error(2),p1_error,p2_error]);
k_TS1_line2= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_TS1(3,2),Table_TS1(4,2),Table_TS1(3,1),Table_TS1(4,1)],[q_dot{1,3},Area{1,3},TS1_Temperature_error(3),TS1_Temperature_error(4),p3_error,p4_error]);
k_TS1_line3= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_TS1(5,2),Table_TS1(6,2),Table_TS1(5,1),Table_TS1(6,1)],[q_dot{1,3},Area{1,3},TS1_Temperature_error(5),TS1_Temperature_error(6),p5_error,p6_error]);

% Thermal contact resistance

TS1_Thermal_Resitance1=PropError(Thermal_Resistance,[temp1,temp2,q],[Table_TS1_line1(x1),Table_TS1_line2(x1),q_dot{1,1}],[TS1_Temperature_error(2),TS1_Temperature_error(3),q_dot{1,3}]);
TS1_Thermal_Resitance2=PropError(Thermal_Resistance,[temp1,temp2,q],[Table_TS1_line2(x1+x2),Table_TS1_line3(x1+x2),q_dot{1,1}],[TS1_Temperature_error(4),TS1_Temperature_error(5),q_dot{1,3}]);

% Overall Heat Transfer

TS1_Q_with_R=PropError(Q,[a,temp1,temp2,K1,K2,K3,X1,X2,X3,R1,R2],[Area{1,1},Table_TS1(1,2),Table_TS1(6,2),k_TS1_line1{1,1},k_TS1_line2{1,1},k_TS1_line3{1,1},x1,x2,x3,TS1_Thermal_Resitance1{1,1},TS1_Thermal_Resitance2{1,1}],[Area{1,3},TS1_Temperature_error(1),TS1_Temperature_error(6),k_TS1_line1{1,3},k_TS1_line2{1,3},k_TS1_line3{1,3},x1_error,x2_error,x3_error,TS1_Thermal_Resitance1{1,3},TS1_Thermal_Resitance2{1,3}]);
TS1_Q_without_R=PropError(Q,[a,temp1,temp2,K1,K2,K3,X1,X2,X3,R1,R2],[Area{1,1},Table_TS1(1,2),Table_TS1(6,2),k_TS1_line1{1,1},k_TS1_line2{1,1},k_TS1_line3{1,1},x1,x2,x3,0,0],[Area{1,3},TS1_Temperature_error(1),TS1_Temperature_error(6),k_TS1_line1{1,3},k_TS1_line2{1,3},k_TS1_line3{1,3},x1_error,x2_error,x3_error,TS1_Thermal_Resitance1{1,3},TS1_Thermal_Resitance2{1,3}]);

%% TS2

% Temperature Errors
% This value was taken as the difference between the last good temperature
% reading and the twentyeth value from that point 

for i=1:6
TS2_Temperature_error(i)=abs(TS2(length(TS2),i+1)-TS2(length(TS2)-20,i+1));
end

Slope_TS2_Temperature=TS2_Temperature_error/40;

% Graph Points

Table_TS2=[...
    p1 TS2(length(TS2),2);...
    p2 TS2(length(TS2),3);...
    p3 TS2(length(TS2),4);...
    p4 TS2(length(TS2),5);...
    p5 TS2(length(TS2),6);...
    p6 TS2(length(TS2),7);...
    ];

Table_TS2_fit1=polyfit(Table_TS2(1:2,1),Table_TS2(1:2,2),1);
Table_TS2_line1=@(x) Table_TS2_fit1(1)*x+Table_TS2_fit1(2);

Table_TS2_fit2=polyfit(Table_TS2(3:4,1),Table_TS2(3:4,2),1);
Table_TS2_line2=@(x) Table_TS2_fit2(1)*x+Table_TS2_fit2(2);

Table_TS2_fit3=polyfit(Table_TS2(5:6,1),Table_TS2(5:6,2),1);
Table_TS2_line3=@(x) Table_TS2_fit3(1)*x+Table_TS2_fit3(2);

Figure_TS2=figure;
hold on
errorbar(Table_TS2(:,1),Table_TS2(:,2),TS2_Temperature_error,'*b')

fplot(Table_TS2_line1,[0 x1],'--r')
line([x1 x1], [0 Table_TS2_line1(x1)],'Color','k')

fplot(Table_TS2_line2,[x1 x1+x2],'--r')
line([x1+x2 x1+x2], [0 Table_TS2_line2(x1+x2)],'Color','k')

fplot(Table_TS2_line3,[x1+x2 x1+x2+x3],'--r')
line([x1+x2+x3 x1+x2+x3], [0 Table_TS2_line3(x1+x2+x3)],'Color','k')

legend('Data','1^{st} Order Fit','Interfaces','Location','Best')
ylabel('Temperature [^{\circ}C]')
xlabel('Distance [m]')
grid minor
grid on
hold off

% k factor

k_TS2_line1= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_TS2(1,2),Table_TS2(2,2),Table_TS2(1,1),Table_TS2(2,1)],[q_dot{1,3},Area{1,3},TS2_Temperature_error(1),TS2_Temperature_error(2),p1_error,p2_error]);
k_TS2_line2= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_TS2(3,2),Table_TS2(4,2),Table_TS2(3,1),Table_TS2(4,1)],[q_dot{1,3},Area{1,3},TS2_Temperature_error(3),TS2_Temperature_error(4),p3_error,p4_error]);
k_TS2_line3= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_TS2(5,2),Table_TS2(6,2),Table_TS2(5,1),Table_TS2(6,1)],[q_dot{1,3},Area{1,3},TS2_Temperature_error(5),TS2_Temperature_error(6),p5_error,p6_error]);

% Thermal contact resistance

TS2_Thermal_Resitance1=PropError(Thermal_Resistance,[temp1,temp2,q],[Table_TS2_line1(x1),Table_TS2_line2(x1),q_dot{1,1}],[TS2_Temperature_error(2),TS2_Temperature_error(3),q_dot{1,3}]);
TS2_Thermal_Resitance2=PropError(Thermal_Resistance,[temp1,temp2,q],[Table_TS2_line2(x1+x2),Table_TS2_line3(x1+x2),q_dot{1,1}],[TS2_Temperature_error(4),TS2_Temperature_error(5),q_dot{1,3}]);

% Overall Heat Transfer

TS2_Q_with_R=PropError(Q,[a,temp1,temp2,K1,K2,K3,X1,X2,X3,R1,R2],[Area{1,1},Table_TS2(1,2),Table_TS2(6,2),k_TS2_line1{1,1},k_TS2_line2{1,1},k_TS2_line3{1,1},x1,x2,x3,TS2_Thermal_Resitance1{1,1},TS2_Thermal_Resitance2{1,1}],[Area{1,3},TS2_Temperature_error(1),TS2_Temperature_error(6),k_TS2_line1{1,3},k_TS2_line2{1,3},k_TS2_line3{1,3},x1_error,x2_error,x3_error,TS2_Thermal_Resitance1{1,3},TS2_Thermal_Resitance2{1,3}]);
TS2_Q_without_R=PropError(Q,[a,temp1,temp2,K1,K2,K3,X1,X2,X3,R1,R2],[Area{1,1},Table_TS2(1,2),Table_TS2(6,2),k_TS2_line1{1,1},k_TS2_line2{1,1},k_TS2_line3{1,1},x1,x2,x3,0,0],[Area{1,3},TS2_Temperature_error(1),TS2_Temperature_error(6),k_TS2_line1{1,3},k_TS2_line2{1,3},k_TS2_line3{1,3},x1_error,x2_error,x3_error,TS2_Thermal_Resitance1{1,3},TS2_Thermal_Resitance2{1,3}]);

%% Averages

Average_k=[(k_Control_no_Paste_line1{1,1}+k_Control_no_Paste_line2{1,1}+k_Control_2_Paste_line2{1,1}+k_Control_no_Paste_line3{1,1}+k_Control_2_Paste_line1{1,1}+k_Control_2_Paste_line3{1,1}+k_TS1_line1{1,1}+k_TS1_line3{1,1}+k_TS2_line3{1,1}+k_TS1_line1{1,1})/10 {'+/-'} (k_Control_no_Paste_line1{1,3}+k_Control_no_Paste_line2{1,3}+k_Control_2_Paste_line2{1,3}+k_Control_no_Paste_line3{1,3}+k_Control_2_Paste_line1{1,3}+k_Control_2_Paste_line3{1,3}+k_TS1_line1{1,3}+k_TS1_line3{1,3}+k_TS2_line3{1,3}+k_TS1_line1{1,3})/10];

%% Effect of Slope on Error

% Temperature Errors
% This value was taken as the difference between the last good temperature
% reading and the tenth value from that point 

for i=1:6
Control_no_Paste_Temperature_error_10(i)=abs(Control_no_Paste(length(Control_no_Paste),i+1)-Control_no_Paste(length(Control_no_Paste)-10,i+1));
end

Slope_Control_no_Paste_Temperature_10=Control_no_Paste_Temperature_error/20;

% Graph Points

Table_Control_no_Paste_10=[...
    p1 Control_no_Paste(length(Control_no_Paste),2);...
    p2 Control_no_Paste(length(Control_no_Paste),3);...
    p3 Control_no_Paste(length(Control_no_Paste),4);...
    p4 Control_no_Paste(length(Control_no_Paste),5);...
    p5 Control_no_Paste(length(Control_no_Paste),6);...
    p6 Control_no_Paste(length(Control_no_Paste),7);...
    ];

k_Control_no_Paste_line1_10= PropError(k,[q,a,temp1,temp2,point1,point2],[q_dot{1,1},Area{1,1},Table_Control_no_Paste_10(1,2),Table_Control_no_Paste_10(2,2),Table_Control_no_Paste_10(1,1),Table_Control_no_Paste_10(2,1)],[q_dot{1,3},Area{1,3},Control_no_Paste_Temperature_error_10(1),Control_no_Paste_Temperature_error_10(2),p1_error,p2_error]);