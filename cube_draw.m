plot3(cube(1,1:1:4),cube(2,1:1:4),cube(3,1:1:4),'m');
hold on;
plot3(cube(1,5:1:8),cube(2,5:1:8),cube(3,5:1:8),'m');

plot3(cube(1,9:1:12),cube(2,9:1:12),cube(3,9:1:12),'m');

plot3(cube(1,13:1:16),cube(2,13:1:16),cube(3,13:1:16),'m');

plot3(cube(1,16:1:20),cube(2,16:1:20),cube(3,16:1:20),'m');

plot3(cube(1,21:1:25),cube(2,21:1:25),cube(3,21:1:25),'m');


axis([-2 2 -1 3 -1 6])
drawnow
hold off