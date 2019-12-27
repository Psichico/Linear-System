%Convolution of two signals using step function
%Code by Psichico (https://github.com/Psichico)

clear;
clc;
close all;

delta = 0.01;       %timestep increments for precision
low   = -5;
high  =  5;

t   = low : delta : high;  %can select any timeframe you want

u1  = t >= 0;		%step input
u2  = t >= 1;		%step input

u3  = 2*(u1 - u2);  %rectangular pulse(window function) using two step input

u4  = t >= -1;

u5  = u4 - u1;      %rectangular pulse
u6  = u5 + u3;      %rectangular pulse

v1  = t >= -2;
v2  = t >=  2;

v3  = 2*(v1 - u2);  %rectangular pulse
v4  = u2 - v2;      %rectangular pulse
v5  = v3 + v4;      %rectangular pulse

figure('Name','Signal X1','NumberTitle','off')
plot(t, u6)
figure('Name','Signal X2','NumberTitle','off')
plot(t, v5)

x1 = conv(v5,u6);
x1 = x1*delta;               %correcting the resolution
x2 = fft(x1,length(x1));     %convert to frequency domain

t  = 2*low : delta : 2*high; %becomes twice because of convolution

N  = length(x2);
f  = -(N-1)/2 : (N-1)/2;

phase = angle(x2);

figure('Name','Convoluted Signal in Time Domain','NumberTitle','off')
plot(t,x1)
grid

figure('Name','Magnitude response of Convoluted signal','NumberTitle','off')
plot(f*delta, fftshift(abs(x2))*delta)
grid

figure('Name','Phase response of Convoluted Signal','NumberTitle','off')
plot(f,phase)
grid

%END