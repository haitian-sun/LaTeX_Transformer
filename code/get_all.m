%%numbers;
result = cell(2,1);
prev = 0;
srcFiles = dir('classify_train\numbers\*.png');
for i = 1 : length(srcFiles)
    filename = strcat('classify_train\numbers\',srcFiles(i).name);
    labels = cell(1,10);
    for j = 1:10
        labels{j} = j+prev;
    end
    temp = [get_symbols_x(filename); labels ];
    result = [result temp];
end

result = (result(:,2:length(result)));

%%letters_with_ij 26
prev = prev + length(labels);
srcFiles = dir('classify_train\letters\*.png');
for i = 1 : length(srcFiles)
    filename = strcat('classify_train\letters\',srcFiles(i).name);
    labels = cell(1,26);
    for j = 1:26
        labels{j} = j+prev;
    end
    a = get_symbols(filename);
    temp = [get_symbols_x(filename); labels ];
    result = [result temp];
end

%%cap letters 26
prev = prev + length(labels);
srcFiles = dir('classify_train\letters_cap\*.png');
for i = 1 : length(srcFiles)
    filename = strcat('classify_train\letters_cap\',srcFiles(i).name);
    labels = cell(1,26);
    for j = 1:26
        labels{j} = j+prev;
    end
    temp = [get_symbols_x(filename); labels ];
    result = [result temp];
end

%%symbols 25
prev = prev + length(labels);
srcFiles = dir('classify_train\math_symbols\*.png');
for i = 1 : length(srcFiles)
    filename = strcat('classify_train\math_symbols\',srcFiles(i).name);
    labels = cell(1,25);
    for j = 1:25
        labels{j} = j+prev;
    end
    temp = [get_symbols_x(filename); labels ];
    result = [result temp];
end

%%greek 8
prev = prev + length(labels);
srcFiles = dir('classify_train\greek_letter\*.png');
for i = 1 : length(srcFiles)
    filename = strcat('classify_train\greek_letter\',srcFiles(i).name);
    labels = cell(1,8);
    for j = 1:8
        labels{j} = j+prev;
    end
    temp = [get_symbols_x(filename); labels ];
    result = [result temp];
end