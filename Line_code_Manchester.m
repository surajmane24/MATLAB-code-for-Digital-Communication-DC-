%Manchester polar coding
clc;
clear all;
close all;
N=10;
n=randi([0 1],1,N)
%Binary to bipolar conversion
nnn=[];
for m=1:N
    if n(m)==0;
        nn=[-1 1];
    else
        nn=[1 -1];
    end
        nnn=[nnn nn];
end
%Pulse shaping
i=1;
l=0.5;
t=0:0.01:length(n);
for j=1:length(t)
    if t(j)<=l
        y(j)=nnn(i);
    else
        y(j)=nnn(i);
        i=i+1;
        l=l+0.5;
    end
end
plot(t,y);
grid on;
axis([0 N -2 2]);