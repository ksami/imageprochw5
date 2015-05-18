function id = recognizeface(face_test, fvecs, label_train, meanvec, basis, numcomp)
% where face test is all 40 test images from orl test.mat, fvecs is the output from
% Part 6, and label train is the training labels from orl test.mat. The meanvec
% and basis are output from Part 1. The output id is the (40X1) recognized subject
% ID (1X40) for each test image. numcomp is the number of components of the feature
% vector to use for comparison


% (i) Run the function projecttrain of Part 6 with face test. Then, you will get (100X40) fvecs test.
fvecs_test = projecttrain(face_test, meanvec, basis);

% (ii) Truncate the 100 dimensional feature vector to the numcomp length.
% (e.g. fvecs(1:numcop,:) and fvecs test(1:numcop,:)).
fvecs = fvecs(1:numcomp,:);
fvecs_test = fvecs_test(1:numcomp,:);

% (iii) For each column of fvecs test, find the closest column of fvecs by using
% Euclidean distance, and look up its label train, which is going to be id.
% (e.g. If the closest column is 50 for the first test image, then id(1) = label train(50))
[~, col_t] = size(fvecs_test);
[~, col] = size(fvecs);

id = zeros(col_t,1);
dist = zeros(col,1);

for i=1:col_t
    for j=1:col
        % Get Euclidean distance
        dist(j) = norm(fvecs_test(:,i) - fvecs(:,j));
    end
    [~, index] = min(dist);
    id(i) = label_train(index);
end
