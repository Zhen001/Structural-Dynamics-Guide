% 
% H = blkhank(y,i,j)
% 
% Description:
%          Make a block Hankel matrix with the data y 
%          containing i block-rows and j columns
%     
% Copyright: 
%          FENG Zhouquan, Feb. 2009
%
%

function H = blkhank(y,i,j)

% Make a (block)-row vector out of y
[l,nd] = size(y);
if nd < l;y = y';[l,nd] = size(y);end

% Check dimensions
if i < 0;error('blkHank: i should be positive');end
if j < 0;error('blkHank: j should be positive');end
if j > nd-i+1;error('blkHank: j too big');end

% Make a block-Hankel matrix
H=zeros(l*i,j);
for k=1:i
	H((k-1)*l+1:k*l,:)=y(:,k:k+j-1);
end
