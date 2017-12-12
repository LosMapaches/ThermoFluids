%% Rankine Cycle Data Select

format compact
format short
close all
clear
clc

%% Data

load('DataImport.mat')

%% Averaging Data

Rankine1Cut=Rankine1(Rankine1(:,1)>=5201 & Rankine1(:,1)<=5339,:);
Rankine2Cut=Rankine2(Rankine2(:,1)>=6226 & Rankine2(:,1)<=6285,:);

%% Saving

save('DataSelect.mat','Rankine1Cut','Rankine2Cut')