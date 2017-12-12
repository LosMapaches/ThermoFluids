%% Flume Experiments

format compact
format short
close all
clear
clc

%% Equations

% Wing Area
syms s c su cu
PlanFormArea=s.*c;
PlanFormAreau=PartialsEquationCalculator(PlanFormArea,[s c],[su cu]);
PlanFormArea=matlabFunction(s.*c);

% Lift
syms Alpha N A Alphau Nu Au
L=N.*cos(Alpha)-A.*sin(Alpha);
Lu=PartialsEquationCalculator(L,[Alpha N A],[Alphau Nu Au]);
L=matlabFunction(N.*cos(Alpha)-A.*sin(Alpha));

% Lift Coefficient
syms l a rho v lu au rhou vu
Cl=2.*l./(a.*rho.*v.^2);
Clu=PartialsEquationCalculator(Cl,[l a rho v],[lu au rhou vu]);
Cl=matlabFunction(2.*l./(a.*rho.*v.^2));

% Drag
syms Alpha N A Alphau Nu Au
D=A.*cos(Alpha)+N.*sin(Alpha);
Du=PartialsEquationCalculator(D,[Alpha N A],[Alphau Nu Au]);
D=matlabFunction(A.*cos(Alpha)+N.*sin(Alpha));

% Drag Coefficient
syms d a rho v du au rhou vu
Cd=2.*d./(a.*rho.*v.^2);
Cdu=PartialsEquationCalculator(Cd,[d a rho v],[du au rhou vu]);
Cd=matlabFunction(2.*d./(a.*rho.*v.^2));

% Reynold's Number
syms v l rho mu vu lu rhou muu
Reynolds=v.*l.*rho./mu;
Reynoldsu=PartialsEquationCalculator(Reynolds,[v l rho mu],[vu lu rhou muu]);
Reynolds=matlabFunction(v.*l.*rho./mu);

% Angle of attack correction
syms cl clu
DeltaAlpha=1.5.*cl;
DeltaAlphau=PartialsEquationCalculator(DeltaAlpha,[cl],[clu]);
DeltaAlpha=matlabFunction(1.5.*cl);

% Coefficient of lift correction
syms cl clu
DeltaDrag=.02.*cl.^2;
DeltaDragu=PartialsEquationCalculator(DeltaDrag,[cl],[clu]);
DeltaDrag=matlabFunction(.02.*cl.^2);

%% Saving

save('Equations.mat','L','Lu','D','Du','Reynolds','Reynoldsu','Cl','Clu','Cd','Cdu','PlanFormArea','PlanFormAreau','DeltaAlpha','DeltaAlphau','DeltaDrag','DeltaDragu')