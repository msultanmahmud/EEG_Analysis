tic;clc;
sub=1;% Number of subject
for j=1:sub
 av=zeros(32,106);
for i=1:4
Files=dir(['E:\Gavin_Hearing\Hearing_Alldata_trial\data\S' num2str(j) '\Event_' num2str(i) '\*.mat']);
%a='E:\Gavin_Hearing\Hearing_Alldata_trial\data\S2\Event_4\';
a= ['E:\Gavin_Hearing\Hearing_Alldata_trial\data\S' num2str(j) '\Event_' num2str(i) '\'];
if i<=2
N=0;
for k=1:length(Files)
   FileNames=Files(k).name;
   ff = fullfile(a,FileNames);
   load(ff)
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
   % Forming a vector by the clusters data points
   FF=[c1m;c2m;c3m;c4m;c5m];
   t=linspace(-10, 200,length(FF));
   figure(1)
   plot(t,FF'*1e6,'LineWidth',2);
   legend('c1m','c2m','c3m','c4m','c5m')
   xlim([-10 200]); grid on
   xlabel('Time (ms)')
   ylabel('Voltage (uv)')
 filename=['c15_' 'S' num2str(j) 'event1' num2str(i) '.xlsx'];
 %xlswrite(filename,FF)
 %csvwrite(filename,M) 
else
 N2=0;
av=zeros(32,106);
for k=1:length(Files)
    FileNames=Files(k).name;
   ff = fullfile(a,FileNames);
   load(ff)
   av=av+F;
   N2=N2+1;
end
F1=av/N2;
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
   % Forming a vector by the clusters data points
   FF=[c1m;c2m;c3m;c4m;c5m];
   figure(2);
   t=linspace(-10, 200,length(FF));
   plot(t,FF'*1e6,'LineWidth',2);
   legend('c1m','c2m','c3m','c4m','c5m')
   xlim([-10 200]); grid on
   xlabel('Time (ms)')
   ylabel('Voltage (uv)')
  filename=['c15_' 'S' num2str(j) 'event3' num2str(i) '.xlsx'];
  %xlswrite(filename,FF);
end
% filename=['S' num2str(j) 'event1' num2str(i) '.xlsx'];
%  xlswrite(filename,D)
end
end
% C=A;
     wholeTime = toc;% time to execute the program