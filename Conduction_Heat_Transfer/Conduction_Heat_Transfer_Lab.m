%% Conduction Heat Transfer Lab

format compact
format long
close all
clear
clc

%% Data

load('Data')

%% Plots

% Plot for the control no paste
Figure_Control_no_Paste=figure;
hold on
for i=2:length(Control_no_Paste(1,:))
    plot(Control_no_Paste(:,1),Control_no_Paste(:,i),'-')
    legendInfo_Control_no_Paste{i-1} = ['ai = ' num2str(i-2)];
end
legend(legendInfo_Control_no_Paste,'Location','Best')
ylabel('Temperature [^{\circ}C]')
xlabel('Time [seconds]')
grid minor
grid on
hold off

% Plot for the control with both sides pastes
Figure_Control_2_Paste=figure;
hold on
for i=2:length(Control_2_Paste(1,:))
    plot(Control_2_Paste(:,1),Control_2_Paste(:,i),'-')
    legendInfo_Control_2_Paste{i-1} = ['ai = ' num2str(i-2)];
end
legend(legendInfo_Control_2_Paste,'Location','Best')
ylabel('Temperature [^{\circ}C]')
xlabel('Time [seconds]')
grid minor
grid on
hold off

% Plot for TS1
Figure_TS1=figure;
hold on
for i=2:length(TS1(1,:))
    plot(TS1(:,1),TS1(:,i),'-')
    legendInfo_TS1{i-1} = ['ai = ' num2str(i-2)];
end
legend(legendInfo_TS1,'Location','Best')
ylabel('Temperature [^{\circ}C]')
xlabel('Time [seconds]')
grid minor
grid on
hold off

% Plot for TS2
Figure_TS2=figure;
hold on
for i=2:length(TS2(1,:))
    plot(TS2(:,1),TS2(:,i),'-')
    legendInfo_TS2{i-1} = ['ai = ' num2str(i-2)];
end
legend(legendInfo_TS2,'Location','Best')
ylabel('Temperature [^{\circ}C]')
xlabel('Time [seconds]')
grid minor
grid on
hold off
