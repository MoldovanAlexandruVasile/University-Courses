
%pairs(E, L - list, RL - PairsList)
pairs(_, [], []).
pairs(E, [H|T], [[E,H]|TR]):-
    pairs(E, T, TR).

%allPairs(L - list, RL - result list)

concata([],B,B).
concata([H|T], B, [H|TR]):-
    concata(T, B, TR).


allPairs([], []).
allPairs([H|T], R):-
    pairs(H, T, X),
    allPairs(T, TR),
    concata(X, TR, R).

