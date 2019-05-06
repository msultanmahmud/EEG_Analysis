clc; clear all;
close all;
j=1;num=2;
for i=1:num
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
    else
        av2=zeros(32,106);N2=0;
 for i=1:length(Files)
    %k=1:length(Files)
FileNames=Files(i).name;
ff = fullfile(a,FileNames);
   load(ff);
   av2=av2+F;
   N2=N2+1;
 end 
    end
end
N=N1+N2;
F1=(av2+av2)/N;
% cluster-2 and so on
 c1=F1([2,3,11],:);c2=F1([6,13,26],:);c3=F1([5,14,23],:);c4=F1([1,4,12],:);c5=F1(18,:);
   %%%if we want to test matches
   %ismember(F,c1); %checking matched values;
   c1m=mean(c1); c2m=mean(c2); c3m=mean(c3);c4m=mean(c4);c5m=c5;
   % Forming a vector by the clusters data points
   FF=[c1m;c2m;c3m;c4m;c5m];
   t=linspace(-10, 200,length(FF));
   figure(1);
   plot(t,FF'*1e6,'LineWidth',2);
   legend('c1m','c2m','c3m','c4m','c5m')
   %color; cl=['*','--mo','b--','-x','-.'];
   xlim([-10 200]); grid on;xlabel('Time (ms)');ylabel('Voltage (uv)')