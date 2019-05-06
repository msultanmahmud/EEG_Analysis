%%%% this is the code for clustering wise dtat processing
clc; clear all; close all;
j=1;, i=2;
Files=dir(['E:\Gavin_Hearing\Hearing_Alldata_trial\data\S' num2str(j) '\Event_' num2str(i) '\*.mat']);
%a='E:\Gavin_Hearing\Hearing_Alldata_trial\data\S2\Event_4\';
a= ['E:\Gavin_Hearing\Hearing_Alldata_trial\data\S' num2str(j) '\Event_' num2str(i) '\'];
av=zeros(32,106);
for i=1:length(Files)
    N=0;
    %k=1:length(Files)
FileNames=Files(i).name;
ff = fullfile(a,FileNames);
   load(ff);
   av=av+F;
   N=N+1;
end
   F1=av/N;
   %xlswrite('filename1.xlsx',FF)
   % 32 channels time series data, below is the particular channel data
   c1=F1([2,3,11],:);% cluster-1
   c2=F1([6,13,26],:);% cluster-2 and so on
   c3=F1([5,14,23],:);
   c4=F1([1,4,12],:);
   c5=F1(18,:);
   %%%if we want to test matches
   %ismember(F,c1);
   %checking matched values;
   c1m=mean(c1);
   c2m=mean(c2);
   c3m=mean(c3);
   c4m=mean(c4);
   c5m=c5;
    t=linspace(-10, 200,length(FF));
   % Forming a vector by the clusters data points
   FF=[c1m;c2m;c3m;c4m;c5m];
   xlswrite('s1e12.xlsx',FF)
   %[thetaBand, alphaBand,betaBand,gammaBand]  = EEG_feat(FF,500);
    %ll=plot(FF(2,:));set(ll,'Color',[0 0.4 0.7]); box on; grid on
    %[peakval,localval]=findpeaks(FF(2,:),'Npeaks',15); 
    figure(1);
    subplot(2,1,1)
    p=plot(FF','LineWidth',2);grid on;
   legend('c1m','c2m','c3m','c4m','c5m')
   subplot(2,1,2)
   plot(t,FF','LineWidth',2);
   legend('c1m','c2m','c3m','c4m','c5m')
   figure(2)
   %cl={'-*',':','o','-*',':'}
   plot(t,FF'*1e6,'LineWidth',2);
   legend('c1m','c2m','c3m','c4m','c5m')
   %color; cl=['*','--mo','b--','-x','-.'];
   xlim([-10 200]); grid on
   xlabel('Time (ms)')
   ylabel('Voltage (uv)')
%    figure(3)
%    plot(t,F1'*1e6,'LineWidth',2);
   %set(groot,'defaultAxesLineStyleOrder',{'--d',':','o','-*',':'})