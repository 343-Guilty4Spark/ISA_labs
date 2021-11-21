close all 
clear all

fs=10e3; %% sampling frequency
f1=0.5e3;  %% first sinewave freq (in band)
f2=4.5e3; %% second sinnewave freq (out band)

N=1; %% filter order
nb=7; %% number of bits

T=1/500; %% maximum period  
tt=0:1/fs:10*T; %% time samples

x1=sin(2*pi*f1*tt); %% first sinewave
x2=sin(2*pi*f2*tt); %% second sinewave

x=(x1+x2)/2; %% input signal

[bi, ai, bq, aq]=myiir_design(N, nb) %% filter design

y=filter(bq, aq, x); %% apply filter

%% plots
figure
plot(tt,x1,'--d');
hold on
plot(tt,x2,'r--s');
plot(tt,x, 'g--+');
plot(tt, y, 'c--o');

legend('x1', 'x2', 'x', 'y')

%% quantize input and output
xq=floor(x*2^(nb-1));
idx=find(xq==2^(nb-1));
xq(idx)=2^(nb-1)-1;

yq=floor(y*2^(nb-1));
idy=find(yq==2^(nb-1));
yq(idy)=2^(nb-1)-1;

%% save input and output
fp=fopen('samples.txt','w');
fprintf(fp,'%d\n', xq);
fclose(fp);

fp=fopen('resultsc.txt', 'r');
yc = fscanf(fp, '%d');
fclose(fp);

fp=fopen('results_lookahead.txt', 'r');
yvhdl = fscanf(fp, '%d');
fclose(fp);

delta = 1/fs;
n1 = length(tt);
f_range = linspace(-0.5 / delta, 0.5 / delta, n1);

figure(3)
hold on

    ft = fftshift(fft(xq)) / N; %input signal spectrum
    plot(f_range, abs(ft), 'r');

    ft = fftshift(fft(yc)) / N; %output signal spectrum
    plot(f_range, (abs(ft)), 'g');

    ft = fftshift(fft(yvhdl)) / N; %output from c spectrum
    plot(f_range, abs(ft), 'y');

   legend('Input spectrum', 'Output spectrum');%, 'yc');
hold off


%%Calculating thd
figure(4)
thd(xq) %thd for input signal
figure(5)
%thd(yq) %thd for output signal
thd(yc)
figure(6)
%thd(yc); %thd for c output
%thd(yvhdl) %thd for vhdl output