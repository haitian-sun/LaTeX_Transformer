function [ stringArray ] = classify( imageArray, tLabels )
%CLASSIFY Summary of this function goes here
%   Detailed explanation goes here
%load classifier.mat;

for i =1:length(imageArray)
    stringArray{i}  = tLabels{pred(imageArray{i},classifier)};
end

