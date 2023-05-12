% main.m
%clear;clc

global Nx dimPk NumGLP
Nx = 80;
k = 2;
NumGLP = 5;
dimPk = k + 1;
CFL = 0.2;

get_GLP

init_data

RK3

%calculate_L2_Error

main1
plot(Xc,uh,'rx--','linewidth',1); axis([Xc(1),Xc(end),min(uh) - 0.1,max(uh) + 0.1])
%hold on
%plot(pi + 0.5*tend,0.5,'r+')
