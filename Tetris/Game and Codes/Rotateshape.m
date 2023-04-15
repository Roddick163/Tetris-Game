function Rotateshape(Parts)
global PartStack Rotationbalance
M    = [0,-1
        1, 0];
XY = zeros(2, numel(Parts));
for n = 1:numel(Parts)
    XY(:, n) = [sum(Parts{n}.XData)/2;sum(Parts{n}.YData)/2];
end
Centroid = mean(XY,2)*ones(1, numel(Parts));
XY = M*(XY - Centroid) + Centroid;
if(mod(Rotationbalance, 2) == 0)
    XY = floor(XY);
else
    XY = ceil(XY);
end

if(any(XY(1,:) < 1) || any(XY(1,:) > 10))
    return;
end
if(any(XY(2,:) < 1))
    return;
end
for n = 1:numel(Parts)
    Parts{n}.XData = [-0.5,0.5] + XY(1, n);
    Parts{n}.YData = [-0.5,0.5] + XY(2, n);
end
Rotationbalance = Rotationbalance + 1;