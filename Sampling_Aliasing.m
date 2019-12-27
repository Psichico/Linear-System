%Sampling a sinusoidal signal with sampling frequency fs
%Note: The amplitude might not be accurate.
%Code by Psichico (https://github.com/Psichico)

clc;
clear all;
close all;

resolution = 0.01;
OM = 0:resolution:2*pi;

f = 100;
fs = 2*f;
n = 0: 1/fs : fs;
x = sin(2*pi*f*n/fs);
figure
plot(n,x)

Y = exp(-j*OM'*n)*x';
fq = OM*fs/(2*pi);

figure('Name','Sampled at fs','NumberTitle','off') %magnitude response
plot(fq,abs(Y)*resolution)
grid
