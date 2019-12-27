%Convolution of two signals with slope equation
%Code by Psichico (https://github.com/Psichico)

clear;
clc;
close all;

delta = 0.01;
low   = -10;
high  =  10;

t = low : delta : high;

%signal 1
i = 1;
for t = low : delta : high;
    if t>=4 && t <=5;
        x1(i) = -(3*t) + 15; %equation of signal 1
        i = i+1;
    else
        x1(i) = 0;
        i = i+1;
    end
end

%signal 2
j = 1;
for t = low : delta : high;
    if t>=-2 && t <=0;
        x2(j) = t.^2;       %equation of signal 2
        j = j+1;
    else
        x2(j) = 0;
        j = j+1;
    end
end

t = low : delta : high;

figure('Name','Signal X1','NumberTitle','off')
plot(t,x1)
grid
figure('Name','Signal X2','NumberTitle','off')
plot(t,x2)
grid

t = 2*low : delta : 2*high;
y = conv(x2,x1);
y = y*delta;                %*delta to correct the resolution

figure('Name','Convoluted Signal in Time Domain','NumberTitle','off')
plot(t,y)
grid

%end