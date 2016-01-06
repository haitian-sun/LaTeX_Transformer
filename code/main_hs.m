%%

%EECS 445 Group Project
%LaTex Transformer

addpath(genpath(fullfile('tmp')));

%% Image Preprocessing

%% Rough Segmentation


im = imread('test_hs/test14.png');
im = im2bw(im,0.9);

image{1} = im;
[rough_result, rough_coord] = rough_cut(image, [1 1]);

rough_coord = [rough_coord(:,1) rough_coord(:,3) rough_coord(:,2) rough_coord(:,4)];


%% Deep Segmentation 

deep_result = cell(0);
deep_coord = zeros(0,4);

for i = 1:size(rough_result,2)
    % segmentation code here
    [new_result, result_boundries] = deep_cut(rough_result{i}, rough_coord(i,:));
    deep_result = [deep_result new_result];
    deep_coord = [deep_coord; result_boundries];
end
result = deep_result;
coord = deep_coord;
[result coord] = combine_equal_sign(deep_result,deep_coord,im); 
[result coord] = combine_dot(result,coord,im); 

coord = [coord(:,1) coord(:,3) coord(:,2) coord(:,4)];



%% Symbol Classification

%symbol = 'x2a2+wg2';
addpath('classification_code');
load('classifier.mat');
%symbol = groupClassify(result, classifier, tLabels, coord);
symbol = cell(0);
%{
symbol{1} = 'a';
symbol{2} = '2';
symbol{3} = '+';
symbol{4} = 'k';
symbol{5} = 'a';
symbol{6} = 'b';
symbol{7} = 'c';
symbol{8} = 'd';
symbol{9} = 'e';
symbol{10} = 'f';
symbol{11} = 'g';
symbol{12} = 'h';
symbol{13} = '\sum';
symbol{14} = '=';
symbol{15} = '1';
symbol{16} = '2';
symbol{17} = '3';
symbol{18} = '4';
symbol{19} = '5';
symbol{20} = '6';
symbol{21} = '7';
symbol{22} = 'i';
symbol{23} = 'k';
symbol{24} = '8';
symbol{25} = '9';
symbol{26} = '0';
symbol{27} = 'a';
symbol{28} = 'a';
symbol{29} = 'a';
symbol{30} = '\sum';
symbol{31} = 'N';
symbol{32} = 'i';
symbol{33} = '=';
symbol{34} = '3';
symbol{35} = '4';
symbol{36} = '\frac';
symbol{37} = 'p';
symbol{38} = 'q';
%}
% test13
%{
symbol{27} = '+';
symbol{28} = '\sum';
symbol{29} = 'N';
symbol{30} = 'i';
symbol{31} = '=';
symbol{32} = '3';
symbol{33} = '4';
symbol{34} = '\frac';
symbol{35} = 'p';
symbol{36} = 'q';
%}
%{
symbol{1} = 'k';
symbol{2} = '=';
symbol{3} = '1';
symbol{4} = '2';
symbol{5} = '\sum';
symbol{6} = '3';
symbol{7} = '4';
symbol{8} = '5';
symbol{9} = '6';
symbol{10} = '7';
symbol{11} = '8';
symbol{12} = '9';
symbol{13} = '0';
%}
%test14

symbol{1} = '1';
symbol{2} = '\frac';
symbol{3} = '(';
symbol{4} = '1';
symbol{5} = '\frac';
symbol{6} = '2';
symbol{7} = ')';
symbol{8} = '3';
symbol{9} = '\frac';
symbol{10} = '4';

%symbol = 'exp(wjT';
save('symbol.mat', 'symbol');










%% Tree Generation

load('model_sub_new.mat')
load('model_super_new.mat')
%load('tmp/boundries.mat') % this is the position information for each symbol
load('symbol.mat') % this is the classified symbol


root_array = constr_tree(model_sub_new, model_super_new, coord, symbol);
generate_code(root_array, symbol)








