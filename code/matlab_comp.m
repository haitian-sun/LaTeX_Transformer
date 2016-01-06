function bw = matlab_comp(A, scale)
    I = rgb2gray(A);
    level = graythresh(I);
    bw = im2bw(I, level);
    bw = 1 - double(imresize(bw, scale));
end