clc
clear
load('visiondata.mat');

%%
%visualize_vision_data(fixed_meas_3, fixed_true);
%visualize_vision_data(circ_meas_2, circ_true);
visualize_vision_data(mov_meas_2, mov_true);

%%
pf_track(circ_meas_2, circ_true ,2);
%pf_track(fixed_meas_1, fixed_true ,2);


%% Part of the results
% -circle-1000 particles, type 2, motion model cicular
% RQ-origin	absolute error analysi s: measurements: 24.8 +- 12.8, estimates: 8.7 +- 4.5
% R-*0.1		absolute error analysis: measurements: 24.8 +- 12.8, estimates: 10.3 +- 2.3
% R-*1		absolute error analysis: measurements: 24.8 +- 12.8, estimates: 12.4 +- 6.6
% Q-*10		absolute error analysis: measurements: 24.8 +- 12.8, estimates: 7.8 +- 3.1
% Q-*3		absolute error analysis: measurements: 24.8 +- 12.8, estimates: 7.3 +- 3.6
% 
% motion model linear
% Q-*10		absolute error analysis: measurements: 24.8 +- 12.8, estimates: 21.2 +- 5.7
% Q-*3		absolute error analysis: measurements: 24.8 +- 12.8, estimates: 7.4 +- 3.9
% 
% motion model fixed
% R-*10,Q*2	absolute error analysis: measurements: 24.8 +- 12.8, estimates: 11.4 +- 5.8
% R-*10,Q*4	absolute error analysis: measurements: 24.8 +- 12.8, estimates: 11.4 +- 5.4
