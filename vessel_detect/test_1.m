clear
close all
clc

im=imread('good2.jpg');
figure,imshow(im);title('Input image');
im_mask=rgb2gray(im)>10;
figure,imshow(im_mask);title('Mask image');
im=im(:,:,2);%green channel extraction
im=im2double(im);%uint8 to double conversion for processing
im=mat2gray(im).*mat2gray(im_mask);
im=imcomplement(im);

LEN_c=11;
LEN_o=11;
LEN_diff=7;
TH_HIGH=40;
TH_LOW=25;
min_obj=180;
min_hole=10;

im_result=main_algo(im,im_mask,LEN_c,LEN_o,LEN_diff,TH_HIGH,TH_LOW,min_obj,min_hole);
figure,imshow(im_result);title('obtained');

