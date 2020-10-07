% function nr_zdarz =mierzal(nr_zdarz, typ_kl, nr_ev)
function nr_zdarz =mierzal(czas, nr_zdarz, typ_kl, nr_ev)
globs;
typ=0;
        if(rand<P_sukc) % czy cos wybral -----
           if(rand<P_doradz)
              czas=czas-T_doradz*log(1-rand); % losujemy czas przymierzania 
              typ=4; 
           else 
              if(rand<P_przym_exp) 
                 czas=czas-T_expoz*log(1-rand); % losujemy czas ekspozycji
                 typ=2;
              else    
                 czas=czas-T_kasy*log(1-rand); % losujemy czas obsl.w kasie 
                 typ=5;
              end
           end   
      %     tb(nr_ev)=czas;
           nr_zdarz=rej_evt(czas, typ, nr_zd_obs, typ_kl, nr_ev);  % rejestracja zdarzenia -
     % ------------------------------------------------------
        else nr_zdarz=del_evt(czas,nr_zdarz, nr_zd_obs, typ_kl, typ, nr_ev); % usuwamy
        end  
