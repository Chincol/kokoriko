%% In order to run this code, you need the libsvm installed and its path added to matlab paths
%% Last modification: 
%% Salwa 
%% 28/11/2016 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc
addpath(genpath('~/Desktop/project'));
load noisy_time25_fft50; %step12_time10_fft10;
%% Obtaining data
disp('Obtaining images in rows')
notrain = length(data.class);
strain = [];
for i=1:notrain
    a = data.spectrogram(:,:,:,i);
    t = a(:);
    t = t';
    strain = [strain;t];
end
%% Now for 5 fold cross validation
%% Constructing the foldes
numfolds = 5;
numclass = max(data.class);
Folds = cell(numclass,numfolds);
FoldSize = zeros(1,numclass);
%% Obtain the size of fold for each class
for i=1:numclass
    FoldSize(i) = ceil(length(find(data.class(1:notrain)==i)) / 5);
    for j=1:numfolds
        Folds{i,j}.data = [];
        Folds{i,j}.class = [];
    end
end
%% Getting data to folds
disp('Dividing data to folds')
PointerFold = ones(1,numclass);
for i=1:notrain
    Folds{data.class(i),PointerFold(data.class(i))}.data = [Folds{data.class(i),PointerFold(data.class(i))}.data; strain(i,:)];
    Folds{data.class(i),PointerFold(data.class(i))}.class = [Folds{data.class(i),PointerFold(data.class(i))}.class; data.class(i)];
    if(length(Folds{data.class(i),PointerFold(data.class(i))}.class) == FoldSize(data.class(i)))
        PointerFold(data.class(i)) = PointerFold(data.class(i)) + 1;
    end
end

%% Now apply 5 fold cross validation
disp('Begin the 5 fold cross validation')
accuracy = zeros(1,numfolds);
for i=1:numfolds
    disp('Validation number:')
    disp(i)
    %% Get test set (20% of data) and train data (80%)
    train.data = []; train.class = [];
    test.data = []; test.class = [];
    for j = 1:numclass
        %% Getting the test
        test.data = [test.data; Folds{j,i}.data];
        test.class = [test.class; Folds{j,i}.class];
        %% Getting the train
        for k=1:numfolds
            if(i~=k)
                train.data = [train.data; Folds{j,k}.data];
                train.class = [train.class; Folds{j,k}.class];
            end
        end
    end
    disp(length(test.class))
    disp(length(train.class))
    disp('Now begin training')
    model = svmtrain(double(train.class),double(train.data)); %, '-c 1 -g 0.07 -b 1'
    %% Now I will test the classification
    disp('Now testing how many I scored right')
    [predict_label, ac, prob_estimates] = svmpredict(double(test.class),double(test.data),model); %,'-b 1'
    accuracy(i) = ac(1);
    disp('Accuracy vector till now')
    disp(accuracy)
end
FoldsAccur = sum(accuracy) / length(accuracy);
disp(' 5 Folds test accuracy is')
disp(FoldsAccur)

exit
