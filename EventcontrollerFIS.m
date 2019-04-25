n=7;

for i=1:1:n
    idEvent=[321;654;7655;7643;4578;5432];
source=[17;18; 10;18;65;76];
date=[20;19;18;17;15;14];
intervlaJour=[4;4;4;3;3;2];
intervlaSais=[4;4;4;4;4;4];
niveauChte=[2;3;4;2;3;2];
dureeChute=[97;164;97;204;183;122];
score=[2.46; 2.48;2.4678;2.445;2.3;2.43];
freq=[7;7;2;7;2;2];
chuteur=[1;1;1;1;1;1];
idniveau=[1;1;1;1;1;1];
intervSemaine=[4;4;4;4;4;4];
S(i).ID=idEvent(i);
idevent(i)=S(i).ID;

S(i).SR=source(i);
sr(i)=S(i).SR;

S(i).Date=date(i);
dte(i)=S(i).Date;

S(i).IntervlaJour=intervlaJour(i);
inJ(i)=S(i).IntervlaJour;

S(i).IntervlaSais=intervlaSais(i);
inLs(i)=S(i).IntervlaSais;

S(i).NiveauChte=niveauChte(i);
nivCh(i)=S(i).NiveauChte;

S(i).DureeChute=dureeChute(i);
durCht(i)=S(i).DureeChute;

S(i).Score=score(i);
score(i)=S(i).Score;

S(i).Freq=freq(i);
frq(i)=S(i).Freq;

S(i).Chuteur=chuteur(i);
chteur(i)=S(i).Chuteur;

S(i).IDniveau=idniveau(i);
idnive(i)=S(i).IDniveau;

S(i).IntervSemaine=intervSemaine(i);
intSem(i)=S(i).IntervSemaine;

a=[idEvent'; source';date';intervlaJour';intervlaSais';niveauChte']
V1=a(:,1);
V2=a(:,2);
V3=a(:,3);
% V2=a(:,2);
V4=a(:,4);
V5=a(:,5);
V6=a(:,6);
%V3=a(:,3)
c=[V1, V2,V3,V4,V5,V6]

end




