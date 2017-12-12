%% Fluid Flow Laboratory Experiment 1

format compact
format long
close all
clear
clc

%% Given

gravity=9.79376;
gravityerror=.01;

mu=1.15*10^-3;
muError=0.01*10^-3;

gamma=9810;
gammaError=1;

temperature=15+273.15;
temperatureError=1;

density=999;
desnityError=1;

DiameterVenturi1Small=.828*.0254;
DiameterVenturi1Large=2.009*.0254;
DiameterVenturi2Small=.828*.0254;
DiameterVenturi2Large=.85*.0254;
DiameterPipe=.824*.0254;
DiameterError=.001;

StraightLength=(25+7/8)*0.0254;
StraightLengthError=2/100;

ElbowLength=.68;
ElbowLengthError=2/100;

kconversion=.849;
kError=0;

RelativeRoughness=10^-6;

%% Data from pressure guages

% Pressures for theory
p1=[81500
    79400
    79288
    80941
    81469.65
    80847.1
    80903.82
    81369.62264
    81357.23127
    81586.5416
    82275.38336
    81921.1093
    114234.5188
    98961.33768
    96017.01689
    ];

p2=[81300
    79300
    79074
    80940
    81469.1
    80833.835
    80894.91
    81312.26415
    81304.39739
    81507.12887
    82253.80098
    81174.97553
    104123.0995
    93318.84176
    91310.28143
    ];

PressureError=100;

% Times and volumes (seconds in first column m^3 in second column)
Run{1} = [
    {3.46} {0.85/1000};
    {} {};
    {} {};
    {} {};];
    
Run{2} = [
    {1.83} {.3/1000};
    {1.51} {.25/1000};
    {1.41} {.2245/1000};
    {} {};];
    
Run{3} = [
    {3.15} {.325/1000};
    {2.32} {.248/100};
    {1.77} {.176/1000};
    {1.66} {.168/1000};];

Run{4} = [
    {8.01} {.46/1000};
    {5.5} {.26/1000};
    {3.08} {.168/1000};
    {3.95} {.225/1000};];

Run{5} = [
    {6.58} {.515/1000};
    {5.26} {.4/1000};
    {3.41} {.25/1000};
    {3.08} {.8/1000};];

Run{6} = [
    {30.11} {.6/1000};
    {18.7} {.395/1000};
    {11.51} {.23/1000};
    {9.93} {.198/1000};];

Run{7} = [
    {17.64} {.725/1000};
    {8.43} {.365/1000};
    {5.28} {.205/1000};
    {5} {.198/1000};];

Run{8} = [
    {15.3} {.41/1000};
    {8.62} {.215/1000};
    {6.83} {.175/1000};
    {} {};];

Run{9} = [
    {25.63} {.275/1000};
    {18.22} {.174/1000};
    {18.02} {.176/1000};
    {} {};];

Run{10} = [
    {3.86} {.35/1000};
    {2.21} {.191/1000};
    {1.9} {.175/1000};
    {} {};];

Run{11} = [
    {1.18} {.248/1000};
    {1.21} {.23/1000};
    {1.48} {.255/1000};
    {} {};];

Run{12} = [
    {2.98} {1.547/1000};
    {} {};
    {} {};
    {} {};];

Run{13} = [
    {.79} {1.385/1000};
    {} {};
    {} {};
    {} {};];

Run{14} = [
    {1.2} {1.352/1000};
    {} {};
    {} {};
    {} {};];

Run{15} = [
    {1.43} {1.537/1000};
    {} {};
    {} {};
    {} {};];

TimeError=.25;

VolumeError=.001*.001;

% Straight Pipe Section
StraightVenturiDownstream=1000*[82.71786408
    103.7181068
    110.1823856
    106.5626214
    90.45299353
    80.73436482
    81.15933657
    ];

StraightVenturiUpstream=1000*[82.79936893
    114.5978964
    123.6673203
    118.6405663
    96.13799353
    82.34205212
    81.22728155
    ];

StraightStraightUpstream=1000*[82.25349515
    90.9533657
    94.93116013
    92.74347896
    83.1471521
    77.94333876
    80.74019417
    ];

StraightStraightDownstream=1000*[81.85071197
    81.55927184
    83.70668301
    82.57008091
    77.68210356
    75.68539088
    80.34606796
    ];

%% Equations

% Cross-Sectional Area
syms area r
area=pi.*r.^2;

% Volume Flow Rate
syms A1 A2 P1 P2 rho
QinTheory=A1.*(2./rho.*(P1-P2)./((A1./A2).^2-1)).^(1/2);
syms volume time
QinExperimental=volume./time;
syms slope intercept
QinTheoryCalibrated=slope.*(A1.*(2./rho.*(P1-P2)./((A1./A2).^2-1)).^(1/2))+intercept;

% Velocity
syms volumeflowrate A
Velocity=volumeflowrate/A;

% Reynold's Number
syms Vel D rho MU Rey
Reynold=Vel.*D.*rho./MU;
Velo=Rey.*MU./(rho.*D);

% Pressure Differential in Head [m]
syms specificweight
HeadChange=(P1-P2)./specificweight;

% Darcy-Weisbach
syms hl L d g v F
f=2.*hl.*d.*g./(L.*v.^2);
headlossf=F.*L.*v.^2./(2.*g.*d);

% Hydraulic Radius
syms Perimeter
Radius=A./Perimeter;

% Hazen-William
syms k R c
C=(v./(k.*R^.63)).*(L./hl).^(1/1.852);
headlossc=L.*(v./(k.*c.*R.^.63)).^1.852;

%% Pipe Crossectional Areas [m^3]

AreaVenturi1Small=PropError(area,[r],[DiameterVenturi1Small/2],[DiameterError]);
AreaVenturi1Large=PropError(area,[r],[DiameterVenturi1Large/2],[DiameterError]);
AreaVenturi2Small=PropError(area,[r],[DiameterVenturi2Small/2],[DiameterError]);
AreaVenturi2Large=PropError(area,[r],[DiameterVenturi2Large/2],[DiameterError]);
AreaPipe=PropError(area,[r],[DiameterPipe/2],[DiameterError]);

%% Theoretical Calibration

% Volume Flow Rate [m^3/sec]
for i=1:length(p1)
    QTheoretical1{i}=PropError(QinTheory,[A1 A2 P1 P2 rho],[AreaVenturi1Large{1} AreaVenturi1Small{1} p1(i) p2(i) density],[AreaVenturi1Large{1,3} AreaVenturi1Small{1,3} PressureError PressureError desnityError]);
end

% Velocity Before Venturi [m/sec]
for i=1:length(p1)
    VTheoretical1{i}=PropError(Velocity,[volumeflowrate A],[QTheoretical1{i}{1,1} AreaVenturi1Small{1}],[QTheoretical1{i}{1,3}  AreaVenturi1Small{1,3}]);
end

% Reynold's Number
for i=1:length(p1)
    ReynoldTheoretical1{i}=PropError(Reynold,[Vel D rho MU],[VTheoretical1{i}{1,1} DiameterVenturi1Small density mu],[VTheoretical1{i}{1,3}  DiameterError desnityError muError]);
end

%% Experimental Calibration

% Average Times and Volumes
for i=1:length(p1)
    RunAverages(i,1)=mean(cell2mat(Run{i}(:,1)));
    RunAverages(i,2)=mean(cell2mat(Run{i}(:,2)));
end

% Volume Flow Rate [m^3/sec]
for i=1:length(p1)
    QExperimental1{i}=PropError(QinExperimental,[volume time],[RunAverages(i,2) RunAverages(i,1)],[VolumeError TimeError]);
end

% Velocity [m/sec]
for i=1:length(p1)
    VExperimental1{i}=PropError(Velocity,[volumeflowrate A],[QExperimental1{i}{1,1} AreaPipe{1}],[QExperimental1{i}{1,3}  AreaPipe{1,3}]);
end

% Reynold's Number
for i=1:length(p1)
    ReynoldExperimental1{i}=PropError(Reynold,[Vel D rho MU],[VExperimental1{i}{1,1} DiameterPipe density mu],[VExperimental1{i}{1,3}  DiameterError desnityError muError]);
end

%% Plots Reynolds Comparison

Figure_Reynolds=figure;
hold on
for i=1:length(p1)
    x(i)=cell2mat(QTheoretical1{i}(1,1));
    y(i)=cell2mat(QExperimental1{i}(1,1));
    Plot_Reynolds=plot(x,y,'r*');
end
ylabel('Experimental Flow [m^{3}/sec]')
xlabel('Theoretical Flow [m^{3}/sec]')
grid minor
grid on

% Liniarization
fit=polyfit(x,y,1);

Plot_Reynolds_Fit=fplot(@(x) fit(1).*x+fit(2), [0 max(x) 0 max(y)]);
legend([Plot_Reynolds Plot_Reynolds_Fit],{'Data','Linear Fit'},'Location','Best');

hold off
saveas(1,'Reynolds.png')

%% Pressure Losses in Head for Straight Section Runs

% Volume Flow Rate [m^3/sec]
for i=1:length(StraightStraightUpstream)
    QTheoretical2{i}=PropError(QinTheoryCalibrated,[A1 A2 P1 P2 rho slope intercept],[AreaVenturi1Large{1} AreaVenturi1Small{1} StraightVenturiUpstream(i) StraightVenturiDownstream(i) density fit(1) fit(2)],[AreaVenturi1Large{1,3} AreaVenturi1Small{1,3} PressureError PressureError desnityError 0 0]);
end

% Velocity [m/sec]
for i=1:length(StraightStraightUpstream)
    VExperimental2{i}=PropError(Velocity,[volumeflowrate A],[QTheoretical2{i}{1,1} AreaPipe{1,1}],[QTheoretical2{i}{1,3}  AreaPipe{1,3}]);
end

% Head Loss [m]
for i=1:length(StraightStraightUpstream)
    HeadLoss2{i}=PropError(HeadChange,[P1 P2 specificweight],[StraightStraightUpstream(i) StraightStraightDownstream(i) gamma],[PressureError PressureError gammaError]);
end

% Friction Factors
for i=1:length(StraightStraightUpstream)
    StraightFrictionFactor{i}=PropError(f,[hl L d g v],[HeadLoss2{i}{1,1} StraightLength DiameterPipe gravity VExperimental2{i}{1,1}],[HeadLoss2{i}{1,3} StraightLengthError DiameterError gravityerror VExperimental2{i}{1,3}]);
end

% HydraulicRadius
HydraulicRadius=PropError(Radius,[A Perimeter],[AreaPipe{1,1} pi*DiameterPipe],[AreaPipe{1,3} DiameterError]);

% Roughness Coefficient
for i=1:length(StraightStraightUpstream)
    StraightRoughnessCoefficient{i}=PropError(C,[hl L v k R],[HeadLoss2{i}{1,1} StraightLength VExperimental2{i}{1,1} kconversion HydraulicRadius{1,1}],[HeadLoss2{i}{1,3} StraightLengthError VExperimental2{i}{1,3} kError HydraulicRadius{1,3}]);
end

% Reynold's Number
for i=1:length(StraightStraightUpstream)
    ReynoldExperimental2{i}=PropError(Reynold,[Vel D rho MU],[VExperimental2{i}{1,1} DiameterPipe density mu],[VExperimental2{i}{1,3}  DiameterError desnityError muError]);
end

% Friction Factor Comparison values From http://www.advdelphisys.com/michael_maley/moody_chart/
% Assume Relative roughness 10^-6
StraightRoughnessCoefficientComparison=[
    0.03263454517763461
    0.018374660695708974
    0.017967780803376867
    0.018175004987412608
    0.019688409051571123
    0.022656926266320584
    0.033418377317087244];

for i=1:length(StraightStraightUpstream)
    StraightFrictionFactorPercentDifference(i)=100.*abs(StraightRoughnessCoefficientComparison(i)-StraightFrictionFactor{i}{1,1})./StraightFrictionFactor{i}{1,1};
end

% Roughness Coeficient From http://www.engineeringtoolbox.com/hazen-williams-coefficients-d_798.html
% For PVC 
StraightRoughnessCoefficientComparison=150;

for i=1:length(StraightStraightUpstream)
    StraightRoughnessPercentDifference(i)=100.*abs(StraightRoughnessCoefficientComparison-StraightRoughnessCoefficient{i}{1,1})./StraightRoughnessCoefficient{i}{1,1};
end

%% Factors For Calculation

% Used C factor
for i=1:length(StraightStraightUpstream)
    Value(i)=StraightRoughnessCoefficient{i}(1,1);
    ValueError(i)=StraightRoughnessCoefficient{i}(1,3);
    CFactor=cell2mat(Value)';
    CFactorError=cell2mat(ValueError)';
end
CFactor=mean(CFactor(2:5));
CFactorError=mean(CFactorError(2:5));


% Used f factor
for i=1:length(StraightStraightUpstream)
    Value(i)=StraightFrictionFactor{i}(1,1);
    ValueError(i)=StraightFrictionFactor{i}(1,3);
    FFactor=cell2mat(Value)';
    FFactorError=cell2mat(ValueError)';
end
FFactor=mean(FFactor(2:5));
FFactorError=mean(FFactorError(2:5));

%% Head Losses For Straight Section

% Head Loss [m]
for i=1:length(p1)
    HeadLoss1f{i}=PropError(headlossf,[L d g v F],[StraightLength DiameterPipe gravity VExperimental1{i}{1,1} FFactor],[StraightLengthError DiameterError gravityerror VExperimental1{i}{1,3} FFactorError]);
end

% Head Loss [m]
for i=1:length(p1)
    HeadLoss1c{i}=PropError(headlossc,[L v k c R],[StraightLength VExperimental1{i}{1,1} kconversion CFactor HydraulicRadius{1,1}],[StraightLengthError VExperimental1{i}{1,3} kError CFactorError HydraulicRadius{1,3}]);
end

%% hf versus log v

for i=1:length(p1)
    x(i)=cell2mat(VExperimental1{i}(1,1));
    y(i)=cell2mat(HeadLoss1f{i}(1,1));
    z(i)=cell2mat(HeadLoss1c{i}(1,1));
    xE(i)=cell2mat(VExperimental1{i}(1,3));
    yE(i)=cell2mat(HeadLoss1f{i}(1,3));
    zE(i)=cell2mat(HeadLoss1c{i}(1,3));
end

Figure_Plot_hf_verus_v=figure;
hold on

% Darcy Friction Friction Factor
Plot_hff_verus_v=plot(x,y,'r*');

% Hazen-William Friction Factor
Plot_hfc_verus_v=plot(x,z,'b*');

% End of Laminar Zone
laminarvelocity=PropError(Velo,[Rey MU rho D],[2300 mu density DiameterPipe],[0 muError desnityError DiameterError]);
Laminar=line([laminarvelocity{1,1} laminarvelocity{1,1}], [0 1.2],'Color','k');

% End of Transitional Zone
transitionalvelocity=PropError(Velo,[Rey MU rho D],[4000 mu density DiameterPipe],[0 muError desnityError DiameterError]);
Transitional=line([transitionalvelocity{1,1} transitionalvelocity{1,1}], [0 1.2],'Color','g');

ylabel('Head Loss [m]')
xlabel('Velocity [m/sec]')
legend([Plot_hff_verus_v Plot_hfc_verus_v Laminar Transitional],{'Darcy Friction Factor','Hazen-William Friction Factor','Laminar End','Transitional End'},'Location','NorthWest');
grid minor
grid on
hold off
saveas(2,'HeadLosses.png')

% Laminar Linearity
fcorrelationlaminar=corrcoef(x(find(x<laminarvelocity{1,1})),y(find(x<laminarvelocity{1,1})));
ccorrelationlaminar=corrcoef(x(find(x<laminarvelocity{1,1})),z(find(x<laminarvelocity{1,1})));

% Turbulent Linearity
fcorrelationturbulent=corrcoef(x(find(x>transitionalvelocity{1,1})),y(find(x>transitionalvelocity{1,1})));
ccorrelationtrubulent=corrcoef(x(find(x>transitionalvelocity{1,1})),z(find(x>transitionalvelocity{1,1})));

%% hf versus log v

Figure_Plot_hf_verus_logv=figure;
hold on

% Darcy Friction Friction Factor
Plot_hff_verus_logv=plot(log10(x),log10(y),'r*');

% Hazen-William Friction Factor
Plot_hfc_verus_logv=plot(log10(x),log10(z),'b*');

% End of Laminar Zone
Laminar=line([log10(laminarvelocity{1,1}) log10(laminarvelocity{1,1})], [-5 2],'Color','k');

% End of Transitional Zone
Transitional=line([log10(transitionalvelocity{1,1}) log10(transitionalvelocity{1,1})], [-5 2],'Color','g');

ylabel('Head Loss [m]')
xlabel('Velocity [m/sec]')
grid minor
grid on


fitffactorlog=polyfit(log10(x(find(x>transitionalvelocity{1,1}))),log10(y(find(x>transitionalvelocity{1,1}))),1);
fitcfactorlog=polyfit(log10(x(find(x>transitionalvelocity{1,1}))),log10(z(find(x>transitionalvelocity{1,1}))),1);

nf=fitffactorlog(1)
bf=fitffactorlog(2)

nc=fitcfactorlog(1)
bc=fitcfactorlog(2)

Plot_f_Fit=fplot(@(x) nf.*x+bf, [log10(transitionalvelocity{1,1}) max(log10(x))]);
Plot_c_Fit=fplot(@(x) nc.*x+bc, [log10(transitionalvelocity{1,1}) max(log10(x))]);

legend([Plot_hff_verus_logv Plot_hfc_verus_logv Laminar Transitional],{'Darcy Friction Factor','Hazen-William Friction Factor','Laminar End','Transitional End'},'Location','NorthWest');

hold off
saveas(2,'HeadLosses.png')

fcorrelationlaminar(1,2);
ccorrelationlaminar(1,2);
fcorrelationturbulent(1,2);
ccorrelationtrubulent(1,2);