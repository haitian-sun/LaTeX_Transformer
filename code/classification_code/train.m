disp('train starts ...');
cellSize = 8;
hogFeatureSize = length(hog);
numImages  =length(im);
feature  = zeros(numImages, hogFeatureSize, 'single');
labels = cell2mat(result(2,1:length(result)));
for i = 1:length(im)
        
         feature(i, :) = reshape(vl_hog(single(im{i}), cellSize),1,[]);
         %HOG -  histogram of oriented gradients 
         %  It counts occurrences of gradient orientation in localized portions of an image.
end

%multiclass svm
classifier = fitcecoc(feature, labels);
disp('train ends ...')


%%%test
I = imread('test/integral1.PNG');
    I = imresize(I, [imSize,imSize]);
    lvl = graythresh(I);
    I = im2bw(I,lvl);
test = reshape(vl_hog(single(I), cellSize),1,[]);
predictedLabels = predict(classifier, test);
disp(tLabels{predictedLabels});