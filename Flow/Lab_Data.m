%% Conduction Heat Transfer Lab

format compact
format long
close all
clear
clc

%% Given

mu=1.15*10^-3;
muError=0.01*10^-3;

temperature=15+273.15;
temperatureError=1;

density=999;
desnityError=1;

DiameterVenturi1Small=.828*.0254;
DiameterVenturi1Large=2.009*.0254;
DiameterVenturi2Small=.828*.0254;
DiameterVenturi2Large=.85*.0254;
DiameterPipe=0.0209296;
DiameterError=.001;

%% Data from pressure guages

p1=[81500
79400
79288
80941
81469.65
80847.1
80903.82
81369.62264
81357.23127
81586.5416
82275.38336
81921.1093
114234.5188
98961.33768
96017.01689
];

p2=[81300
79300
79074
80940
81469.1
80833.835
80894.91
81312.26415
81304.39739
81507.12887
82253.80098
81174.97553
104123.0995
93318.84176
91310.28143
];

PressureError=100;

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