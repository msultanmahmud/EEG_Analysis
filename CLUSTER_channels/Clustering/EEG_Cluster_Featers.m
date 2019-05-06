clc;tic
sub=1;% Number of subject
for j=1:sub
    C=[];E=[];
for i=1:1
Files=dir(['E:\Gavin_Hearing\Hearing_Alldata_trial\data\S' num2str(j) '\Event_' num2str(i) '\*.mat']);
%a='E:\Gavin_Hearing\Hearing_Alldata_trial\data\S2\Event_4\';
a= ['E:\Gavin_Hearing\Hearing_Alldata_trial\data\S' num2str(j) '\Event_' num2str(i) '\'];
A=[];
if i<=2
for k=1:length(Files)
   FileNames=Files(k).name;
   ff = fullfile(a,FileNames);
   load(ff)
   [thetaBand, alphaBand,betaBand,gammaBand]  = EEG_feat(F,500);
    B=[thetaBand, alphaBand,betaBand,gammaBand];
    A=[A;B]; 
    D=[C;A];
end
 C=A;
 filename=['S' num2str(j) 'event1' num2str(i) '.xlsx'];
 %xlswrite(filename,D)
 %csvwrite(filename,M)
else
A=[];
for k=1:length(Files)
   FileNames=Files(k).name;
   ff = fullfile(a,FileNames);
   load(ff)
   [thetaBand, alphaBand,betaBand,gammaBand]  = EEG_feat(F,500);
    B=[thetaBand, alphaBand,betaBand,gammaBand];
    A=[A;B]; 
    D=[E;A];
end
E=A;
filename=['S' num2str(j) 'event3' num2str(i) '.xlsx'];
%xlswrite(filename,D)
end
% filename=['S' num2str(j) 'event1' num2str(i) '.xlsx'];
%  xlswrite(filename,D)
end
end
% C=A;

     wholeTime = toc;% time to execute the program