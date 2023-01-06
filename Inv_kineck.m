%% DH Param and FwdKineck
l = 1;  
        al_1 = input("Input your alpha_1: ");
        a_1 = input("Input your a_1: ");
        d_1 = input("Input your d_1: ");
        t_1 = input ("Input your theta_1: ");
        al_2 = input("Input your alpha_2: ");
        a_2 = input("Input your a_2: ");
        d_2 = input("Input your d_2: ");
        t_2 = input ("Input your theta_2: ");
        DH_par = [al_1 a_1 d_1 t_1; al_2 a_2 d_2 t_2]

        T_1_0 = [cosd(t_1) -sind(t_1) 0 a_1;... 
        sind(t_1)*cosd(al_1) cosd(t_1)*cosd(al_1) -sind(al_1) -sind(al_1)*d_1;...
        sind(t_1)*sind(al_1) cosd(t_1)*sind(al_1) cosd(al_1) cosd(al_1)*d_1;...
        0 0 0 1];
    
        T_2_1 = [cosd(t_2) -sind(t_2) 0 a_2;... 
        sind(t_2)*cosd(al_2) cosd(t_2)*cosd(al_2) -sind(al_2) -sind(al_2)*d_2;...
        sind(t_2)*sind(al_2) cosd(t_2)*sind(al_2) cosd(al_2) cosd(al_2)*d_2;...
        0 0 0 1];
        
        T_2_0 = T_1_0 * T_2_1;
        
        
        while true
            frame_1 = input("From what frame: ");
            frame_2 = input("to what frame: ");
            if frame_1 == 0 && frame_2 == 1
            disp(T_1_0)
            cont = input("Count Inverese Kinematic? [Y/N]: ","s");
                    if cont == "Y"
                        break
                    end
            elseif frame_1 == 1 && frame_2 == 2
            disp(T_2_1)
            cont = input("Count Inverese Kinematic? [Y/N]: ","s");
                    if cont == "Y"
                        break
                    end
            elseif frame_1 == 0 && frame_2 == 2
            disp(T_2_0)
            cont = input("Count Inverese Kinematic? [Y/N]: ","s");
                    if cont == "Y"
                        break
                    end
            end
        
        end
        
%% inverse Kineckmatic
fprintf("Inv Kinematics")
t1 = atan2d(-(T_2_0(1,3)),T_2_0(2,3))
t2 = atan2d(-(T_2_0(3,1)),-(T_2_0(3,2)))