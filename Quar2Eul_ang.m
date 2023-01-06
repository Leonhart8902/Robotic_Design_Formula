clear 
clc

e_1 = input ("Input your value for 1st euler parameters: ");
e_2 = input ("Input your value for 2nd euler parameters: ");
e_3 = input ("Input your value for 3rd euler parameters: ");
e_4 = input ("Input your value for 4rd euler parameters: ");

eul_param = [e_1 e_2 e_3 e_4]

r_11 = 1- 2*(e_2^2)- 2*(e_3^2);
r_12 = 2*(e_1*e_2 - e_3*e_4);
r_13 = 2*(e_1*e_3 + e_2*e_4);
r_21 = 2*(e_1*e_2 + e_3*e_4);
r_22 = 1 - 2*(e_1^2) - 2*(e_3^2);
r_23 = 2*(e_2*e_3 - e_1*e_4);
r_31 = 2*(e_1*e_3 - e_2*e_4);
r_32 = 2*(e_2*e_3 + e_1*e_4);
r_33 = 1 - 2*(e_1^2) - 2*(e_2^2);

R_matr = [r_11 r_12 r_13; r_21 r_22 r_23; r_31 r_32 r_33]

tb = -R_matr(3,1)/(sqrt((R_matr(1,1)^2)+(R_matr(2,1)^2)))
b = atand(tb);

if b == 90
   a = 0;
   g = atand(R_matr(3,2)/R_matr(3,3));
elseif b == 270
    a = 0;
    g = atand(R_matr(3,2)/R_matr(3,3));
else
    a = acosd(R_matr(1,1)/cosd(b));
    g = acosd(R_matr(3,3)/cosd(b));
end  

eul_ang = [a b g]