function Parts = Shape(type, clr, flp)
Shift  = [1, 0, 1, 0, 1, 0, 1, 0, 1, 0
          2, 0, 2, 0, 2, 0, 2, 0, 2, 0
          2,-1, 3, 0, 3, 0, 2,-1, 1,-1
          3,-1, 3,-1, 4, 0, 3, 0, 2,-1];
index = [9, 10];
switch type
   case 'Z'
       index = [1,2];
   case 'L'
       index = [3,4];
   case 'I'
       index = [5,6];
   case 'T'
       index = [7,8]; 
end
point = [5;25];
M = eye(2);
if(flp)
    M = [-1,0
         0, 1]; 
end
Points = point*ones(1,4) + M * Shift(:,index)';
del = point - mean(Points, 2);
XY = floor(Points + del*ones(1,4));
img = flipud(imread(clr));
Parts = {};
for n = 1:size(Points,2)
    sq = image('CData',img,'XData',[-0.5 0.5] + XY(1, n),...
                           'YData',[-0.5 0.5] + XY(2, n));
    Parts = [Parts, {sq}];
end