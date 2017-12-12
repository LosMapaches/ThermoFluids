%% Flume Experiments

format compact
format short
close all
clear
clc

%% Data

% Data is arranged as q [mbar] V_ref [m/s] Apla [deg] AF/AF2 [N] PM/YM
% [N-cm] P[mbar]
load('AverageOfData.mat')
NonConstant80UncertaintiesImport=std(NonConstant80);
Constant80UncertaintiesImport=std(Constant80);
NonConstant100UncertaintiesImport=std(NonConstant100);
Constant100UncertaintiesImport=std(Constant100);
FlapNonConstant80UncertaintiesImport=std(FlapNonConstant80);
SlatFlapNonConstant80UncertaintiesImport=std(SlatFlapNonConstant80);

% Other Parameters
FlapAngle=45; %[deg]
FlapAngleUncertainty=.5; %[deg]

SlatDisplacement=3/16*.0254; %[m]
SlatDisplacementUncertainty=.0001*.0254; %[m]

Span=25e-2; %[m]
SpanUncertainty=.1e-2; %[m]

Chord=9e-2; %[m]
ChordUncertainty=.1e-2; %[m]

MU=1.73*10^-5;
MUUncertainty=0.01*10^-5;

RHO=1.225;
RHOUncertainty=.001;

%% Saving

save('OverallData.mat')