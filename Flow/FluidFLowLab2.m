%% Fluid Flow Laboratory Experiment 2

format compact
format long
close all
clear
clc

%% Given

gravity=9.79376;
gravityerror=.01;

mu=1.15*10^-3;
muError=0.01*10^-3;

gamma=9810;
gammaError=1;

temperature=15+273.15;
temperatureError=1;

density=999;
desnityError=1;

DiameterVenturi1Small=.828*.0254;
DiameterVenturi1Large=2.009*.0254;
DiameterVenturi2Small=.828*.0254;
DiameterVenturi2Large=.85*.0254;
DiameterPipe=.824*.0254;
DiameterError=.001;

StraightLength=(25+7/8)*0.0254;
StraightLengthError=2/100;

ElbowLength=.68;
ElbowLengthError=2/100;

kconversion=.849;
kError=0;

RelativeRoughness=10^-6;

%% Given

% Elbow Pipe Section
ElbowVenturiDownstream=1000*[117.942813
    116.0358862
    111.3733821
    105.6546992
    99.6853268
    89.80943089
    80.16734959
    ];

ElbowVenturiUpstream=1000*[124.6664715
    122.4493984
    116.8325854
    110.1403415
    103.1803268
    91.55426016
    80.19456911
    ];

ElbowStraightUpstream=1000*[108.491561
    106.954813
    103.2601626
    98.71772358
    94.02027778
    85.92294309
    78.23354472
    ];

ElbowStraightDownstream=1000*[82.01139837
    81.65058537
    80.63107317
    79.49193496
    78.25361111
    76.24346341
    74.39513821
    ];

%% Equations

% Cross-Sectional Area
syms area r
area=pi.*r.^2;

% Volume Flow Rate
syms A1 A2 P1 P2 rho
QinTheory=A1.*(2./rho.*(P1-P2)./((A1./A2).^2-1)).^(1/2);
syms volume time
QinExperimental=volume./time;
syms slope intercept
QinTheoryCalibrated=slope.*(A1.*(2./rho.*(P1-P2)./((A1./A2).^2-1)).^(1/2))+intercept;

% Velocity
syms volumeflowrate A
Velocity=volumeflowrate/A;

% Reynold's Number
syms Vel D rho MU Rey
Reynold=Vel.*D.*rho./MU;
Velo=Rey.*MU./(rho.*D);

% Pressure Differential in Head [m]
syms specificweight
HeadChange=(P1-P2)./specificweight;

% Darcy-Weisbach
syms hl L d g v F
f=2.*hl.*d.*g./(L.*v.^2);
headlossf=F.*L.*v.^2./(2.*g.*d);

% Hydraulic Radius
syms Perimeter
Radius=A./Perimeter;

% Hazen-William
syms k R c
C=(v./(k.*R^.63)).*(L./hl).^(1/1.852);
headlossc=L.*(v./(k.*c.*R.^.63)).^1.852;

%% Pressure Losses in Head for Straight Section Runs

% Volume Flow Rate [m^3/sec]
for i=1:length(StraightStraightUpstream)
    QTheoretical2{i}=PropError(QinTheoryCalibrated,[A1 A2 P1 P2 rho slope intercept],[AreaVenturi1Large{1} AreaVenturi1Small{1} StraightVenturiUpstream(i) StraightVenturiDownstream(i) density fit(1) fit(2)],[AreaVenturi1Large{1,3} AreaVenturi1Small{1,3} PressureError PressureError desnityError 0 0]);
end

% Velocity [m/sec]
for i=1:length(StraightStraightUpstream)
    VExperimental2{i}=PropError(Velocity,[volumeflowrate A],[QTheoretical2{i}{1,1} AreaPipe{1,1}],[QTheoretical2{i}{1,3}  AreaPipe{1,3}]);
end

% Head Loss [m]
for i=1:length(StraightStraightUpstream)
    HeadLoss2{i}=PropError(HeadChange,[P1 P2 specificweight],[StraightStraightUpstream(i) StraightStraightDownstream(i) gamma],[PressureError PressureError gammaError]);
end

% Friction Factors
for i=1:length(StraightStraightUpstream)
    StraightFrictionFactor{i}=PropError(f,[hl L d g v],[HeadLoss2{i}{1,1} StraightLength DiameterPipe gravity VExperimental2{i}{1,1}],[HeadLoss2{i}{1,3} StraightLengthError DiameterError gravityerror VExperimental2{i}{1,3}]);
end

% HydraulicRadius
HydraulicRadius=PropError(Radius,[A Perimeter],[AreaPipe{1,1} pi*DiameterPipe],[AreaPipe{1,3} DiameterError]);

% Roughness Coefficient
for i=1:length(StraightStraightUpstream)
    StraightRoughnessCoefficient{i}=PropError(C,[hl L v k R],[HeadLoss2{i}{1,1} StraightLength VExperimental2{i}{1,1} kconversion HydraulicRadius{1,1}],[HeadLoss2{i}{1,3} StraightLengthError VExperimental2{i}{1,3} kError HydraulicRadius{1,3}]);
end

% Reynold's Number
for i=1:length(StraightStraightUpstream)
    ReynoldExperimental2{i}=PropError(Reynold,[Vel D rho MU],[VExperimental2{i}{1,1} DiameterPipe density mu],[VExperimental2{i}{1,3}  DiameterError desnityError muError]);
end