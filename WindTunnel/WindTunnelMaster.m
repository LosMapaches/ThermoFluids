%% Flume Experiments

format compact
format short
close all
clear
clc

run('WindTunnelDataImport.m')
run('WindTunnelAveragingData.m')
run('WindTunnelParameters.m')
run('WindTunnelPartials.m')
run('WindTunnelAnalysis.m')
run('WindTunnelTables.m')
run('WindTunnelPlots.m')