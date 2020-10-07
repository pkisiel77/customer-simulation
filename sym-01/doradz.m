% function nr_zdarz =wejscie(nr_zdarz, typ_kl, nr_ev)
function nr_zdarz =doradz(czas,nr_zdarz, typ_kl, nr_ev)
globs;
typ=0;
        if(rand<P_wyb) % czy cos wybral -----
           czas=czas-T_kasy*log(1-rand); % losujemy czas przymierzania 
      %     tb(nr_ev)=czas;
           typ=5; % KASA !!! 
           nr_zdarz=rej_evt(czas, typ, nr_zd_obs, typ_kl, nr_ev);  % rejestracja zdarzenia -
     % ------------------------------------------------------
        else nr_zdarz=del_evt(czas,nr_zdarz, nr_zd_obs, typ_kl, typ, nr_ev); % usuwamy
        end  
