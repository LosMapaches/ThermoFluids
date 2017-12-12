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
    legendInfo_Control_no_Paste{i-1} = ['Point = ' num2str(i-1)];
end
line([Control_no_Paste(length(Control_no_Paste)-20,1) Control_no_Paste(length(Control_no_Paste)-20,1)], [0 Control_no_Paste(length(Control_no_Paste)-20,2)],'Color','k')
line([Control_no_Paste(length(Control_no_Paste),1) Control_no_Paste(length(Control_no_Paste),1)], [0 Control_no_Paste(length(Control_no_Paste),2)],'Color','k')
legendInfo_Control_no_Paste{7}='Slope Interval';
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
    legendInfo_Control_2_Paste{i-1} = ['Point = ' num2str(i-1)];
end
line([Control_2_Paste(length(Control_2_Paste)-20,1) Control_2_Paste(length(Control_2_Paste)-20,1)], [0 Control_2_Paste(length(Control_2_Paste)-20,2)],'Color','k')
line([Control_2_Paste(length(Control_2_Paste),1) Control_2_Paste(length(Control_2_Paste),1)], [0 Control_2_Paste(length(Control_2_Paste),2)],'Color','k')
legendInfo_Control_2_Paste{7}='Slope Interval';
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
    legendInfo_TS1{i-1} = ['Point = ' num2str(i-1)];
end
line([TS1(length(TS1)-20,1) TS1(length(TS1)-20,1)], [0 TS1(length(TS1)-20,2)],'Color','k')
line([TS1(length(TS1),1) TS1(length(TS1),1)], [0 TS1(length(TS1),2)],'Color','k')
legendInfo_TS1{7}='Slope Interval';
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
    legendInfo_TS2{i-1} = ['Point = ' num2str(i-1)];
end
line([TS2(length(TS2)-20,1) TS2(length(TS2)-20,1)], [0 TS2(length(TS2)-20,2)],'Color','k')
line([TS2(length(TS2),1) TS2(length(TS2),1)], [0 TS2(length(TS2),2)],'Color','k')
legendInfo_TS2{7}='Slope Interval';
legend(legendInfo_TS2,'Location','Best')
ylabel('Temperature [^{\circ}C]')
xlabel('Time [seconds]')
grid minor
grid on
hold off
