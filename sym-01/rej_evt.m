%function nr_zdarz=rej_evt(czas, typ, nr_zdarz, nast_puste, typ_kl)
% -- rejestracja zdarzenia typu typ dla typ_kl
function nr_zdarz=rej_evt(czas, typ, NR_zdarz, typ_kl, nr_ev)
globs;
% ----- rejestracja zdarzenia ---------------
   nr_zdarz=NR_zdarz; 
 	t_obs(NR_zdarz)=czas; typ_zdarz(NR_zdarz)=typ; 
   % ------------------------------------------------------
	tb(nr_ev)=czas; Typz(nr_ev)=typ; kol_kl(nr_ev)=nr_zd_obs;
   % ---------------------------------------------------------
   