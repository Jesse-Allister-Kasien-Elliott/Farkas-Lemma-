

% part (a)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EAMPLE 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example is from class
%
A = [-1 2; -1 -2; 0 -1; 1 0 ];

b = [0;-2;-2;0];

% U = [.5 .5 0 0; .5 0 1 0; 0 0 0 1]

U = fm(A,b,2);

UA = mtimes(U,A);

Ub = mtimes(U,b);

V = fm(UA,Ub,1);

VUA = mtimes(V,UA);

VUb = mtimes(V,Ub);

VU = mtimes(V,U);

u1 = VU(1,:);

u2 = VU(2,:);

% test conditions of certificate of infeasability

mtimes(u1,A);

mtimes(u1,b);

u1;
%








%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EAMPLE 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%{
A = [1 1 -2; -1 -3 1; 0 1 1];

b = [2;0;1];

U = fm(A,b,3)

UA = mtimes(U,A);

Ub = mtimes(U,b);

V = fm(UA,Ub,2);

VUA = mtimes(V,UA);

VUb = mtimes(V,Ub);

VU = mtimes(V,U);

W = fm(VUA,VUb,1);

WVUA = mtimes(W,VUA);

WVUb = mtimes(W,VUb)
%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EAMPLE 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%{
A = [-.1 .7 -.7 ;.7 .9 .2 ; -.7 -.9 -.2];
b = [99; -1 ;-1];
U = fm(A,b,3);
% U = [1.43 5 0; 0 5 5];
UA = mtimes(U,A);
Ub = mtimes(U,b);


% UA = [3.357 5.5; 0 0];
% Ub = [136.429; -10];

V = fm(UA,Ub,2);

VUA = mtimes(V,UA);

VUb = mtimes(V,Ub);

VU = mtimes(V,U);

W = fm(VUA,VUb,1);
%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EAMPLE 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%{
A = [-.14378192 .74821 -.742891;
    .748329 .9687432 .28932;
    -.748329 -.9687432 -.28932];
b = [99;-1;-1];

U = fm(A,b,3);

UA = mtimes(U,A);

Ub = mtimes(U,b);

V = fm(UA,Ub,2);

size(V);
%}
