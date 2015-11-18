module Main where

import Data.Attoparsec.Text
import Data.Text (Text, pack)
import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit
import Test.HUnit

import Roman

expectedValues = [
    ("XVII", 17)
  , ("IV", 4)
  , ("IX", 9)
  , ("MMCDXLVI", 2446)
  , ("MMMMM", 5000)]

testExpectedValues :: [Test]
testExpectedValues = map (\(r, n) -> TestLabel ("parse \"" ++ r ++ "\"")
                                     $ Right n ~=? parseOnly roman (pack r))
                     expectedValues

main :: IO ()
main = do
  defaultMain $ hUnitTestToTests $ TestList testExpectedValues
