clear
close all
clc

for i=1:69
    I=imread(strcat('drimdb_bad (',num2str(i),').jpg'));
    V=extract_vessel(I);
    I=double(I(:,:,2)).*double(~V);
    [cA,~,~,~] = dwt2(I,'sym4','wname','db2');
    h1(i,:)=imhist(im_show(cA,'08'));
end

for i=1:125
    I=imread(strcat('drimdb_good (',num2str(i),').jpg'));
    V=extract_vessel(I);
    I=double(I(:,:,2)).*double(~V);
    [cA,~,~,~] = dwt2(I,'sym4','wname','db2');
    h2(i,:)=imhist(im_show(cA,'08'));
end

dwt_hist_data=[h1;h2];
dwt_hist_class=[ones(69,1);ones(125,1)*2];

save dwt_hist_data dwt_hist_data
save dwt_hist_class dwt_hist_class