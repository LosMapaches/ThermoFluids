%% Flume Experiments

format compact
format short
close all
clear
clc

%% Data

load('Analysis.mat')
load('Tables.mat','ReynoldsTable')

%% Lift for comparison of constant and non constant velocites.
figure
hold on
plot(NonConstant80(:,3),NonConstant80LiftCoefficient,':*k')
plot(Constant80(:,3),Constant80LiftCoefficient,':ok')
plot(NonConstant100(:,3),NonConstant100LiftCoefficient,':xk')
plot(Constant100(:,3),Constant100LiftCoefficient,':sk')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Lift [-]')
legend('Run 1','Run 2','Run 3','Run 4','Location','South')

%% Lift for slat and flap configurations

figure
hold on
plot(NonConstant80(:,3),NonConstant80LiftCoefficient,':*k')
plot(FlapNonConstant80(:,3),FlapNonConstant80LiftCoefficient,':ok')
plot(SlatFlapNonConstant80(:,3),SlatFlapNonConstant80LiftCoefficient,':xk')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Lift [-]')
legend('Run 1','Run 5','Run6','Location','South')

%% Drag for slat and flap configurations

figure
hold on
plot(NonConstant80(:,3),NonConstant80DragCoefficient,':*k')
plot(Constant80(:,3),Constant80DragCoefficient,':ok')
plot(NonConstant100(:,3),NonConstant100DragCoefficient,':xk')
plot(Constant100(:,3),Constant100DragCoefficient,':sk')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Drag [-]')
legend('Run 1','Run 2','Run 3','Run 4','Location','NorthWest')

%% Drag for comparison of constant and non constant velocites.

figure
hold on
plot(NonConstant80(:,3),NonConstant80DragCoefficient,':*k')
plot(FlapNonConstant80(:,3),FlapNonConstant80DragCoefficient,':ok')
plot(SlatFlapNonConstant80(:,3),SlatFlapNonConstant80DragCoefficient,':xk')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Drag [-]')
legend('Run 1','Run 5','Run 6','Location','NorthWest')

%% Lift vs. Drag

Overlap=figure;

% Non-Constant80
subplot(3,2,1)
herrorbar(NonConstant80(:,3),NonConstant80LiftCoefficient,CorrectionNonConstant80(:,1),':ok')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Lift [-]')
title('Run 1')

yyaxis right

errorbar(NonConstant80(:,3),NonConstant80DragCoefficient,CorrectionNonConstant80(:,2),'-*k')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Drag [-]')
legend('Drag','Lift','Location','NorthWest')

% Constant80
subplot(3,2,2)
herrorbar(Constant80(:,3),Constant80LiftCoefficient,CorrectionConstant80(:,1),':ok')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Lift [-]')
title('Run 2')


yyaxis right

errorbar(Constant80(:,3),Constant80DragCoefficient,CorrectionConstant80(:,2),'-*k')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Drag [-]')
legend('Drag','Lift','Location','NorthWest')

% Non-Constant100
subplot(3,2,3)
herrorbar(NonConstant100(:,3),NonConstant100LiftCoefficient,CorrectionNonConstant100(:,1),':ok')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Lift [-]')
title('Run 3')


yyaxis right

errorbar(NonConstant100(:,3),NonConstant100DragCoefficient,CorrectionNonConstant100(:,2),'-*k')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Drag [-]')
legend('Drag','Lift','Location','NorthWest')

% Constant100
subplot(3,2,4)
herrorbar(Constant100(:,3),Constant100LiftCoefficient,CorrectionConstant100(:,1),':ok')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Lift [-]')
title('Run 4')


yyaxis right

errorbar(Constant100(:,3),Constant100DragCoefficient,CorrectionConstant100(:,2),'-*k')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Drag [-]')
legend('Drag','Lift','Location','NorthWest')

% Flap 45 80 mph non-constant velocity
subplot(3,2,5)
herrorbar(NonConstant80(:,3),FlapNonConstant80LiftCoefficient,FlapCorrectionNonConstant80(:,1),':ok')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Lift [-]')
title('Run 5')


yyaxis right

errorbar(NonConstant80(:,3),FlapNonConstant80DragCoefficient,FlapCorrectionNonConstant80(:,2),'-*k')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Drag [-]')
legend('Drag','Lift','Location','NorthWest')

% Slat 3/16 Flap 45 80 mph non-constant velocity
subplot(3,2,6)
herrorbar(NonConstant80(:,3),SlatFlapNonConstant80LiftCoefficient,SlatFlapCorrectionNonConstant80(:,1),':ok')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Lift [-]')
title('Run 6')


yyaxis right

errorbar(NonConstant80(:,3),SlatFlapNonConstant80DragCoefficient,SlatFlapCorrectionNonConstant80(:,2),'-*k')
grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Coefficient of Drag [-]')
legend('Drag','Lift','Location','NorthWest')

set(Overlap, 'Units', 'normalized', 'Position', [0,0,1/2,1]);

%% Reynold Numbers

figure
hold on

plot(NonConstant80(:,3),ReynoldsTable(:,1),':*k')
plot(Constant80(:,3),ReynoldsTable(:,3),':ok')
plot(NonConstant100(:,3),ReynoldsTable(:,5),':xk')
plot(Constant100(:,3),ReynoldsTable(1:end-2,7),':sk')
plot(FlapNonConstant80(:,3),ReynoldsTable(:,9),':dk')
plot(SlatFlapNonConstant80(:,3),ReynoldsTable(:,11),':vk')

grid minor
grid on
xlabel('Angle of Attack [degrees]')
ylabel('Reynolds Number')
legend('Run 1','Run 2','Run 3','Run 4','Run 5','Run 6','Location','SouthWest')

%% Saving

saveas(1,'ConstantVersusNonConstantLift.png')
saveas(2,'FlapsVersusSlatsLift.png')
saveas(3,'ConstantVersusNonConstantDrag.png')
saveas(4,'FlapsVersusSlatsDrag.png')
saveas(5,'Overlap.png')
saveas(6,'ReynoldNumber.png')