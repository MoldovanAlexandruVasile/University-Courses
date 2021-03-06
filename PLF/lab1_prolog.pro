rangeList(N, M, []):-
    N is M+1.
rangeList(N, M, [H|T]):-
    H is N,
    N1 is N+1,
    rangeList(N1, M, T).

maxElem([], M, M).
maxElem([H|T], M, R):-
    H > M,
    maxElem(T, H, R).
maxElem([H|T], M, R):-
    H < M,
    maxElem(T, M, R).

% L, E, P, LR
insertPozN(L, _, 0, L).

insertPozN(L, E, 1, [E|TR]):-
    insertPozN(L, E, 0, TR).

insertPozN([H|T], E, P, [H|TR]):-
    P1 is P-1,
    insertPozN(T, E, P1, TR).

%!  %%%%

alterSum([], _, 0).

alterSum([H|T], 1, R):-
    alterSum(T, 0, R1),
    R is R1 - H.

alterSum([H|T], 0, R):-
    alterSum(T, 1, R1),
    R is R1+H.

removeNth([], _, []).
removeNth(L, 0, L).
removeNth([_|T], 1, LR):-
    removeNth(T, 0, LR).
removeNth([H|T], P, [H|TR]):-
    P1 is P-1,
    removeNth(T, P1, TR).

adaugaInceput(E, L, [E|L]).










