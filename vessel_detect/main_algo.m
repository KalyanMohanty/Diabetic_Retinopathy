function im_result=main_algo(img,im_mask,LEN_c,LEN_o,LEN_diff,TH_HIGH,TH_LOW,min_obj,min_hole)

DEG_NUM=12;
ic1=reconstruction_by_dilation(img,LEN_c,DEG_NUM);
io1=min_openings(img,LEN_o,DEG_NUM);
iv=mat2gray(ic1-io1);
imDiff=smooth_cross_section(iv,LEN_diff);
imL=reconstruction_by_dilation(imDiff,LEN_c,DEG_NUM);
imF=reconstruction_by_erosion(imL,LEN_c,DEG_NUM);

% Hysteresis thresholding
mask=im2bw(imF,TH_LOW/255);
marker=im2bw(imF,TH_HIGH/255);
im_result=imreconstruct(marker,mask);

im_result=im_result&im_mask;
im_result = clear_bw(im_result, min_obj, min_hole);