function reconstruct_exps(faceimages, meanvec, basis, numcomps)

f_ext = '.png';
f_name = 'face';
f_path = '../result';

imsize = [88 72];

for i=1:5
    for j=1:4
        fvec = projectface(faceimages{i}, meanvec, basis, numcomps(j));
        reconimage = reconstructface(fvec, meanvec, basis, imsize);
        imwrite(reconimage, sprintf('%s/%s_%d_%d%s', f_path, f_name, i, numcomps(j), f_ext));
        
        %//todo mean squared error btwn original and reconstructed
    end
end