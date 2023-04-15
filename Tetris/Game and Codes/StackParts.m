function clearedlines = StackParts(Parts)
global hstack PartStack
clearedlines = 0; maxY = max(hstack);
for n = 1:numel(Parts)
    part = Parts{n};
    point = [mean(part.XData), mean(part.YData)];
    maxY = max(maxY,point(2));
    hstack(point(1)) = max(hstack(point(1)), point(2));
    if(point(2)<=25)
        if(~isempty(PartStack{point(2),point(1)}))
            error('overlap');
        else
            PartStack{point(2),point(1)} = part;
        end
    end
end
if(maxY>25)
    return
end
somecomplete = 1;
while(somecomplete)
    ycomplete = [];
    for ny = maxY:-1:1
        complete = 1;
        for nx = 1:10
            if(isempty(PartStack{ny,nx})) 
                complete = 0;
                break;
            end
        end
        if(complete) 
            ycomplete = [ycomplete,ny];
        end
    end
    somecomplete = ~isempty(ycomplete);
    if(somecomplete)
        for ny = 1:numel(ycomplete)
            for nx = 1:10
                delete(PartStack{ycomplete(ny),nx});
                for n = ycomplete(ny)+1:maxY
                    movepartdown(n,nx);
                end
            end
        end
        drawnow;
    end
    clearedlines = clearedlines + numel(ycomplete);
end
hstack = zeros(1,10);
for nx=1:10
    for ny = 25:-1:1
        if(~isempty(PartStack{ny,nx}))
           hstack(nx) = max(hstack(nx), ny);
        end
    end
end

function movepartdown(ny, nx)
global PartStack
part = PartStack{ny,nx};
if ishandle(part)
    part.YData = part.YData - 1;
    PartStack{ny-1,nx} = part;
    PartStack{ny,nx} = [];
else
    PartStack{ny-1,nx} = [];
end


