clc;
clear all;
%close all;
% ROI values: A1, M1, B1, B2
% HI
rhi = [7.1189	7.1935	7.036	6.9806];
%sehi=[0.306428571 0.249030612 0.210178571 0.233290816];

% ROI values: A1, M1, B1, B2
% NH
rnh=[6.2587 6.3864 6.3719 6.2757];
%senh=[];
fig = figure
% errorbar(rhi,sehi,'rx')
% %hold on
% errorbar(rnh,sehi,'bo')
plot(rhi,'r--*','LineWidth',2, 'MarkerSize',10, 'MarkerEdgeColor','b')
hold on 
%plot(rhi,'g--+')
plot(rnh,'-o','LineWidth',2, 'MarkerSize',10, 'MarkerEdgeColor','g')
title('Eccentricity for clean speech detection (LH)')
legend('HI', 'NH')
xlabel('Different brain ROIs')
ylabel('Measured Eccentricity Value')
xlim([.5 4.5])
ylim([6 7.5])