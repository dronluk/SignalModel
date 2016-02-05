clear all;
fd=80e6; % частота дискретизации
td=1/fd; %период дискретизации 
fc=20e6; % частота несущей (частота синусойды сигнала carr(t) ),
T=0.01; %время моделирования в секундах
Nms=T*1000; %количество миллисекунд моделирования ( Nms = T*1000 ),
t=td:td:T; % интервал мод
N=1:length(t);
f_psp=fd/1023000;
sv=1;
n = randn(1,length(t)); %Шум
carr=sin(2*pi*fc*td*N);%Несущая
psp = get_cacode(sv,f_psp);%ПСП
figure(1);
plot(carr); hold on;xlim([1 500]);ylim([-2 2]);
plot(psp);
m=1;
for k=1:length(t)
    psp2(k)=psp(m);
    m=m+1;
    if m>length(psp)
        m=1;
    end
end
psp=psp2;
s=(psp.*carr)+n;
CARR=fft(carr);
S=fft(s);
PSP=fft(psp);
figure(3);
plot(abs(CARR)); 
hold on 
plot(abs(S),'r');
title('Спектр');
figure(2);
plot(s);xlim([1 500]);ylim([-2 2]);
hold on; plot(n,'r');