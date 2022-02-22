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
xlabel('Time(s)') 
ylabel('EMG signal') 
saveas(gcf,'EEG')% save as .fig
saveas(gcf,'EMG.png')% save as .png

figure(2)
X2=DATA_2(1,:); %First line of the matrix
Y2=DATA_2(2,:); %Second line of the matrix
plot(X2,Y2)
title('Motion data')
xlabel('Time(s)') 
ylabel('Motion data') 
saveas(gcf,'Motion')% save as .fig
saveas(gcf,'Motion.png') % save as .png

figure(3)
X3=0:1/Fs_3:length(DATA_3)/Fs_3-1/Fs_3; %plotting data in time point
Y3=DATA_3;
plot(X3,Y3)
limX3=length(X3)/Fs_3; %In order to stop the axe at the last data
axis([0 limX3  -1.93*10^4 -1.83*10^4]); %Design of the limit of x and y axis
title('EEG signal')
xlabel('Time (s)') 
ylabel('EEG signal') 
saveas(gcf,'EEG')% save as .fig
saveas(gcf,'EEG.png')% save as .png

figure(5)
X = fft(DATA_1');% Obtain the DFT using the FFT algorithm
X(1,1)=0;%Force the first element at 0
Xabs = abs(X); % Obtain the magnitude
N = length(Xabs);
fgrid = Fs_1*(0:(N-1))/(N);
Xabs = Xabs(1:floor(N/4));
fgrid = fgrid(1:floor(N/4));
plot(fgrid,Xabs);

figure(6)
X = fft(DATA_3');% Obtain the DFT using the FFT algorithm
X(1,1)=0;%Force the first element at 0
Xabs = abs(X); % Obtain the magnitude
N = length(X);
fgrid = Fs_3*(0:(N-1))/(N);
Xabs = Xabs(1:floor(10000));
fgrid = fgrid(1:floor(10000));
plot(fgrid,Xabs);

figure(7)
% L = length(Xabs);
% P2 = abs(X/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs_3*(0:(L/2))/L;

freq = 0:Fs_3/length(DATA_3'):Fs_3/2;
xdft(1,1)=0;
xdft = X(1:length(DATA_3')/2+1);
plot(freq,abs(xdft));
% plot(f,P1)

