function [ points ] = rotate_shift_3D(xi_ref,p)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

psi = xi_ref(6);
phi = xi_ref(5);
theta = xi_ref(4);


% Drehmatrix Dz
Dz = [cos(psi) -sin(psi) 0
      sin(psi)  cos(psi) 0
         0          0    1];

% Drehmatrix Dy    
Dy = [cos(phi)  0   sin(phi)
         0      1      0
     -sin(phi)  0   cos(phi)];

% Drehmatrix D
Dx = [1     0         0          
      0  cos(theta) -sin(theta)
      0  sin(theta)  cos(theta)];
  
  points = zeros(size(p));
  
  for i=1:1:size(p,2)
      points(:,i) = xi_ref(1:3) + Dz*Dy*Dx*p(:,i);
  end
  
end

