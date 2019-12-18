%%This code is written by Sultan Mahmud, 17 Nov 2019
% PhD student
clc;tic
%%sub=1;% Number of subject
Dcl=[];Dno=[];
sub=[1 2];
%sub=[4, 5, 6, 7, 11, 12, 13, 15, 17, 18, 19, 20, 21, 25, 26, 27, 29, 30, 32]; %HI=1;
%sub=[1, 2 ,3 ,8, 9, 10, 14 ,16, 22 ,23, 24 ,28 ,31]%NH=0;Subject ID number and class labels;
par='HI'; %% participants 
for j=1:length(sub)
    C=[];
for i=1:4
destdirectory = ['E:\Band_features_100ERPs\S' num2str(sub(j)) '\Event_' num2str(i) '\'];
%mkdir(destdirectory)
Files=dir(['E:\100sample_ERPs\S' num2str(sub(j)) '\Event_' num2str(i) '\*.csv']);
a=['E:\100sample_ERPs\S' num2str(sub(j)) '\Event_' num2str(i) '\'];
%A=[];
if i<=2
A=[];
for k=1:length(Files)
   FileNames=Files(k).name;
   ff = fullfile(a,FileNames);
   M = readtable(ff);
   MM=M(:,8:end); %%% number of data point need to ommit. here we omiteed pre-stimulus interval
   F=table2array(MM);
   [thetaBand, alphaBand,betaBand,gammaBand]  = EEG_spectralfeat(F,500);
    B=[thetaBand, alphaBand,betaBand,gammaBand];
    A=[A;B]; 
end
 C=A;
 Dcl=[Dcl;C];
% filename=['S' num2str(sub(j)) 'event' num2str(i) '.csv'];
% fulldestination = fullfile(destdirectory, filename);
% csvwrite(fulldestination,C);%save the file there directory
else
    disp('Ev12done')   
A=[];
for k=1:length(Files)
   FileNames=Files(k).name;
   ff = fullfile(a,FileNames);
   M = readtable(ff);
   MM=M(:,8:end);
   F=table2array(MM);
   [thetaBand, alphaBand,betaBand,gammaBand]  = EEG_spectralfeat(F,500);
    B=[thetaBand, alphaBand,betaBand,gammaBand];
    A=[A;B]; 
end
C=A;
Dno=[Dno;C];
%filename=['S' num2str(sub(j)) 'event' num2str(i) '.csv'];
%fulldestination = fullfile(destdirectory, filename);
%csvwrite(fulldestination,C);%save the file there directory
end
end
end
csvwrite(['Clear' par '.csv'],Dcl);%save the file there directory
csvwrite(['Noise' par '.csv'],Dno);
wholeTime = toc;% time to execute the program