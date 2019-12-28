%Discrete Time Fourier Transform of given Discrete signal.
%DTFT without using inbuilt functions.
%Code by Psichico (https://github.com/Psichico)

clear;
clc;
close all;

x = [1 -3 6 -1 5 8]; %give your signal here, index should start from 0

figure
stem(x);

N = length(x);
resolution = 0.01;
w = 0 : resolution : 2*pi; %it is 2*pi periodic

dtft = [1 - exp(-j.*w.*N) ] ./ [1 - exp(-j.*w) ] ; 

figure
subplot(2,1,1)
Magnitude  = abs(dtft); 

plot(w,fftshift(Magnitude));
title('DTFT Magnitude Spectra')
xlabel('omega')
ylabel('Magnitude')

subplot(2,1,2)
Phase = angle(dtft); 
plot(w,Phase); 
title('DTFT Phase Spectra')
xlabel('omega')
ylabel('arg(omega)')
