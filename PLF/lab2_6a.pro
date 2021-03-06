
%productL(L-List, D-Digit, LR-ResultList)
%flow model (i,i,o), (i,i,i)
productL(L, D, [Q|LR]):-
    productL(L, D, Q, LR),
    Q =\= 0, !.

productL(L, D, LR):-
    productL(L, D, _, LR).

%productL(L-List, D-Digit, Q-Quotient, LR-RestulList)
%flow model(i,i,o,o)
productL([], _, 0, []).
productL([H|T], D, Q, [HR|TR]):-
    productL(T, D, Q1, TR),
    HR is mod(H * D + Q1, 10),
    Q is div(H * D + Q1, 10).


test:-
    productL([1,2,3], 4, [4,9,2]),
    productL([1,1,1], 1, [1,1,1]),
    productL([9,9,9], 9, [8,9,9,1]),
    productL([4,1,2,4,1,5,5], 7, [2,8,8,6,9,0,8,5]).
