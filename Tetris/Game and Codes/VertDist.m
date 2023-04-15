function maxY = VertDist
global PartStack Parts
maxY = 25;
for n = 1:numel(Parts)
    V = [mean(Parts{n}.XData);
         mean(Parts{n}.YData)];
    V(2) = min(25,V(2));
    if(V(2)) == 1
        maxY = 0;
        break;
    end
    maxY = min(maxY, YDiff(PartStack, V(2), V(1)));
end
    