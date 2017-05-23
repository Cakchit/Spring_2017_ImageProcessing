function result = my_erode(im, se)

    %
    % This function returns erosion binary images with structure element.
    % se(structure element) size is 3x3.
    %
    % Author : Yoonjae, Cho
    % Email  : yoonjae.cho92@gmail.com
    % Github : https://github.com/yoon-jae
    %
    
    [h,w] = size(im);
    
    im = uint8(im);
    se = uint8(se);    
    
    result = uint8(zeros(h,w));
    
    for i = 1:h
        for j = 1:w
            if im(i,j) == 1
                % 4 Vertex, 4 Edge, 1 Inside area : 9 Case
                if i == 1
                    if j == 1 % Vertex
                        num_of_one = length(find(se(2:3,2:3) == 1));
                        window = bitand(im(1:2,1:2), se(2:3,2:3));
                    elseif j == w % Vertex
                        num_of_one = length(find(se(2:3,1:2) == 1));
                        window = bitand(im(1:2,w-1:w), se(2:3,1:2));
                    else % j = 2:w-1, Edge
                        num_of_one = length(find(se(2:3,:) == 1));
                        window = bitand(im(1:2,j-1:j+1), se(2:3,:));
                    end
                elseif i == h
                    if j == 1 % Vertex
                        num_of_one = length(find(se(1:2,2:3) == 1));
                        window = bitand(im(h-1:h,1:2), se(1:2,2:3));
                    elseif j == w % Vertex
                        num_of_one = length(find(se(1:2,1:2) == 1));
                        window = bitand(im(h-1:h,w-1:w), se(1:2,1:2));
                    else % j = 2:w-1, Edge
                        num_of_one = length(find(se(1:2,:) == 1));
                        window = bitand(im(h-1:h,j-1:j+1), se(1:2,:));
                    end
                else % i = 2:h-1
                    if j == 1 % Edge
                        num_of_one = length(find(se(:,2:3) == 1));
                        window = bitand(im(i-1:i+1,1:2), se(:,2:3));
                    elseif j == w % Edge
                        num_of_one = length(find(se(:,1:2) == 1));
                        window = bitand(im(i-1:i+1,w-1:w), se(:,1:2));
                    else % j = 2:w-1, Inside area
                        num_of_one = length(find(se == 1));
                        window = bitand(im(i-1:i+1,j-1:j+1), se);
                    end
                end
                
                num_of_and = length(find(window == 1));
                if num_of_one == num_of_and
                    result(i,j) = 1;
                else
                    result(i,j) = 0;
                end
            end
        end
    end
end
