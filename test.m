str = cell(0);
for i=1:45
    im = imread(strcat('data/test_overall/',num2str(i),'.png'));
    str{i} = transform(im);
end