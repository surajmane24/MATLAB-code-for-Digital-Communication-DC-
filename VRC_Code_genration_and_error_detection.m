clc;
clear all;
%g=input('Enter The Generator Matrix: ');%row value separate by semicolon
g= [1 1 0 1 0 0 0 ;0 1 1 0 1 0 0;1 1 1 0 0 1 0;1 0 1 0 0 0 1];
[n,k] = size(transpose(g));
p = [g(:,1:n-k)];
h = [eye(n-k),transpose(p)];
disp('The H Matrix is ');
disp(h);
ht = transpose(h);
disp('The H Transpose Matrix is ');
disp(ht);
r=[0 0 1 1 1 0 1];
e=rem(r*ht,2);
disp('Syndrome of a Given Codeword is :');
disp(e);
for i = 1:1:size(ht)
if(ht(i,1:3)==e)
r(i) = 1-r(i);
break;
end
end
disp('The Error is in bit:');
disp(i);
disp('The Corrected Codeword is :');
disp(r);