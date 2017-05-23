function result = my_dilate(im, se)

    %
    % This function returns dilation binary images with structure element.
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
                        masking = bitor(im(1:2,1:2), se(2:3,2:3));
                        result(1:2,1:2) = bitor(result(1:2,1:2), masking);
                    elseif j == w % Vertex
                        masking = bitor(im(1:2,w-1:w), se(2:3,1:2));
                        result(1:2,w-1:w) = bitor(result(1:2,w-1:w), masking);
                    else % j = 2:w-1, Edge
                        masking = bitor(im(1:2,j-1:j+1), se(2:3,:));
                        result(1:2,j-1:j+1) = bitor(result(1:2,j-1:j+1), masking);
                    end
                elseif i == h
                    if j == 1 % Vertex
                        masking = bitor(im(h-1:h,1:2), se(1:2,2:3));
                        result(h-1:h,1:2) = bitor(result(h-1:h,1:2), masking);
                    elseif j == w % Vertex
                        masking = bitor(im(h-1:h,w-1:w), se(1:2,1:2));
                        result(h-1:h,w-1:w) = bitor(result(h-1:h,w-1:w), masking);
                    else % j = 2:w-1, Edge
                        masking = bitor(im(h-1:h,j-1:j+1), se(1:2,:));
                        result(h-1:h,j-1:j+1) = bitor(result(h-1:h,j-1:j+1), masking);
                    end
                else % i = 2:h-1
                    if j == 1 % Edge
                        masking = bitor(im(i-1:i+1,1:2), se(:,2:3));
                        result(i-1:i+1,1:2) = bitor(result(i-1:i+1,1:2), masking);
                    elseif j == w % Edge
                        masking = bitor(im(i-1:i+1,w-1:w), se(:,1:2));
                        result(i-1:i+1,w-1:w) = bitor(result(i-1:i+1,w-1:w), masking);
                    else % j = 2:w-1, Inside area
                        masking = bitor(im(i-1:i+1,j-1:j+1), se);
                        result(i-1:i+1,j-1:j+1) = bitor(result(i-1:i+1,j-1:j+1), masking);
                    end
                end
            end
        end
    end
end  
