%% Flume Experiments

format compact
format short
close all
clear
clc

%% Data

% 80 mph non-constant velocity
Constant80At0DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt0point0Degrees.xlsx');
Constant80At2DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt2point1Degrees.xlsx');
Constant80At4DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt4point0Degrees.xlsx');
Constant80At6DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt6point2Degrees.xlsx');
Constant80At8DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt8point0Degrees.xlsx');
Constant80At10DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt10point0Degrees.xlsx');
Constant80At12DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt12point1Degrees.xlsx');
Constant80At14DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt14point1Degrees.xlsx');
Constant80At16DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt15point9Degrees.xlsx');
Constant80At18DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt18point0Degrees.xlsx');
Constant80At20DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt20point1Degrees.xlsx');
Constant80At22DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt22point1Degrees.xlsx');
Constant80At24DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt24point0Degrees.xlsx');
Constant80At25DegreesData=xlsread('MPH80ConstantVelocity/ConstantAt25point6Degrees.xlsx');
Constant80AtNegative2DegreesData=xlsread('MPH80ConstantVelocity/ConstantAtNegative1point9Degrees.xlsx');
Constant80AtNegative4DegreesData=xlsread('MPH80ConstantVelocity/ConstantAtNegative4point1Degrees.xlsx');

% 80 mph constant velocity
NonConstant80At0DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAtZeroDegrees.xlsx');
NonConstant80At2DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt2Degrees.xlsx');
NonConstant80At4DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt4Degrees.xlsx');
NonConstant80At6DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt5point9Degrees.xlsx');
NonConstant80At8DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt8point1Degrees.xlsx');
NonConstant80At10DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt10Degrees.xlsx');
NonConstant80At12DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt12point1Degrees.xlsx');
NonConstant80At14DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt14point1Degrees.xlsx');
NonConstant80At16DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt16point2Degrees.xlsx');
NonConstant80At18DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt18point0Degrees.xlsx');
NonConstant80At20DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt20point0Degrees.xlsx');
NonConstant80At22DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt22point0Degrees.xlsx');
NonConstant80At24DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt24point0Degrees.xlsx');
NonConstant80At25DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAt25point6Degrees.xlsx');
NonConstant80AtNegative2DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAtNegative2point1Degrees.xlsx');
NonConstant80AtNegative4DegreesData=xlsread('MPH80NonConstantVelocity/NonConstantAtNegative4Degrees.xlsx');

% 100 mph constant velocity
NonConstant100At0DegreesData=xlsread('MPH100ConstantVelocity/ConstantAtNegative0Point0Degrees.xlsx');
NonConstant100At2DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt2Point1Degrees.xlsx');
NonConstant100At4DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt4Point1Degrees.xlsx');
NonConstant100At6DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt5Point9Degrees.xlsx');
NonConstant100At8DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt8Point0Degrees.xlsx');
NonConstant100At10DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt10Point0Degrees.xlsx');
NonConstant100At12DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt12Point1Degrees.xlsx');
NonConstant100At14DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt14Point1Degrees.xlsx');
NonConstant100At16DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt16Point0Degrees.xlsx');
NonConstant100At18DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt18Point1Degrees.xlsx');
NonConstant100At20DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt20Point1Degrees.xlsx');
NonConstant100At22DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt22Point1Degrees.xlsx');
NonConstant100AtNegative2DegreesData=xlsread('MPH100ConstantVelocity/ConstantAtNegative2Point1Degrees.xlsx');
NonConstant100AtNegative4DegreesData=xlsread('MPH100ConstantVelocity/ConstantAtNegative4Point1Degrees.xlsx');

save('WindTunnelData')