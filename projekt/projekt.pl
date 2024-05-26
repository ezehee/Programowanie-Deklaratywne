% wynajem samochod�w
% predykat samochod/6:
% samochod(Nazwa, Typ, Rozmiar, LimitKilometrow, Cena, Paliwo) - definicja samochodu

samochod('Toyota Corolla',
     osobowy, kompakt, 2000, 100, benzyna).
samochod('Ford Focus',
     osobowy, kompakt, 2000, 120, benzyna).
samochod('BMW X5',
     suv, du�y, 1500, 200, diesel).
samochod('Mercedes Sprinter',
     dostawczy, du�y, 1000, 250, diesel).
samochod('Fiat 500',
     osobowy, ma�y, 3000, 80, benzyna).
samochod('Volkswagen Golf',
     osobowy, kompakt, 2000, 110, benzyna).
samochod('Tesla Model S',
     osobowy, du�y, 2500, 300, elektryczny).
samochod('Renault Kangoo',
     dostawczy, �redni, 1500, 150, diesel).
samochod('Honda Civic',
     osobowy, kompakt, 2500, 130, benzyna).
samochod('Audi A4',
     osobowy, �redni, 2000, 160, benzyna).
samochod('Nissan Qashqai',
     suv, �redni, 2000, 170, benzyna).
samochod('Toyota Prius',
     osobowy, �redni, 2500, 140, hybryda).
samochod('Skoda Octavia',
     osobowy, kompakt, 2000, 110, benzyna).
samochod('Peugeot Partner',
     dostawczy, ma�y, 1500, 130, diesel).
samochod('Kia Sportage',
     suv, �redni, 2000, 180, benzyna).

% >> predykat losowy/1: <<
% losowy(X) - spe�niony, gdy X == losowy
losowy(X):- X==losowy.

% >> predykat wypisz_cena/2: <<
% wypisz_cena(Samochod, Cena) - spe�niony, gdy samochod Samochod ma cen� r�wn� Cena
wypisz_cena(Samochod, Cena):-samochod(Samochod,_,_,_,Cena,_).

% >> predykat limit/2: <<
% limit(Samochod, Limit) - spe�niony, gdy samochod Samochod mo�e przejecha�
% conajmniej Limit kilometr�w
% limit(Samochod, 2000).
limit(Samochod, Limit):-(losowy(Limit), !);
    samochod(Samochod,_,_,LimSamochod,_,_), LimSamochod>=Limit.

% >> predykat cenaMax/2: <<
% cenaMax(Samochod, Cena) - spe�niony, gdy samochod Samochod jest niedro�szy ni� podana Cena lub Cena == losowy
% cenaMax(X, 150),
cenaMax(Samochod, Cena):-(losowy(Cena), !);
    (samochod(Samochod,_,_,_,CenaSamochod,_), CenaSamochod=<Cena).

% >> predykat cenaMin/2: <<
% cenaMin(Samochod, Cena) - spe�niony, gdy samochod Samochod kosztuje conajmniej podan� Cena lub Cena == losowy
% cenaMin(X, 100).
cenaMin(Samochod, Cena):-(losowy(Cena), !);
    (samochod(Samochod,_,_,_,CenaSamochod,_), CenaSamochod>=Cena).


% >> predykat typ/2: <<
% typ(Samochod, Typ) - spe�niony, gdy samochod Samochod jest typu Typ lub Typ == losowy.
% typ(X, osobowy).
typ(Samochod, Typ):-(losowy(Typ), !);
    (samochod(Samochod,TypSamochod,_,_,_,_), TypSamochod==Typ).


% >> predykat rozmiar/2: <<
% rozmiar(Samochod, Rozmiar) - spe�niony, gdy samochod Samochod jest rozmiaru Rozmiar lub Rozmiar == losowy.
% rozmiar(X, �redni).
rozmiar(Samochod, Rozmiar):-(losowy(Rozmiar), !);
    (samochod(Samochod,_,RozmSamochod,_,_,_), RozmSamochod==Rozmiar).

% >> predykat paliwo/2: <<
% paliwo(Samochod, Paliwo) - spe�niony, gdy samochod Samochod u�ywa paliwa typu Paliwo lub Paliwo == losowy.
% paliwo(X, benzyna).
paliwo(Samochod, Paliwo):-(losowy(Paliwo), !);
    (samochod(Samochod,_,_,_,_,PaliwoSamochod), PaliwoSamochod==Paliwo).

% >> predykat filtruj/6: <<
% filtruj(X, FBudzet, FTyp, FRozmiar, FPaliwo, FLimit) - spe�niony, gdy samochod o nazwie X
% spe�nia za�o�enia predykat�w cenaMax/2, typ/2, rozmiar/2, paliwo/2, limit/2
filtruj(X, FBudzet, FTyp, FRozmiar, FPaliwo, FLimit):-samochod(X,_,_,_,_,_),
    cenaMax(X,FBudzet),
    typ(X,FTyp),
    rozmiar(X,FRozmiar),
    paliwo(X,FPaliwo),
    limit(X,FLimit).

% >> predykat asystent/0: <<
% funkcja g��wna programu -- interakcja z u�ytkownikiem
asystent:-
    write('Jaki bud�et posiadasz? (podaj maksymaln� cen� wynajmu samochodu na dzie� w z�)'),
    read(ABudzet),
    write('Jaki rodzaj samochodu? (osobowy/suv/dostawczy)'),
    read(ATyp),
    write('Jakiego rozmiaru samochodu poszukujesz? (ma�y/kompakt/�redni/du�y)'),
    read(ARozmiar),
    write('Jakiego typu paliwo? (benzyna/diesel/elektryczny/hybryda)'),
    read(APaliwo),
    write('Jak� maksymaln� ilo�� kilometr�w chcesz przejecha�? (w km)'),
    read(ALimit),
    findall(Samochod, filtruj(Samochod, ABudzet, ATyp, ARozmiar, APaliwo, ALimit), SamochodLista),
    wypisz_samochody(SamochodLista),
    !.

% >> predykat wypisz_samochody/1: <<
% wypisuje rekurencyjnie zawarto�� listy
wypisz_samochody([]):- !. % warunek stopu
wypisz_samochody([H|T]) :-
  writeln(H),
  wypisz_samochody(T),
  !.

% >> predykat koszyk/1: <<
% koszyk(Lista) - pobiera nazwy samochod�w i dopisuje je do listy
koszyk(KoszykLista) :-
    write('Podaj nazw� samochodu (lub wpisz koniec)'),
    read(Nazwa),
    dodaj_samochod(Nazwa, KoszykLista).

% >> predykat dodaj_samochod/2: <<
% dodaje rekurencyjnie samochody do tablicy
dodaj_samochod(koniec, []) :- !.
dodaj_samochod(Nazwa, [Nazwa | Reszta]) :-
    koszyk(Reszta).

