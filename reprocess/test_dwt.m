clear
close all
clc

addpath(genpath(pwd));
sample_image_folder=pwd;
[filename,user_canceled] = imgetfile('InitialPath',sample_image_folder);
imb=imread(filename);
imbv=extract_vessel(imb);
imbg=double(imb(:,:,2)).*double(~imbv);
[cA1,~,~,~] = dwt2(imbg,'sym4','wname','db2');
h1=imhist(im_show(cA1,'08'));

figure,
subplot(1,2,1);imshow(imb);title('Image');
subplot(1,2,2);imshow(imbg);title('Green Plane');

I1=imbg(imbg~=0);
E1=entropy(uint8(I1));
M1=mean(I1);
SD1=std(I1);
SK1=skewness(I1);
KT1=kurtosis(I1);

load Mdl_dwt
obtained=predict(Mdl_dwt,h1');
disp('Experimenting with DWT features');
if(obtained==1)
    disp('image is Bad');
else
    disp('Diabetic retina');
end
