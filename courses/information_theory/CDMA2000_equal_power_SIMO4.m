% this function is to calculate the channel capacity of CDMA2000 using
% equal power allocation scheme 
% the channel is SIMO, fast fading, g11,g12,g13,g14,Nr=4
% the equation is C=1/L*sum(log(1+(|h1|^2+|h2|^2+|h3|^2+|h4|^2)*SNR)) 
% the equation is C=1/L*sum(log(1+(|h1|^2+|h2|^2)*SNR/2)) when transmitter
% does not know the channels.
% C=1/L*sum(log(1+(|h1|^2+|h2|^2)*SNR)) when transmitter knows the channels


clear all
clc

load g11
load g12
load g13
load g14

L=length(g11); % the number of coherent period
Aver11=mean(g11.^2);
Aver12=mean(g12.^2);
Aver13=mean(g13.^2);
Aver14=mean(g14.^2);
h11=g11./sqrt(Aver11); % channel normalization
h12=g12./sqrt(Aver12); % channel normalization
h13=g13./sqrt(Aver13); % channel normalization
h14=g14./sqrt(Aver14); % channel normalization
N0=1e-4;
SNR_dB=[-20:2:40];
SNR=10.^(SNR_dB/10);
M=length(SNR_dB);
P=SNR.*N0;
Pl=P./L; % power allocation for each coherent period
C=zeros(1,M);

for m=1:M
   
    C(m)=sum(log2(1+Pl(m)*(h11.^2+h12.^2+h13.^2+h14.^2)/N0))/L;
   
end

figure
plot(SNR_dB,C,'c-^');
xlabel('SNR(dB)');
ylabel('channel capacity(bits/s/Hz)');
title('channel capacity of CDMA2000 with equal power allocation (SIMO4)');