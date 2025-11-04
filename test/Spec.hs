module Main (main) where
import Test.HUnit
import Lab1 (add)

tests :: Test
tests = TestList
  [ "1+1=2" ~: 2 ~=? add 1 1
  ]

main :: IO ()
main = runTestTTAndExit tests
