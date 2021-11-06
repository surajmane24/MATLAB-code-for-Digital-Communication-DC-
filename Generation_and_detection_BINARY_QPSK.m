% QPSK Modulation  
clc;  
clear all;  
close all;  
%GENERATE QUADRATURE CARRIER SIGNAL  
Tb=1;t=0:(Tb/100):Tb;fc=1;  
c1=sqrt(2/Tb)*cos(2*pi*fc*t);  
c2=sqrt(2/Tb)*sin(2*pi*fc*t);  
%generate message signal  
N=8;m=rand(1,N);  
t1=0;t2=Tb  
for i=1:2:(N-1)  
t=[t1:(Tb/100):t2]  
if m(i)>0.5  
m(i)=1;  
m_s=ones(1,length(t));  
else 
m(i)=0;  
m_s=-1*ones(1,length(t));  
end 
%odd bits modulated signal  
odd_sig(i,:)=c1.*m_s;  
if m(i+1)>0.5 
 m(i+1)=1;  
m_s=ones(1,length(t));  
else 
m(i+1)=0;  
m_s=-1*ones(1,length(t)); 
end 
%even bits modulated signal  
even_sig(i,:)=c2.*m_s;  
%qpsk signal  
qpsk=odd_sig+even_sig;  
%Plot the QPSK modulated signal  
subplot(3,2,4);plot(t,qpsk(i,:));  
title('QPSK signal');xlabel('t---->');ylabel('s(t)');grid on; hold on;  t1=t1+(Tb+.01); t2=t2+(Tb+.01);  
end 
hold off 
%Plot the binary data bits and carrier signal  
subplot(3,2,1);stem(m);  
title('binary data bits');xlabel('n---->');ylabel('b(n)');grid on;  subplot(3,2,2);plot(t,c1);  
title('carrier signal-1');xlabel('t---->');ylabel('c1(t)');grid on;  subplot(3,2,3);plot(t,c2);  
title('carrier signal-2');xlabel('t---->');ylabel('c2(t)');grid on;  % QPSK Demodulation 
t1=0;t2=Tb  
for i=1:N-1  
t=[t1:(Tb/100):t2]  
%correlator  
x1=sum(c1.*qpsk(i,:));  
x2=sum(c2.*qpsk(i,:));  
%decision device  
if (x1>0&&x2>0)  
demod(i)=1;  
demod(i+1)=1;  
elseif (x1>0&&x2<0)  
demod(i)=1;  
demod(i+1)=0;  
elseif (x1<0&&x2<0)  
demod(i)=0;  
demod(i+1)=0;  
elseif (x1<0&&x2>0)  
demod(i)=0;  
demod(i+1)=1;  
end 
t1=t1+(Tb+.01); t2=t2+(Tb+.01);  
end 
subplot(3,2,5);stem(demod);  
title('qpsk demodulated bits');xlabel('n---->');ylabel('b(n)');grid on;
