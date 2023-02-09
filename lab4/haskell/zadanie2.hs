-- Funkcja factorial(n) zwraca wartość n!.
factorial :: Integer -> Integer
factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial (n - 1)

mygcd :: Integer -> Integer -> Integer
mygcd a 0 = a
mygcd a b = mygcd b (a `mod` b)

solveDiofantine :: Integer -> Integer -> Integer -> (Integer, Integer)
solveDiofantine a b c = (x, y)
  where g = gcd a b
        x = c * b `div` g
        y = c * a `div` g
