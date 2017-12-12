%% Notes
% An external fuction file was used for error propegation

%% Formating

format compact
format short
close all
clear
clc

%% Data

Data_Experiment_One=xlsread('Experiment_One.csv');

Time_1=Data_Experiment_One(:,1);
Current_1=Data_Experiment_One(:,2);
Voltage_1=Data_Experiment_One(:,3);
Power_1=abs(Current_1.*Voltage_1); %Data_Experiment_One(:,4);
Temperature1_1=Data_Experiment_One(:,5);
Temperature2_1=Data_Experiment_One(:,6);
Time_2=Data_Experiment_One(:,7);
Current_2=Data_Experiment_One(:,8);
Voltage_2=Data_Experiment_One(:,9);
Power_2=abs(Current_2.*Voltage_2); %Data_Experiment_One(:,10);
Temperature1_2=Data_Experiment_One(:,11);
Temperature2_2=Data_Experiment_One(:,12);

%% Constants

cfin=.90; % J/(gC)
mfin=19; % g

%% Controlling Equations

% Heat transfered
syms m c dT
Q=m.*c.*dT;

% Work
syms dt P1 P2
Warea=dt.*(P1+1/2.*(P2-P1));

% Energy loss
syms Qhot Qcold W
Eloss=abs(Qhot-(Qcold+W));

% Useful work percent
syms Wuseful
Wuseful=W./(Qhot-Qcold).*100;

% Energy recovered percent
syms Wgenerated QcoldIN WIN
Erecovered=Wgenerated./(QcoldIN+WIN)*100;

%% Heat Pump Mode

% Hot reservoir in heat pump mode
QhotHP=PropError(Q,[c m dT],[cfin mfin abs(max(Temperature2_1)-min(Temperature2_1))],[.005 .5 .005]);
QhotHP{1,1} = double(QhotHP{1,1}); 
QhotHP{1,3} = double(QhotHP{1,3})

% Cold reservoir in heat pump mode
QcoldHP=PropError(Q,[c m dT],[cfin mfin abs(max(Temperature1_1)-min(Temperature1_1))],[.005 .5 .005]);
QcoldHP{1,1} = double(QcoldHP{1,1}); 
QcoldHP{1,3} = double(QcoldHP{1,3})

% Plot of the work done on the heat pump
FigureHP=figure;
plot(Time_1,Power_1,'.')
grid minor
grid on
xlabel('Time [s]')
ylabel('Power [W]')
saveas(gcf, 'PowerHP', 'png')

% Energy put into he heat pump
WHP=PropError(Warea,[dt P1 P2],[abs(max(Time_1)-Time_1(35)) Power_1(2402) Power_1(35)],[.005 .005 .005]);
WHP{1,1} = double(WHP{1,1});
WHP{1,3} = double(WHP{1,3})

% The lost energy of the system
ElossHP=PropError(Eloss,[Qhot Qcold W],[QhotHP{1,1} QcoldHP{1,1} WHP{1,1}],[QhotHP{1,3} QcoldHP{1,3} WHP{1,3}]);
ElossHP{1,1} = double(ElossHP{1,1}); 
ElossHP{1,3} = double(ElossHP{1,3})

%% Heat Engine Mode

% Hot reservoir in heat engine mode
QhotHE=PropError(Q,[c m dT],[cfin mfin abs(max(Temperature2_2)-min(Temperature2_2))],[.005 .5 .005]);
QhotHE{1,1} = double(QhotHE{1,1}); 
QhotHE{1,3} = double(QhotHE{1,3})

% Cold reservoir in heat engine mode
QcoldHE=PropError(Q,[c m dT],[cfin mfin abs(max(Temperature1_2)-min(Temperature1_2))],[.005 .5 .005]);
QcoldHE{1,1} = double(QcoldHE{1,1}); 
QcoldHE{1,3} = double(QcoldHE{1,3})

% Plot of the work done on the heat engine
FigureHE=figure;
plot(Time_2,Power_2,'.')
grid minor
grid on
xlabel('Time [s]')
ylabel('Power [W]')
saveas(gcf, 'PowerHE', 'png')

% Energy put into he heat engine
WHE=PropError(Warea,[dt P1 P2],[abs(max(Time_2)-Time_2(2)) Power_2(3614) Power_2(2)],[.005 .005 .005]);
WHE{1,1} = double(WHE{1,1}); 
WHE{1,3} = double(WHE{1,3})

% The lost energy of the system
ElossHE=PropError(Eloss,[Qhot Qcold W],[QhotHE{1,1} QcoldHE{1,1} WHE{1,1}],[QhotHE{1,3} QcoldHE{1,3} WHE{1,3}]);
ElossHE{1,1} = double(ElossHE{1,1}); 
ElossHE{1,3} = double(ElossHE{1,3})

% Useful work generated
UsefulWork=PropError(Wuseful,[Qhot Qcold W],[QhotHE{1,1} QcoldHE{1,1} WHE{1,1}],[QhotHE{1,3} QcoldHE{1,3} WHE{1,3}]);
UsefulWork{1,1} = double(UsefulWork{1,1}); 
UsefulWork{1,3} = double(UsefulWork{1,3})

%% Conservation of Energy

Recovered=PropError(Erecovered,[QcoldIN WIN Wgenerated],[QcoldHP{1,1} WHP{1,1} WHE{1,1}],[QcoldHP{1,3} WHP{1,3} WHE{1,3}]);
Recovered{1,1} = double(Recovered{1,1}); 
Recovered{1,3} = double(Recovered{1,3})
