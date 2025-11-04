module Task0 where

sumRec :: Int -> Int
sumRec n
  | n <= 0 = 0
  | (n - 1) `mod` 3 == 0 = (n - 1) + sumRec (n - 1)
  | (n - 1) `mod` 5 == 0 = (n - 1) + sumRec (n - 1)
  | otherwise = sumRec (n - 1)

sumTailRec :: Int -> Int
sumTailRec n = go (n - 1) 0
  where
    go k acc
      | k <= 0 = acc
      | k `mod` 3 == 0 = go (k - 1) (acc + k)
      | k `mod` 5 == 0 = go (k - 1) (acc + k)
      | otherwise = go (k - 1) acc
