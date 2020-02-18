function imB=min_openings(im,LEN,DEG_NUM)

imo=cell(DEG_NUM,1);
for i=1:DEG_NUM
    DEG=(i-1)*((360/DEG_NUM)/2);
    se=strel('line',LEN,DEG);
    imo{i}=imopen(im,se);
end

imB=imo{1};
for i=2:length(imo)
    imB=min(imB,imo{i});% eq. (3.1)
end
