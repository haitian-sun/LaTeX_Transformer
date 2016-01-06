%%

%EECS 445 Group Project
%LaTex Transformer

addpath(genpath(fullfile('tmp')));
addpath(genpath(fullfile('classification_code')));
addpath(genpath(fullfile('toolbox')));
run('toolbox/vlfeat-0.9.20/toolbox/vl_setup')

%% Image Preprocessing

%% Rough Segmentation


im = imread('really_good_images/12.png');
im = im2bw(im,0.9);

image{1} = im;
[rough_result, rough_coord] = rough_cut(image, [1 1]);

rough_coord = [rough_coord(:,1) rough_coord(:,3) rough_coord(:,2) rough_coord(:,4)];


%% Deep Segmentation 

deep_result = cell(0);
deep_coord = zeros(0,4);

for i = 1:size(rough_result,2)
    [new_result, result_boundries] = deep_cut(rough_result{i}, rough_coord(i,:));
    deep_result = [deep_result new_result];
    deep_coord = [deep_coord; result_boundries];
end
%result = deep_result;
%coord = deep_coord;
[result coord] = combine_equal_sign(deep_result,deep_coord,im); 
[result coord] = combine_dot(result,coord,im); 

coord = [coord(:,1) coord(:,3) coord(:,2) coord(:,4)];

for i = 1:size(result,2)
    figure(i);
    imshow(result{i});
end