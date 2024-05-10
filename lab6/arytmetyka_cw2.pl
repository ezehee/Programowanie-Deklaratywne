% Rozpoznawanie wielomianów jednej zmiennej
% o wspó³czynnikach liczbowych

/*
Definicja: rekurencja strukturalna

1) x jest wielomianem zmiennej x
   c - liczba jest wielomianem dowolnej zmiennej

2) Je¿eli W, W1, W2 s¹ wielomianami zm. x, to
   -W, W1+W2, W1-W2, W1*W2, W^N (N-liczba naturalna)
   s¹ wielomianami zmiennej x
*/


% wielomian(W,X)
% spe³niony,gdy W jest wielomianem zmiennej X
% o wspó³czynnikach liczbowych
% definicja rekurencyjna

% warunki zakoñczenia rekurencji
  wielomian(X,X).
  wielomian(C,_):-number(C).

% rekurencja
  wielomian(-W,X):-wielomian(W,X).
  wielomian(W1+W2,X):-wielomian(W1,X),
          wielomian(W2,X).
  wielomian(W1-W2,X):-wielomian(W1,X),
          wielomian(W2,X).
  wielomian(W1*W2,X):-wielomian(W1,X),
          wielomian(W2,X).
  wielomian(W^N,X):-integer(N),
         N>1,
         wielomian(W,X).
