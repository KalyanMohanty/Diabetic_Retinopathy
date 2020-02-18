clear
close all
clc

addpath(genpath(pwd));
sample_image_folder=pwd;
[filename,user_canceled] = imgetfile('InitialPath',sample_image_folder);
imb=imread(filename);
imbv=extract_vessel(imb);
imbg=double(imb(:,:,2)).*double(~imbv);

figure,
subplot(1,2,1);imshow(imb);title('Image');
subplot(1,2,2);imshow(imbg);title('Green Plane');

I1=imbg(imbg~=0);
E1=entropy(uint8(I1));
M1=mean(I1);
SD1=std(I1);
SK1=skewness(I1);
KT1=kurtosis(I1);

load Mdl_stat
obtained=predict(Mdl_stat,[E1 M1 SD1 SK1 KT1]);
disp('Experimenting with Statistical features');
if(obtained==1)
    disp('Diabetic retina');
else
    disp('Healthy retina');
end
