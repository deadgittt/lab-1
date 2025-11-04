module Task5Spec (tests) where

import Test.HUnit
import Task5
  ( divisibleByAll
  , divisibleByAllTail
  , smallestMultipleRec
  , smallestMultipleTailRec
  , leastCommonMul
  , leastCommonMulMap2
  , leastCommonMulFor
  )

tests :: IO Counts
tests = runTestTT $ TestList
  [ "divisibleByAll 12 4 == True"        ~: True  ~=? divisibleByAll 12 4
  , "divisibleByAllTail 12 5 == False"   ~: False ~=? divisibleByAllTail 12 5

  , "smallestMultipleRec 10 == 2520"     ~: 2520  ~=? smallestMultipleRec 10
  , "smallestMultipleTailRec 10 == 2520" ~: 2520  ~=? smallestMultipleTailRec 10

  , "leastCommonMul 10 == 2520"          ~: 2520  ~=? leastCommonMul 10
  , "leastCommonMulMap2 10 == 2520"      ~: 2520  ~=? leastCommonMulMap2 10
  , "leastCommonMulFor 10 == 2520"       ~: 2520  ~=? leastCommonMulFor 10
  ]
