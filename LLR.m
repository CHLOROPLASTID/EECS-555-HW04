function [Lout] = LLR(Lin, Lcode)
%LLR calculate log likelihood ratio for (7,4) Hamming code
%   Input: Lcode: 16x1 LLR of each codeword based on received vector; 
%          Lin: 4x1 Apriori LLR
%   output: 4x1 LLR of each information bit
Lout = zeros(4,1);
cb = zeros(16,4);
for i=1:16
    b=dec2bin(i-1,4);
    cb(i,:)=mod(b,2); % This is a 16 x7 matrix with all possible Hamming code codewords
end
Lmat = exp(sum(cb * Lin, 2) + Lcode);
for i=1:4
   Lout(i) = log(sum(Lmat(cb(:,i)==1)) / sum(Lmat(cb(:,i)==0))) - Lin(i);
end
end

