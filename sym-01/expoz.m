% function nr_zdarz =expoz(nr_zdarz, typ_kl, nr_ev)
function nr_zdarz =expoz(czas, nr_zdarz, typ_kl, nr_ev)
globs; 
typ=0;
         rn=rand;  
         while(1) 
           if(rn<Pwyb(1)) wyb=1; break;  end
           if(rn<Pwyb(2)) wyb=2; break;  end 
           if(rn<Pwyb(3)) wyb=3; break;  
           else wyb=4; break; 
           end   
        end  
        if(Asort(wyb)<1) 
           nr_zdarz=del_evt(czas,nr_zdarz, nr_zd_obs, typ_kl, 2, nr_ev); 
        end   
        if(rand<P_wyb) % czy cos wybral -----
           czas=czas-T_przym*log(1-rand); % losujemy czas przymierzania 
  %         tb(nr_ev)=czas;
           typ=3; % przymierzalnia 
           wybor(nr_zd_obs)=wyb; 
           nr_zdarz=rej_evt(czas, typ, nr_zd_obs, typ_kl, nr_ev);  % rejestracja zdarzenia -
     % ------------------------------------------------------
        else nr_zdarz=del_evt(czas,nr_zdarz, nr_zd_obs, typ_kl, typ, nr_ev); % usuwamy
        end  
