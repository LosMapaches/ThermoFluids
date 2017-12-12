%% Formating

format compact
format short
close all
clear
clc

%% Data

ohm30=xlsread('30_ohm.csv');

Time0=ohm30(:,1);
Time3=ohm30(:,15);
Time7=ohm30(:,22);
Time10=ohm30(:,29);
Time20=ohm30(:,36);
Time30=ohm30(:,43);

Power0=ohm30(150,4);
Power3=ohm30(243,18);
Power7=ohm30(178,25);
Power10=ohm30(244,32);
Power20=ohm30(193,39);
Power30=ohm30(250,46);

Current0=ohm30(150,2);
Current3=ohm30(243,16);
Current7=ohm30(178,23);
Current10=ohm30(244,30);
Current20=ohm30(193,37);
Current30=ohm30(250,44);

Voltage0=ohm30(150,3);
Voltage3=ohm30(243,17);
Voltage7=ohm30(178,24);
Voltage10=ohm30(244,31);
Voltage20=ohm30(193,38);
Voltage30=ohm30(250,45);

DeltaT0=ohm30(:,7);
DeltaT3=ohm30(:,21);
DeltaT7=ohm30(:,28);
DeltaT10=ohm30(:,35);
DeltaT20=ohm30(:,42);
DeltaT30=ohm30(:,49);

Rl=[0 3 7 10 20 30]';

%% Equations

% Power
syms I V Rload Rwire Rinternal
P=I.*V;
p2 = (V.*(Rload+Rwire)./(Rinternal+Rload+Rwire)).^2./(Rload+Rwire);

syms P1
R=V^2/P1;

%% Table

% Power values corresponding to resistors used9

Pwr1=PropError(P,[I V],[abs(Current0) abs(Voltage0)],[.005 .005]);
Pwr1{1,1} = double(Pwr1{1,1}); 
Pwr1{1,3} = double(Pwr1{1,3})

Pwr2=PropError(P,[I V],[abs(Current3) abs(Voltage3)],[.005 .005]);
Pwr2{1,1} = double(Pwr2{1,1}); 
Pwr2{1,3} = double(Pwr2{1,3})

Pwr3=PropError(P,[I V],[abs(Current7) abs(Voltage7)],[.005 .005]);
Pwr3{1,1} = double(Pwr3{1,1}); 
Pwr3{1,3} = double(Pwr3{1,3})

Pwr4=PropError(P,[I V],[abs(Current10) abs(Voltage10)],[.005 .005]);
Pwr4{1,1} = double(Pwr4{1,1}); 
Pwr4{1,3} = double(Pwr4{1,3})

Pwr5=PropError(P,[I V],[abs(Current20) abs(Voltage20)],[.005 .005]);
Pwr5{1,1} = double(Pwr5{1,1}); 
Pwr5{1,3} = double(Pwr5{1,3})

Pwr6=PropError(P,[I V],[abs(Current30) abs(Voltage30)],[.005 .005]);
Pwr6{1,1} = double(Pwr6{1,1}); 
Pwr6{1,3} = double(Pwr6{1,3})

Power(1)=Pwr1{1,1}
Power(2)=Pwr2{1,1}
Power(3)=Pwr3{1,1}
Power(4)=Pwr4{1,1}
Power(5)=Pwr5{1,1}
Power(6)=Pwr6{1,1}

Power_Error=[Pwr1{1,3} Pwr2{1,3} Pwr3{1,3} Pwr4{1,3} Pwr5{1,3} Pwr6{1,3}]

Figure1=figure;
errorbar(Rl,Power,Power_Error,'s')
grid minor
grid on
xlabel('Resistance [\Omega]')
ylabel('Power [W]')

% Theoretical relationship for just internal resistance

Ri=PropError(R,[V P1],[abs(Voltage0) Power(1)],[.005 .005]);
Ri{1,1} = double(Ri{1,1}); 
Ri{1,3} = double(Ri{1,3})

Vnl=Voltage0;

Rt=0;

Pwr2_1=PropError(p2,[Rload Rwire Rinternal V],[Rl(1) Rt Ri{1,1} Vnl],[.01*Rl(1) 0 Ri{1,3} .005]);
Pwr2_1{1,1} = double(Pwr2_1{1,1}); 
Pwr2_1{1,3} = double(Pwr2_1{1,3})

Pwr2_2=PropError(p2,[Rload Rwire Rinternal V],[Rl(2) Rt Ri{1,1} Vnl],[.01*Rl(2) 0 Ri{1,3} .005]);
Pwr2_2{1,1} = double(Pwr2_2{1,1}); 
Pwr2_2{1,3} = double(Pwr2_2{1,3})

Pwr2_3=PropError(p2,[Rload Rwire Rinternal V],[Rl(3) Rt Ri{1,1} Vnl],[.01*Rl(3) 0 Ri{1,3} .005]);
Pwr2_3{1,1} = double(Pwr2_3{1,1}); 
Pwr2_3{1,3} = double(Pwr2_3{1,3})

Pwr2_4=PropError(p2,[Rload Rwire Rinternal V],[Rl(4) Rt Ri{1,1} Vnl],[.01*Rl(4) 0 Ri{1,3} .005]);
Pwr2_4{1,1} = double(Pwr2_4{1,1}); 
Pwr2_4{1,3} = double(Pwr2_4{1,3})

Pwr2_5=PropError(p2,[Rload Rwire Rinternal V],[Rl(5) Rt Ri{1,1} Vnl],[.01*Rl(5) 0 Ri{1,3} .005]);
Pwr2_5{1,1} = double(Pwr2_5{1,1}); 
Pwr2_5{1,3} = double(Pwr2_5{1,3})

Pwr2_6=PropError(p2,[Rload Rwire Rinternal V],[Rl(6) Rt Ri{1,1} Vnl],[.01*Rl(6) 0 Ri{1,3} .005]);
Pwr2_6{1,1} = double(Pwr2_6{1,1}); 
Pwr2_6{1,3} = double(Pwr2_6{1,3})

Pwr2=[Pwr2_1{1,1} Pwr2_2{1,1} Pwr2_3{1,1} Pwr2_4{1,1} Pwr2_5{1,1} Pwr2_6{1,1}]'
Pwr2_Error=[Pwr2_1{1,3} Pwr2_2{1,3} Pwr2_3{1,3} Pwr2_4{1,3} Pwr2_5{1,3} Pwr2_6{1,3}]'



Figure1;
hold on
errorbar(Rl,Pwr2,Pwr2_Error,'r*')
grid minor
grid on
xlabel('Resistance [\Omega]')
ylabel('Power [W]')

legend('Experimental','Theoretical','Location','Best')

saveas(gcf, 'Power', 'png')

std(Power-Pwr2')