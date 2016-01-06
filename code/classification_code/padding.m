function [ I ] = padding( C,maxSize )
%PADDING Summary of this function goes here
%   Detailed explanation goes here
I = C;
s =size(I);
[val,loc]=max(s);
scale = maxSize/val;
I = imresize(I,scale);

lvl = graythresh(single(I));
%%lvl = graythresh(typecast(I,'uint8'));
I = im2bw(I,lvl);
s = size(I);
if loc == 1
    left = floor((maxSize-s(2))/2);
    right = maxSize-s(2) - left;
    I = padarray(I,[0 left],1,'pre');
    I = padarray(I,[0 right],1,'post');
else
    up = floor((maxSize-s(1))/2);
    down = maxSize-s(1) - up;
    I = padarray(I,[up 0],1,'pre');
    I = padarray(I,[down 0],1,'post');
end



end

