function label = my_label(image, kernel_size)
    [h w] = size(image);
    label = zeros(h, w);
    
    parent = [];
    rank = [];
    
    current_cnt = 0;
    
    for i = 1:h
        for j = 1:w
            labeled_adj = [];
            if image(i,j) == 1
                if i == 1 && j == 1
                    current_cnt = current_cnt + 1;
                    label(i,j) = current_cnt;
                    parent(current_cnt) = current_cnt;
                    rank(current_cnt) = 1;
                elseif i == 1
                    if label(i,j-1) ~= 0
                        label(i,j) = label(i,j-1);
                    else
                        current_cnt = current_cnt + 1;
                        label(i,j) = current_cnt;
                        parent(current_cnt) = current_cnt;
                        rank(current_cnt) = 1;
                    end
                elseif j == 1
                    if kernel_size == 4
                        if label(i-1,j) ~= 0
                            label(i,j) = label(i-1,j);
                        else
                            current_cnt = current_cnt + 1;
                            label(i,j) = current_cnt;
                            parent(current_cnt) = current_cnt;
                            rank(current_cnt) = 1;
                        end
                    elseif kernel_size == 8
                        my_label = current_cnt + 1;
                        if label(i-1,j) ~= 0
                            labeled_adj(end + 1) = label(i-1,j);
                            my_label = min(my_label, label(i-1,j));
                        end
                        if label(i-1,j+1) ~= 0
                            labeled_adj(end + 1) = label(i-1,j+1);
                            my_label = min(my_label, label(i-1,j+1));
                        end
                        if my_label == current_cnt + 1
                            current_cnt = current_cnt + 1;
                            my_label = current_cnt;
                            parent(current_cnt) = current_cnt;
                            rank(current_cnt) = 1;
                        else
                            l = length(labeled_adj);
                            for k = 1:l
                                union_(my_label, labeled_adj(k));
                            end
                        end
                        label(i,j) = my_label;
                    end
                else
                    if kernel_size == 4
                        my_label = current_cnt + 1;
                        if label(i-1,j) ~= 0
                            labeled_adj(end + 1) = label(i-1,j);
                            my_label = min(my_label, label(i-1,j));
                        end
                        if label(i,j-1) ~= 0
                            labeled_adj(end + 1) = label(i,j-1);
                            my_label = min(my_label, label(i,j-1));
                        end
                        if my_label == current_cnt + 1
                            current_cnt = current_cnt + 1;
                            my_label = current_cnt;
                            parent(current_cnt) = current_cnt;
                            rank(current_cnt) = 1;
                        else
                            l = length(labeled_adj);
                            for k = 1:l
                                union_(my_label, labeled_adj(k));
                            end
                        end
                        label(i,j) = my_label;
                    elseif kernel_size == 8
                        my_label = current_cnt + 1;
                        if j == w
                            if label(i-1,j-1) ~= 0
                                labeled_adj(end + 1) = label(i-1,j-1);
                                my_label = min(my_label, label(i-1,j-1));
                            end
                            if label(i-1,j) ~= 0
                                labeled_adj(end + 1) = label(i-1,j);
                                my_label = min(my_label, label(i-1,j));
                            end
                            if label(i,j-1) ~= 0
                                labeled_adj(end + 1) = label(i,j-1);
                                my_label = min(my_label, label(i,j-1));
                            end                            
                        else
                            if label(i-1,j-1) ~= 0
                                labeled_adj(end + 1) = label(i-1,j-1);
                                my_label = min(my_label, label(i-1,j-1));
                            end
                            if label(i-1,j) ~= 0
                                labeled_adj(end + 1) = label(i-1,j);
                                my_label = min(my_label, label(i-1,j));
                            end
                            if label(i,j-1) ~= 0
                                labeled_adj(end + 1) = label(i,j-1);
                                my_label = min(my_label, label(i,j-1));
                            end
                            if label(i-1,j+1) ~= 0
                                labeled_adj(end + 1) = label(i-1,j+1);
                                my_label = min(my_label, label(i-1,j+1));
                            end                            
                        end
                        if my_label == current_cnt + 1
                            current_cnt = current_cnt + 1;
                            my_label = current_cnt;
                            parent(current_cnt) = current_cnt;
                            rank(current_cnt) = 1;                            
                        else
                            l = length(labeled_adj);
                            for k = 1:l
                                union_(my_label, labeled_adj(k));
                            end
                        end
                        label(i,j) = my_label;
                    end
                end
            end
        end
    end
    
    for i = 1:h
        for j = 1:w
            if label(i,j) ~= 0
                label(i,j) = find_(label(i,j));
            end
        end
    end
    
    function my_parent = find_(u)
        if parent(u) == u
            my_parent = u;
            return;
        end
        parent(u) = find_(parent(u));
        my_parent = parent(u);
    end
    
    function union_(u, v)
        u = find_(u);
        v = find_(v);
        if u == v
            return;
        end
        if rank(u) > rank(v)
            rank([u v]) = rank([v u]);
        elseif rank(u) == rank(v)
            rank(v) = rank(v) + 1;
        end
        parent(u) = v;
    end
end