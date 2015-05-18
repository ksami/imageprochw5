function fvec = projectface(faceimage, meanvec, basis, K)
% The faceimage is a face image (88X72), K is the number of components to be used
% for projection (1 <= K <= 100), The output fvec is a (K X 1) vector that represents
% the weights of the top K basis vectors

% (i) Transform faceimage into a (6336X1) vector, from which the meanvec is subtracted.
faceimage = faceimage(:) - meanvec;

% (ii) fvec is calculated by multiplying basis(:,K)' and the transformed faceimage
fvec = basis(:,K)' * faceimage;