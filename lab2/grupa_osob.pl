%  Program Grupa_osób
% Baza wiedzy o grupie osób i ich upodobaniach
% Definiowane predykaty:
% lubi/2
% opis: lubi(X,Y)-spe³niony, gdy osoba X lubi osobê Y
% jarosz/1
% opis:jarosz(X)-spe³niony, gdy X jest jaroszem
% nie_pal¹cy/1
% opis: nie_pal¹cy(X)-spe³niony, gdy X nie pali papierosów.
% lubi_czytaæ/1
% opis: lubi_czytaæ(X)-spe³niony, gdy X lubi czytaæ ksi¹¿ki
% uprawia_sport/1
% opis: uprawia_sport(X)-spe³niony, gdy X uprawia sport
%-----------------------------------------------------------------
jarosz(ola).
jarosz(ewa).
jarosz(jan).
jarosz(pawe³).
nie_pal¹cy(ola).
nie_pal¹cy(ewa).
nie_pal¹cy(jan).
lubi_czytaæ(ola).
lubi_czytaæ(iza).
lubi_czytaæ(piotr).
uprawia_sport(ola).
uprawia_sport(jan).
uprawia_sport(piotr).
uprawia_sport(pawe³).
lubi(ola,X):-jarosz(X),uprawia_sport(X).
lubi(ewa,X):-nie_pal¹cy(X),jarosz(X).
lubi(iza,X):-lubi_czytaæ(X).
lubi(iza,X):-uprawia_sport(X),nie_pal¹cy(X).
lubi(jan,X):-uprawia_sport(X).
lubi(piotr,X):-jarosz(X),uprawia_sport(X).
lubi(piotr,X):-lubi_czytaæ(X).
lubi(pawe³,X):-jarosz(X),uprawia_sport(X),lubi_czytaæ(X).
/*
Program sk³ada siê z 22 klauzul, 14 faktów i 8 regu³.
Program sk³ada siêz 5 definicji relacji.
*/






