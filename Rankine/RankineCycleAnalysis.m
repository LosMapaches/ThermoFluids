%% Rankine Cycle Analysis

format compact
format short
close all
clear
clc

%% Data

load('DataImport.mat')
load('DataSelect.mat')

%% Analysis

%% Run 1

Ave_Power_1 = mean(Rankine1Cut(:,12))
std_Power_1 = std(Rankine1Cut(:,12))

Ave_Turbine_Inlet_Temp_1 = mean(Rankine1Cut(:,3))
std_Turbine_Inlet_Temp_1 = std(Rankine1Cut(:,3));
Ave_Turbine_Inlet_Press_1 = mean(Rankine1Cut(:,6))
std_Turbine_Inlet_Press_1 = std(Rankine1Cut(:,6));

Ave_Turbine_Exit_Temp_1 = mean(Rankine1Cut(:,4))
std_Turbine_Exit_Temp_1 = std(Rankine1Cut(:,4));
Ave_Turbine_Exit_Press_1 = (mean(Rankine1Cut(:,7)))
std_Turbine_Exit_Press_1 = std(Rankine1Cut(:,7));

Ave_Boiler_Press_1 = (mean(Rankine1Cut(:,5)))
std_Boiler_Press_1 = std(Rankine1Cut(:,5));
Ave_Boiler_Temp_1 = mean(Rankine1Cut(:,2))
std_Boiler_Temp_1 = std(Rankine1Cut(:,2));


%Enthalpys
h_boil_ex = 2844; %KJ/Kg
h2_inlet = 2690; %KJ/Kg
h3_exit = 2672; %KJ/Kg
mdot = Ave_Power_1/(h2_inlet-h3_exit)
%Boiler Heat Flow
QBOIL = (mdot*(h_boil_ex))
%Turbine Work Rate
WTURB = mdot*(h2_inlet-h3_exit)
%Generator Eff.
GenEFF = (Ave_Power_1/WTURB)*100
%SystemEFF
Sys_EFF = ((Ave_Power_1)/QBOIL)*100
%CarnotEFF
Carnot_EFF = ((Ave_Boiler_Temp_1 - 23)/Ave_Boiler_Temp_1)*100

%ERRORS
mdotERROR = sqrt(((1/(h2_inlet-h3_exit))^2*std_Power_1^2))
QBOILERROR = sqrt((h_boil_ex^2*mdotERROR^2))
WTURBERROR = sqrt((h2_inlet-h3_exit)^2*mdotERROR^2)
effERROR = sqrt(((1/QBOIL)^2*WTURBERROR^2) + ((WTURB/QBOIL^2)^2*QBOILERROR^2))

%% Run 2

Ave_Power_2 = mean(Rankine2Cut(:,12))
std_Power_2 = std(Rankine2Cut(:,12))

Ave_Turbine_Inlet_Temp_2 = mean(Rankine2Cut(:,3))
std_Turbine_Inlet_Temp_2 = std(Rankine2Cut(:,3));
Ave_Turbine_Inlet_Press_2 = mean(Rankine2Cut(:,6))
std_Turbine_Inlet_Press_2 = std(Rankine2Cut(:,6));

Ave_Turbine_Exit_Temp_2 = mean(Rankine2Cut(:,4))
std_Turbine_Exit_Temp_2 = std(Rankine2Cut(:,4));
Ave_Turbine_Exit_Press_2 = (mean(Rankine2Cut(:,7)))
std_Turbine_Exit_Press_2 = std(Rankine2Cut(:,7));

Ave_Boiler_Press_2 = (mean(Rankine2Cut(:,5)))
std_Boiler_Press_2 = std(Rankine2Cut(:,5));
Ave_Boiler_Temp_2 = mean(Rankine2Cut(:,2))
std_Boiler_Temp_2 = std(Rankine2Cut(:,2));


%Enthalpys
h_boil_ex2 = 2925; %KJ/Kg
h2_inlet2 = 2694; %KJ/Kg
h3_exit2 = 2678; %KJ/Kg
mdot2 = Ave_Power_2/(h2_inlet2-h3_exit2)
%Boiler Heat Flow
QBOIL2 = (mdot2*(h_boil_ex2))
%Turbine Work Rate
WTURB2 = mdot*(h2_inlet2-h3_exit2)
%Generator Eff.
GenEFF2 = (Ave_Power_2/WTURB2)*100
%SystemEFF
Sys_EFF2 = ((Ave_Power_2)/QBOIL2)*100
%CarnotEFF
Carnot_EFF2 = ((Ave_Boiler_Temp_2 - 23)/Ave_Boiler_Temp_2)*100

%ERRORS
mdotERROR2 = sqrt(((1/(h2_inlet2-h3_exit2))^2*std_Power_2^2))
QBOILERROR2 = sqrt((h_boil_ex2^2*mdotERROR2^2))
WTURBERROR2 = sqrt((h2_inlet2-h3_exit2)^2*mdotERROR2^2)
effERROR2 = sqrt(((1/QBOIL2)^2*WTURBERROR2^2) + ((WTURB2/QBOIL2^2)^2*QBOILERROR2^2))


%% Saving