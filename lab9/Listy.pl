% PRZETWARZANIE LIST

wypisz_lista([]).

wypisz_lista([H|T]):-
    write(H),
    nl,
    wypisz_lista(T).

%----------------------------------
% KWADRAT LISTY

kwadrat_listy([],[]).

kwadrat_listy([H1|T1],[H2|T2]):-
    H2 is H1*H1,
    kwadrat_listy(T1,T2).

%----------------------------------
% PODWOJENIE

podwojenie([],[]).

podwojenie([H1|T1],[H1,H1|T2]):-
    podwojenie(T1,T2).

%----------------------------------
% LICZBA ELEMENTÓW LISTY

liczba_elem1([],0).
liczba_elem1([_|T],N):-
    liczba_elem1(T,N1),
    N is N1+1.
