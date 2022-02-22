%loading
mat_1=load('data1.mat');
mat_2=load('data2.mat');
mat_3=load('data3.mat');

%sampling frequency
Fs_1=2000;
Fs_2=166;
Fs_3=250;

%convert a structure to a matrix
DATA_1=cell2mat(struct2cell(mat_1));
DATA_2=cell2mat(struct2cell(mat_2));
DATA_3=cell2mat(struct2cell(mat_3));

%Figure
figure(1)
X1=0:1/Fs_1:length(DATA_1)/Fs_1-1/Fs_1; %plotting data in time point
Y1=DATA_1';%transposed vector to have a line vector
plot(X1,Y1)
limX1=length(X1)/Fs_1; %In order to stop the axe at the last data
axis([0 limX1  -500 500]); %Design of the limit of x and y axis
title('EMG signal')
xlabel('time(s)') 
ylabel('EMG signal') 

figure(2)
X2=DATA_2(1,:); %First line of the matrix
Y2=DATA_2(2,:); %Second line of the matrix
plot(X2,Y2)
title('Motion data')
xlabel('time(s)') 
ylabel('Motion data') 

figure(3)
X3=0:1/Fs_3:length(DATA_3)/Fs_3-1/Fs_3; %plotting data in time point
Y3=DATA_3;
plot(X3,Y3)
limX3=length(X3)/Fs_3; %In order to stop the axe at the last data
axis([0 limX3  -1.93*10^4 -1.83*10^4]); %Design of the limit of x and y axis
title('EEG signal')
xlabel('time (s)') 
ylabel('EEG signal') 

