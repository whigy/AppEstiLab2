clc
clear
load('visiondata.mat');

%visualize_vision_data(fixed_meas_3, fixed_true);
%visualize_vision_data(circ_meas_2, circ_true);
visualize_vision_data(mov_meas_2, mov_true);

%%
pf_track(fixed_meas_1, fixed_true ,2);

