solveDiofantine :: Integer -> Integer -> Integer -> (Integer, Integer)
solveDiofantine a b c = (x, y)
  where g = gcd a b
        x = c * b `div` g
        y = c * a `div` g