%% Reynolds_Experiment
format compact
format short
close all
clear
clc

%% Data Prior

Mu=1.15*10^-3;
MuError=0.01*10^-3;

Density=999;
DensityError=1;

D_Pipe=.7545*.0254;

DistanceError=.001*.0254;

VolumeError=2*1e-6;

TimeError=.25;


%% Data Experiment

% Measurements FLow (Broken Tube)
Lengths=[58, 5]*.0254; %[m]
Times=[12.77, 5.5]; %[s]
Volumes=[58, 56]*1e-6; %[m^3]

%% Equations

% Area
syms d
area=(pi/4)*d^2

% Volume Flow Rate
syms V T
volumeflowrate=V./T;

% Fluid Velocity
syms Q D
velocity=Q/D;

% Reynold's Number
syms V d p u
reynold=V.*d.*p./u;

%% Analysis

% Pipe crossectional area
for k=1:length(Times)
    Area{k}=PropError(area,[d],[D_Pipe],[DistanceError]);
end

% Volume Flow Rate [m^3/s]
for k=1:length(Times)
    VolumeFlowRate{k}=PropError(volumeflowrate,[V T],[Volumes(k) Times(k)],[VolumeError TimeError]);
end

% Flow Velocity [m/s]
for k=1:length(Times)
    Velocity{k}=PropError(velocity,[Q D],[VolumeFlowRate{k}{1,1} Area{k}{1,1}],[VolumeFlowRate{k}{1,3} Area{k}{1,3}]);
end

% Reynold's Number
for k=1:length(Times)
    Reynold{k}=PropError(reynold,[V d p u],[Velocity{k}{1,1} D_Pipe Density Mu],[Velocity{k}{1,3} DistanceError DensityError MuError]);
end

%% Plots

hold on
for k=1:length(Times)
    errorbar(Lengths(k),Reynold{k}{1,1},Reynold{k}{1,3},'*r','MarkerEdgeColor','blue','MarkerFaceColor','blue')
    Lengths(k)
    Reynold{k}
end

grid minor
grid on
xlabel('Length of Laminar Flow [m]')
ylabel('Reynolds Number [-]')

saveas(1,'Reynolds_Experiment.png')















