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
Constant100At0DegreesData=xlsread('MPH100ConstantVelocity/ConstantAtNegative0Point0Degrees.xlsx');
Constant100At2DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt2Point1Degrees.xlsx');
Constant100At4DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt4Point1Degrees.xlsx');
Constant100At6DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt5Point9Degrees.xlsx');
Constant100At8DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt8Point0Degrees.xlsx');
Constant100At10DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt10Point0Degrees.xlsx');
Constant100At12DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt12Point1Degrees.xlsx');
Constant100At14DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt14Point1Degrees.xlsx');
Constant100At16DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt16Point0Degrees.xlsx');
Constant100At18DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt18Point1Degrees.xlsx');
Constant100At20DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt20Point1Degrees.xlsx');
Constant100At22DegreesData=xlsread('MPH100ConstantVelocity/ConstantAt22Point1Degrees.xlsx');
Constant100AtNegative2DegreesData=xlsread('MPH100ConstantVelocity/ConstantAtNegative2Point1Degrees.xlsx');
Constant100AtNegative4DegreesData=xlsread('MPH100ConstantVelocity/ConstantAtNegative4Point1Degrees.xlsx');

% 100 mph non-constant velocity
NonConstant100At0DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAtNegative0Point0Degrees.xlsx');
NonConstant100At2DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt2Point1Degrees.xlsx');
NonConstant100At4DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt4Point1Degrees.xlsx');
NonConstant100At6DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt5Point9Degrees.xlsx');
NonConstant100At8DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt8Point0Degrees.xlsx');
NonConstant100At10DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt10Point0Degrees.xlsx');
NonConstant100At12DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt12Point1Degrees.xlsx');
NonConstant100At14DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt14Point0Degrees.xlsx');
NonConstant100At16DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt16Point2Degrees.xlsx');
NonConstant100At18DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt18Point0Degrees.xlsx');
NonConstant100At20DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt20Point0Degrees.xlsx');
NonConstant100At22DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt22Point1Degrees.xlsx');
NonConstant100At24DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt24Point0Degrees.xlsx');
NonConstant100At25DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAt25Point6Degrees.xlsx');
NonConstant100AtNegative2DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAtNegative2Point1Degrees.xlsx');
NonConstant100AtNegative4DegreesData=xlsread('MPH100NonConstantVelocity/NonConstantAtNegative3Point9Degrees.xlsx');

% Flap 45 80 mph non-constant velocity
FlapNonConstant80At0DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAtNegative0Point0Degrees.xlsx');
FlapNonConstant80At2DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt2Point1Degrees.xlsx');
FlapNonConstant80At4DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt4Point1Degrees.xlsx');
FlapNonConstant80At6DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt5Point9Degrees.xlsx');
FlapNonConstant80At8DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt8Point0Degrees.xlsx');
FlapNonConstant80At10DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt10Point0Degrees.xlsx');
FlapNonConstant80At12DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt12Point1Degrees.xlsx');
FlapNonConstant80At14DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt14Point1Degrees.xlsx');
FlapNonConstant80At16DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt15Point9Degrees.xlsx');
FlapNonConstant80At18DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt18Point0Degrees.xlsx');
FlapNonConstant80At20DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt20Point1Degrees.xlsx');
FlapNonConstant80At22DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt22Point1Degrees.xlsx');
FlapNonConstant80At24DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt24Point0Degrees.xlsx');
FlapNonConstant80At25DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAt25Point6Degrees.xlsx');
FlapNonConstant80AtNegative2DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAtNegative2Point1Degrees.xlsx');
FlapNonConstant80AtNegative4DegreesData=xlsread('Flap45MPH80NonConstantVelocity/NonConstantAtNegative4Point0Degrees.xlsx');

% Slat 3/16 Flap 45 80 mph non-constant velocity
SlatFlapNonConstant80At0DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAtNegative0Point0Degrees.xlsx');
SlatFlapNonConstant80At2DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt2Point1Degrees.xlsx');
SlatFlapNonConstant80At4DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt4Point1Degrees.xlsx');
SlatFlapNonConstant80At6DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt5Point9Degrees.xlsx');
SlatFlapNonConstant80At8DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt8Point0Degrees.xlsx');
SlatFlapNonConstant80At10DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt10Point0Degrees.xlsx');
SlatFlapNonConstant80At12DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt12Point1Degrees.xlsx');
SlatFlapNonConstant80At14DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt14Point1Degrees.xlsx');
SlatFlapNonConstant80At16DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt15Point9Degrees.xlsx');
SlatFlapNonConstant80At18DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt18Point0Degrees.xlsx');
SlatFlapNonConstant80At20DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt20Point1Degrees.xlsx');
SlatFlapNonConstant80At22DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt22Point1Degrees.xlsx');
SlatFlapNonConstant80At24DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt24Point0Degrees.xlsx');
SlatFlapNonConstant80At25DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAt25Point6Degrees.xlsx');
SlatFlapNonConstant80AtNegative2DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAtNegative2Point1Degrees.xlsx');
SlatFlapNonConstant80AtNegative4DegreesData=xlsread('SlatandFlap45MPH80NonConstantVelocity/NonConstantAtNegative4Point1Degrees.xlsx');

%% Saving

save('WindTunnelData')