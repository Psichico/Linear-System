%Rectangular pulse function
%Code by Psichico (https://github.com/Psichico)

clear;
clc;
close all;

delta = 0.01;
low   = 0;
high  = 10;

t  = low : delta : high;

x = rectangularPulse(0,2,t);     %pulse with center 2
h = rectangularPulse(3,5,t);     %pulse with center 4

figure('Name','Rectangular pulse x','NumberTitle','off')
plot(t,x)
grid
figure('Name','Rectangular pulse h','NumberTitle','off')
plot(t,h)
grid

t  = 2*low : delta : 2*high; %necessary to scale before convolution

c1 = conv(x,h);
y = c1*delta;                %correct the precision

figure('Name','Convoluted signal','NumberTitle','off')
plot(t,y)
grid

%end