clc; clear all;
close all;
sub=2;
j=1;EN=4;
for i=1:EN
Files=dir(['E:\Gavin_Hearing\Hearing_Alldata_trial\data\S' num2str(j) '\Event_' num2str(i) '\*.mat']);
%a='E:\Gavin_Hearing\Hearing_Alldata_trial\data\S2\Event_4\';
a= ['E:\Gavin_Hearing\Hearing_Alldata_trial\data\S' num2str(j) '\Event_' num2str(i) '\'];
if i==1
av1=zeros(32,106);N1=0;
for i=1:length(Files)
    %k=1:length(Files)
FileNames=Files(i).name;
ff = fullfile(a,FileNames);
   load(ff);
   av1=av1+F;
   N1=N1+1;
end
elseif i==2
av2=zeros(32,106);N2=0;
 for i=1:length(Files)
    %k=1:length(Files)
FileNames=Files(i).name;
ff = fullfile(a,FileNames);
   load(ff);
   av2=av2+F;
   N2=N2+1;
 end 
 elseif i==3
av3=zeros(32,106);N3=0;
for i=1:length(Files)
    %k=1:length(Files)
FileNames=Files(i).name;
ff = fullfile(a,FileNames);
   load(ff);
   av3=av3+F;
   N3=N3+1;
end 
else
av4=zeros(32,106);N4=0;
for i=1:length(Files)
    %k=1:length(Files)
FileNames=Files(i).name;
ff = fullfile(a,FileNames);
   load(ff);
   av4=av4+F;
   N4=N4+1;
end 
end
end
N12=N1+N2;
F1=(av2+av2)/N12;
N34=N3+N4;
F34=(av3+av4)/N34;
%%
% cluster-2 and so on
 c1=F1([2,3,11],:);c2=F1([6,13,26],:);c3=F1([5,14,23],:);c4=F1([1,4,12],:);c5=F1(18,:);
   %ismember(F,c1); %checking matched values;
 c1m=mean(c1); c2m=mean(c2); c3m=mean(c3);c4m=mean(c4);c5m=c5;
   % Forming a vector by the clusters data points
  FF=[c1m;c2m;c3m;c4m;c5m];
  filename=['c15_' 'S' num2str(j) 'event1' num2str(i) '.xlsx'];
 %xlswrite(filename,FF)
  t=linspace(-10,200,length(FF));
  figure(1);
  plot(t,FF'*1e6,'LineWidth',2);
  legend('c1m','c2m','c3m','c4m','c5m')
  xlim([-10 200]); grid on;xlabel('Time (ms)');ylabel('Voltage (uv)')
  %%
  %For event 3 and 4
  cs1=F34([2,3,11],:);cs2=F34([6,13,26],:);cs3=F34([5,14,23],:);cs4=F34([1,4,12],:);cs5=F34(18,:);
   %ismember(F,c1); %checking matched values;
 cs1m=mean(cs1); cs2m=mean(cs2); cs3m=mean(cs3);cs4m=mean(cs4);cs5m=cs5;
   % Forming a vector by the clusters data points
  FF34=[cs1m;cs2m;cs3m;cs4m;cs5m];
  filename=['cs_' 'S' num2str(j) 'event3' num2str(i) '.xlsx'];
 %xlswrite(filename,FF)
  t=linspace(-10,200,length(FF34));
  figure(2);
  plot(t,FF34'*1e6,'LineWidth',2);
  legend('c1m','c2m','c3m','c4m','c5m')
  xlim([-10 200]); grid on;xlabel('Time (ms)');ylabel('Voltage (uv)')
 %% Findpeak
 
 %FF is the cluster data for event 1&2 , F34 for event 3 and 4.
figure(3);
[pks,locs]=findpeaks(c1m*1e6);
plot(t, c1m*1e6,t(locs),pks,'or','LineWidth',2)
hold on
[pks2,locs2]=findpeaks(c2m*1e6);
plot(t, c2m*1e6,t(locs2),pks2,'*m','LineWidth',2)
hold on
[pks3,locs3]=findpeaks(c3m*1e6);
plot(t, c3m*1e6,t(locs3),pks3,'sb','LineWidth',2)
hold on
[pks4,locs4]=findpeaks(c4m*1e6);
plot(t, c4m*1e6,t(locs4),pks4,'dk','LineWidth',2)
hold on
[pks5,locs5]=findpeaks(c5m*1e6);
plot(t, c5m*1e6,t(locs5),pks5,'vg','LineWidth',2)
xlim([-10 200]); grid on;xlabel('Time (ms)');ylabel('Voltage (uv)') 
title('Clean Speech')
legend('c1m','c2m','c3m','c4m','c5m')
%%
 %% Findpeak
 %FF is the cluster data for event 1&2 , F34 for event 3 and 4.
figure(4);
[pksn,locsn]=findpeaks(cs1m*1e6);
plot(t, cs1m*1e6,t(locsn),pksn,'or','LineWidth',2)
hold on
[pksn2,locsn2]=findpeaks(cs2m*1e6);
plot(t, cs2m*1e6,t(locsn2),pksn2,'*m','LineWidth',2)
hold on
[pksn3,locsn3]=findpeaks(cs3m*1e6);
plot(t, cs3m*1e6,t(locsn3),pksn3,'sb','LineWidth',2)
hold on
[pksn4,locsn4]=findpeaks(cs4m*1e6);
plot(t, cs4m*1e6,t(locsn4),pksn4,'dk','LineWidth',2)
hold on
[pksn5,locsn5]=findpeaks(cs5m*1e6);
plot(t, cs5m*1e6,t(locsn5),pksn5,'vg','LineWidth',2)
xlim([-10 200]); grid on;xlabel('Time (ms)');ylabel('Voltage (uv)') 
title('Noise Speech')
legend('c1m','c2m','c3m','c4m','c5m')
%%
 %}
figure(5);
[pks,locs]=findpeaks(c1m*1e6);
plot(t, c1m*1e6,t(locs),pks,'or','LineWidth',2)
[pkst,locst]=findpeaks(-c1m*1e6);
plot(t, c1m*1e6,t(locs),pks, 'dm',t(locst),-pkst,'or','LineWidth',2)
hold on
[pks2,locs2]=findpeaks(c2m*1e6);;
plot(t, c2m*1e6,t(locs2),pks2,'*m','LineWidth',2)
[pkst2,locst2]=findpeaks(-c2m*1e6);
plot(t, c1m*1e6,t(locs),pks, 'dm',t(locst2),-pkst2,'ok','LineWidth',2)
xlim([-10 200]); grid on;xlabel('Time (ms)');ylabel('Voltage (uv)')
%%
[cp1,ct1]=pnppeak(t,pks,locs,pkst,locst);
[cp2,ct2]=pnppeak(t,pks2,locs2,pkst2,locst2);