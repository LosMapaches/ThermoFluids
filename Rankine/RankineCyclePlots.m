%% Rankine Cycle Plots

format compact
format short
close all
clear
clc

%% Data

load('DataImport.mat')
load('DataSelect.mat')

%% Plots

% Uncut Plot
figure
plot(Rankine1(:,1),Rankine1(:,12),'.')
rectangle('Position',[min(Rankine1Cut(:,1)) min(Rankine1Cut(:,12)) max(Rankine1Cut(:,1))-min(Rankine1Cut(:,1)) max(Rankine1Cut(:,12))-min(Rankine1Cut(:,12))])
grid minor
grid on
xlabel('Time [sec]')
ylabel('Power [W]')
title('Run 1')
legend('Data','Location','NorthEast')
text(5210,.17,'The rectangle was data analyzed')

figure
plot(Rankine2(:,1),Rankine2(:,12),'.')
rectangle('Position',[min(Rankine2Cut(:,1)) min(Rankine2Cut(:,12)) max(Rankine2Cut(:,1))-min(Rankine2Cut(:,1)) max(Rankine2Cut(:,12))-min(Rankine2Cut(:,12))])
grid minor
grid on
xlabel('Time [sec]')
ylabel('Power [W]')
title('Run 2')
legend('Data','Location','NorthEast')
text(6190,.17,'The rectangle was data analyzed')

% subplot(2,2,3)
% plot(Rankine3(:,1),Rankine3(:,12),'.')
% grid minor
% grid on
% xlabel('Time [sec]')
% ylabel('Power [W]')
% title('Run 3')
% 
% subplot(2,2,4)
% plot(Rankine4(:,1),Rankine4(:,12),'.')
% grid minor
% grid on
% xlabel('Time [sec]')
% ylabel('Power [W]')
% title('Run 4')


% % Cut Plots
% 
% PowerVersusTimeCut=figure;
% 
% subplot(2,2,1)
% plot(Rankine1Cut(:,1),Rankine1Cut(:,12),'.')
% grid minor
% grid on
% xlabel('Time [sec]')
% ylabel('Power [W]')
% title('Run 1')
% 
% subplot(2,2,2)
% plot(Rankine2Cut(:,1),Rankine2Cut(:,12),'.')
% grid minor
% grid on
% xlabel('Time [sec]')
% ylabel('Power [W]')
% title('Run 2')
% 
% set(PowerVersusTimeCut, 'Units', 'normalized', 'Position', [0,0,1/2,1]);

%% Saving

saveas(1,'Run1.png')
saveas(2,'Run2.png')