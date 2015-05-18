% Runs part 1, 2, 5, 6, 7


% Load face_train and label_train
load('../data/orl_train.mat');
% Load face_test and label_test
load('../data/orl_test.mat');


% Part 1
[meanvec, basis] = pcaface(face_train);


% Part 2 with K as 10
imsize = [88, 72];
ploteigface(meanvec, basis, 10, imsize);


% Part 5
numcomps = [5, 10, 50, 100];
faceimages{5} = zeros(imsize);

for i=1:5
    faceimages{i} = face_test{i};
end

reconstruct_exps(faceimages, meanvec, basis, numcomps);


% Part 6
fvecs = projecttrain(face_train, meanvec, basis);


% Part 7
numcomp = [1,3,5,10,25,50,100];
accuracy = zeros(size(numcomp, 2), 1);

for i=1:size(numcomp, 2)
    id = recognizeface(face_test, fvecs, label_train, meanvec, basis, numcomp(i));
    
    % Calculate accuracy
    error = id - label_test;
    
    num_results = size(id,1);
    num_correct = 0;
    
    for j=1:num_results
        if(error(j) == 0)
            num_correct = num_correct + 1;
        end
    end
    accuracy(i) = (num_correct/num_results) * 100.0;
end

% Plot accuracy for face recognition vs numcomp
figure
plot(numcomp, accuracy);
title('Accuracy');
xlabel('numcomp');
ylabel('accuracy %');