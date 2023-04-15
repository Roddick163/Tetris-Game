function Y = YDiff(PartStack, y, x)
Y = y - 1;
for n = 1:y
    if(~isempty(PartStack{n,x}))
        Y = y - n - 1;
    end
end