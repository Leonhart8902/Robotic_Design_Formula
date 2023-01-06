syms l1 d1 l2 d2 l3 d3 l4 d4 l5 d5 t1 t2 t3 t4 t5

num_of_joint = input ("How much join you have: ");
switch num_of_joint 
    case 1
        al_1 = input("Input your alpha_1: ");
        a_1 = input("Input your a_1: ");
        d_1 = input("Input your d_1: ");
        t_1 = input ("Input your theta_1: ");
        DH_par = [al_1 a_1 d_1 t_1]
        start_T_calc = input("I/O : ","s");
        while true
            if start_T_calc == "I"
                frame_1 = input("From what frame: ");
                frame_2 = input("to what frame: ");
                if frame_1 == 0 && frame_2 == 1
                    T_0_1 = [cosd(t_1) -sind(t_1) 0 a_1;... 
                        sind(t_1)*cosd(al_1) cosd(t_1)*cosd(al_1) -sind(al_1) -sind(al_1)*d_1;...
                        sind(t_1)*sind(al_1) cosd(t_1)*sind(al_1) cosd(al_1) cosd(al_1)*d_1;...
                        0 0 0 1]
                    cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
                else 
                    fprintf ("ERROR")
                    break
                end
            else
                break
            end 
        end
    case 2
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
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            elseif frame_1 == 1 && frame_2 == 2
            disp(T_2_1)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            elseif frame_1 == 0 && frame_2 == 2
            disp(T_2_0)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            end
        
        end
                    
    case 3
        al_1 = input("Input your alpha_1: ");
        a_1 = input("Input your a_1: ");
        d_1 = input("Input your d_1: ");
        t_1 = input ("Input your theta_1: ");
        al_2 = input("Input your alpha_2: ");
        a_2 = input("Input your a_2: ");
        d_2 = input("Input your d_2: ");
        t_2 = input ("Input your theta_2: ");
        al_3 = input("Input your alpha_3: ");
        a_3 = input("Input your a_3: ");
        d_3 = input("Input your d_3: ");
        t_3 = input ("Input your theta_3: ");
        DH_par = [al_1 a_1 d_1 t_1; al_2 a_2 d_2 t_2; al_3 a_3 d_3 t_3]
        
        T_1_0 = [cosd(t_1) -sind(t_1) 0 a_1;... 
                 sind(t_1)*cosd(al_1) cosd(t_1)*cosd(al_1) -sind(al_1) -sind(al_1)*d_1;...
                 sind(t_1)*sind(al_1) cosd(t_1)*sind(al_1) cosd(al_1) cosd(al_1)*d_1;...
                 0 0 0 1];
        T_2_1 = [cosd(t_2) -sind(t_2) 0 a_2;... 
                 sind(t_2)*cosd(al_2) cosd(t_2)*cosd(al_2) -sind(al_2) -sind(al_2)*d_2;...
                 sind(t_2)*sind(al_2) cosd(t_2)*sind(al_2) cosd(al_2) cosd(al_2)*d_2;...
                 0 0 0 1];

        T_3_2 = [cosd(t_3) -sind(t_3) 0 a_3;... 
                 sind(t_3)*cosd(al_3) cosd(t_3)*cosd(al_3) -sind(al_3) -sind(al_3)*d_3;...
                 sind(t_3)*sind(al_3) cosd(t_3)*sind(al_3) cosd(al_3) cosd(al_3)*d_3;...
                 0 0 0 1];
 
        T_2_0 = T_1_0 * T_2_1;
                   
        T_3_1 = T_2_1 * T_3_2;
                    
        T_3_0 = T_1_0 * T_2_1 * T_3_2;
        
        while true
            frame_1 = input("From what frame: ");
            frame_2 = input("to what frame: ");
            if frame_1 == 0 && frame_2 == 1
            disp(T_1_0)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            elseif frame_1 == 1 && frame_2 == 2
            disp(T_2_1)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            elseif frame_1 == 0 && frame_2 == 2
            disp(T_2_0)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            elseif frame_1 == 1 && frame_2 == 3
            disp(T_3_1)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            elseif frame_1 == 2 && frame_2 == 3
            disp(T_3_2)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end        
            elseif frame_1 == 0 && frame_2 == 3
            disp(T_3_0)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end        
            end
        
        end
                      
    case 4
    al_1 = input("Input your alpha_1: ");
        a_1 = input("Input your a_1: ");
        d_1 = input("Input your d_1: ");
        t_1 = input ("Input your theta_1: ");
        al_2 = input("Input your alpha_2: ");
        a_2 = input("Input your a_2: ");
        d_2 = input("Input your d_2: ");
        t_2 = input ("Input your theta_2: ");
        al_3 = input("Input your alpha_3: ");
        a_3 = input("Input your a_3: ");
        d_3 = input("Input your d_3: ");
        t_3 = input ("Input your theta_3: ");
        al_4 = input("Input your alpha_4: ");
        a_4 = input("Input your a_4: ");
        d_4 = input("Input your d_4: ");
        t_4 = input ("Input your theta_4: ");
        DH_par = [al_1 a_1 d_1 t_1; al_2 a_2 d_2 t_2; al_3 a_3 d_3 t_3; al_4 a_4 d_4 t_4]
        
        T_1_0 = [cosd(t_1) -sind(t_1) 0 a_1;... 
                 sind(t_1)*cosd(al_1) cosd(t_1)*cosd(al_1) -sind(al_1) -sind(al_1)*d_1;...
                 sind(t_1)*sind(al_1) cosd(t_1)*sind(al_1) cosd(al_1) cosd(al_1)*d_1;...
                 0 0 0 1];
             
        T_2_1 = [cosd(t_2) -sind(t_2) 0 a_2;... 
                 sind(t_2)*cosd(al_2) cosd(t_2)*cosd(al_2) -sind(al_2) -sind(al_2)*d_2;...
                 sind(t_2)*sind(al_2) cosd(t_2)*sind(al_2) cosd(al_2) cosd(al_2)*d_2;...
                 0 0 0 1];

        T_3_2 = [cosd(t_3) -sind(t_3) 0 a_3;... 
                 sind(t_3)*cosd(al_3) cosd(t_3)*cosd(al_3) -sind(al_3) -sind(al_3)*d_3;...
                 sind(t_3)*sind(al_3) cosd(t_3)*sind(al_3) cosd(al_3) cosd(al_3)*d_3;...
                 0 0 0 1];
        T_4_3 = [cosd(t_4) -sind(t_4) 0 a_4;... 
                 sind(t_4)*cosd(al_4) cosd(t_4)*cosd(al_4) -sind(al_4) -sind(al_4)*d_4;...
                 sind(t_4)*sind(al_4) cosd(t_4)*sind(al_4) cosd(al_4) cosd(al_4)*d_4;...
                 0 0 0 1];
 
        T_2_0 = T_1_0 * T_2_1;
                   
        T_3_1 = T_2_1 * T_3_2;
        
        T_4_2 = T_3_2 * T_4_3;
                    
        T_3_0 = T_1_0 * T_2_1 * T_3_2;
        
        T_4_1 = T_2_1 * T_3_2 * T_4_3;
        
        T_4_0 = T_1_0 * T_2_1 * T_3_2 * T_4_3;
        while true
            frame_1 = input("From what frame: ");
            frame_2 = input("to what frame: ");
            if frame_1 == 0 && frame_2 == 1
            disp(T_1_0)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            elseif frame_1 == 1 && frame_2 == 2
            disp(T_2_1)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            elseif frame_1 == 0 && frame_2 == 2
            disp(T_2_0)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            elseif frame_1 == 1 && frame_2 == 3
            disp(T_3_1)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            elseif frame_1 == 2 && frame_2 == 3
            disp(T_3_2)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end        
            elseif frame_1 == 0 && frame_2 == 3
            disp(T_3_0)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end  
            elseif frame_1 == 0 && frame_2 == 4
            disp(T_4_0)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end        
            elseif frame_1 == 1 && frame_2 == 4
            disp(T_4_1)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end
            elseif frame_1 == 2 && frame_2 == 4
            disp(T_4_2)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end 
            elseif frame_1 == 3 && frame_2 == 4
            disp(T_4_3)
            cont = input("Continue? [Y/N]: ","s");
                    if cont == "N"
                        break
                    end                
            end
        
        end    
        
end
 