

%
% infeasable example
A = [-1 2; -1 -2; 0 -1; 1 0 ];
b = [0;-2;-2;0];
farkas(A,b)
%


%{
% infeasable example
A = [-1 1 -1; 1 1 1; -1 -1 -1];
b = [1;-1;-1];
farkas(A,b)
%}


%{
% infeasable example
A = [-.14378192 .74821 -.742891;
    .748329 .9687432 .28932;
    -.748329 -.9687432 -.28932];
b = [99;-1;-1];
farkas(A,b)
%}


%{
A = [-.1 .7 -.7 ;.7 .9 .2 ; -.7 -.9 -.2];
b = [99; -1 ;-1];
farkas(A,b)
%}


%{
% feasable example
A = [1 1 1; -1 0 1; 1 -1 1];
b = [6;4;5];
farkas(A,b)
%}



%{
% feasable example
A = [1 1 -2; -1 -3 1; 0 1 1];
b = [2;0;1];
farkas(A,b);
%}
