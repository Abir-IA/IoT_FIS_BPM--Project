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

%Data for the first input of the first controller: input about patient
%status

[num,txt,tab]=xlsread('eventdatasample.xls');

idevent=cell2mat({tab{2:end,1}}')
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

%t=[idevent; source; intervalleSaison; nivChutePrec; dureeChutePrec; scorePatient; freqChutePatient; chuteurRep; idniveauurgence; intervalleSemaine; intervalleChutePrec; intervalleChutePrec; intervalleScore];

%use Table instead of matrix to solve the problem
%Table array with named variables that can contain different types
%test with 2 cols
EventTable = table(heure, date,idevent, intervalleJour, intervalleSemaine, intervalleSaison, dureeChutePrec, freqChutePatient, chuteurRep, intervalleScore, idniveau_urgence, dureeChutePrec, nivChutePrec);
%%%%
r=cellstr(source)
p=cellstr(scorePatient)
EventTable = table(idevent,r,date,heure, intervalleJour,intervalleSaison,nivChutePrec, dureeChutePrec,p, freqChutePatient, chuteurRep, idniveauUrgence, intervalleSemaine)

% Matrix Construction%

T=NaN(19,15)
T(:,1)=idevent
T(1:numel(intervalleJour),5)=intervalleJour
T(1:numel(intervalleSaison),6)=intervalleSaison
%T(1:numel(nivChutePrec),7)=nivChutePrec
T(1:numel(dureeChutePrec),8)=dureeChutePrec
T(1:numel(scorePatient),9)=scorePatient
 T(1:numel(freqChutePatient),10)=freqChutePatient
T(1:numel(chuteurRep),11)=chuteurRep
 T(1:numel(idniveauUrgence),12)=idniveauUrgence
T(1:numel(intervalleSemaine),13)=intervalleSemaine


%Data for the second input of the first controller: input about device
%status
[num,txt,tab]=xlsread('DeviceDataSet.xls');
 
 
Position=cell2mat({raw{2:end,1}}');
 
 ID_Device=({raw{2:end,2}}');
 id=cellfun(@ischar,ID_Device);
 ID_Device(id)={nan};
 ID_Device_Cam=cell2mat(ID_Device); 
 
 dateDevice=({raw{2:end,3}}');
 formatOut = 'dd/mm/yyyy';
 DateStringIn=dateDevice;
 Date_First_use=datestr(DateStringIn,formatOut);
 
 Total_FalseAlerts_2015=cell2mat({raw{2:end,4}}');
 
 Total_FalseAlerts_2016=cell2mat({raw{2:end,5}}');
 
 Total_FalseAlerts_2017=cell2mat({raw{2:end,6}}');
 
 Total_FalseAlerts_2018=cell2mat({raw{2:end,7}}');
 
 Device_Changed=cell2mat({raw{2:end,8}}');
 
 %create input table : for device
 
InputDeviceTable = table(Position, ID_Device, Date_First_use, Total_FalseAlerts_2015, Total_FalseAlerts_2016, Total_FalseAlerts_2017, Total_FalseAlerts_2018, Device_Changed);
 






