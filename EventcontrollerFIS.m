% Use this part of the code if you have the data set otherwise start from
% line 19 (xlsread) and use the sample data provided with this code
% (eventdatasample.xls)
% import csv file
    %DataSet = readtable('EventDataSet.csv');

% divide a data set randomly into training and testing data set
% train: 70%, test: 30%
    %cv = cvpartition(size(DataSet,1),'HoldOut',0.1);
    %idx = cv.test;
% Separate to training and test data
    %dataTrain = DataSet(~idx,:);
    %dataTest  = DataSet(idx,:);

% Reading data from data set : we make our test here only on
% a small xls file with random events
%[num,txt,tab]=csvread('EventDataSet.csv');

[num,txt,tab]=xlsread('eventdatasample.xls');

devent=cell2mat({tab{2:end,1}}')
 source=cell2mat({tab{2:end,2}}');
 d=({tab{2:end,3}}');
 formatOut = 'dd/mm/yyyy';
 DateStringIn=d;
 date=datestr(DateStringIn,formatOut);

 h=({tab{2:end,4}}');
 formatOut ='HH:MM:SS';
 heure= datestr(h,formatOut);
 
 intervalleJour=cell2mat({tab{2:end,5}}');
 
 intervalleSaison=cell2mat({tab{2:end,6}}');
 
 nivChutePrec1=({tab{2:end,7}}');
b=cellfun(@ischar,nivChutePrec1);
nivChutePrec1(b)={nan}
nivChutePrec=cell2mat(nivChutePrec1)

dureeChutePrec1=({tab{2:end,8}}');
c=cellfun(@ischar,dureeChutePrec1);
dureeChutePrec1(c)={nan}
dureeChutePrec=cell2mat(dureeChutePrec1);

scorePatient=cell2mat({tab{2:end,9}}');      
freqChutePatient=cell2mat({tab{2:end,10}}');
chuteurRep=cell2mat({tab{2:end,11}}');
idniveau_urgence=cell2mat({tab{2:end,12}}');
intervalleSemaine=cell2mat({tab{2:end,13}}');

intervalleChutePrec=cell2mat({tab{2:end,14}}');
intervalleScore=char({tab{2:end,15}}');

S(i).ID= idevent(i);
idev(i)=S(i).ID;

 S(i).Source= strvcat(source(i));
 sour(i)=S(i).Source;

S(i).Date=date(i);
dte(i)=S(i).Date;

S(i).IntervlaJour=intervalleJour(i);
inJ(i)=S(i).IntervlaJour;

S(i).IntervlaSais=intervalleSaison(i);
inLs(i)=S(i).IntervlaSais;

S(i).NiveauChte=nivChutePrec(i);
nivCh(i)=S(i).NiveauChte;

S(i).DureeChute=dureeChutePrec(i);
durCht(i)=S(i).DureeChute;

S(i).Score=scorePatient(i);
score(i)=S(i).Score;

S(i).Freq=freqChutePatient(i);
frq(i)=S(i).Freq;

S(i).Chuteur=chuteurRep(i);
chteur(i)=S(i).Chuteur;

S(i).ChuteurRep=chuteurRep(i);
chte(i)=S(i).ChuteurRep;

S(i).IDniveau_urgence=idniveau_urgence(i);
idniveau(i)=S(i).IDniveau_urgence;

S(i).IntervalleSemaine=intervalleSemaine(i);
intervSemaine(i)=S(i).IntervalleSemaine;

S(i).INteChutePrec=strvcat(intervalleChutePrec(i));
inChute(i)=S(i).INteChutePrec;

S(i).IntervalleScore=strvcat(intervalleScore);
inScore=S(i).IntervalleScore;

t=[idevent; source; intervalleSaison; nivChutePrec; dureeChutePrec; scorePatient; freqChutePatient; chuteurRep; idniveauurgence; intervalleSemaine; intervalleChutePrec; intervalleChutePrec; intervalleScore];


% another way to access data from data set
%we will decide later with once to choose for the rest of the code
%idevent=  dataTest(:, 1);
%source= dataTest(:, 2);
%date= dataTest(:, 3);
%heure= dataTest(:, 4);
%intervalleJour= dataTest(:, 5);
%intervalleSaison= dataTest(:, 6);
%nivChutePrec= dataTest(:, 7);



 
% Our first example without the event dataset
n=6;
%the controller inputs 
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

%structure 
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

% event at time slot t
a=[idEvent'; source';date';intervlaJour';intervlaSais';niveauChte']
V1=a(:,1);
V2=a(:,2);
V3=a(:,3);
V4=a(:,4);
V5=a(:,5);
V6=a(:,6);
c=[V1, V2,V3,V4,V5,V6]

end




