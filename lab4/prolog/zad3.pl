solve(A, B, C, X, Y) :-
   gcd(A, B, D),
   C mod D =:= 0, % sprawdzenie, czy równanie ma rozwiązania
   X is C * B / D,
   Y is C * A / D.