function [g] = twodConv(f, w, padding)
%twodConv 此处显示有关此函数的摘要
%   此处显示详细说明

%% padding f
% m-1*n-1|          | m-1*n-1
% _ _ _ _|_ _ _ _ _ | _ _ _ _
%        |* * * * * |  
%        |* * * * * |  
%        |* * * * * |  
% - - - -|- - - - - | - - - -
% m-1*n-1|          | m-1*n-1

% judge the number of input parameters
switch nargin
    case 1
        disp("usage: twodConv(f, w), where padding default be 'zero'" );
        disp("usage: twodConv(f, w, padding), where padding can be 'zero' or 'replicate'" );
    case 2
        % get size of f and w
        size_f = size(f);
        [m, n] = size(w);
        
        % padding default zero
        B1 = zeros(m-1, n-1);
        B2 = zeros(m-1, size_f(2));
        B3 = zeros(size_f(1), n-1);
        J = [B1,B2,B1;B3,f,B3;B1,B2,B1];
    case 3
        % get size of f and w
        size_f = size(f);
        [m, n] = size(w);
        % padding="replicate"
        if(strcmp(padding, 'replicate'))
            A1 = zeros(m-1, n-1);
            for i = 1:1:(m-1)
                for j = 1:1:(n-1)
                    A1(i,j) = f(1,1);
                end
            end
            A2 = zeros(m-1, size_f(2));
            for i = 1:1:(m-1)
                for j = 1:1:size_f(2)
                    A2(i,j) = f(1,j);
                end
            end
            A3 = zeros(m-1, n-1);
            for i = 1:1:(m-1)
                for j = 1:1:(n-1)
                    A3(i,j) = f(1,size_f(2));
                end
            end
            A4 = zeros(size_f(1), n-1);
            for i = 1:1:size_f(1)
                for j = 1:1:(n-1)
                    A4(i,j) = f(i,1);
                end
            end
            A5 = zeros(size_f(1), n-1);
            for i = 1:1:size_f(1)
                for j = 1:1:(n-1)
                    A5(i,j) = f(i,size_f(2));
                end
            end
            A6 = zeros(m-1, n-1);
            for i = 1:1:(m-1)
                for j = 1:1:(n-1)
                    A6(i,j) = f(size_f(1),1);
                end
            end
            A7 = zeros(m-1, size_f(2));
            for i = 1:1:(m-1)
                for j = 1:1:size_f(2)
                    A7(i,j) = f(size_f(1),j);
                end
            end
            A8 = zeros(m-1, n-1);
            for i = 1:1:(m-1)
                for j = 1:1:(n-1)
                    A8(i,j) = f(size_f(1),size_f(2));
                end
            end
            J = [A1,A2,A3;A4,f,A5;A6,A7,A8];
        % padding="zero"
        elseif(strcmp(padding,'zero'))
            B1 = zeros(m-1, n-1);
            B2 = zeros(m-1, size_f(2));
            B3 = zeros(size_f(1), n-1);
            J = [B1,B2,B1;B3,f,B3;B1,B2,B1];
        % padding input error
        else           
            disp("usage: twodConv(f, w), where padding default be 'zero'" );
            disp("usage: twodConv(f, w, padding), where padding can be 'zero' or 'replicate'" );
        end
end

%% ratate 180 degrees of w
% flip horizontally
for i = 1:1:m
    for j = 1:1:(n-1)/2
        exchange_temp = w(i,j);
        w(i,j) = w(i,n+1-j);
        w(i,n+1-j) = exchange_temp;
    end
end
% flip vertically
for j = 1:1:n
    for i = 1:1:(m-1)/2
        exchange_temp = w(i,j);
        w(i,j) = w(m+1-i,j);
        w(m+1-i,j) = exchange_temp;
    end
end

%% conv J and w
size_J = size(J);
a = (m-1)/2;
b = (n-1)/2;
J1 = zeros(size_J(1),size_J(2));
for i = (a+1):1:(size_J(1)-a)
    for j = (b+1):1:(size_J(2)-b)
        temp = J(i-a:1:i+a,j-b:1:j+b).* w;
        J1(i, j) = sum(sum(temp));
    end
end

%% final result after crop
g = J1((m-1)+1:1:size_J(1)-(m-1),(n-1)+1:1:size_J(2)-(n-1));
end




