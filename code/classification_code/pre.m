function [ I ] = pre( filename,size )
%PRE Summary of this function goes here
%   Detailed explanation goes here

I = imread(filename);
    I = imresize(I, [size,size]);
    lvl = graythresh(I);
    I = im2bw(I,lvl);
end

