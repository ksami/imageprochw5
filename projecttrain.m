function fvecs = projecttrain(face_train, meanvec, basis)
% The fvecs vector should be (100X360), and meanvec and basis are output from
% Part 1. Note that this function calls projectface of Part 3 iteratively for each
% image.
K = 100;
[num_images, ~] = size(face_train);

fvecs = zeros(K, num_images);

for i=1:num_images
    fvecs(:,i) = projectface(face_train{i}, meanvec, basis, K);
end
