%% Flume Experiments

format compact
format short
close all
clear
clc

%% Data

load('WindTunnelData.mat')

%% Averaging Data

% Data is arranged as q [mbar] V_ref [m/s] Apla [deg] AF/AF2 [N] PM/YM
% [N-cm] P[mbar]

% 80 mph non-constant velocity
NonConstant80=[...
    nanmean(NonConstant80AtNegative4DegreesData);...
    nanmean(NonConstant80AtNegative2DegreesData);...
    nanmean(NonConstant80At0DegreesData);...
    nanmean(NonConstant80At2DegreesData);...
    nanmean(NonConstant80At4DegreesData);...
    nanmean(NonConstant80At6DegreesData);...
    nanmean(NonConstant80At8DegreesData);...
    nanmean(NonConstant80At10DegreesData);...
    nanmean(NonConstant80At12DegreesData);...
    nanmean(NonConstant80At14DegreesData);...
    nanmean(NonConstant80At16DegreesData);...
    nanmean(NonConstant80At18DegreesData);...
    nanmean(NonConstant80At20DegreesData);...
    nanmean(NonConstant80At22DegreesData);...
    nanmean(NonConstant80At24DegreesData);...
    nanmean(NonConstant80At25DegreesData);...
    ];

% 80 mph constant velocity
Constant80=[...
    nanmean(Constant80AtNegative4DegreesData);...
    nanmean(Constant80AtNegative2DegreesData);...
    nanmean(Constant80At0DegreesData);...
    nanmean(Constant80At2DegreesData);...
    nanmean(Constant80At4DegreesData);...
    nanmean(Constant80At6DegreesData);...
    nanmean(Constant80At8DegreesData);...
    nanmean(Constant80At10DegreesData);...
    nanmean(Constant80At12DegreesData);...
    nanmean(Constant80At14DegreesData);...
    nanmean(Constant80At16DegreesData);...
    nanmean(Constant80At18DegreesData);...
    nanmean(Constant80At20DegreesData);...
    nanmean(Constant80At22DegreesData);...
    nanmean(Constant80At24DegreesData);...
    nanmean(Constant80At25DegreesData);...
    ];

% 100 mph constant velocity
Constant100=[...
    nanmean(Constant100AtNegative4DegreesData);...
    nanmean(Constant100AtNegative2DegreesData);...
    nanmean(Constant100At0DegreesData);...
    nanmean(Constant100At2DegreesData);...
    nanmean(Constant100At4DegreesData);...
    nanmean(Constant100At6DegreesData);...
    nanmean(Constant100At8DegreesData);...
    nanmean(Constant100At10DegreesData);...
    nanmean(Constant100At12DegreesData);...
    nanmean(Constant100At14DegreesData);...
    nanmean(Constant100At16DegreesData);...
    nanmean(Constant100At18DegreesData);...
    nanmean(Constant100At20DegreesData);...
    nanmean(Constant100At22DegreesData);...
    ];

% 100 mph non-constant velocity
NonConstant100=[...
    nanmean(NonConstant100AtNegative4DegreesData);...
    nanmean(NonConstant100AtNegative2DegreesData);...
    nanmean(NonConstant100At0DegreesData);...
    nanmean(NonConstant100At2DegreesData);...
    nanmean(NonConstant100At4DegreesData);...
    nanmean(NonConstant100At6DegreesData);...
    nanmean(NonConstant100At8DegreesData);...
    nanmean(NonConstant100At10DegreesData);...
    nanmean(NonConstant100At12DegreesData);...
    nanmean(NonConstant100At14DegreesData);...
    nanmean(NonConstant100At16DegreesData);...
    nanmean(NonConstant100At18DegreesData);...
    nanmean(NonConstant100At20DegreesData);...
    nanmean(NonConstant100At22DegreesData);...
    nanmean(NonConstant100At24DegreesData);...
    nanmean(NonConstant100At25DegreesData);...
    ];

% Flap 80 mph non-constant velocity
FlapNonConstant80=[...
    nanmean(FlapNonConstant80AtNegative4DegreesData);...
    nanmean(FlapNonConstant80AtNegative2DegreesData);...
    nanmean(FlapNonConstant80At0DegreesData);...
    nanmean(FlapNonConstant80At2DegreesData);...
    nanmean(FlapNonConstant80At4DegreesData);...
    nanmean(FlapNonConstant80At6DegreesData);...
    nanmean(FlapNonConstant80At8DegreesData);...
    nanmean(FlapNonConstant80At10DegreesData);...
    nanmean(FlapNonConstant80At12DegreesData);...
    nanmean(FlapNonConstant80At14DegreesData);...
    nanmean(FlapNonConstant80At16DegreesData);...
    nanmean(FlapNonConstant80At18DegreesData);...
    nanmean(FlapNonConstant80At20DegreesData);...
    nanmean(FlapNonConstant80At22DegreesData);...
    nanmean(FlapNonConstant80At24DegreesData);...
    nanmean(FlapNonConstant80At25DegreesData);...
    ];

% Flap and Slat 80 mph non-constant velocity
SlatFlapNonConstant80=[...
    nanmean(SlatFlapNonConstant80AtNegative4DegreesData);...
    nanmean(SlatFlapNonConstant80AtNegative2DegreesData);...
    nanmean(SlatFlapNonConstant80At0DegreesData);...
    nanmean(SlatFlapNonConstant80At2DegreesData);...
    nanmean(SlatFlapNonConstant80At4DegreesData);...
    nanmean(SlatFlapNonConstant80At6DegreesData);...
    nanmean(SlatFlapNonConstant80At8DegreesData);...
    nanmean(SlatFlapNonConstant80At10DegreesData);...
    nanmean(SlatFlapNonConstant80At12DegreesData);...
    nanmean(SlatFlapNonConstant80At14DegreesData);...
    nanmean(SlatFlapNonConstant80At16DegreesData);...
    nanmean(SlatFlapNonConstant80At18DegreesData);...
    nanmean(SlatFlapNonConstant80At20DegreesData);...
    nanmean(SlatFlapNonConstant80At22DegreesData);...
    nanmean(SlatFlapNonConstant80At24DegreesData);...
    nanmean(SlatFlapNonConstant80At25DegreesData);...
    ];

%% Saving

save('AverageOfData','NonConstant80','Constant80','Constant100','NonConstant100','FlapNonConstant80','SlatFlapNonConstant80')