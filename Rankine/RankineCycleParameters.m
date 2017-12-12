%% Rankine Cycle Parameters

format compact
format short
close all
clear
clc

%% Data

load('DataImport.mat')

CondenserInitial=450e-6; % [m]
CondenserFinal=(200+200+800+400+750)*1e-6; %[m]

%% Saving

save('Parameters.mat')