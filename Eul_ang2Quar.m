clear
clc

Alpha = input("Input your Z angle value: ");
Beta = input("Input your Y angle value: ");
Gamma = input("Input your X angle value: ");

R_x = [1 0 0; 0 cosd(Gamma) -sind(Gamma); 0 sind(Gamma) cosd(Gamma)];
R_y = [cosd(Beta) 0 sind(Beta); 0 1 0; -sind(Beta) 0 cosd(Beta)];
R_z = [cosd(Alpha) -sind(Alpha) 0; sind(Alpha) cosd(Alpha) 0; 0 0 1];

ca = cosd(Alpha);
sa = sind(Alpha);
cb = cosd(Beta);
sb = sind(Beta);
cy = cosd(Gamma);
sy = sind(Gamma);

fprintf("Please choose the sequence below \n 1.ZYX\n 2.XYZ\n 3.XZY\n 4.YXZ\n 5.YZX\n 6.ZXY\n 7.XYX\n 8.XZX\n 9.YXY\n 10.YZY\n 11.ZXZ\n 12.ZYZ\n")
Condition = input("Input the sequence here: ");

switch Condition
    case 1
        Rot_matr = R_z * R_y * R_x
    case 2
        Rot_matr = R_x * R_y * R_z
    case 3
        Rot_matr = R_x * R_z * R_y
    case 4 
        Rot_matr = R_y * R_x * R_z
    case 5
        Rot_matr = R_y * R_z * R_x
    case 6 
        Rot_matr = R_z * R_x * R_y
    case 7
        Rot_matr = [cb (sb*sy) (sb*cy); (sa*sb) (-sa*cb*sy + ca*cy) (-sa*cb*cy-ca*sy);...
            (-ca*sb) (ca*cb*sy +sa*cy) (ca*cb*cy - sa*sy)]
    case 8
        Rot_matr =  [cb (-sb*cy) (sb*sy); (ca*sb) (-ca*cb*cy - sa*sy) (-ca*cb*sy-sa*cy);...
            (sa*sb) (sa*cb*cy +ca*sy) (-sa*cb*sy + ca*cy)]
    case 9
        Rot_matr =  [(-sa*cb*sy+ca*cy) (sa*sb) (sa*cb*cy+ca*sy); (sb*sy) cb (-sb*cy);...
            (-ca*cb*sy-sa*cy) (ca*sb) (ca*cb*cy - sa*sy)]
    case 10
        Rot_matr =  [(ca*cb*cy-sa*sy) (-ca*sb) (ca*cb*sy+sa*cy); (sb*cy) cb (sb*sy);...
            (-sa*cb*cy-ca*sy) (sa*sb) (-sa*cb*sy + ca*cy)]
    case 11
        Rot_matr = [(-sa*cb*sy+ca*cy) (-sa*cb*cy-ca*sy) (sa*sb); (ca*cb*sy+sa*cy) (ca*cb*cy - sa*sy) (-ca*sb);...
            (sb*sy) (sb*cy) cb]
    case 12
        Rot_matr = [(ca*cb*cy-sa*sy) (-ca*cb*sy-sa*cy) (ca*sb); (sa*cb*cy+ca*sy) (-sa*cb*sy+ca*cy) (sa*sb);...
            (-sb*cy) (sb*sy) cb]
end

%Quarternion 
e_1 = 0.5*sqrt(Rot_matr(1,1) - Rot_matr(2,2) - Rot_matr(3,3) + 1);
e_2 = 0.5*sqrt(-Rot_matr(1,1) + Rot_matr(2,2) - Rot_matr(3,3) + 1);
e_3 = 0.5*sqrt(-Rot_matr(1,1) - Rot_matr(2,2) + Rot_matr(3,3) + 1);
e_4 = 0.5*sqrt(Rot_matr(1,1) + Rot_matr(2,2) + Rot_matr(3,3) + 1);

M = [e_1 e_2 e_3 e_4];
max_M = max(M);

if M(1,4) == max_M
    e_1 = (Rot_matr(3,2) - Rot_matr(2,3))/(4*max_M);
    e_2 = (Rot_matr(1,3) - Rot_matr(3,1))/(4*max_M);
    e_3 = (Rot_matr(2,1) - Rot_matr(1,2))/(4*max_M);
    e_4 = max_M;
    disp ([e_1 e_2 e_3 e_4])
elseif M(1,1) == max_M
    e_1 = max_M;
    e_2 = (Rot_matr(1,2) + Rot_matr(2,1))/(4*max_M);
    e_3 = (Rot_matr(1,3) - Rot_matr(3,1))/(4*max_M);
    e_4 = (Rot_matr(3,2) - Rot_matr(2,3))/(4*max_M);
    disp ([e_1 e_2 e_3 e_4])
elseif M(1,2) == max_M
    e_1 = (Rot_matr(1,2) + Rot_matr(2,1))/(4*max_M);
    e_2 = max_M;
    e_3 = (Rot_matr(2,3) + Rot_matr(3,2))/(4*max_M);
    e_4 = (Rot_matr(1,3) - Rot_matr(3,1))/(4*max_M);
    disp ([e_1 e_2 e_3 e_4])
elseif M(1,3) == max_M
    e_1 = (Rot_matr(1,3) + Rot_matr(3,1))/(4*max_M);
    e_2 = (Rot_matr(2,3) + Rot_matr(3,2))/(4*max_M);
    e_3 = max_M;
    e_4 = (Rot_matr(2,1) - Rot_matr(1,2))/(4*max_M);
    disp ([e_1 e_2 e_3 e_4])
else
    disp ("ERROR")
end

