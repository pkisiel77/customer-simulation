%symulacja sklepu obuwniczego
clear all;
globs; % tb(1)=0;
czas_sesji=8*3600; L_kwadr_sesji=floor(czas_sesji/900)+1; 
Strum=500/3600;
P_strum=0.1; P_wej=0.3; P_wyb=0.75; P_sukc=0.6; P_wplaty=0.95; 
P_doradz=0.4;
P_przym_exp=0.2; 
r=0;
Ts=L_kwadr_sesji; str0=Strum/5; str_sr=Strum; 
for(i=1:1.5*Ts) t=(i-1); STRUM(i)=str0+(str_sr-str0)/Ts*4*t*(1-0.75*t/Ts); end
plot([1:Ts]*15, STRUM(1:Ts)*60); xlabel('Strumien klientów/min'); 
Strum=str0;
%break;
%------------------------------------------------------------------- 
%      Po przymierzalni: (1-P_sukc)->rezygnacja, 
%                        P_sukc: P_kasa +P_doradz+P_przym_exp=1
%                                P_kasa=1-P_doradz+P_przym_exp;
% ------------------------------------------------------------------
T_exp=180; T_przym=240; T_zakup=68; 
T_expoz=180; T_doradz=120; T_kasy=60; T_poczek=300;
L_sukc=0; Kasa=0; cena1=53.70; cena2=15.30; cena3=150.60; cena4=289.20;
Cena=[cena1 cena2 cena3 cena4]; 
Pwyb=[0.3 0.45 0.15 0.1]; Asort0=[100 80 20 10]; 
L_KL_max=25;
% ------------- rozkl czasu wejsc -------
lam_we=1/(P_wej*Strum); 
% ---------------------------------------
typ_kl=1;  nr_ev=1; nast_puste=0;
czas=0; l_klientow=0; SUKCES=0; nr_zdarz=1;
L_zdarz=1;
czas=czas-lam_we*log(1-rand); % czas_nast=czas; 
nr_zd_obs=L_zdarz; nr_ev=1; typ=1;
nr_zdarz=rej_evt(czas, typ, nr_zd_obs, typ_kl, nr_ev); 
pkwadr=-1; Liczba_kli_w_skl=0; LKLwSKL(1)=0;
% =============================================================
l_obs=0; Asort=Asort0;
while(nr_ev<11600)  % symulacja sesji
   nr_ev=nr_ev+1; l_obs=l_obs+1; 
   % ================= przegl¹d kolejki zdarzen ------------
   tm=1.e40; nr_zd_obs=-1; 
   for(k=1:L_zdarz) % przegl¹d zdarzeñ
      if(typ_zdarz(k)>0 & t_obs(k)<tm) tm=t_obs(k); nr_zd_obs=k; end
   end    
   if(nr_zd_obs<1) break; end
   typ=typ_zdarz(nr_zd_obs); czas=t_obs(nr_zd_obs);
   LKLwSKL(l_obs)=Liczba_kli_w_skl;  Rtime(l_obs)=czas;
   kwadr=floor(czas/900)+1; 
   if(kwadr>pkwadr) 
      Strum=STRUM(kwadr); lam_we=1/(P_wej*Strum); pkwadr=kwadr;
   end
   % ------------------------------------------------------
   if(typ==1) % nadejscie kolejnego klienta
      % -------- losujemy czas wejscie nastepnego klienta ---------------
     czas_nast=czas-lam_we*log(1-rand); % losujemy wejscie nastepnego
     if(czas_nast<czas_sesji)
        typ=1; % wejscie 
        if(nast_puste==0)
           L_zdarz=L_zdarz+1; nr=L_zdarz;   
        else nr=nast_puste; nast_puste=0;
        end
        % -------------- Nowy klient w sklepie/srodowisku ------------- 
        nr_zdarz=rej_evt(czas_nast, typ, nr, typ_kl, nr_ev);  % rejestracja nastepn.wejscia-
        tb(nr_ev)=czas; nr_ev=nr_ev+1; 
%        LKLwSKL(nr_ev)=Liczba_kli_w_skl;  Rtime(nr_ev)=czas; % ?????
     end  
     % -------------- Poczatek obslugi po wejsciu --------------------- 
     if(Liczba_kli_w_skl<L_KL_max)
        Liczba_kli_w_skl=Liczba_kli_w_skl+1; 
        nr_zdarz=wejscie(czas,nr_zdarz, typ_kl, nr_ev);
     end   
        % -------------------------------------------------------------
   else % <==== nie bylo to wejscie (typ!=1) ====
      if(typ==2)% mial byc w ekspozycji    
          nr_zdarz=expoz(czas,nr_zdarz, typ_kl, nr_ev); 
      else% <==== nie bylo to 2 (typ!=1 nr_ev != 2) ====
        if(typ==3) % mial byc w przymierzalni    
           nr_zdarz=mierzal(czas, nr_zdarz, typ_kl, nr_ev);
     % ------------------------------------------------------
        else  % <==== nie bylo to 3 (typ!=1 nr_ev != 2 nr_ev !=3) ====
           % tb(nr_ev)=czas; Typz(nr_ev)=typ;
           if(typ==4) % doradztwo 
              nr_zdarz=doradz(czas, nr_zdarz, typ_kl, nr_ev);
     % ------------------------------------------------------
			  else  % <==== nie bylo to 3 (typ!=1 nr_ev != 2 nr_ev
             if(typ==5) 
                 nr_zdarz=kasa(czas, nr_zdarz, typ_kl, nr_ev);
     % ------------------------------------------------------
                 nr_zdarz=del_evt(czas,nr_zdarz, nr_zd_obs, typ_kl, typ, nr_ev); % usuwamy
	  	           SUKCES=SUKCES+1; 
                 L_SUKC(nr_ev)=SUKCES;
             end      
           end % typ=4: doradztwo 
        end % typ=3: mial byc w przymierzalni    
     end % typ=2: mial byc w ekspozycji    
   end  % typ=1: nadejscie kolejnego klienta
end   % symulacja sesji
xev=[1:length(tb)];
%xev=[1:length(l_klientow)];
figure; 
%wyniki %<--- oddzielny plik
% ---------------- Statystyka ---------------------------
for(n=1:6)
   k=0; for(i=1:length(Typz)) if(Typz(i)==n-1) k=k+1; typ_ev(n)=k; end, end
end
k=0; for(i=1:length(Typz)) if(Typz(i)==1) k=k+1; ev_wej(k)=tb(i); end, end
typ_ev,
bar(typ_ev);
