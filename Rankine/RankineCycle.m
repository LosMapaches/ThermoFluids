%% Rankine Cycle Data Import

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

Rankine1=Import1(4:end,:);
Rankine2=Import2(4:end,:);
Rankine3=Import3(4:end,:);
Rankine4=Import4(4:end,:);