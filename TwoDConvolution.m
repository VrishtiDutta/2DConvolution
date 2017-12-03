function [convolutedImage] = TwoDConvolution(image, filter)

%Converting input images to grayscale and normalizing filter
if size((size(image))) == 1 & size((size(filter))) == 1
    im = double(image);
    flt = double(filter); 
else
    im = double(rgb2gray(image));
    flt = double(rgb2gray(filter));
end

%Getting size of image and filter
imageSize = size(im);
filterSize = size(flt);

%Setting up output image to store convolution value
convolutedImage = zeros(imageSize(1),imageSize(2));

%Calculating padding size for the image and padding image 
pad = floor(filterSize(1)/2);
paddedImage = padarray(im, [pad, pad], 'both');

%Calculating and storing convolution of image (patch by patch)
for row=1:imageSize(1)
    for col=1:imageSize(2)
        imagePatch = paddedImage(row:row+2*pad,col:col+2*pad);
        convolutedImage(row,col) = sum(sum(imagePatch.*flip(flip(flt),2)));
    end
end