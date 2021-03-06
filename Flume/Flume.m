%% Flume Experiments

format compact
format short
close all
clear
clc

%% Data

gravity=9.79376;
gravityError=.01;

mu=1.15*10^-3;
muError=0.01*10^-3;

density=999;
desnityError=1;

KLarge=.8139*.0254;
DPipingLarge=3.042*.0254;
dOrificeLarge=2.375*.0254;

KSmall=.8139*.0254;
DPipingSmall=3.042*.0254;
dOrificeSmall=2.375*.0254;

dPipe=.7545*.0254;

DistanceError=.001*.0254;

KError=.0001*.0254;

% dh=[1].*.0254/12;
DHError=.001;

% Measurements FLow (Broken Tube)
Lengths=[58, 5]*.0254; %[m]
Times=[12.77, 5.5]; %[s]
Volumes=[58, 56]*1e-6; %[m^3]

% Velocity Profile � Pitot Static Tube
DistanceDown=[5.00, 10, 20.01, 25, 30, 35, 40, 45, 50, 5, 60, 65, 70, 75]/1000;
right=[.51, .48, .42, .37, .32, .27, .23, .22, .215, .205, .195, .195, .19, .195, .195]*.0254/12;
left=[.21, .21, .21, .21, .21, .21, .2, .215, .205, .205, .205, .205, .2, .205, .205]*.0254/12;
dh=abs(right-left);
h=55/1000; %[m]


% Open Channel Flow Metering Using a Vee Notched Wier
Time=[2.45, 1.63, 1.3, 1.21, 1.15]; %[s]
Volume=[206, 198, 210, 236, 228+126]*1e-6; %[m^3];
H=[16.43, 0, 21.54, 22.92, 204.65]/1000; % Zero value needs linear intepolation
y=[193.82, 0, 198.93, 200.31, 204.65]/1000; % Bottom to water level
right=[.95, .95, .945, .945, .945]*.0254/12;
left=[.95, .945, .945, .945, .95]*.0254/12;

% Sluice Gate
H=[.185 .28 .205 .3 .265 .305 .31 .305 0; .135 .21 .24 .17 .27 .23 .275 .28 .26; .14 .18 .2 .16 .25 .205 .23 .23 0]*.0254/12 % Tube Measurements from the right to the left. down to up % zeros are place holders
% each row is correspond the following heights [m]
Openings=[.562 1.17 1.68]'*.0254 %[m]
WaterLevel=[109.8]/1000 %[m]

%% Equations

syms DH V d MU g Qrate K D rho
Q=(K.*sqrt(2.*g.*DH).*pi.*D.^2)./4;
% QLarge=(KLarge.*sqrt(2.*g.*DH).*pi.*DPipingLarge.^2)./4;
% QSmall=(KSmall.*sqrt(2.*g.*DH).*pi.*DPipingSmall.^2)./4;
Re=V.*d.*rho./MU;
Velocity=Qrate./d;
% 
% %% Analysis
% 
% % Flow Rates
% for i=1:length(dh)
%     FlowRates{i}=PropError(Q,[K g D DH],[KLarge gravity dOrificeLarge dh(i)],[KError gravityError DistanceError DHError]);
% end
% 
% % Flow Velocity
% for i=1:length(dh)
%     FlowVelocity{i}=PropError(Velocity,[Qrate d],[FlowRates{i}{1,1} dPipe],[FlowRates{i}{1,3} DistanceError]);
% end
% 
% 
% % Reynold's Numbers
% for i=1:length(dh)
%     Reynolds{i}=PropError(Re,[V d MU rho],[FlowVelocity{i}{1,1} dPipe mu density],[FlowVelocity{i}{1,3} DistanceError muError densityError]);
% end

