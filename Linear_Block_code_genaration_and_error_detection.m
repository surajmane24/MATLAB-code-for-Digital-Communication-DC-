 clc;
 clear all;
 g= [1 1 0 1 0 0 0; 0 1 1 0 1 0 0; 1 1 1 0 0 1 0; 1 0 1 0 0 0 1];
 disp(g);
 disp('The order of linear block code for given generator matrix is:');
 [n,k]= size(transpose(g));
 disp('The code word length is : '); disp(n);
 disp('The message bit length is');disp(k);
 for i = 1:2^k
     for j= k:-1:1
         if rem(i-1,2^(-j+k+1))>=2^(-j+k)
             m(i,j)=1;
         else
             m(i,j)=0;
         end
     end
 end
 disp('the posible message bits are : ');
 disp('c0 c1 c2 c3');
 disp(m);
 disp('The vposiuble codeword are : ');
 disp('b0 b1 b2 c0 c1 c2 c3 hamming weigh');
 c = rem(m*g,2);
 d_min= sum((c(1:2^k,:))');
 d_min2 = d_min';
 s= [c d_min2];
 disp('s');
 disp('The minimum Hamming Wight for given block code is= ');
 d_min1 = min(sum((c(2:2^k,:))'));
 disp(d_min1);