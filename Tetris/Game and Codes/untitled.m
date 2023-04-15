Colors = [66 133 244
          219 68 55
          244 180 0
          15 157 88
          30,30,30
          215,215,215];
Names = {'Blue', 'Red', 'Yellow', 'Green', 'Black', 'White'};
figure('Color','w')
for i = 1:numel(Names)
    clr1 = Colors(i,:);
    clr2 = max(0,clr1-30);
    clr3 = min(255,clr1+30);
    fill([-1,-1,1],[-1,1,-1], clr2/255); hold on;
    fill([-1,1,1],[1,1,-1], clr3/255);
    fill(0.6*[-1,-1,1,1],0.6*[-1,1,1,-1], clr1/255);
    axis off; daspect([1,1,1]);
    f = getframe(gca);
    imwrite(f.cdata, [Names{i}, '.png'], 'png');
end