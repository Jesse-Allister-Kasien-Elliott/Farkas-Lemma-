% The following is a MATLAB program that receives as input an m × n matrix A and a vector
% b ∈ R^m, and which then determines if the system Ax ≤ b is feasible or not. If it is
% infeasible, the program outputs a certificate of infeasibility u ∈ R^m:
% function u = farkas( A, b )

function u = farkas( A, b )

% Get the sizes of matrix A
[m,n] = size(A);

% Check if the size of b matches m
if m ~= size(b)
   error('Dimensions of A and b do not match')
end

% Matrix auxU is the identity matrix mxm
auxU = eye(m);

% perform FM to eliminate all variables

% first loop
U = fm(A,b,n);
AiMinus1 = mtimes(U,A);
biMinus1 = mtimes(U,b);
ProjProduct = U;
% remaining loops
for i=n-1:-1:1
    V = fm(AiMinus1,biMinus1,i);
    AiMinus1 = mtimes(V,AiMinus1); % VUA
    biMinus1 = mtimes(V,biMinus1); % VUb
    ProjProduct = mtimes(V,ProjProduct); % VU
end

% now construct certificate of infeasability
[Pm Pn] = size(ProjProduct);
k = 0;
for i=1:Pm
    if dot(ProjProduct(i,:),b) < 0
        k = i;
    end
end

if k > 0
    fprintf('PROBLEM IS INFEASIBLE!!\n\n')
    u = ProjProduct(k,:);
    return
else
    fprintf('PROBLEM IS FEASIBLE!!\n\n')
    u = [];
    return
end



end
