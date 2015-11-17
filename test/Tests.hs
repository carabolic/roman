module Main where

import Data.Attoparsec.Text
import Data.Text (Text, pack)
import Test.HUnit

import Roman

expectedValues = [
    ("XVII", 17)
  , ("IV", 4)
  , ("IX", 9)
  , ("MMCDXLVI", 2446)
  , ("MMMMM", 5000)]

testExpectedValues :: [Test]
testExpectedValues = map (\(r, n) -> TestLabel ("Test" ++ r)
                                     $ TestCase
                                     $ assertBool ""
                                     $ parseOnly roman (pack r) == Right n)
                     expectedValues

main :: IO ()
main = do
  _ <- runTestTT $ TestList testExpectedValues
  return ()
