%% Flume Experiments

format compact
format short
close all
clear
clc

%% Data Prior

Gravity=9.79376;
GravityError=.01;

Mu=1.15*10^-3;
MuError=0.01*10^-3;

Density=999;
DensityError=1;

D_Pipe=.7545*.0254;

DistanceError=.001*.0254;

% Pitote tube distance from vertical front part of obstacle to the tip of
% pitot
D1=25/100; % Dominated by eddi currents
D2=43/100;% Other spot

%% Data Experiment

% Velocity Profile – Pitot Static Tube Eddy dominated
DistanceDown1=[5.00, 10, 15, 20.01, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75]/1000;
right1=[.51, .48, .42, .37, .32, .27, .23, .22, .215, .205, .195, .195, .19, .195, .195]*.0254/12;
left1=[.21, .21, .21, .21, .21, .21, .2, .215, .205, .205, .205, .205, .2, .205, .205]*.0254/12;
Pressure_Change1=abs(right1-left1);

% Run 2
DistanceDown2=[5.00, 10, 15, 20.01, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80]/1000;
right2=[.255,.26,.265,.25,.25,.235,.235,.23,.22,.22,.21,.215,.215,.21,.21,.21]*.0254/12;
left2=[.2,.205,.205,.205,.21,.21,.21,.205,.205,.205,.2,.21,.21,.21,.21,.215]*.0254/12;
Pressure_Change2=abs(right2-left2);

% Eliminating Bad value
Pressure_Change1=Pressure_Change1(find(Pressure_Change1~=0));
DistanceDown1=DistanceDown1(find(Pressure_Change1~=0));
Pressure_Change2=Pressure_Change2(find(Pressure_Change2~=0));
DistanceDown2=DistanceDown2(find(Pressure_Change2~=0));

Pressure_Change_Error=.01.*(.0254/12);
h1=55/1000; %[m]
h2=50/1000;

%% Equations

% Flow Velocity
syms rho dh
flowvelocity=((2./rho).*(dh)).^(1/2);

% Reynold's Number
syms  v d rho mu
Re=v.*d.*rho./mu;

%% Analysis 1

% Flow Velocity
for K=1:length(Pressure_Change1)
    FlowVelocities{K}=PropError(flowvelocity,[rho dh],[Density Pressure_Change1(K)],[GravityError Pressure_Change_Error]);
end

%% Plots
figure
hold on
for K=1:length(Pressure_Change1)
    herrorbar(FlowVelocities{K}{1,1},DistanceDown1(K),FlowVelocities{K}{1,3},'*b')
end

grid minor
grid on
xlabel('Flow Velocity [m/s]')
ylabel('Height from Bed [m]')

saveas(1,'Velocity_Profile_Pitote_Static_Tube.png')

%% Analysis 2

% Flow Velocity
for K=1:length(Pressure_Change2)
    FlowVelocities2{K}=PropError(flowvelocity,[rho dh],[Density Pressure_Change2(K)],[GravityError Pressure_Change_Error]);
end

%% Plots
figure
hold on
for K=1:length(Pressure_Change2)
    herrorbar(FlowVelocities2{K}{1,1},DistanceDown2(K),FlowVelocities2{K}{1,3},'*b')
end

grid minor
grid on
xlabel('Flow Velocity [m/s]')
ylabel('Height from Bed [m]')

saveas(2,'Velocity_Profile_Pitote_Static_Tube2.png')