clc
clear

%% Parameters to change:
%init.m:
%   M = 1000 / 10000;
%   part_bound = 20;
%   R = diag([1e-2 1e-2 1e-2]); %process noise covariance matrix
%   Q = diag([1e-1;1e-1]);

%mcl.m:
%   multinomial/systematic re-sampling

%% Dataset 1
%runlocalization_MCL(simoutfile, mapfile,show_estimate,show_gth,show_odo,start_pose,verbose)
runlocalization_MCL('so_sym2_nk.txt', 'map_sym2.txt', 1, 1, 1,[], 2);

%%
% D1-1000 particle, 
% 
% mean error(x, y, theta)=(0.199023, -4.722965, 0.016452)
% mean absolute error=(0.665087, 4.732941, 0.143695)
% total_time =51.934639

% mean error(x, y, theta)=(-0.170241, -0.227672, 0.052013)
% mean absolute error=(0.198297, 0.273322, 0.065122)
% total_time =47.419341
% 
% D1-10000 particles
% mean error(x, y, theta)=(-0.539110, -0.721514, 0.051877)
% mean absolute error=(0.559769, 0.748113, 0.077613)
% total_time =191.471676
% 
% D1-multinomial
% mean error(x, y, theta)=(-0.673549, -0.375187, 0.012832)
% mean absolute error=(0.694845, 0.395548, 0.059998)
% total_time =191.928102
% 
% D1-10RQ
% mean error(x, y, theta)=(-1.272145, -3.057192, 1.070944)
% mean absolute error=(5.090906, 5.860038, 1.070944)
% total_time =191.402304
% 
% D1-0.01RQ
% mean error(x, y, theta)=(-1.667823, -1.554709, 0.273617)
% mean absolute error=(1.879811, 1.764976, 0.353059)
% total_time =199.750699


%% Dataset 2
%runlocalization_MCL(simoutfile, mapfile,show_estimate,show_gth,show_odo,start_pose,verbose)
runlocalization_MCL('so_sym3_nk.txt', 'map_sym3.txt', 1, 1, 1,[], 2);

