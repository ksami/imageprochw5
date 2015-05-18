function reconimage = reconstructface(fvec, meanvec, basis, imsize)
% The reconimage is a reconstructed face image (88X72). The program must
% accept a variable length of (KX1) fvec.
reconimage = zeros(6336, 1);

% (i) Multiply basis(:,K) and fvec where K is the length of fvec.
for i=1:length(fvec)
    reconimage = reconimage + (basis(:,i) * fvec(i));
end

% (ii) It is added by meanvec and reshaped into the size of imsize by the
% matlab function reshape. The final result is the output reconimage
reconimage = reshape((reconimage + meanvec), imsize);