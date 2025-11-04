module Task25Spec (tests) where

import Test.HUnit
import Task25
  ( fibRec
  , fibTailRec
  , indexFibWithDigits
  , indexFibDigitsModular
  , indexFibDigitsMap
  )

tests :: IO Counts
tests = runTestTT $ TestList
  [ "fibRec 10 == 55"                 ~: 55   ~=? fibRec 10
  , "fibTailRec 10 == 55"             ~: 55   ~=? fibTailRec 10

  , "indexFibWithDigits 3 == 12"      ~: 12   ~=? indexFibWithDigits 3
  , "indexFibDigitsModular 3 == 12"   ~: 12   ~=? indexFibDigitsModular 3
  , "indexFibDigitsMap 3 == 12"       ~: 12   ~=? indexFibDigitsMap 3
  ]
