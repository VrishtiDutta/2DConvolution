clear all;close all;

%Loading image for TwoDConvolution
img = imread('img.JPG');
figure;imagesc(img);
title('Original image, read for testing TwoDConvolution');

tmp = imread('tmp.jpg');
figure;imagesc(tmp);
title('Original filter, read for testing TwoDConvolution');

%Performing TwoDConvolution (manual 2D convolution)
imgConv = TwoDConvolution(img, tmp);
figure;imagesc(imgConv);
title('convolution result using TwoDConvolution');

%Loading image for built-in convolution
img1 = double(rgb2gray(imread('img.JPG')));
figure;imagesc(img1);axis image;colormap gray;
title('Original image, read for testing using conv2');

template1 = double(rgb2gray(imread('tmp.jpg')));
figure;imagesc(template1);axis image;colormap gray;
title('Original template, read for testing using conv2');

%Performing conv2
imgBltinConv = conv2(img1,template1,'same');
figure;imagesc(imgBltinConv);
title('convolution result using conv2');