## Задача 5

**Формулировка:**  
Найти наименьшее положительное число, которое делится на все числа от `1` до `n`.

**Файл:** `src/Task5.hs`  

**Вспомогательные функции:**  
- `divisibleByAll`, `divisibleByAllTail` — проверка «x делится на все 1..n».

**Реализации:**
- `smallestMultipleRec` — перебор кандидатов с обычной рекурсией  
- `smallestMultipleTailRec` — то же, но хвостовая рекурсия  
- `leastCommonMul` — модульный конвейер: `genCandidates` → `filter (isGood n)` → `head`  
- `leastCommonMulMap2` — генерация через `map (* n)` + `filter`  
- `leastCommonMulFor` — list comprehension как синтаксис цикла  
  
---

## Задача 25

**Формулировка:**  
Найти **индекс** первого числа Фибоначчи с заданным количеством цифр `n`  
(для 1000 цифр ответ `4782`).

**Файл:** `src/Task25.hs`  

**Реализации:**
- `fibRec`, `fibTailRec` — базовые функции Фибоначчи (наивная и хвостовая)  
- `indexFibWithDigits` — линейный хвостовой проход по паре `(F_{n-1}, F_n)` до порога `10^(d-1)`  
- `indexFibDigitsModular` — модульный стиль: `zip [1..] fibs` → `takeWhile` → `fold`  
- `indexFibDigitsMap` — генерация через `map` в `Maybe` + `catMaybes` + `head`  

---

# Тесты
--➤  stack test --fast --no-terminal         \
lab1-0.1.0.0: unregistering (local file changes: lab1.cabal) \
lab1> configure (lib + exe + test) \
Configuring lab1-0.1.0.0... \
lab1> build (lib + exe + test) with ghc-9.6.7 \
Preprocessing library for lab1-0.1.0.0.. \
Building library for lab1-0.1.0.0.. \
Preprocessing executable 'lab1' for lab1-0.1.0.0.. \
Building executable 'lab1' for lab1-0.1.0.0.. \
Preprocessing test suite 'all-tests' for lab1-0.1.0.0.. \
Building test suite 'all-tests' for lab1-0.1.0.0.. \
lab1> copy/register \
Installing library in /home/Atmosphere/ITMO/7_FP/lab1/.stack-work/install/x86_64-linux/b7265b181a5dd7849be9a9634d3639770923163add728a9d7593a790be4a06eb/9.6.7/lib/x86_64-linux-ghc-9.6.7/lab1-0.1.0.0-Hh4SRHh7EcHA6vO1bib7ND \
Installing executable lab1 in /home/Atmosphere/ITMO/7_FP/lab1/.stack-work/install/x86_64-linux/b7265b181a5dd7849be9a9634d3639770923163add728a9d7593a790be4a06eb/9.6.7/bin \
Registering library for lab1-0.1.0.0.. \
lab1> test (suite: all-tests) 

Cases: 7  Tried: 7  Errors: 0  Failures: 0 \
Cases: 5  Tried: 5  Errors: 0  Failures: 0 \
✅ All tests passed



lab1> Test suite all-tests passed \ 
Completed 2 action(s).
