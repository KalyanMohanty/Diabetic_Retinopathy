clear
close all
clc

addpath(genpath(pwd));

imb=imread('bad.jpg');
imbv=extract_vessel(imb);
img=imread('good.jpg');
imgv=extract_vessel(img);
imbg=double(imb(:,:,2)).*double(~imbv);
imgg=double(img(:,:,2)).*double(~imgv);


figure,
subplot(2,2,1);imshow(imb);title('DR retina');
subplot(2,2,2);imshow(img);title('Healthy retina');
subplot(2,2,3);imshow(imbg);title('Green Plane (DR retina)');
subplot(2,2,4);imshow(imgg);title('Green Plane (healthy retina)');

[cA1,cH1,cV1,cD1] = dwt2(imbg,'sym4','wname','db2');
[cA2,cH2,cV2,cD2] = dwt2(imgg,'sym4','wname','db2');

figure,
subplot(2,2,1);imshow(im_show(cA1,'01'));title('Wavelet Approx (DR retina)');
subplot(2,2,2);imshow(im_show(cA2,'01'));title('Wavelet Approx (Healthy retina)');
subplot(2,2,3);imshow(im_show(cH1,'01'));title('Wavelet Horizontal (DR retina)');
subplot(2,2,4);imshow(im_show(cH2,'01'));title('Wavelet Horizontal (Healthy retina)');

figure,
subplot(2,2,1);imshow(im_show(cV1,'01'));title('Wavelet Vertical (DR retina)');
subplot(2,2,2);imshow(im_show(cV2,'01'));title('Wavelet Vertical (Healthy retina)');
subplot(2,2,3);imshow(im_show(cD1,'01'));title('Wavelet Diagonal (DR retina)');
subplot(2,2,4);imshow(im_show(cD2,'01'));title('Wavelet Diagonal (Healthy retina)');

figure,
subplot(2,2,1);imagesc(cA1);title('Wavelet Approx (DR retina)');
subplot(2,2,2);imagesc(cA2);title('Wavelet Approx (Healthy retina)');
subplot(2,2,3);plot(imhist(im_show(cA1,'08')));title('Histogram Approx (DR retina)');
subplot(2,2,4);plot(imhist(im_show(cA2,'08')));title('Histogram Approx (Healthy retina)');

I1=imbg(imbg~=0);
I2=imgg(imgg~=0);
E1=entropy(uint8(I1));
E2=entropy(uint8(I2));
M1=mean(I1);
M2=mean(I2);
SD1=std(I1);
SD2=std(I2);
SK1=skewness(I1);
SK2=skewness(I2);
KT1=kurtosis(I1);
KT2=kurtosis(I2);

disp([E1 E2;M1 M2;SD1 SD2;SK1 SK2;KT1 KT2]);