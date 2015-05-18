function reconstruct_exps(faceimages, meanvec, basis, numcomps)

f_ext = '.png';
f_name = 'face';
f_path = '../result';

imsize = [88 72];
m = 1;
mse(20).err = 0;
mse(20).face = 0;
mse(20).K = 0;

for i=1:5
    for j=1:4
        fvec = projectface(faceimages{i}, meanvec, basis, numcomps(j));
        reconimage = reconstructface(fvec, meanvec, basis, imsize);
        imwrite(fn_double2img(reconimage), sprintf('%s/%s_%d_%d%s', f_path, f_name, i, numcomps(j), f_ext));
        
        %Calculate mean squared error btwn original and reconstructed
        error = faceimages{i}(:) - reconimage(:);
        mse(m).err = mean(error.^2);
        mse(m).face = i;
        mse(m).K = numcomps(j);
        m = m+1;
    end
end

save('../result/mse.mat', 'mse');