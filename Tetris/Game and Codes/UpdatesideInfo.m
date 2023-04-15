function [Parts, txt1, txt2] = UpdatesideInfo(Parts, txt1, txt2, type, clr, speed, flp, score)

point = [3;6];
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
M = eye(2);
if(flp)
    M = [-1,0; 0, 1]; 
end
Points = point*ones(1,4) + M * Shift(:,index)';
del = point - mean(Points, 2);
XY = Points + del*ones(1,4);
img = flipud(imread(clr));
if(ishandle(txt1))
     txt1.String = num2str(speed);
     txt2.String = num2str(score);
     for n = 1:numel(Parts)
         delete(Parts{n})
         Parts{n} = image('CData',img,'XData',[-0.5 0.5] + XY(1, n),...
                               'YData',[-0.5 0.5] + XY(2, n));
     end
else
    text(2.5, 23, 'Speed',...
         'HorizontalAlignment','Center','FontSize',12, 'FontWeight','bold','interpreter', 'latex');
    txt1 = text(2.5, 21, num2str(speed),...
         'HorizontalAlignment','Center','FontSize',12, 'FontWeight','bold','interpreter', 'latex');
    text(2.5, 16, 'Score',...
             'HorizontalAlignment','Center','FontSize',12, 'FontWeight','bold','interpreter', 'latex');
    txt2 = text(2.5, 14, num2str(score),...
             'HorizontalAlignment','Center','FontSize',12, 'FontWeight','bold','interpreter', 'latex');
    text(2.5, 9, 'Next',...
             'HorizontalAlignment','Center','FontSize',12, 'FontWeight','bold','interpreter', 'latex');
    Parts = {};
    for n = 1:size(Points,2)
        sq = image('CData',img,'XData',[-0.5 0.5] + XY(1, n),...
                               'YData',[-0.5 0.5] + XY(2, n));
        Parts = [Parts, {sq}];
    end
end
drawnow;
    