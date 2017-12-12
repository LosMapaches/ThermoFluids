%% Flume Experiments

format compact
format short
close all
clear
clc

%% Data Prior

Gravity=9.79376;
GravityError=.01;

DistanceError=.001*.0254;

VolumeError=.0001*1e-4;

TimeError=.25;

Theta=90*pi/180;
ThetaError=.1;


%% Data Experiment

% Open Channel Flow Metering Using a Vee Notched Wier
Time=[2.45, 1.63, 1.3, 1.21, 1.15]; %[s]
Volume=[206, 198, 210, 236, 228+126]*1e-6; %[m^3];
H=[16.43, 0, 21.54, 22.92, 204.65]/1000; % Zero value needs linear intepolation
y=[193.82, 0, 198.93, 200.31, 204.65]/1000; % Bottom to water level
y(2)=(y(3)-y(1))/2+y(1);
H(2)=(H(3)-H(1))/2+H(1);
H(length(H))=H(length(H))-(y(1)-H(1));
right=[.95, .95, .945, .945, .945]*.0254/12;
left=[.95, .945, .945, .945, .95]*.0254/12;

%% Equations

% Volume Flow Rate
syms v t
volume_flow_rate=v./t;

% Volume Flow Rate for Vee Notched Wier
syms q g h theta
vee_notched_coefficient_of_discharge=q.*((8/15).*(2.*g).^(1/2).*tan(theta/2).*h.^(5/2)).^(-1);

%% Analysis

% Volume flow rate measured with graduated cylinder
for K=1:length(Volume)
    Experimental_Volume_Flow_Rate{K}=PropError(volume_flow_rate,[v t],[Volume(K) Time(K)],[VolumeError TimeError]);
end

% Volume from the vee notched weir

for K=1:length(Volume)
    Vee_Notched_Coefficient_of_Discharge{K}=PropError(vee_notched_coefficient_of_discharge,[q g h theta],[Experimental_Volume_Flow_Rate{K}{1,1} Gravity H(K) Theta],[Experimental_Volume_Flow_Rate{K}{1,3} GravityError DistanceError ThetaError]);
end

% Correlation coefficient for linearity
for K=1:length(Volume)
    Experimental_Volume_Flow_Rate_Value(K)=Experimental_Volume_Flow_Rate{K}{1,1};
end
Degree_of_Linearity=corrcoef(Experimental_Volume_Flow_Rate_Value,H);

% Average discharge coefficient
for K=1:length(Volume)
    Vee_Notched_Coefficient_of_Discharge_Value(K)=Vee_Notched_Coefficient_of_Discharge{K}{1,1};
    Vee_Notched_Coefficient_of_Discharge_Value_Error(K)=Vee_Notched_Coefficient_of_Discharge{K}{1,3};
end
Coefficient_of_Discharge=mean(Vee_Notched_Coefficient_of_Discharge_Value);
Coefficient_of_Discharge_Error=mean(Vee_Notched_Coefficient_of_Discharge_Value_Error);

%% Plots

% Plot for head versus discharge.
for K=1:length(Volume)
    x(K)=Experimental_Volume_Flow_Rate{K}{1,1};
    y(K)=H(K);
end
[P1 S1]=polyfit(x,y,2);
h1=linspace(min(x),max(x),100);
PressureFit1=P1(1).*h1.^2+P1(2).*h1.^1+P1(3).*h1.^0;
figure
hold on
for K=1:length(Volume)
    ErrorPlot1=herrorbar((Experimental_Volume_Flow_Rate{K}{1,1}),H(K),(Experimental_Volume_Flow_Rate{K}{1,3}),'*r')
end
fitplot1=plot(h1,PressureFit1,'b--')

grid minor
grid on
ylabel('Head [m]')
xlabel('Volumetric Flow Rate [m^{3}/s]')
legend([fitplot1],{'Fit'},'Location','Best')

saveas(1,'QvsH.png')

% Plot for correction coefficient and head.
figure
hold on
for K=1:length(Volume)
    errorbar(H(K),Vee_Notched_Coefficient_of_Discharge{K}{1,1},Vee_Notched_Coefficient_of_Discharge{K}{1,3},'*r','MarkerEdgeColor','blue','MarkerFaceColor','blue')
end

grid minor
grid on
xlabel('Head [m]')
ylabel('Coefficient of Discharge [-]')

saveas(2,'CdvsH.png')
