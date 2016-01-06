function s = transform(im)
%%

%EECS 445 Group Project
%LaTex Transformer

addpath(genpath(fullfile('toolbox')));
run('toolbox/vlfeat-0.9.20/toolbox/vl_setup')


%% Rough Segmentation


%im = imread('test_hs/test15.png');
im = im2bw(im,0.9);

image{1} = im;
[rough_result, rough_coord] = rough_cut(image, [1 1]);

rough_coord = [rough_coord(:,1) rough_coord(:,3) rough_coord(:,2) rough_coord(:,4)];


%% Deep Segmentation 

deep_result = cell(0);
deep_coord = zeros(0,4);

for i = 1:size(rough_result,2)
    [new_result, result_boundries] = deep_cut_left(rough_result{i}, rough_coord(i,:));
    deep_result = [deep_result new_result];
    deep_coord = [deep_coord; result_boundries];
end
[result coord] = combine_equal_sign(deep_result,deep_coord,im); 
[result coord] = combine_dot(result,coord,im); 
[result coord] = sort_by_left(result, coord);
coord = [coord(:,1) coord(:,3) coord(:,2) coord(:,4)];



%% Symbol Classification

load('classifier.mat');
symbol = groupClassify(result, classifier, tLabels, coord);


%% Tree Generation

load('model_sub_new.mat')
load('model_super_new.mat')
%load('tmp/boundries.mat') % this is the position information for each symbol
%load('symbol.mat') % this is the classified symbol


root_array = constr_tree(model_sub_new, model_super_new, coord, symbol);
s = generate_code(root_array, symbol);








