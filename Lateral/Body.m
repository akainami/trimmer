clc; clear ; close; tic;

lateral_data = datcomimport('lateral.out');
longitudinal_data = datcomimport('longitudinal.out');

% Unit Debugging
lateral_data{1}.sref = lateral_data{1}.sref * 0.3048^2;
lateral_data{1}.blref = lateral_data{1}.blref * 0.3048;
lateral_data{1}.cbar = lateral_data{1}.cbar * 0.3048;
lateral_data{1}.alt = lateral_data{1}.alt * 0.3048;
lateral_data{1}.dim = 'm';
lateral_data{1}.deriv = 'deg';
lateral_data{1}.cyb(:) = lateral_data{1}.cyb(1);
lateral_data{1}.cnb(:) = lateral_data{1}.cnb(1);
lateral_data{1}.clq(:) = lateral_data{1}.clq(1);
lateral_data{1}.cmq(:) = lateral_data{1}.cmq(1);

longitudinal_data{1}.sref = longitudinal_data{1}.sref * 0.3048^2;
longitudinal_data{1}.blref = longitudinal_data{1}.blref * 0.3048;
longitudinal_data{1}.cbar = longitudinal_data{1}.cbar * 0.3048;
longitudinal_data{1}.alt = longitudinal_data{1}.alt * 0.3048;
longitudinal_data{1}.dim = 'm';
longitudinal_data{1}.deriv = 'deg';
longitudinal_data{1}.cyb(:) = longitudinal_data{1}.cyb(1);
longitudinal_data{1}.cnb(:) = longitudinal_data{1}.cnb(1);
longitudinal_data{1}.clq(:) = longitudinal_data{1}.clq(1);
longitudinal_data{1}.cmq(:) = longitudinal_data{1}.cmq(1);

V_init = 328.6 * longitudinal_data{1}.mach;
h_init = longitudinal_data{1}.alt;
mass = 4157;
inertia_xx = 12392;
inertia_yy = 31501;
inertia_zz = 41908;
inertia_xz = 2252.2;
Inertia = [inertia_xx 0 -inertia_xz;
           0 inertia_yy 0;
           -inertia_xz 0 inertia_zz];
c_ndeltar = -0.065;
c_ldeltar = 0.102;
T_max = 22e3;

% Open Simulink Model
open('SLModel.slx');
sim('SLModel.slx');

toc