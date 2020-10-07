% function nr_zdarz=del_evt(nr_zdarz, nr_zd_obs, typ_kl, typ)
% usuwanie zdarzenia z bazy
function nr_zdarz=del_evt(czas, nr_zdarz, Nr_zd_obs, typ_kl, typ, nr_ev)
globs;
   typ_zdarz(nr_zd_obs)=0; % usuwamy zdarzenie
   if(L_zdarz==nr_zd_obs) L_zdarz=L_zdarz-1; nast_puste=0;
   else nast_puste=nr_zd_obs;   
   end
   tb(nr_ev)=czas; Typz(nr_ev)=0; kol_kl(nr_ev)=nr_zd_obs;
   Liczba_kli_w_skl=Liczba_kli_w_skl-1;   