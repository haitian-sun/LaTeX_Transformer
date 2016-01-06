string = ['a.png'; 'w.png'; 'y.png' ;'1.png'];
for i = 1 : 4
    figure;
    imshow(imread(string(i,:)));
    temp = pre(string(i,:),48);
    figure;
    imshow(temp);
    [hog_2x2, vis2x2] = extractHOGFeatures(temp,'CellSize',[2 2]);
    figure;
    plot(vis2x2);
    figure;
    plot(hog_2x2);
end