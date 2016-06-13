%% creates a video of the trajectories of the desired robots position and its actual positions
% trajectories should move in formation with the reference frame and keep
% the relative positions assigned

% number of vehicles
N = size(vehicle_pos.data,2);
% number of timesteps
timesteps = size(vehicle_pos.data,3);

% cube setup
cube_setup;

figure('Position',[0 100 800 800]);


% color vector
c = ['b','m','k','r','g','b','m','k','r','g','b','m','k','r','g','b','m',...
    'k','r','g','b','m','k','r','g','b','m','k','r','g','b','m','k','r',...
    'g','b','m','k','r','g','b','m','k','g','b','m','k','r','g','b','m','k',...
    'g','b','m','k','r','g','b','m','k','g','b','m','k','r','g','b','m','k',...
    'g','b','m','k','r','g','b','m','k','g','b','m','k','r','g','b','m','k',...
    'g','b','m','k','r','g','b','m','k','r','g','b','m','k','r','g'];

v = VideoWriter('C:\Users\Jens\Documents\Uni Stuttgart\BA\BA ohne Video\Matlab\Consensus_3D\1 formation_control\Videos\vehicle_trajectories9.mp4','MPEG-4');
v.FrameRate = 24;
v.Quality = 50;
open(v);
opengl('software')

% loop over each data entry of the simout results
for j=1:30:(timesteps/5)
    % plot of the reference frame trajectory
    plot3(xi_ref.data(:,1),xi_ref.data(:,2),xi_ref.data(:,3));
    axis([-2 2 -1 3 -1 3]);
    grid on;
    hold on;
    
    cube = desired_pos_abs(xi_ref.data(j,:)',cube_init);
    plot3(cube(1,1:1:4),cube(2,1:1:4),cube(3,1:1:4),'m');
    plot3(cube(1,5:1:8),cube(2,5:1:8),cube(3,5:1:8),'m');
    plot3(cube(1,9:1:12),cube(2,9:1:12),cube(3,9:1:12),'m');
    plot3(cube(1,13:1:16),cube(2,13:1:16),cube(3,13:1:16),'m');
    plot3(cube(1,16:1:20),cube(2,16:1:20),cube(3,16:1:20),'m');
    plot3(cube(1,21:1:25),cube(2,21:1:25),cube(3,21:1:25),'m');

    % loop over each vehicle
    for i=1:1:N
        % plots the x,y-values of the actual i-th robot position
        x = vehicle_pos.data(1,i,j);
        y = vehicle_pos.data(2,i,j);
        z = vehicle_pos.data(3,i,j);
        scatter3(x,y,z,60,c(i),'d','filled');
        
        %plots i-th robot desired position
%         x_ref = des_pos.data(1,i,j);
%         y_ref = des_pos.data(2,i,j);
%         z_ref = des_pos.data(3,i,j);
%         scatter3(x_ref, y_ref, z_ref,60,c(i),'filled','o');
        
    end
    writeVideo(v,getframe);
    %     legend('ref','v1','v1_des','v2','v2_des','v3','v3_des','v4','v4_des');
    hold off;
end
set(gcf,'color','w');
export_fig test.pdf
close(v);