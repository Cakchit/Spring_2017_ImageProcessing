function label = my_label_dfs(image, kernel_size)
    [h w] = size(image);
    label = zeros(h, w);
    check = zeros(h, w);
    
    dy4 = [0 -1 0 1];
    dx4 = [-1 0 1 0];
    
    dy8 = [0 -1 -1 -1 0 1 1 1];
    dx8 = [-1 -1 0 1 1 1 0 -1];
    
    current_cnt = 0;
    
    for i = 1:h
        for j = 1:w
            if image(i,j) == 1 && check(i,j) == 0
                current_cnt = current_cnt + 1;
                if kernel_size == 4
                    dfs4(i,j);
                elseif kernel_size == 8
                    dfs8(i,j);
                end
            end
        end
    end

    function dfs4(y,x)
        check(y,x) = 1;
        label(y,x) = current_cnt;
        for k = 1:4
            ny = y + dy4(k);
            nx = x + dx4(k);
            if 1 <= ny && ny <= h && 1 <= nx && nx <= w
                if image(ny, nx) == 1 && check(ny, nx) == 0
                    dfs4(ny, nx); 
                end
            end
        end
    end

    function dfs8(y,x)
        check(y,x) = 1;
        label(y,x) = current_cnt;
        for k = 1:8
            ny = y + dy8(k);
            nx = x + dx8(k);
            if 1 <= ny && ny <= h && 1 <= nx && nx <= w
                if image(ny, nx) == 1 && check(ny, nx) == 0
                    dfs8(ny, nx); 
                end
            end
        end
    end
end