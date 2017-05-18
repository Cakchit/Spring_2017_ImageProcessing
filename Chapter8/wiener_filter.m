function result = wiener_filter(input, f_size)

    %
    % This function returns image with wiener_filter(adaptive filter).
    %
    % Author : Yoonjae, Cho
    % Email  : yoonjae.cho92@gmail.com
    % Github : https://github.com/yoon-jae
    %
    
    input = double(input);
    
    h = size(input,1);
    w = size(input,2);
    pad = floor(f_size/2);

    result = zeros(h,w);
    m = zeros(h,w); 
    v_G = zeros(h,w); 
    I_G = zeros(h+2*pad, w+2*pad);
    I_G(1+pad:h+pad,1+pad:w+pad) = input;
    
    gaussian_filter = fspecial('gaussian',f_size, 4);
    
    for i = 1:h
        for j = 1:w
            window = I_G(i:i+2*pad,j:j+2*pad);
            mask = gaussian_filter .* window;
            m(i,j) = sum(mask(:)); % result of the Gaussian LPF
            v_G(i,j) = var(window(:),1); % variance of the window
        end
    end
    
    n = sum(v_G(:)) / (h*w); % average of variance over an entire image.
    
    for i = 1:h
        for j = 1:w
            result(i,j) = m(i,j) + max(0,v_G(i,j)-n) / max(v_G(i,j),n)...
                * (I_G(i+pad,j+pad)-m(i,j));
        end
    end
end