function imF=reconstruction_by_erosion(im,LEN,DEG_NUM)
im_close=cell(DEG_NUM,1);
for i=1:DEG_NUM
    DEG=(i-1)*((360/DEG_NUM)/2);
    se=strel('line',LEN,DEG);
    im_close{i}=imclose(im,se);
end
imTemp39=im_close{1};
for i=2:length(im_close)
    imTemp39=min(imTemp39,im_close{i});
end
marker=imcomplement(imTemp39);
mask=imcomplement(im);
imF=imreconstruct(marker,mask);
imF=mat2gray(imF);
imF=imcomplement(imF);% eq. (3.9)
