function [ redictedLabels ] = pred( filename, classifier )
%EVAL Summary of this function goes here
%   Detailed explanation goes here

    cellSize = 8;
    imSize = 48; % resize pixel
    I = filename;
    %I = imread(filename);
%    I = imresize(I, [imSize,imSize]);
%     lvl = graythresh(I);
%     I = im2bw(I,lvl);
    I = padding(I, imSize);
    test = reshape(vl_hog(single(I), cellSize),1,[]);
    redictedLabels = predict(classifier, test);
    
end

