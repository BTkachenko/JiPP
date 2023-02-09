factorial(0, 1). % warunek brzegowy: 0! = 1
factorial(N, F) :-
   N > 0,
   N1 is N - 1,
   factorial(N1, F1),
   F is N * F1.

gcd(A, 0, A). 
gcd(A, B, D) :-
   B > 0,
   R is A mod B,
   gcd(B, R, D).

   solve(A, B, C, X, Y) :-
   gcd(A, B, D),
   C mod D =:= 0, % sprawdzenie, czy równanie ma rozwiązania
   X is C * B / D,
   Y is C * A / D.