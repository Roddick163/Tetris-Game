function moved = Moveshape(Parts, del)
global PartStack
XY = zeros(2, numel(Parts));
for n = 1:numel(Parts)
    XY(:, n) = [sum(Parts{n}.XData)/2;sum(Parts{n}.YData)/2];
end
XY = XY + del*ones(1, numel(Parts));
%% || Check Wall Collision
if(any(XY(1,:) < 1) || any(XY(1,:) > 10))
    return;
end
%% _ Check Wall Collision
if(any(XY(2,:) < 1))
    return;
end
%% Check collision with others
for n = 1:numel(Parts)
    i = XY(2, n); j = XY(1, n);
    if(~isempty(PartStack{i, j}))
        return;
    end
end
for n = 1:numel(Parts)
    Parts{n}.XData = [-0.5,0.5] + XY(1, n);
    Parts{n}.YData = [-0.5,0.5] + XY(2, n);
end
moved = 1;