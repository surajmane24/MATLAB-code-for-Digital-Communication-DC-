%ASK Modulation
clc;
clear all;
close all;
%Generate Carrier Signal
Tb=1; fc=10;
t=0:Tb/100:1;
c=sqrt(2/Tb)*sin(2*pi*fc*t);
%Generate Message signal
N=8;
m=rand(1,N);
t1=0;t2=Tb;
for i=1:N
    t=[t1:0.01:t2]
    if m(i)>0.5
        m(i)=1;
        m_s=ones(1,length(t));
    else
        m(i)=0;
        m_s=zeros(1,length(t));
    end
    message(i,:)=m_s;
    %Product of carrier and message
    ask_sig(i,:)=c.*m_s;
    t1=t1+(Tb+.01);
    t2=t2+(Tb+.01);
    %Plot the message and ASK Signal
    subplot(5,1,2);
    axis([0 N -2 2]);
    plot(t,message(i,:),'r');
    title('Message Signal');
    xlabel('t--->');
    ylabel('m(t)');
    grid on;
    hold on
    subplot(5,1,4);
    plot(t,message(i,:),'r');
    title('ASK Signal');
    xlabel('t--->');
    ylabel('s(t)');
    grid on;
    hold on
end
hold off
%Plot thecarrier signal and input binary data
subplot(5,1,3);
plot(t,c);
title('Carrier Signal');
xlabel('t--->');
ylabel('c(t)');
grid on;
subplot(5,1,1);
stem(m);
title('Binary Data bits');
xlabel('t--->');
ylabel('b(t)');
grid on;

%ASK Demodulation
t1=0;t2=Tb
for i=1:N
    t=[t1:Tb/100:t2]
    %correlator
    x=sum(c.*ask_sig(i,:));
    %declision Device
    if x>0
        demod(i)=1
    else
        demod(i)=0;
    end
    t1=t1+(Tb+.01);
    t2=t2+(Tb+.01);
end
%plot demodulated binary data bits
subplot(5,1,5);
stem(demod);
title('ASK demodulated signal');
xlabel('n--->');
ylabel('b(n)');
grid on;


    