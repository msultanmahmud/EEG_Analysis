tic
clc; clear all;
close all;
sub=2;
Ev12=[];Ev34=[];FFna5=zeros(5,106);FFca5=zeros(5,106);
for j=1:sub
EN=4;
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
  %(r*c)=(5*106)
 FFcr12=[c1m;c2m;c3m;c4m;c5m];
 % only rows
 FF=[c1m c2m c3m c4m c5m];
 pathw='C:\Users\Sultan\OneDrive - The University of Memphis\RESEARCH2017S\CLUSTER_channels\Time_series_5cls';
 filename=['c15_' 'S' num2str(j) 'event12.xlsx'];
 ffc=fullfile(pathw,filename); 
 %xlswrite(ffc,FF);
 %figure
%   t=linspace(-10,200,length(FF));
%   figure(1);
%   plot(t,FF'*1e6,'LineWidth',2);
%   legend('c1m','c2m','c3m','c4m','c5m')
%   xlim([-10 200]); grid on;xlabel('Time (ms)');ylabel('Voltage (uv)')
  %%
  %For event 3 and 4
 cs1=F34([2,3,11],:);cs2=F34([6,13,26],:);cs3=F34([5,14,23],:);cs4=F34([1,4,12],:);cs5=F34(18,:);
   %ismember(F,c1); %checking matched values;
 cs1m=mean(cs1); cs2m=mean(cs2); cs3m=mean(cs3);cs4m=mean(cs4);cs5m=cs5;
   % Forming a vector by the clusters data points
  %FF34=[cs1m;cs2m;cs3m;cs4m;cs5m];
  FFn34=[cs1m cs2m cs3m cs4m cs5m];
  FFnr34=[cs1m;cs2m;cs3m;cs4m;cs5m];
  filename=['c15_' 'S' num2str(j) 'event34.xlsx'];
  ffn=fullfile(pathw,filename);
  FFca5=FFca5+FFcr12;
  FFna5=FFna5+FFnr34;
  %% this is for 5 by 506
  %xlswrite(ffn,FFn34)
  %Ev12=[Ev12;FFcr12];
  %xlswrite('Ev12fall.xlsx',FFca5)
  %Ev34=[Ev34;FFnr34];
  %xlswrite('Ev34fall.xlsx',FFna5)
  %% This is for 1 by 530
  Ev12=[Ev12;FF];
  Ev34=[Ev34;FFn34];
end
Fallcc5=FFca5/sub;% 
Fallnc5=FFna5/sub;%
clall=sum(Fallcc5)/5.0;
nsall=sum(Fallnc5)/5.0;
%xlswrite('Allcc5.xlsx',Fallcc5)
  %Ev34=[Ev34;FFnr34];
%xlswrite('Allnc5.xlsx',Fallnc5)
%xlswrite('Allrowcc5.xlsx',Ev12); %% This the file for clear writing
%%xlswrite('Allrownc5.xlsx',Ev34); %% This is the for nose-degraded 

timeElapsed=toc;
  close all
  figure(1)
  t=linspace(-10,200,length(Fallcc5));
  plot(t,Fallcc5'*1e6,'LineWidth',2);
  legend('c1m','c2m','c3m','c4m','c5m')
  xlim([-10 200]); grid on;xlabel('Time (ms)');ylabel('Voltage (uv)')
  title('Clear sound')
  
  figure(2)
  t=linspace(-10,200,length(Fallnc5));
  plot(t,Fallnc5'*1e6,'LineWidth',2);
  legend('c1m','c2m','c3m','c4m','c5m')
  xlim([-10 200]); grid on;xlabel('Time (ms)');ylabel('Voltage (uv)')
  title('Noise sound')

  figure(3)
  t=linspace(-10,200,length(Fallnc5));
  plot(t,clall'*1e6,'LineWidth',2);
  legend('c1m','c2m','c3m','c4m','c5m')
  xlim([-10 200]); grid on;xlabel('Time (ms)');ylabel('Voltage (uv)')
  title('Clean sound')
  figure(4)
  t=linspace(-10,200,length(Fallnc5));
  plot(t,nsall'*1e6,'LineWidth',2);
  legend('c1m','c2m','c3m','c4m','c5m')
  xlim([-10 200]); grid on;xlabel('Time (ms)');ylabel('Voltage (uv)')
  title('Noise sound')