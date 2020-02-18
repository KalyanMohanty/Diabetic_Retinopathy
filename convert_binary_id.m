function id=convert_binary_id(T)
E=eye(size(T,1));
id=[];
for i=1:size(T,2)
    for j=1:size(T,1)
        if(E(:,j)==T(:,i))
            id=[id j];
        end
    end
end
end