clear
close all
clc

for i=1:69
    I=imread(strcat('drimdb_bad (',num2str(i),').jpg'));
    V=extract_vessel(I);
    I=double(I(:,:,2)).*double(~V);
    I=I(I~=0);
    E=entropy(uint8(I));
    M=mean(I);
    SD=std(I);
    SK=skewness(I);
    KT=kurtosis(I);
    feat1(i,:)=[E M SD SK KT];
end

for i=1:125
    I=imread(strcat('drimdb_good (',num2str(i),').jpg'));
    V=extract_vessel(I);
    I=double(I(:,:,2)).*double(~V);
    I=I(I~=0);
    E=entropy(uint8(I));
    M=mean(I);
    SD=std(I);
    SK=skewness(I);
    KT=kurtosis(I);
    feat2(i,:)=[E M SD SK KT];
end

stat_data=[feat1;feat2];
stat_class=[ones(69,1);ones(125,1)*2];
save stat_data stat_data
save stat_class stat_class