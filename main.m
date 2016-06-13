%% main script
% performs a simulation of a consensus based distributed formation
% algorithm. information about a virtual reference frame is stored in each
% vehicle and updated according to its neighbors information states and the
% if connected virtual leader. the virtual leader moves in a circle shape.
% parameters only in initialize section (No. of vehicles,
% virtual-leader-connections)

%% initialize
clear all;
close all;

% No. of vehicles
N = 60;

% specify to virtual leader connected vehicles
connections = [3 4];
connections2 = [5 8];

[A_c, A_c_2, A, A_2] = graph_create(connections, connections2, N);

% fixed communcation adjacency matrix
% A_2 = zeros(N);
% A_2(1,2) = 1;
% A_2(2,1) = 1;
% A_2(3,2) = 1;
% A_2(4,3) = 1;
% A_2(5,1) = 1;
% A_2(6,3) = 1;
% A_2(7,3) = 1;
% A_2(7,8) = 1;
% l_c = [1 0 0 0 0 0 0 0];
% A_2
% A_c_2 = [A_2 l_c'; zeros(1,N+1)]

% random initial values of the reference frame of each vehicle
%xi_init = randn(6,N);
xi_init = zeros(6,N);
% circle start formation of vehicles around the center
r_init = zeros(3,N);
for i=1:1:N
    r_init(:,i) = [cos(2*pi/N*(i-1)); sin(2*pi/N*(i-1)); 0];
end

% desired relative position / formation around virtual center
[r_rel_1, r_rel_2, r_rel_3] = create_r_relative(N);


%% simulation
sim simulation;

%% results plot

% creates new figure in the right display half with 6 subplots
scrsz = get(groot,'ScreenSize');
result = figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)]);
set(result, 'Name', 'Simulation Results Consensus', 'NumberTitle', 'off');

% splits up simulation timeseries results into the different states
time = xi_ref_i.time;
x_ref_i = timeseries(xi_ref_i.data(1,:,:), time, 'Name', 'x-coordinate');
y_ref_i = timeseries(xi_ref_i.data(2,:,:), time, 'Name', 'y-coordinate');
z_ref_i = timeseries(xi_ref_i.data(3,:,:), time, 'Name', 'z-coordinate');
theta_ref_i = timeseries(xi_ref_i.data(4,:,:), time, 'Name', 'theta-value');
phi_ref_i = timeseries(xi_ref_i.data(5,:,:), time, 'Name', 'theta-value');
psi_ref_i = timeseries(xi_ref_i.data(6,:,:), time, 'Name', 'theta-value');

subplot(3,2,1), plot(xi_ref);
legend('x_{ref}','y_{ref}','z_{ref}','theta_{ref}','phi_{ref}','psi_{ref}');
title('Plot of the reference state (leader)');
ylabel('pos/angle');

subplot(3,2,2), plot3(xi_ref.data(:,1),xi_ref.data(:,2),xi_ref.data(:,3));
legend('reference trajectory');
title('Leader trajectory');

subplot(3,2,3), plot(x_ref_i);
%legend('v1','v2','v3','v4', 'v5');
title('Followers x-coordinate');

subplot(3,2,4), plot(y_ref_i);
%legend('v1','v2','v3','v4', 'v5');
title('Followers y-coordinate');

subplot(3,2,5), plot(z_ref_i);
%legend('v1','v2','v3','v4', 'v5');
title('Followers z-coordinate');

subplot(3,2,6), plot(psi_ref_i);
%legend('v1','v2','v3','v4','v5');
title('Followers theta-valua');