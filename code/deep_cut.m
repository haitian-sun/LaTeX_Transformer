function [output_imgs, output_boundries] = deep_cut(in_m, g)
    output_imgs = cell(0);
    output_boundries = zeros(0,4);
    m = reverse(in_m);
    while (sum(m(:)) ~= 0)
        temp = zeros(size(m));
        [y0, x0] = find_topmost(m);
        [m, temp, boundry] = find_connected_component(m, temp, y0, x0, [y0, x0, y0, x0]);
        output_imgs = [output_imgs reverse(temp(boundry(1):boundry(3),boundry(2):boundry(4)))];
        output_boundries = [output_boundries; boundry + [g(1), g(3), g(1), g(3) ]];
    end
end

function new_img = reverse(m)
   new_img = zeros(size(m));
   for i = 1:size(m,1)
       for j = 1:size(m,2)
           if m(i,j) == 0
               new_img(i,j) = 1;
           end
       end
   end
end

function [y, x] = find_topmost(m)
    x = 1;
    y = 1;
    while (sum(m(y,:)) == 0)
        y = y + 1;
    end
    while (m(y, x) == 0)
        x = x + 1;
    end
end

function [m, m_cut, boundry] = find_connected_component(m, m_cut, y, x, boundry)
    m(y, x) = 0;
    m_cut(y, x) = 1;
    if (y-1>0 && x-1>0 && m(y-1,x-1) == 1)
        if (y-1 < boundry(1))
            boundry(1) = y - 1;
        end
        if (x-1 < boundry(2))
            boundry(2) = x - 1;
        end
        [m, m_cut, boundry] = find_connected_component(m, m_cut, y-1, x-1, boundry);
    end
    if (y-1>0 && m(y-1,x) == 1)
        if (y-1 < boundry(1))
            boundry(1) = y - 1;
        end
        [m, m_cut, boundry] = find_connected_component(m, m_cut, y-1, x, boundry);
    end
    if (y-1>0 && x+1<size(m,2) && m(y-1,x+1) == 1)
        if (y-1 < boundry(1))
            boundry(1) = y - 1;
        end
        if (x+1 > boundry(4))
            boundry(4) = x + 1;
        end
        [m, m_cut, boundry] = find_connected_component(m, m_cut, y-1, x+1, boundry);
    end
    if (x-1>0 && m(y,x-1) == 1)
        if (x-1 < boundry(2))
            boundry(2) = x - 1;
        end
        [m, m_cut, boundry] = find_connected_component(m, m_cut, y, x-1, boundry);
    end
    if (x<size(m,2) && m(y,x+1) == 1)
        if (x+1 > boundry(4))
            boundry(4) = x + 1;
        end
        [m, m_cut, boundry] = find_connected_component(m, m_cut, y, x+1, boundry);
    end
    if (y<size(m,1) && x-1>0 && m(y+1,x-1) == 1)
        if (y+1 > boundry(3))
            boundry(3) = y + 1;
        end
        if (x-1 < boundry(2))
            boundry(2) = x - 1;
        end
        [m, m_cut, boundry] = find_connected_component(m, m_cut, y+1, x-1, boundry);
    end
    if (y<size(m,1) && m(y+1,x) == 1)
        if (y+1 > boundry(3))
            boundry(3) = y + 1;
        end
        [m, m_cut, boundry] = find_connected_component(m, m_cut, y+1, x, boundry);
    end
    if (y<size(m,1) && x<size(m,2) && m(y+1,x+1) == 1)
        if (y+1 > boundry(3))
            boundry(3) = y + 1;
        end
        if (x+1 > boundry(4))
            boundry(4) = x + 1;
        end
        [m, m_cut, boundry] = find_connected_component(m, m_cut, y+1, x+1, boundry);
    end
end