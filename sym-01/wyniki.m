figure
xt=[1:length(Rtime)];
subplot(2,2,1), plot(xt,Rtime,'y'); xlabel('Czas zdarzen');
subplot(2,2,2), plot(xev,Typz,'w'); hold on, stairs(kol_kl); 
xlabel('Typ zdarzen - kolejno');
%[1:length(kol_kl)],kol_kl,'c')
subplot(2,1,2), plot(tb,Typz,'w'),  hold on, stairs(Rtime,LKLwSKL); %,tb,kol_kl,'c')
xlabel('Typ zdarzen - w RT i dlugosc kolejki (zolty)');
%subplot(2,1,2), plot(xev,tb); 
 