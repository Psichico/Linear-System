%Convolution in Discrete Time Domain.
%Fourier Transform without using inbuilt functions.
%Code by Psichico (https://github.com/Psichico)

clear;
close all;
clc;

x = [1 0 2 4];
h = [0 0 1 0 2];

figure
subplot(2,1,1)
stem(x)
grid
subplot(2,1,2)
stem(h)
grid

y = conv(x,h);

figure
stem(y);
n = 0:length(y)-1;

resolution = 0.01;
OM = 0:resolution:2*pi;

Y = exp(-j*OM'*n)*y';

figure
subplot(2,1,1)
plot(OM,abs(Y))
grid
subplot(2,1,2)
plot(OM,angle(Y))
grid