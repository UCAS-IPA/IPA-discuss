function g = rgb1gray(f, method)
    if (nargin == 1)
        method = 'NTSC';
    end
    
    [row_num, col_num, channel_num] = size(f); % obtain row number, column and channel number
    R_img = f(:,:,1); % obtain the red channel
    G_img = f(:,:,2); 
    B_img = f(:,:,3);
    if  strcmp (method,'average') % compare two strings
        gray_img = (R_img+G_img+B_img)/3; % Calculate mean value
        g = uint8(gray_img); % double to int
    end
    if  strcmp (method,'NTSC')
        gray_img = 0.2989*R_img+0.5870*G_img+0.1140*B_img;
        g = uint8(gray_img);
    end    
end