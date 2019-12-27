%Simple Sinusoidal wave in Time Domain and Frequency Domain. Continuous Time Domain
%Fourier Transform without using inbuilt functions.
%Code by Psichico (https://github.com/Psichico)

clear;
clc;
close all;

resolution = 0.01;
frequency = 50;  %%Select desired frequency
phase_in_rad = 0;

OM = 0 : resolution : 2*pi;
%OM = -pi : resolution : pi; %%Doesnt matter

fs = 2*frequency;
n = 0 : 1/fs : fs; 

x = sin((2*pi*frequency*n/fs) + phase_in_rad);

figure('Name','Sinusoidal wave in time domain','NumberTitle','off')
plot(n,x)
grid

Y = exp(-j*OM'*n)*x';
f = OM*fs/(2*pi);

figure('Name','Sinusoidal wave in frequency domain','NumberTitle','off')
plot(f,abs(Y)*resolution)
grid

%end