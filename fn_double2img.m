% helper function for 'ploteigface'
% change the image from 'double' to 'uint8' in the range of [0, 255].
function img = fn_double2img(img)

minI = min(img(:)) ;
maxI = max(img(:)) ;
img = uint8( (255/(maxI-minI)) * (img - minI) ) ;

end
