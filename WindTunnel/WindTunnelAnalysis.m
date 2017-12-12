%% Flume Experiments

format compact
format short
close all
clear
clc

%% Data

% Data is arranged as q [mbar] V_ref [m/s] Apla [deg] AF/AF2 [N] PM/YM
% [N-cm] P[mbar]

load('OverallData.mat')

%% Equations

load('Equations.mat')

%% Drag
% NonConstant80
DNonConstant80=D(NonConstant80(:,5),deg2rad(NonConstant80(:,3)),NonConstant80(:,4));
DNonConstant80Uncertainty=Du(NonConstant80(:,5),deg2rad(NonConstant80(:,3)),deg2rad(NonConstant80UncertaintiesImport(:,3)),NonConstant80UncertaintiesImport(:,5),NonConstant80(:,4),NonConstant80UncertaintiesImport(:,4));

% Constant80
DConstant80=D(Constant80(:,5),deg2rad(Constant80(:,3)),Constant80(:,4));
DConstant80Uncertainty=Du(Constant80(:,5),deg2rad(Constant80(:,3)),deg2rad(Constant80UncertaintiesImport(:,3)),Constant80UncertaintiesImport(:,5),Constant80(:,4),Constant80UncertaintiesImport(:,4));

% Constant100
DConstant100=D(Constant100(:,5),deg2rad(Constant100(:,3)),Constant100(:,4));
DConstant100Uncertainty=Du(Constant100(:,5),deg2rad(Constant100(:,3)),deg2rad(Constant100UncertaintiesImport(:,3)),Constant100UncertaintiesImport(:,5),Constant100(:,4),Constant100UncertaintiesImport(:,4));

% NonConstant100
DNonConstant100=D(NonConstant100(:,5),deg2rad(NonConstant100(:,3)),NonConstant100(:,4));
DNonConstant100Uncertainty=Du(NonConstant100(:,5),deg2rad(NonConstant100(:,3)),deg2rad(NonConstant100UncertaintiesImport(:,3)),NonConstant100UncertaintiesImport(:,5),NonConstant100(:,4),NonConstant100UncertaintiesImport(:,4));

% Flap 45 80 mph non-constant velocity
DFlapNonConstant80=D(FlapNonConstant80(:,5),deg2rad(FlapNonConstant80(:,3)),FlapNonConstant80(:,4));
DFlapNonConstant80Uncertainty=Du(FlapNonConstant80(:,5),deg2rad(FlapNonConstant80(:,3)),deg2rad(FlapNonConstant80UncertaintiesImport(:,3)),FlapNonConstant80UncertaintiesImport(:,5),FlapNonConstant80(:,4),FlapNonConstant80UncertaintiesImport(:,4));

% Slat 3/16 Flap 45 80 mph non-constant velocity
DSlatFlapNonConstant80=D(SlatFlapNonConstant80(:,5),deg2rad(SlatFlapNonConstant80(:,3)),SlatFlapNonConstant80(:,4));
DSlatFlapNonConstant80Uncertainty=Du(SlatFlapNonConstant80(:,5),deg2rad(SlatFlapNonConstant80(:,3)),deg2rad(SlatFlapNonConstant80UncertaintiesImport(:,3)),SlatFlapNonConstant80UncertaintiesImport(:,5),SlatFlapNonConstant80(:,4),SlatFlapNonConstant80UncertaintiesImport(:,4));

%% Lift
% NonConstant80
LNonConstant80=L(NonConstant80(:,5),deg2rad(NonConstant80(:,3)),NonConstant80(:,4));
LNonConstant80Uncertainty=Lu(NonConstant80(:,5),deg2rad(NonConstant80(:,3)),deg2rad(NonConstant80UncertaintiesImport(:,3)),NonConstant80UncertaintiesImport(:,5),NonConstant80(:,4),NonConstant80UncertaintiesImport(:,4));

% Constant80
LConstant80=L(Constant80(:,5),deg2rad(Constant80(:,3)),Constant80(:,4));
LConstant80Uncertainty=Lu(Constant80(:,5),deg2rad(Constant80(:,3)),deg2rad(Constant80UncertaintiesImport(:,3)),Constant80UncertaintiesImport(:,5),Constant80(:,4),Constant80UncertaintiesImport(:,4));

% Constant100
LConstant100=L(Constant100(:,5),deg2rad(Constant100(:,3)),Constant100(:,4));
LConstant100Uncertainty=Lu(Constant100(:,5),deg2rad(Constant100(:,3)),deg2rad(Constant100UncertaintiesImport(:,3)),Constant100UncertaintiesImport(:,5),Constant100(:,4),Constant100UncertaintiesImport(:,4));

% NonConstant100
LNonConstant100=L(NonConstant100(:,5),deg2rad(NonConstant100(:,3)),NonConstant100(:,4));
LNonConstant100Uncertainty=Lu(NonConstant100(:,5),deg2rad(NonConstant100(:,3)),deg2rad(NonConstant100UncertaintiesImport(:,3)),NonConstant100UncertaintiesImport(:,5),NonConstant100(:,4),NonConstant100UncertaintiesImport(:,4));

% Flap 45 80 mph non-constant velocity
LFlapNonConstant80=L(FlapNonConstant80(:,5),deg2rad(FlapNonConstant80(:,3)),FlapNonConstant80(:,4));
LFlapNonConstant80Uncertainty=Lu(FlapNonConstant80(:,5),deg2rad(FlapNonConstant80(:,3)),deg2rad(FlapNonConstant80UncertaintiesImport(:,3)),FlapNonConstant80UncertaintiesImport(:,5),FlapNonConstant80(:,4),FlapNonConstant80UncertaintiesImport(:,4));

% Slat 3/16 Flap 45 80 mph non-constant velocity
LSlatFlapNonConstant80=L(SlatFlapNonConstant80(:,5),deg2rad(SlatFlapNonConstant80(:,3)),SlatFlapNonConstant80(:,4));
LSlatFlapNonConstant80Uncertainty=Lu(SlatFlapNonConstant80(:,5),deg2rad(SlatFlapNonConstant80(:,3)),deg2rad(SlatFlapNonConstant80UncertaintiesImport(:,3)),SlatFlapNonConstant80UncertaintiesImport(:,5),SlatFlapNonConstant80(:,4),SlatFlapNonConstant80UncertaintiesImport(:,4));

%% Planform Area
Area=PlanFormArea(Chord,Span);
AreaUncertainty=PlanFormAreau(Chord,ChordUncertainty,Span,SpanUncertainty);

%% Coefficient of Lift

% NonConstant80
NonConstant80LiftCoefficient=Cl(Area,LNonConstant80,RHO,NonConstant80(:,2));
NonConstant80LiftCoefficientUncertainty=Clu(Area,AreaUncertainty,LNonConstant80,LNonConstant80Uncertainty,RHO,RHOUncertainty,NonConstant80(:,2),NonConstant80UncertaintiesImport(:,2));

% Constant80
Constant80LiftCoefficient=Cl(Area,LConstant80,RHO,Constant80(:,2));
Constant80LiftCoefficientUncertainty=Clu(Area,AreaUncertainty,LConstant80,LConstant80Uncertainty,RHO,RHOUncertainty,Constant80(:,2),Constant80UncertaintiesImport(:,2));

% Constant100
Constant100LiftCoefficient=Cl(Area,LConstant100,RHO,Constant100(:,2));
Constant100LiftCoefficientUncertainty=Clu(Area,AreaUncertainty,LConstant100,LConstant100Uncertainty,RHO,RHOUncertainty,Constant100(:,2),Constant100UncertaintiesImport(:,2));

% NonConstant100
NonConstant100LiftCoefficient=Cl(Area,LNonConstant100,RHO,NonConstant100(:,2));
NonConstant100LiftCoefficientUncertainty=Clu(Area,AreaUncertainty,LNonConstant100,LNonConstant100Uncertainty,RHO,RHOUncertainty,NonConstant100(:,2),NonConstant100UncertaintiesImport(:,2));

% Flap 45 80 mph non-constant velocity
FlapNonConstant80LiftCoefficient=Cl(Area,LFlapNonConstant80,RHO,FlapNonConstant80(:,2));
FlapNonConstant80LiftCoefficientUncertainty=Clu(Area,AreaUncertainty,LFlapNonConstant80,LFlapNonConstant80Uncertainty,RHO,RHOUncertainty,FlapNonConstant80(:,2),FlapNonConstant80UncertaintiesImport(:,2));

% Slat 3/16 Flap 45 80 mph non-constant velocity
SlatFlapNonConstant80LiftCoefficient=Cl(Area,LSlatFlapNonConstant80,RHO,SlatFlapNonConstant80(:,2));
SlatFlapNonConstant80LiftCoefficientUncertainty=Clu(Area,AreaUncertainty,LSlatFlapNonConstant80,LSlatFlapNonConstant80Uncertainty,RHO,RHOUncertainty,SlatFlapNonConstant80(:,2),SlatFlapNonConstant80UncertaintiesImport(:,2));

%% Coefficient of Drag

% NonConstant80
NonConstant80DragCoefficient=Cd(Area,DNonConstant80,RHO,NonConstant80(:,2));
NonConstant80DragCoefficientUncertainty=Cdu(Area,AreaUncertainty,DNonConstant80,DNonConstant80Uncertainty,RHO,RHOUncertainty,NonConstant80(:,2),NonConstant80UncertaintiesImport(:,2));

% Constant80
Constant80DragCoefficient=Cd(Area,DConstant80,RHO,Constant80(:,2));
Constant80DragCoefficientUncertainty=Cdu(Area,AreaUncertainty,DConstant80,DConstant80Uncertainty,RHO,RHOUncertainty,Constant80(:,2),Constant80UncertaintiesImport(:,2));

% Constant100
Constant100DragCoefficient=Cd(Area,DConstant100,RHO,Constant100(:,2));
Constant100DragCoefficientUncertainty=Cdu(Area,AreaUncertainty,DConstant100,DConstant100Uncertainty,RHO,RHOUncertainty,Constant100(:,2),Constant100UncertaintiesImport(:,2));

% NonConstant100
NonConstant100DragCoefficient=Cd(Area,DNonConstant100,RHO,NonConstant100(:,2));
NonConstant100DragCoefficientUncertainty=Cdu(Area,AreaUncertainty,DNonConstant100,DNonConstant100Uncertainty,RHO,RHOUncertainty,NonConstant100(:,2),NonConstant100UncertaintiesImport(:,2));

% Flap 45 80 mph non-constant velocity
FlapNonConstant80DragCoefficient=Cd(Area,DFlapNonConstant80,RHO,FlapNonConstant80(:,2));
FlapNonConstant80DragCoefficientUncertainty=Cdu(Area,AreaUncertainty,DFlapNonConstant80,DFlapNonConstant80Uncertainty,RHO,RHOUncertainty,FlapNonConstant80(:,2),FlapNonConstant80UncertaintiesImport(:,2));

% Slat 3/16 Flap 45 80 mph non-constant velocity
SlatFlapNonConstant80DragCoefficient=Cd(Area,DSlatFlapNonConstant80,RHO,SlatFlapNonConstant80(:,2));
SlatFlapNonConstant80DragCoefficientUncertainty=Cdu(Area,AreaUncertainty,DSlatFlapNonConstant80,DSlatFlapNonConstant80Uncertainty,RHO,RHOUncertainty,SlatFlapNonConstant80(:,2),SlatFlapNonConstant80UncertaintiesImport(:,2));

%% Wall Corrections set as uncertainties first column is for alpha second is for drag.

% NonConstant80
CorrectionNonConstant80=[DeltaAlpha(NonConstant80LiftCoefficient) DeltaDrag(NonConstant80LiftCoefficient)];

% Constant80
CorrectionConstant80=[DeltaAlpha(Constant80LiftCoefficient) DeltaDrag(Constant80LiftCoefficient)];

% Constant100
CorrectionConstant100=[DeltaAlpha(Constant100LiftCoefficient) DeltaDrag(Constant100LiftCoefficient)];

% NonConstant100
CorrectionNonConstant100=[DeltaAlpha(NonConstant100LiftCoefficient) DeltaDrag(NonConstant100LiftCoefficient)];

% Flap 45 80 mph non-constant velocity
FlapCorrectionNonConstant80=[DeltaAlpha(FlapNonConstant80LiftCoefficient) DeltaDrag(FlapNonConstant80LiftCoefficient)];

% Slat 3/16 Flap 45 80 mph non-constant velocity
SlatFlapCorrectionNonConstant80=[DeltaAlpha(SlatFlapNonConstant80LiftCoefficient) DeltaDrag(SlatFlapNonConstant80LiftCoefficient)];

%% Reynold's Number

% NonConstant80
NonConstant80Reynolds=Reynolds(Chord,MU,RHO,NonConstant80(:,2));
NonConstant80ReynoldsUncertainty=Reynoldsu(Chord,ChordUncertainty,MU,MUUncertainty,RHO,RHOUncertainty,NonConstant80(:,2),NonConstant80UncertaintiesImport(:,2));

% Constant80
Constant80Reynolds=Reynolds(Chord,MU,RHO,Constant80(:,2));
Constant80ReynoldsUncertainty=Reynoldsu(Chord,ChordUncertainty,MU,MUUncertainty,RHO,RHOUncertainty,Constant80(:,2),Constant80UncertaintiesImport(:,2));

% Constant100
Constant100Reynolds=Reynolds(Chord,MU,RHO,Constant100(:,2));
Constant100ReynoldsUncertainty=Reynoldsu(Chord,ChordUncertainty,MU,MUUncertainty,RHO,RHOUncertainty,Constant100(:,2),Constant100UncertaintiesImport(:,2));

% NonConstant100
NonConstant100Reynolds=Reynolds(Chord,MU,RHO,NonConstant100(:,2));
NonConstant100ReynoldsUncertainty=Reynoldsu(Chord,ChordUncertainty,MU,MUUncertainty,RHO,RHOUncertainty,NonConstant100(:,2),NonConstant100UncertaintiesImport(:,2));

% Flap 45 80 mph non-constant velocity
FlapNonConstant80Reynolds=Reynolds(Chord,MU,RHO,FlapNonConstant80(:,2));
FlapNonConstant80ReynoldsUncertainty=Reynoldsu(Chord,ChordUncertainty,MU,MUUncertainty,RHO,RHOUncertainty,FlapNonConstant80(:,2),FlapNonConstant80UncertaintiesImport(:,2));

% Slat 3/16 Flap 45 80 mph non-constant velocity
SlatFlapNonConstant80Reynolds=Reynolds(Chord,MU,RHO,SlatFlapNonConstant80(:,2));
SlatFlapNonConstant80ReynoldsUncertainty=Reynoldsu(Chord,ChordUncertainty,MU,MUUncertainty,RHO,RHOUncertainty,SlatFlapNonConstant80(:,2),SlatFlapNonConstant80UncertaintiesImport(:,2));

Constant100Reynolds(end+1)=NaN;
Constant100Reynolds(end+1)=NaN;
Constant100ReynoldsUncertainty(end+1)=NaN;
Constant100ReynoldsUncertainty(end+1)=NaN;

%% Saving
save('Analysis.mat')