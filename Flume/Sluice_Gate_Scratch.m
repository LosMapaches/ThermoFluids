% Line Fittings
FitOrder=2;
for K=1:length(H(1,:))
    x1(K)=Tube_Pressure1{K}{1,1};
    x2(K)=Tube_Pressure2{K}{1,1};
    x3(K)=Tube_Pressure3{K}{1,1};
end
[P1 S1]=polyfit(TubeHeightsFromBottom+Openings(1),x1,FitOrder);
[P2 S2]=polyfit(TubeHeightsFromBottom+Openings(2),x2,FitOrder);
[P3 S3]=polyfit(TubeHeightsFromBottom+Openings(3),x3,FitOrder);

NumberofLines=100;
h1=linspace(min(TubeHeightsFromBottom)+Openings(1),max(TubeHeightsFromBottom)+Openings(1),NumberofLines);
PressureFit1=P1(1).*h1.^2+P1(2).*h1.^1+P1(3).*h1.^0;

h2=linspace(min(TubeHeightsFromBottom)+Openings(2),max(TubeHeightsFromBottom)+Openings(2),NumberofLines);
PressureFit2=P2(1).*h2.^2+P2(2).*h2.^1+P2(3).*h2.^0;

h3=linspace(min(TubeHeightsFromBottom)+Openings(3),max(TubeHeightsFromBottom)+Openings(3),NumberofLines);
PressureFit3=P3(1).*h3.^2+P3(2).*h3.^1+P3(3).*h3.^0;

for K=1:length(H(1,:))
    Force1(K)=Tube_Pressure1{K}{1,1}*(WaterLevel-Openings(1))*TubeDiameter
end

fun1 = @(h1) (P1(1).*h1.^2+P1(2).*h1.^1+P1(3).*h1.^0)*D1
q1 = integral(fun1,Openings(1),WaterLevel)

fun2 = @(h1) (P2(1).*h1.^2+P2(2).*h1.^1+P2(3).*h1.^0)*D1
q2 = integral(fun2,Openings(2),WaterLevel)

fun3 = @(h1) (P3(1).*h1.^2+P3(2).*h1.^1+P3(3).*h1.^0)*D1
q3 = integral(fun3,Openings(3),WaterLevel)


% Run 1 Pressures
figure
hold on
for K=1:length(H(1,:))
    ErrorPlot1=herrorbar(Tube_Pressure1{K}{1,1},TubeHeightsFromBottom(K)+Openings(1),Tube_Pressure1{K}{1,3},'r*');
end
fitplot1=plot(PressureFit1,h1);
grid minor
grid on
xlabel('Tube Pressures [Pa]')
ylabel('Height from Bed [m]')
% legend([ErrorPlot1 fitplot1 ],{'Data','Fit'},'Location','Best')

% Run 2 Pressures
figure
hold on
for K=1:length(H(1,:))
    ErrorPlot2=errorbar(TubeHeightsFromBottom(K)+Openings(2),Tube_Pressure2{K}{1,1},Tube_Pressure2{K}{1,3},'r*');
end
fitplot2=plot(h2,PressureFit2);
grid minor
grid on
ylabel('Tube Pressures [Pa]')
xlabel('Height from Bed [m]')
legend([ErrorPlot2 fitplot2 ],{'Data','Fit'},'Location','Best')

% Run 3 Pressures
figure
hold on
for K=1:length(H(1,:))
    ErrorPlot3=errorbar(TubeHeightsFromBottom(K)+Openings(3),Tube_Pressure3{K}{1,1},Tube_Pressure3{K}{1,3},'r*');
end
fitplot3=plot(h3,PressureFit3);
grid minor
grid on
ylabel('Tube Pressures [Pa]')
xlabel('Height from Bed [m]')
legend([ErrorPlot3 fitplot3 ],{'Data','Fit'},'Location','Best')


