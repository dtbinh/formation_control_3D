% rotierender Würfel

clear all
close all
clc

% Eckpunkte des Würfels als 1xn-Matrizen
X=[1  1 -1 -1  1  1  1 -1 -1  1  1  1  1  1 -1 -1 -1 -1 -1  1  1 -1 -1 -1  1  1 -1 -1];
Y=[1  1  1  1  1 -1 -1 -1 -1 -1  1  1 -1 -1 -1 -1  1  1 -1 -1  1  1 -1 -1 -1  1  1 -1];
Z=[1 -1 -1  1  1  1 -1 -1  1  1  1 -1 -1  1  1 -1 -1  1  1  1  1  1  1 -1 -1 -1 -1 -1];

% 1° je Schritt
phi = pi/180;

% Drehmatrix Dz
Dz = [cos(phi) -sin(phi) 0
      sin(phi)  cos(phi) 0
         0          0    1];

% Drehmatrix Dy    
Dy = [cos(phi)  0   sin(phi)
         0      1      0
     -sin(phi)  0   cos(phi)];

% Drehmatrix D
Dx = [1     0         0          
      0  cos(phi) -sin(phi)
      0  sin(phi)  cos(phi)];

% OpenGl für flackerfreie Darstellung
set(gcf,'render','opengl');

t= 700;

for k = 1:t
    
    % Matrixmultiplikation, d.h. Drehung der Eckpunkte
    xyz = Dx*Dy*Dz*[X;Y;Z];
    
    X = xyz(1,:);
    Y = xyz(2,:);
    Z = xyz(3,:);
    
    C = [k/t k/t k/t];

    % Fläche xz_oben plotten
    fill3(X(1,1:5),Y(1,1:5),Z(1,1:5),C)
    hold on
    
    % Fläche xz_unten plotten
    fill3(X(1,6:10),Y(1,6:10),Z(1,6:10),C)
    
    % Fläche yz_rechts plotten
    fill3(X(1,10:14),Y(1,10:14),Z(1,10:14),C)
    
    % Fläche yz_links plotten
    fill3(X(1,15:19),Y(1,15:19),Z(1,15:19),C)
    
    % Fläche xy_vorne plotten
    fill3(X(1,19:23),Y(1,19:23),Z(1,19:23),C)
    
    % Fläche xy_hinten plotten
    fill3(X(1,24:28),Y(1,24:28),Z(1,24:28),C)
    
    axis([-2 2 -2 2 -2 2])
    axis square
    drawnow
    hold off
end

     