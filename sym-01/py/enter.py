
from math import log, exp

def rej_evt(czas, typ, nr_zd_obs, typ_kl, nr_ev):
    return 0

def del_evt(czas,nr_zdarz, nr_zd_obs, typ_kl, typ, nr_ev):
    return 0

# function nr_zdarz =wejscie(czas, nr_zdarz, typ_kl, nr_ev)
def enter(czas, nr_zdarz, typ_kl, nr_ev):
    P_wej = 0
    Liczba_kli_w_skl=0
    L_KL_max=100
    rand= 0.0
    T_exp=exp(1)
    nr_zd_obs = 0
    # load globs
    typ=0
    p_wej=P_wej*(1-Liczba_kli_w_skl/L_KL_max) 
    if rand<p_wej:
        l_klientow=l_klientow+1
        Lklien[nr_ev]=l_klientow
	    czas=czas-(T_exp*log(1-rand))
   	    typ=2; #ekspozycja
        #tb(nr_ev)=czas;
        nr_zdarz=rej_evt(czas, typ, nr_zd_obs, typ_kl, nr_ev)  # rejestracja zdarzenia
    else:
        nr_zdarz=del_evt(czas,nr_zdarz, nr_zd_obs, typ_kl, typ, nr_ev) # usuwamy klienta
     
    return 0
