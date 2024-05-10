f0(X,Y):-between(10,12,X),
    between(X,13,Y).
f0(5,5).

f1(X,Y):-!,
    between(10,12,X),
    between(X,13,Y).
f1(5,5).

f2(X,Y):-between(10,12,X),
    !,
    between(X,13,Y).
f2(5,5).

f3(X,Y):-between(10,12,X),
    between(X,13,Y),
    !.
f3(5,5).

