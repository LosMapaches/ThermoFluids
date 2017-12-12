%% ALL
clc
clear all

Rankine_Data_ALL = xlsread('Rankine_Data.xlsx','Sheet1','A1600:L4700');
Time_ALL = Rankine_Data_ALL(:,1)-min(Rankine_Data_ALL(:,1));
Power_ALL = Rankine_Data_ALL(:,12)/1000;
Boiler_Temp_ALL =Rankine_Data_ALL(:,5);
Boiler_Press_ALL = (6.89476.*Rankine_Data_ALL(:,2))+74.7040;
Turbine_Inlet_Temp_ALL = Rankine_Data_ALL(:,3);
Turbine_Inlet_Press_ALL = (6.89476.*Rankine_Data_ALL(:,6))+74.7040;
Turbine_Exit_Temp_ALL = Rankine_Data_ALL(:,4);
Turbine_Exit_Press_ALL = (6.89476.*Rankine_Data_ALL(:,7))+74.7040;
Turbine_Voltage_ALL = Rankine_Data_ALL(:,10);
Turbine_Current_1 = Rankine_Data_ALL(:,11);

Ave_Power_ALL = mean(Power_ALL)
figure
plot(Time_ALL,Power_ALL)
title('Full View of Run One and Two')
xlabel('Time(s)')
ylabel('Turbine Power Output(Watts)')
grid on


%% Run Two
Rankine_Data_1 = xlsread('Rankine_Data.xlsx','Sheet1','A2017:L2425');
Time_1 = Rankine_Data_1(:,1)-min(Rankine_Data_1(:,1));
Power_1 = Rankine_Data_1(:,12)/1000;
Boiler_Temp_1 =Rankine_Data_1(:,5);
Boiler_Press_1 = 6.89476.*Rankine_Data_1(:,2);
Turbine_Inlet_Temp_1 = Rankine_Data_1(:,3);
Turbine_Inlet_Press_1 = 6.89476.*Rankine_Data_1(:,6);
Turbine_Exit_Temp_1 = Rankine_Data_1(:,4);
Turbine_Exit_Press_1 = 6.89476.*Rankine_Data_1(:,7);
Turbine_Voltage_1 = Rankine_Data_1(:,10);
Turbine_Current_1 = Rankine_Data_1(:,11);

Ave_Power_1 = mean(Power_1)
std_Power_1 = std(Power_1)
Ave_Turbine_Inlet_Temp_1 = mean(Rankine_Data_1(:,3));
std_Turbine_Inlet_Temp_1 = std(Rankine_Data_1(:,3));
Ave_Turbine_Inlet_Press_1 = (6.89476.*mean(Rankine_Data_1(:,6)))+74.7040;
std_Turbine_Inlet_Press_1 = std(6.89476.*(Rankine_Data_1(:,6)+74.7040));
Ave_Turbine_Exit_Temp_1 = mean(Rankine_Data_1(:,4));
std_Turbine_Exit_Temp_1 = std(Rankine_Data_1(:,4));
Ave_Turbine_Exit_Press_1 = (6.89476.*mean(Rankine_Data_1(:,7)))+74.7040;
std_Turbine_Exit_Press_1 = std(6.89476.*Rankine_Data_1(:,7)+74.7040);

Ave_Boiler_Press_1 = (6.89476.*mean(Rankine_Data_1(:,5)))+74.7040;
std_Boiler_Press_1 = std(6.89476.*Rankine_Data_1(:,5)+74.7040);
Ave_Boiler_Temp_1 = mean(Rankine_Data_1(:,2));
std_Boiler_Temp_1 = std(Rankine_Data_1(:,2));


%Enthalpys
h_boil_ex = 2925; %KJ/Kg
h2_inlet = 2710; %KJ/Kg
h3_exit = 2683; %KJ/Kg
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


figure
plot(Time_1,Power_1)
title('Turbine Power Output versus Time for Run One')
xlabel('Time(s)')
ylabel('Turbine Power Output(Watts)')
grid on
%% Run Three

Rankine_Data_2 = xlsread('Rankine_Data.xlsx','Sheet1','A4050:L4600');

Boiler_Temp_2 =Rankine_Data_2(:,5);
Boiler_Press_2 = (6.89476.*Rankine_Data_2(:,2))+74.7040;
Turbine_Inlet_Temp_2 = Rankine_Data_2(:,3);
Turbine_Inlet_Press_2 = (6.89476.*Rankine_Data_2(:,6))+74.7040;
Turbine_Exit_Temp_2 = Rankine_Data_2(:,4);
Turbine_Exit_Press_2 =(6.89476.* Rankine_Data_2(:,7))+74.7040;
Turbine_Voltage_2 = Rankine_Data_2(:,10);
Turbine_Current_2 = Rankine_Data_2(:,11);
Time_2 = Rankine_Data_2(:,1)-min(Rankine_Data_2(:,1));
Power_2 = Rankine_Data_2(:,12)/1000;

Ave_Power_2 = mean(Power_2)
std_Power_2 = std(Power_2)
Ave_Turbine_Inlet_Temp_2 = mean(Rankine_Data_2(:,3))
std_Turbine_Inlet_Temp_2 = std(Rankine_Data_2(:,3))
Ave_Turbine_Inlet_Press_2 = (6.89476.*mean(Rankine_Data_2(:,6)))+74.7040
std_Turbine_Inlet_Press_2 = std(6.89476.*Rankine_Data_2(:,6)+74.704)
Ave_Turbine_Exit_Temp_2 = mean(Rankine_Data_2(:,4))
std_Turbine_Exit_Temp_2 = std(Rankine_Data_2(:,4))
Ave_Turbine_Exit_Press_2 = (6.89476.*mean(Rankine_Data_2(:,7)))+74.7040
std_Turbine_Exit_Press_2 = std(6.89476.*Rankine_Data_2(:,7)+74.7040)

Ave_Boiler_Press_2 = (6.89476.*mean(Rankine_Data_2(:,5)))+74.7040
std_Boiler_Press_2 = std(6.89476.*Rankine_Data_2(:,5)+74.7040)
Ave_Boiler_Temp_2 = mean(Rankine_Data_2(:,2))
std_Boiler_Temp_2 = std(Rankine_Data_2(:,2))

%Enthalpys
h_boil_ex2 = 2982; %KJ/Kg
h2_inlet2 = 2705; %KJ/Kg
h3_exit2 = 2682; %KJ/Kg
mdot2 = Ave_Power_2/(h2_inlet2-h3_exit2)
%Boiler Heat Flow
QBOIL2 = (mdot2*(h_boil_ex2))
%Turbine Work Rate
WTURB2 = mdot2*(h2_inlet2-h3_exit2)
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


figure
plot(Time_2,Power_2)
title('Turbine Power Output versus Time for Run Two')
xlabel('Time(s)')
ylabel('Turbine Power Output(Watts)')
grid on

%% 







