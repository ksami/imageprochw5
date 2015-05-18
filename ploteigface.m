function ploteigface(meanvec, basis, K, imsize)
% The meanvec and basis are the output of Part 1, and imsize is (1X2) vector of
% the image size (e.g., [88 72]). Set K to 10. Then this function will save 11 image
% files eigface00.png to eigface 10.png. The eigface00.png is the mean face, which
% is the meanvec that is resized into [88 72] by using the provided helper function
% fn double2img. eigface01.png - eigface10.png are first K columns of basis that
% are also resized by fn double2img.

f_ext = '.png';
f_name = 'eigface';
f_path = '../result';

meanface = reshape(fn_double2img(meanvec), imsize);
imwrite(meanface, sprintf('%s/%s00%s', f_path, f_name, f_ext));

for i=1:K
    img = reshape(fn_double2img(basis(:,i)), imsize);
    if(i>9)
        imwrite(img, sprintf('%s/%s%d%s', f_path, f_name, i, f_ext));
    else
        imwrite(img, sprintf('%s/%s0%d%s', f_path, f_name, i, f_ext));
    end
end