clear
close all
clc
imb=imread('good2.jpg');
Red=imb(:,:,1);
Green=imb(:,:,2);
Blue=imb(:,:,3);
[yRed, Red]=imhist(Red);
[yGreen, Green]=imhist(Green);
[yBlue, Blue]=imhist(Blue);
plot(Red,yRed,'Red',Green,yGreen,'Green',Blue,yBlue,'Blue');


