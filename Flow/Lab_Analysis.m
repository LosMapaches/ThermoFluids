%% Conduction Heat Transfer Lab

format compact
format long
close all
clear
clc

%% Data

load('Data')

%% Equations

% Cross-Sectional Area
syms area r
area=pi.*r.^2;

% Volume Flow Rate
syms A1 A2 P1 P2 rho
Q=A1*(2/rho.*(P1-P2)./((A1/A2).^2-1)).^(1/2);

%% Pipe Crossectional Areas [m^3]

AreaVenturi1Small=PropError(area,[r],[DiameterVenturi1Small/2],[DiameterError]);
AreaVenturi1Large=PropError(area,[r],[DiameterVenturi1Large/2],[DiameterError]);
AreaVenturi2Small=PropError(area,[r],[DiameterVenturi2Small/2],[DiameterError]);
AreaVenturi2Large=PropError(area,[r],[DiameterVenturi2Large/2],[DiameterError]);
AreaPipe=PropError(area,[r],[DiameterPipe/2],[DiameterError]);

%% Volume Flow Rate [m^3/sec]

QTheoretical1=PropError(Q,[A1 A2 P1 P2 rho],[AreaVenturi1Small{1} AreaVenturi1Large{1} p1(1) p2(1) density],[AreaVenturi1Small{3} AreaVenturi1Large{3} PressureError PressureError desnityError]);