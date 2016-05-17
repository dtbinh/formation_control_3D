cube_setup;
figure;
timelength = size(xi_ref.data,1);

for i=1:30:timelength
    cube = desired_pos_abs(xi_ref.data(i,:)',cube_init);
    cube_draw;
end






