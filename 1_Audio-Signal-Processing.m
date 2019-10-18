%Time and Frequency response of an audio signal
%Code by Psichico (https://github.com/Psichico)

clc;
clear;
close all;

%replace audio.format with file name and extention

[x, fs] = audioread('audio.format'); %read the audiofile, return x=sampled data and fs=sampling rate of x.
                                     %keep the audio file in same folder.
                                     % audio.format example Steve.mp3 or
                                     % steve.wav

									 
% % select particular range of the audio %uncomment the following two lines
% samples = [2*fs,4*fs]; %from 2nd second to 4th second %change as per requirement
% [x, fs] = audioread('audio.format',samples);
                                     
wc  = 1000;                       %cut-off frequency
LowBand = 5000;                   %Low cut off of bandpass
HighBand = 10000;                 %max cut off of bandpass

%Uncomment only one of the below filter

% h = fir1(100, [(LowBand)*(2/fs) (HighBand)*(2/fs)], 'bandpass');
% %Bandpass filer
h = fir1(100, (wc)*(2/fs) , 'low');   %LowPass Filter
% h = fir1(100, (wc)*(2/fs) , 'high');  %HighPass Filter

xx = x;
yy = x;

x = filter(h,1,x); %apply filter on x
N = length(x); %length of the array
OM = 0:0.01:pi;  % range is from 0 to pi, increment in steps of 0.01 as it is detla 't'. 
n = 0:(N-1); %'n' is the integral range from '0' to 'N-1'

X = exp(-j*OM'*n)*x;  %convert time domain to frequency domain of Filtered 'x'
Y = exp(-j*OM'*n)*yy; %convert time domain to frequency domain of Original 'x'

fq = OM*fs/(2*pi); %amplitude formula is used because OM varies in the interval

figure('Name','Frequency Response after applying filter','NumberTitle','off')
plot(fq, abs(X))
grid

figure('Name','Frequency Response before applying filter','NumberTitle','off')
plot(fq, abs(Y))
grid

figure('Name','Time Response after applying filter','NumberTitle','off')
plot(n, x)
grid

figure('Name','Time Response before applying filter','NumberTitle','off')
plot(n, xx)
grid

pause(1)
sound(yy,fs) %Original sound
pause(11)
sound(x,fs)  %Filtered sound

%end