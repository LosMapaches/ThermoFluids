%% Rankine Cycle Parameters

format compact
format short
close all
clear
clc

%% Data Import
% The header are as follows:
% Time (sec)	Boiler Temperature (C)	Turbine Inlet Temp (C)	Turbine Exit Temp (C)	Boiler Pressure (PSIG)	Turbine Inlet Pres (PSIG)	Turbine Exit Pres (PSIG)	Fuel Flow (L/min)	Generator (RPM)	Voltage (Volts)	Current (Amps)	Power (Watts)

Import1=xlsread('data/Rankine_1.xlsx');
Import2=xlsread('data/Rankine_2.xlsx');
Import3=xlsread('data/Rankine_3.xlsx');
Import4=xlsread('data/Rankine_4.xlsx');

% I converted [C] to [K], [PSIG] to [Pa], [L/min] to [m^3/sec], [RPM] to
% [rad/sec] Ignore these units
% I also added atmospheric pressure to the pressures
Rankine1=[Import1(4:end,1) Import1(4:end,2) Import1(4:end,3) Import1(4:end,4) Import1(4:end,5)*6.89476+74.7040 Import1(4:end,6)*6.89476+74.7040 Import1(4:end,7)*6.89476+74.7040 Import1(4:end,8)*1.66667e-5 Import1(4:end,9)*9.54929659643^-1 Import1(4:end,10) Import1(4:end,11) Import1(4:end,12)];
Rankine2=[Import2(4:end,1) Import2(4:end,2) Import2(4:end,3) Import2(4:end,4) Import2(4:end,5)*6.89476+74.7040 Import2(4:end,6)*6.89476+74.7040 Import2(4:end,7)*6.89476+74.7040 Import2(4:end,8)*1.66667e-5 Import2(4:end,9)*9.54929659643^-1 Import2(4:end,10) Import2(4:end,11) Import2(4:end,12)];
Rankine3=[Import3(4:end,1) Import3(4:end,2) Import3(4:end,3) Import3(4:end,4) Import3(4:end,5)*6.89476+74.7040 Import3(4:end,6)*6.89476+74.7040 Import3(4:end,7)*6.89476+74.7040 Import3(4:end,8)*1.66667e-5 Import3(4:end,9)*9.54929659643^-1 Import3(4:end,10) Import3(4:end,11) Import3(4:end,12)];
Rankine4=[Import4(4:end,1) Import4(4:end,2) Import4(4:end,3) Import4(4:end,4) Import4(4:end,5)*6.89476+74.7040 Import4(4:end,6)*6.89476+74.7040 Import4(4:end,7)*6.89476+74.7040 Import4(4:end,8)*1.66667e-5 Import4(4:end,9)*9.54929659643^-1 Import4(4:end,10) Import4(4:end,11) Import4(4:end,12)];

%% Saving
save('DataImport.mat','Rankine1','Rankine2','Rankine3','Rankine4')