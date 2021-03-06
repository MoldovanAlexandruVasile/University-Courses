
%maxy(List-L, M-MaxElem)
%flow model (i, o)
maxy([H|T], M):-
   maxy(T, H, M).

%maxy(List-L, M-CurrentMax, R-FinalMax)
%flow model (i, i, o), (i, i, i)
maxy([], M, M).

maxy([H|T], M, R):-
    H > M, !,
    maxy(T, H, R).

maxy([H|T], M, R):-
    H =< M,
    maxy(T, M, R).

%pozMaxList(List-L, RestulList-X)
%flow model (i, o)
pozMaxList(L, X):-
    maxy(L, M),
    pozMaxList(L, M, 0, X).

%pozMaxList(List-L, MaxElem-M, ContorForPoz-C, ResultList-R)
%flow model (i, i, o)
pozMaxList([], _, _, []).
pozMaxList([H|T], M, C, [HR|TR]):-
        H=:=M, !,
        C1 is C+1,
        HR is C1,
        pozMaxList(T, M, C1, TR).

pozMaxList([H|T], M, C, L):-
    H=\=M,
    C1 is C+1,
    pozMaxList(T, M, C1, L).

%solve(List-L, ListRestul-LR)
%flow model (i,O)
solve([],[]).

solve([H|T], [H|TR]):-
    number(H), !,
    solve(T,TR).

solve([H|T], [HR|TR]):-
    is_list(H),
    pozMaxList(H, X),
    f(X, HR),
    solve(T, TR).

%f(List-L, ListResult-LR)
%flow model (i,o)
f([], []).
f([H|T], [H|TR]):-
   f(T, TR).


test:-
   solve([1,2,[3,4,1,4],1,[2,2,2],4], [1,2,[2,4],1,[1,2,3],4]),
   solve([1,2,3,4], [1,2,3,4]),
   solve([[1,2,3,4,5]], [[5]]),
   solve([4,2,[4,5,6,5],[1,2,1,2],5], [4,2,[3],[2,4],5]),
   solve([[1,1],[1,2,3],[2,3,3,2]], [[1,2],[3],[2,3]]).



















