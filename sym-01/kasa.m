% function nr_zdarz =kasa(nr_zdarz, typ_kl, nr_ev)
function nr_zdarz =kasa(czas, nr_zdarz, typ_kl, nr_ev)
globs;
%        tb(nr_ev)=czas; Typz(nr_ev)=0;
        rn=rand;   
        if(rn<P_wplaty) % czy cos wybral -----
           wyb=wybor(nr_zd_obs); 
           Kasa_s=Kasa_s+Cena(wyb);
           Asort(wyb)=Asort(wyb)-1; 
           L_sukc=L_sukc+1; 
           return
     % ------------------------------------------------------
        end 
        typ=0; % wyjscie 
%        nr_zdarz=del_evt(nr_zdarz, nr_zd_obs, typ_kl, typ); % usuwamy
  
