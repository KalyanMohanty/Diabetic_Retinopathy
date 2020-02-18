function imDiff=smooth_cross_section(imV,LEN_diff)
imV_c=imcomplement(imV);
G1=fspecial('gaussian',[1 LEN_diff],0.5);
G2=fspecial('log',[1 LEN_diff],1.75);

imd=cell(12,1);
for i=1:12
    DEG=(i-1)*15;
    se1=makeLineKernel(LEN_diff,DEG,G1);
    se2=makeLineKernel(LEN_diff,DEG+90,G2);

    temp=imfilter(double(imV_c),se1,0,'same','conv');
    imd{i}=imfilter(mat2gray(temp),se2,0,'same','conv');
    imd{i}( imd{i}<0)=0;
end
imDiff=imd{1};
for i=2:length(imd)
    imDiff=max(imDiff,imd{i});% eq. (3.5)
end
imDiff=mat2gray(imDiff);