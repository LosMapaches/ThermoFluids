%% Conduction Heat Transfer Lab

format compact
format long
close all
clear
clc

%% Data from Signal Express

% The known test section without thermal paste
Control_0_Paste_6061_ai0=xlsread('6061_control/Book6','01_31_2017 08_...DAQ1Mod1_ai0 1');
Control_0_Paste_6061_ai1=xlsread('6061_control/Book6','01_31_2017 08_...DAQ1Mod1_ai1 1');
Control_0_Paste_6061_ai2=xlsread('6061_control/Book6','01_31_2017 08_...DAQ1Mod1_ai2 1');
Control_0_Paste_6061_ai3=xlsread('6061_control/Book6','01_31_2017 08_...DAQ1Mod1_ai3 1');
Control_0_Paste_6061_ai4=xlsread('6061_control/Book6','01_31_2017 08_...DAQ1Mod1_ai4 1');
Control_0_Paste_6061_ai5=xlsread('6061_control/Book6','01_31_2017 08_...DAQ1Mod1_ai5 1');

% The known test section with thermal paste on both sides
Control_2_Paste_6061_ai0=xlsread('6061_control_Paste_Both_Sides/Book10','Thermocouple 1...DAQ1Mod1_ai0 1');
Control_2_Paste_6061_ai1=xlsread('6061_control_Paste_Both_Sides/Book10','Thermocouple 1...DAQ1Mod1_ai1 1');
Control_2_Paste_6061_ai2=xlsread('6061_control_Paste_Both_Sides/Book10','Thermocouple 1...DAQ1Mod1_ai2 1');
Control_2_Paste_6061_ai3=xlsread('6061_control_Paste_Both_Sides/Book10','Thermocouple 1...DAQ1Mod1_ai3 1');
Control_2_Paste_6061_ai4=xlsread('6061_control_Paste_Both_Sides/Book10','Thermocouple 1...DAQ1Mod1_ai4 1');
Control_2_Paste_6061_ai5=xlsread('6061_control_Paste_Both_Sides/Book10','Thermocouple 1...DAQ1Mod1_ai5 1');

% The first unkown section
TS1_ai0=xlsread('TS1/Book3','Thermocouple 1...DAQ1Mod1_ai0 1');
TS1_ai1=xlsread('TS1/Book3','Thermocouple 1...DAQ1Mod1_ai1 1');
TS1_ai2=xlsread('TS1/Book3','Thermocouple 1...DAQ1Mod1_ai2 1');
TS1_ai3=xlsread('TS1/Book3','Thermocouple 1...DAQ1Mod1_ai3 1');
TS1_ai4=xlsread('TS1/Book3','Thermocouple 1...DAQ1Mod1_ai4 1');
TS1_ai5=xlsread('TS1/Book3','Thermocouple 1...DAQ1Mod1_ai5 1');

% The second unkown section
TS2_ai0=xlsread('TS2/Book9','01_31_2017 10_...DAQ1Mod1_ai0 1');
TS2_ai1=xlsread('TS2/Book9','01_31_2017 10_...DAQ1Mod1_ai1 1');
TS2_ai2=xlsread('TS2/Book9','01_31_2017 10_...DAQ1Mod1_ai2 1');
TS2_ai3=xlsread('TS2/Book9','01_31_2017 10_...DAQ1Mod1_ai3 1');
TS2_ai4=xlsread('TS2/Book9','01_31_2017 10_...DAQ1Mod1_ai4 1');
TS2_ai5=xlsread('TS2/Book9','01_31_2017 10_...DAQ1Mod1_ai5 1');

% Data Sets [Seconds, Degree C, Degree C, Degree C, Degree C, Degree C, Degree C]
Control_no_Paste=[...
    Control_0_Paste_6061_ai0(:,1)...
    Control_0_Paste_6061_ai0(:,2)...
    Control_0_Paste_6061_ai1(:,2)...
    Control_0_Paste_6061_ai2(:,2)...
    Control_0_Paste_6061_ai3(:,2)...
    Control_0_Paste_6061_ai4(:,2)...
    Control_0_Paste_6061_ai5(:,2)...
    ];

Control_2_Paste=[...
    Control_2_Paste_6061_ai0(:,1)...
    Control_2_Paste_6061_ai0(:,2)...
    Control_2_Paste_6061_ai1(:,2)...
    Control_2_Paste_6061_ai2(:,2)...
    Control_2_Paste_6061_ai3(:,2)...
    Control_2_Paste_6061_ai4(:,2)...
    Control_2_Paste_6061_ai5(:,2)...
    ];

TS1=[...
    TS1_ai0(1:500,1)...
    TS1_ai0(1:500,2)...
    TS1_ai1(1:500,2)...
    TS1_ai2(1:500,2)...
    TS1_ai3(1:500,2)...
    TS1_ai4(1:500,2)...
    TS1_ai5(1:500,2)...
    ];

TS2=[...
    TS2_ai0(:,1)...
    TS2_ai0(:,2)...
    TS2_ai1(:,2)...
    TS2_ai2(:,2)...
    TS2_ai3(:,2)...
    TS2_ai4(:,2)...
    TS2_ai5(:,2)...
    ];

%% Gemoetry
% The heat source no contact side is used as the datum for the points
% Heat source length [m] and point location [m]
x1=8.89e-2;
x1_error=.01e-2;

p1=4.445e-2;
p1_error=.01e-2;

p2=p1+2.54e-2;
p2_error=.01e-2;

% Test speciment length [m] and point location [m]
x2=3.81e-2;
x2_error=.01e-2;

p3=p2+2.54e-2;
p3_error=.01e-2;

p4=p3+2*1.27e-2;
p4_error=.01e-2;

% Heat sink length [m] and point location [m]
x3=8.89e-2;
x3_error=.01e-2;

p5=p4+2.54e-2;
p5_error=.01e-2;

p6=p5+2.54e-2;
p6_error=.01e-2;

% Diameter of the rods used [m]
Diameter=3.175e-2;
Diameter_error=.01e-2;

%% Electrical
% Voltage Set [V]
Voltage=14.97;
Voltage_error=.01;

% Current [A]
Current=.804;
Current_error=.001;