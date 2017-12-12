%% Flume Experiments

format compact
format short
close all
clear
clc

%% Data Prior

gravity=9.79376;
gravityError=.01;

mu=1.15*10^-3;
muError=0.01*10^-3;

Density=999;
DensityError=1;

Gamma=Density.*gravity;
GammaError=DensityError+gravityError;

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

% The width of the flume
D1=153/1000;

% Tube Diameter [m]
TubeDiameter=1.53/1000;

%% Data Experiment

% Sluice Gate
H=[ .41 .45 .52-.25 .5 .51 .52 .52 .52 .525 .55 .53;
    .41 .455 .48 .495 .51 .52 .52 .525 .5275 .53 .52]*.0254*12; % Tube Measurements from the right to the left. down to up % zeros are place holders
% each row is correspond the following heights [m]

TubeHeightsFromBottom=[.1 .2 .3 .5 1 1.5 2 2.5 3 4 5 6 7.5 9 10.5 12.5 14.5 16.5]*.0254; %[m]
TubeHeightsFromBottom=TubeHeightsFromBottom(1:length(H(1,:)));

Openings=[.01417 .01225];
OpeningsError=.01*.0254;
WaterLevel=[.18272 .18025];
WaterLevelError=1/1000;
HError=.0025*.0254*12;

%% Equations
syms rho g h
tube_energy=rho.*g.*h;

% Velocity 1
syms g y1 y2 
velocity1=(2.*g.*(y1-y2)./((y1./y2).^2-1)).^(1/2);

% Velocity 2
syms v1 y1 y2
velocity2=v1.*(y1./y2);

% Volumetric Flow Rate
syms v1 y1 b
Q=v1*y1*b;

% Momentum
syms gamma b y1 y2 rho q v2 v1
Fg=(1/2.*gamma.*b.*(y1.^2-y2.^2)-rho.*q.*(v2-v1));

%% Analysis
%% entrainment air
% The pressures given at each tube
for K=1:length(H(1,:))
    Tube_Pressure1{K}=PropError(tube_energy,[rho g h],[Density gravity H(1,K)],[DensityError gravityError HError]);
    Tube_Pressure2{K}=PropError(tube_energy,[rho g h],[Density gravity H(2,K)],[DensityError gravityError HError]);
    X1(K)=Tube_Pressure1{K}{1,1};
    Y1(K)=TubeHeightsFromBottom(K)+Openings(1);
    X2(K)=Tube_Pressure2{K}{1,1};
    Y2(K)=TubeHeightsFromBottom(K)+Openings(1);
end

% Velocities 1 for the different openings
for K=1:length(Openings)
    Velocity1{K}=PropError(velocity1,[g y1 y2],[gravity WaterLevel(K) Openings(K)],[gravityError WaterLevelError OpeningsError]);
end

% Velocities 2 for the different openings
for K=1:length(Openings)
    Velocity2{K}=PropError(velocity2,[v1 y1 y2],[Velocity1{K}{1,1} WaterLevel(K) Openings(K)],[Velocity1{K}{1,3} WaterLevelError OpeningsError]);
end

% Volumetric Flow Rate
for K=1:length(Openings)
    FlowRate{K}=PropError(Q,[v1 y1 b],[Velocity1{K}{1,1} WaterLevel(K) D1],[Velocity1{K}{1,3} WaterLevelError DistanceError]);
end

% Momentum for each of the setups Theoretical
for K=1:length(Openings)
    Momentum{K}=PropError(Fg,[gamma b y1 y2 rho q v2 v1],[Gamma D1 WaterLevel(K) Openings(K) Density FlowRate{K}{1,1} Velocity2{K}{1,1} Velocity1{K}{1,1}],[GammaError DistanceError WaterLevelError OpeningsError DensityError FlowRate{K}{1,3} Velocity2{K}{1,3} Velocity1{K}{1,3}]);
end

% Areas
(trapz(Y1,X1)*D1)
(trapz(Y2,X2)*D1)

%% Plots

% Run 1 Forces
figure
hold on
for K=1:length(H(1,:))
    ErrorPlot1=herrorbar(Tube_Pressure1{K}{1,1},TubeHeightsFromBottom(K)+Openings(1),Tube_Pressure1{K}{1,3},'r.');
end
grid minor
grid on
xlabel('Manometer Pressures [Pa]')
ylabel('Height from Bed [m]')

figure
hold on
for K=1:length(H(1,:))
    ErrorPlot1=herrorbar(Tube_Pressure2{K}{1,1},TubeHeightsFromBottom(K)+Openings(2),Tube_Pressure2{K}{1,3},'r.');
end
grid minor
grid on
xlabel('Manometer Pressures [Pa]')
ylabel('Height from Bed [m]')

saveas(1,'Height4.png')
saveas(2,'Height5.png')