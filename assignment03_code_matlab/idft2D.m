function f = idft2D(F)
    [m,n] = size(F);
    F_conj = conj(F);
    f = dft2D(F_conj);
    f = f / (m*n);
    f = conj(f);
end

