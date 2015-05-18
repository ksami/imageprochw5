function [meanvec, basis] = pcaface(face_data)
% face_data is the cell array containing the face images, meanvec is the (6336X1)
% mean of the images, and basis is a (6336X100) PCA bases (or components). Each
% component is a (6336X1) column vector
mat_face_data = zeros(6336, 360);
meanvec = zeros(6336, 1);

% (i) First transform face_data into a (6336X360) matrix.
for i=1:360
    mat_face_data(:,i) = face_data{i}(:);
end

% (ii) Compute the mean of face_data, which is a (6336X1) vector meanvec.
for i=1:6336
    sum = 0;
    for j=1:360
        sum = sum + mat_face_data(i,j);
    end
    meanvec(i) = sum/360;
end

% (iii) Subtract the mean from each data point of face_data.
for i=1:360
    mat_face_data(:,i) = mat_face_data(:,i) - meanvec(:);
end

% (iv) Compute the (6336X6336) covariance matrix for the new face_data using
% the matlab function cov.
covariance = cov(mat_face_data');

% (v) Obtain the top 100 eigenvectors of the obtained covariance matrix using
% the matlab function eigs. The (6336X100) eigenvectors are the basis, which
% is the second output of this function
[basis, ~] = eigs(covariance, 100);
