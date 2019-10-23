function kernel = gaussKernel(sig, m)

    threshold = 2 * ceil(3 * sig) + 1;

    if (nargin == 1)
        size = threshold;
        
    else
        if m < threshold
            disp('m is too small')
            return
        else
            size = m ;   
        end
    end
    
    kernel = zeros(size,size);
    center = (size - 1) / 2;
    norm = 0;
    for i = 1:size
        for j = 1:size
            x1 = 1 / (2 * pi * power(sig,2));
            x2 = - (power(i-center-1, 2) + power(j-center-1, 2)) / (2 * power(sig,2));
            kernel(i,j) = x1 * exp(x2);
            norm = kernel(i,j) + norm;
        end
    end

    for i = 1:size
        for j = 1:size
            kernel(i,j) = kernel(i,j) / norm;
        end
    end
    return
end