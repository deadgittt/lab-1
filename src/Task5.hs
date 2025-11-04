module Task5 where

-- проверяем, делится ли `x` на все числа от 1 до n
divisibleByAll :: Int -> Int -> Bool
divisibleByAll x n = all isDivisibleBy [1 .. n] -- или через анонимную (лямбда) функцию >>:  all (\k -> x `mod` k == 0) [1..n]
  where
    isDivisibleBy k = x `mod` k == 0

-- наивная рекурсия: 232792560 : (147.62 secs, 225,451,016,872 bytes)
smallestMultipleRec :: Int -> Int
smallestMultipleRec 0 = 0
smallestMultipleRec n = try 1
  where
    try x
      | divisibleByAll x n = x
      | otherwise = try (x + 1)

-- аналог функции выше, но уже хвостовой
divisibleByAllTail :: Int -> Int -> Bool
divisibleByAllTail x n = go [1 .. n]
  where
    go [] = True
    go (k : ks)
      | x `mod` k /= 0 = False
      | otherwise = go ks

-- хвостовая рекурсия
smallestMultipleTailRec :: Int -> Int
smallestMultipleTailRec 0 = 0
smallestMultipleTailRec n = try 1
  where
    -- try candidate -- пробуем текущее число candidate как ответ
    try candidate
      | divisibleByAllTail candidate n = candidate -- нашли ответ
      | otherwise = try (candidate + 1) -- пробуем дальше

-- 2) модульная реализация
-- генерация, для простоты начинаем с 1
genCandidates :: [Int]
genCandidates = [1 ..] -- бесконечный список кандидатов

-- фильтр
-- число x годится, если оно делится на все числа от 1 до n
isGood :: Int -> Int -> Bool
isGood n x = all (\k -> x `mod` k == 0) [1 .. n]

-- свёртка
-- Вариант с явным конвейером: генерация + filter + head
leastCommonMul :: Int -> Int
leastCommonMul n =
  head -- свёртка - возьми первый, т.е. минимальный
    ( filter
        (isGood n) -- фильтрация
        genCandidates -- генерация
    )

-- 3) генерация последовательности при помощи отображения (map)
leastCommonMulMap2 :: Int -> Int
leastCommonMulMap2 n =
  head
    ( filter
        (isGood n)
        (map (* n) [1 ..])
    ) -- получше оптимизировали: 232792560 (9.04 secs, 15,627,323,536 bytes)

-- 4) работа со спец. синтаксисом для циклов
leastCommonMulFor :: Int -> Int
leastCommonMulFor n =
  head
    [x | x <- map (* n) [1 ..], all (\k -> x `mod` k == 0) [1 .. n]]

-- 5) работа с бескончеными списками (уже было продемонстрировано несколько раз выше)
