function s = scanLine4e(f,I,loc)
    if strcmp (loc,'row') % compare two strings, if loc == 'row'
        s = f(I,:); % obtain  line I of the image
    end
    if strcmp(loc, 'column')
        s = f(:,I);
    end
end