% Function fm receives an m x n matrix A, an m dimensional vector b
% and the dimension p (p has to be <= n)
% It is assumed (but never checked) that all columns of A with index j > n are zeros
% (note this allows us to start from an n dimensional matrix and drop down to dimension n-1,
% then n-2, then all the way to p, without changing much the code)
% It returns the matrix U such that UA has the p-th column as 0
% and UA x \leq U b corresponds to the projection of Ax \leq b onto
% the first p-1 variables


% As an example, for the problem seen in class, where
%  A = [-1 2; -1 -2; 0 -1; 1 0 ] and b = [0;-2;-2;0]
% you should call the program with U = fm( A, b, 2 )
% and get as an output:
%
%U =
%
%   0.50000   0.50000   0.00000   0.00000
%   0.50000   0.00000   1.00000   0.00000
%   0.00000   0.00000   0.00000   1.00000


function [ U ] = fm( A, b, p )

    % Get the sizes of matrix A
    [m, n] = size(A);

    % Check if the size of b matches m
    if m ~= size(b)
        error('Dimensions of A and b do not match')
    end

    % Declare an mxm identity matrix to be used to get unit vectors
    I = eye(m);
    U = [];
    Mvec = zeros(1,m);

    % I encode into Mvec the operations of U
    for i = 1:m
        % if abs(A(i,p)) > 0) - i.e. is a positive real
        if abs(A(i,p)) > 0.0001
            Mvec(1,i) = 1/A(i,p);
        % abs(A(i,p)) == 0 - i.e. equals 0
        elseif abs(A(i,p)) < 0.0001
            Mvec(1,i) = 0;
        end
    end

    % construct U
    % now I use Mvec to construct the projection matrix U
    for j=1:m
        if Mvec(1,j) == 0
            uj = zeros(1,m);
            uj(1,j) = 1;
            U = [U; uj];

        elseif Mvec(1,j) < 0
            for k =(j+1):m
                if Mvec(1,k) > 0
                    u = zeros(1,m);
                    u(1,j) = abs(Mvec(1,j));
                    u(1,k) = abs(Mvec(1,k));
                    U = [U; u];
                end
            end

        elseif Mvec(1,j) > 0
            for k =(j+1):m
                if Mvec(1,k) < 0
                    u = zeros(1,m);
                    u(1,j) = abs(Mvec(1,j));
                    u(1,k) = abs(Mvec(1,k));
                    U = [U; u];
                end
            end
        end

    end


    % check to see if the projection has no constraints
    s=sign(Mvec);
    ipositif=sum(s(:)==1);
    inegatif=sum(s(:)==-1);
    % if no constraints on the projection then this is the zero matrix
    if (ipositif==m)
        U = zeros(1,m);
    end
    if (inegatif == m)
        U = zeros(1,m);


end
