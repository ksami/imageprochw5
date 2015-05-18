function reconimage = reconstructface(fvec, meanvec, basis, imsize)
% The reconimage is a reconstructed face image (88X72). The program must
% accept a variable length of (KX1) fvec.

% (i) Multiply basis(:,K) and fvec where K is the length of fvec.
reconimage = basis(:,length(fvec)) * fvec;

% (ii) It is added by meanvec and reshaped into the size of imsize by the
% matlab function reshape. The final result is the output reconimage
reconimage = reshape((reconimage + meanvec), imsize);