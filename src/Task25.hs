-- Task25.hs
module Task25 where

import Data.Maybe (catMaybes)

-- Наивная рекурсия для вычисления чисел Фибоначчи
fibRec :: Int -> Integer
fibRec 1 = 1
fibRec 2 = 1
fibRec n = fibRec (n - 1) + fibRec (n - 2)

-- хвостовая рекурсия
fibTailRec :: Int -> Integer
fibTailRec n = go n 1 1
  where
    go :: Int -> Integer -> Integer -> Integer
    go 1 a _ = a
    go k a b = go (k - 1) b (a + b)

-- индекс числа с числом цифр n
-- 4782 (0.01 secs, 2,863,440 bytes)
indexFibWithDigits :: Int -> Int
indexFibWithDigits n
  | n <= 1 = 1
  | otherwise = go 2 1 1 -- go (i) (F_{i-1}) (F_i)
  where
    target = 10 ^ (n - 1) :: Integer -- минимальное n-значное число
    go i a b
      | b >= target = i
      | otherwise = go (i + 1) b (a + b)

-- модульная реализация: генерация + фильтрация + свёртка
-- 4782 (2.39 secs, 4,774,686,888 bytes)
indexFibDigitsModular :: Int -> Int
indexFibDigitsModular n =
  let target = 10 ^ (n - 1) :: Integer
      -- генерация: (индекс, значение)
      generated = [(i, fibTailRec i) | i <- [1 ..]]
      -- фильтрация: оставляем, пока число меньше порога
      below = takeWhile (\(_, x) -> x < target) generated
      -- свёртка: берём последний индекс
      lastIdx = foldl (\_ (i, _) -> i) 0 below -- ваще можно просто length, но раз просится свёртка.......
   in lastIdx + 1

-- генерация через map
-- 4782 (2.39 secs, 4,774,692,152 bytes)
indexFibDigitsMap :: Int -> Int
indexFibDigitsMap n =
  let target = 10 ^ (n - 1) :: Integer
      -- генерация и отображение: превращаем каждое число в индекс
      marked =
        map
          ( \i ->
              if fibTailRec i >= target
                then Just i
                else Nothing
          )
          [1 ..]
   in head (catMaybes marked)
