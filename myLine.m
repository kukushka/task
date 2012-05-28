classdef myLine
    properties
     x0;
     xn;
     y0;
     yn;   
    end
 methods
  function [x,y]=draw(obj)
   if (obj.x0==obj.xn)
    if (obj.yn>obj.y0)
     y=obj.y0:0.01:obj.yn;
     x=obj.x0;
    else
     y=obj.yn:0.01:obj.y0;
     x=obj.x0;
    end
    else
    k=(obj.yn-obj.y0)/(obj.xn-obj.x0);
    b=obj.y0-obj.x0*k;
    if (obj.xn>obj.x0)
    x=obj.x0:0.1:obj.xn;
    y=k*x+b;
    else
    x=obj.xn:0.01:obj.x0;
    y=k*x+b;
    end
  end
 end
  function [x, y, res]=rotate(obj, angle)
         res=myLine;
         M=[cos(angle) sin(angle); -sin(angle) cos(angle)];
         aa=[obj.x0; obj.y0];
         a=M*aa;
         obj.x0=a(1);
         obj.y0=a(2);
         bb=[obj.xn; obj.yn];
         b=M*bb;
         obj.xn=b(1);
         obj.yn=b(2);
         [x,y]=obj.draw();
         res.x0=obj.x0;   
         res.y0=obj.y0;
         res.xn=obj.xn;
         res.yn=obj.yn;
  end
 end
end


