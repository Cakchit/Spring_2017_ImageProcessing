function value = quick_selection(left, right, a, n)

    %
    % This function returns nth_element value in list(a) at O(n)
    % f_size : 3(3x3), 5(5x5)
    %
    % Author : Yoonjae, Cho
    % Email  : yoonjae.cho92@gmail.com
    % Github : https://github.com/yoon-jae
    %
    
    index = left;
    pivot_value = a(index);
    
    [a(right), a(left)] = deal(a(left), a(right)); % Swap
    
    for i = left:right-1
        if a(i) <= pivot_value
            [a(index), a(i)] = deal(a(i), a(index)); % Swap
            index = index + 1;
        end
    end
    
    [a(index), a(right)] = deal(a(right), a(index)); % Swap
    
    if index == n
        value = a(index);
    elseif index < n
        value = quick_selection(index + 1, right, a, n);
    else
        value = quick_selection(left, index - 1, a, n);
    end
end