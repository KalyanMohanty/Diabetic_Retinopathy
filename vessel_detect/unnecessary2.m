clear
close all
clc
imb=imread('good2.jpg');
imbv=extract_vessel(imb);
redchannel =double(imb(:,:,1)).*double(~imbv);
greenchannel =double(imb(:,:,2)).*double(~imbv);
bluechannel =double(imb(:,:,3)).*double(~imbv);
plot(imhist(imb));title('histogram of rgb');
plot(imhist(redchannel));title('histogram of red');
plot(imhist(greenchannel));title('histogram of green');
plot(imhist(bluechannel));title('histogram of blue');
%rgbhist=imhist(imb);
%subplot(1,1,1);plot(imhist(imshow(imb)));title('Histogram Approx (DR retina)');