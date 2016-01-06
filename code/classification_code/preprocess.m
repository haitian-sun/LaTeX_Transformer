% disp('preprocess starts ...');
% srcFiles = dir('train\*.PNG');
% size = 48; % resize pixel
% for i = 1 : length(srcFiles)
%     filename = strcat('train\',srcFiles(i).name);
%     I = imread(filename);
%     I = imresize(I, [size,size]);
%     lvl = graythresh(I);
%     I = im2bw(I,lvl);
%     im{i} = I; %store preprocessed image into a array
% end
im = cell(1,length(result));
imSize = 48;
for i = 1 : length(result)
    
    I = result{1,i};
%     I = imresize(I, [imSize,imSize]);
%     lvl = graythresh(I);
%     I = im2bw(I,lvl);
    im{i} = padding(I,imSize); %store preprocessed image into a array
end

% for i = 1:length(srcFiles)
%     figure;
% %imshow(im{i});
% [hog_2x2, vis2x2] = extractHOGFeatures(im{i},'CellSize',[4 4]);
% plot(vis2x2)
% end
cellSize = 8;
hog = reshape(vl_hog(single(im{i}), cellSize),1,[]);