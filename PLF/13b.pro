
%gcd1 (A-fist elem, B-second elem, X-result of gcd)
%gcd1 flow model (i,i,o) (i,i,i)
gcd1(A, 0, A):- !.

gcd1(A, B, X):-
    C is mod(A,B),
    gcd1(B, C, X).


% gcdList(L-input list, R-gcd of the list elements)
% gcdList flow model (i, o) (i, i)
gcdList([], 0).

gcdList([H | T], R):-
    gcdList(T, R2),
    R is gcd(H, R2).

test:-
    gcdList([1,2,3,4], 1),
    gcdList([0,4,8,6], 2),
    gcdList([18,9,27], 9),
    write("passed all tests").
