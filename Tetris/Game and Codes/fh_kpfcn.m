function fh_kpfcn(H,E)
global Parts
try
    switch E.Key
        case 'control'
           pause;
        case 'rightarrow'
           Moveshape(Parts,[1;0]);
       case 'leftarrow'
           Moveshape(Parts,[-1;0]);
       case 'uparrow'
           Rotateshape(Parts);
       case 'downarrow'
           Moveshape(Parts,[0;-1]);
    end
    drawnow;
catch
end