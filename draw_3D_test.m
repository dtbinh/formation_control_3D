X_u = [0.5 0.5 -0.5 -0.5];
Y_u = [0.5 -0.5 -0.5 0.5];
Z_u = [-0.5 -0.5 -0.5 -0.5];

Ar_u = [X_u;Y_u;Z_u];

X_o = [0.5 0.5 -0.5 -0.5];
Y_o = [0.5 -0.5 -0.5 0.5];
Z_o = [0.5 0.5 0.5 0.5];

Ar_o = [X_o;Y_o;Z_o];

X_l = [0.5 0.5 -0.5 -0.5];
Y_l = [-0.5 -0.5 -0.5 -0.5];
Z_l = [-0.5 0.5 0.5 -0.5];

Ar_l = [X_l;Y_l;Z_l];

X_r = [0.5 0.5 -0.5 -0.5];
Y_r = [0.5 0.5 0.5 0.5];
Z_r = [-0.5 0.5 0.5 -0.5];

Ar_r = [X_r;Y_r;Z_r];

X_v = [-0.5 -0.5 -0.5 -0.5];
Y_v = [-0.5 -0.5 0.5 0.5];
Z_v = [-0.5 0.5 0.5 -0.5];

Ar_v = [X_v;Y_v;Z_v];

X_h = [0.5 0.5 0.5 0.5];
Y_h = [-0.5 -0.5 0.5 0.5];
Z_h = [-0.5 0.5 0.5 -0.5];

Ar_h = [X_h;Y_h;Z_h];

cube_a = [Ar_u Ar_o Ar_l Ar_r Ar_v Ar_h];


figure;

timelength = size(xi_ref.data,1);

for i=1:30:timelength
    
    
    cube = rotate_shift_3D(xi_ref.data(i,:)',cube_a);
    cube_draw;
    
    
end






