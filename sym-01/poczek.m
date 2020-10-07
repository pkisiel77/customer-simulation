% function nr_zdarz =poczek(nr_zdarz, typ_kl, nr_ev)
function nr_zdarz =poczek(nr_zdarz, typ_kl, nr_ev)
globs;
        tb(nr_ev)=czas; Typz(nr_ev)=0;
        if(rand<P_wyb) % czy cos wybral -----
           czas=czas-1/T_poczek*log(1-rand); % losujemy czas przymierzania 
           tb(nr_ev)=czas;
           typ=3; % przymierzalnia 
           nr_zdarz=rej_evt(czas, typ, nr_zd_obs, typ_kl, nr_ev);  % rejestracja zdarzenia -
     % ------------------------------------------------------
        else nr_zdarz=del_evt(nr_zdarz, nr_zd_obs, typ_kl, typ); % usuwamy
        end  
