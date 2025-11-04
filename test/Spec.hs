-- test/Spec.hs
module Main (main) where

import qualified Task25Spec
import qualified Task5Spec
import Test.HUnit

main :: IO ()
main = do
  c1 <- Task5Spec.tests
  c2 <- Task25Spec.tests
  let fails = errors c1 + failures c1 + errors c2 + failures c2
  if fails == 0
    then putStrLn "✅ All tests passed"
    else error "❌ Some tests failed"
