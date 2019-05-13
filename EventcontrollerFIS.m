
% Reading data from data set : we make our test here only on
% a small xls file with random events

%Data for the first input of the first controller: input about patient
%status
for i=1:1:13

[num,txt,tab]=xlsread('eventdatasample.xls');

idevent=cell2mat({tab{2:end,1}}');
format long g

source = categorical({tab{2:end,2}}');

%Source=cellstr(source);
%source={tab{2:end,2}}';

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
 nivChutePrec1(b)={nan};
 nivChutePrec=cell2mat(nivChutePrec1);

 dureeChutePrec1=({tab{2:end,8}}');
 c=cellfun(@ischar,dureeChutePrec1);
 dureeChutePrec1(c)={nan};
 dureeChutePrec=cell2mat(dureeChutePrec1);

%scorePatient=categorical({tab{2:end,9}}'); 
%scorePatient = str2double({tab{2:end,9}}');
scorePatient={tab{2:end,9}}';
ScorePatient=str2double(scorePatient);

freqChutePatient=cell2mat({tab{2:end,10}}');
chuteurRep=cell2mat({tab{2:end,11}}');
idniveau_urgence=cell2mat({tab{2:end,12}}');
intervalleSemaine=cell2mat({tab{2:end,13}}');


%use Table instead of matrix to solve the problem
%Table array with named variables that can contain different types
 %create input table : for patient
EventTable = table(idevent, source, date, heure, intervalleJour, intervalleSemaine, intervalleSaison, nivChutePrec, dureeChutePrec, ScorePatient, freqChutePatient, chuteurRep, idniveau_urgence, dureeChutePrec)



%Structure for the first dataset

S(i).ID= idevent(i);
idev(i)=S(i).ID;


S(i).So= source(i)
sour(i)=S(i).So;
%j=strvcat(date)

S(i).Dat=d(i);
dte(i)=S(i).Dat;

%t=[strvcat(dte(:))]

S(i).Heure=h(i);
heuree(i)=S(i).Heure;

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

k=[num2str(idev'),strvcat(cellstr(sour)),strvcat(cellstr(dte)),strvcat(cellstr(heuree)),num2str(inJ'),num2str(inLs'),num2str(nivCh'),num2str(durCht'),strvcat(cellstr(score)),num2str(frq'),num2str(chteur'),num2str(chte'),num2str(idniveau'),num2str(intervSemaine')]
str1=k(1,:);
str2=k(2,:);
str3=k(3,:);
str4=k(4,:);
str5=k(5,:);
str6=k(6,:);
str7=k(7,:);
str8=k(8,:);
str9=k(9,:);
str10=k(10,:);
str11=k(11,:);
str12=k(12,:);
str13=k(13,:);


%Data for the second input of the first controller: input about device
%status
[num,txt,tab]=xlsread('DeviceDataSet.xls');
 
 
 %Position=cell2mat({raw{2:end,2}}');
 Position = categorical({tab{2:end,2}}');
 
 ID_Device_Cam=cell2mat({tab{2:end,1}}'); 
 
 dateDevice=({tab{2:end,3}}');
 formatOut = 'dd/mm/yyyy';
 DateStringIn=dateDevice;
 Date_First_use=datestr(DateStringIn,formatOut);
 
 Total_FalseAlerts_2015=cell2mat({tab{2:end,4}}');
 
 Total_FalseAlerts_2016=cell2mat({tab{2:end,5}}');
 
 Total_FalseAlerts_2017=cell2mat({tab{2:end,6}}');
 
 Total_FalseAlerts_2018=cell2mat({tab{2:end,7}}');
 
 Device_Changed=cell2mat({tab{2:end,8}}');
 
 %create input table : for device
 
InputDeviceTable = table(Position, ID_Device_Cam, Date_First_use, Total_FalseAlerts_2015, Total_FalseAlerts_2016, Total_FalseAlerts_2017, Total_FalseAlerts_2018, Device_Changed);
 

%Structure for the second dataset

A(i).IDDevice= ID_Device_Cam(i);
ID_Dev(i)=A(i).IDDevice;
 
A(i).Posit= Position(i);
pos(i)=A(i).Posit;

A(i).dteDev=dateDevice(i);
dtDeivce(i)=A(i).dteDev;

A(i).tFalseAlerts15=Total_FalseAlerts_2015(i);
Total_FalseAlerts15(i)=A(i).tFalseAlerts15;

A(i).tFalseAlerts16=Total_FalseAlerts_2016(i);
Total_FalseAlerts16(i)=A(i).tFalseAlerts16;

A(i).tFalseAlerts17=Total_FalseAlerts_2017(i);
Total_FalseAlerts17(i)=A(i).tFalseAlerts17;

A(i).tFalseAlerts18=Total_FalseAlerts_2018(i);
Total_FalseAlerts18(i)=A(i).tFalseAlerts18;



A(i).Dev_Changed=Device_Changed(i);
DevChanged(i)=A(i).Dev_Changed;


k2=strvcat([num2str(ID_Dev(i));pos(i);dtDeivce(i);num2str(Total_FalseAlerts15(i));num2str(Total_FalseAlerts16(i));num2str(Total_FalseAlerts17(i));num2str(Total_FalseAlerts18(i));num2str(DevChanged(i))]);





 end


