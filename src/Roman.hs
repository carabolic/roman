{-# LANGUAGE OverloadedStrings #-}

module Roman (roman) where

import Control.Applicative ((<|>), many)

import Data.Attoparsec.Text
import Data.Text (Text, cons)

value :: Char -> Int
value 'I' = 1
value 'V' = 5
value 'X' = 10
value 'L' = 50
value 'C' = 100
value 'D' = 500
value 'M' = 1000

single :: Char -> Parser Int
single c = do
    x <- many (char c)
    return $ length x * value c

pair :: Char -> Char -> Parser Int
pair small big = do
    string $ small `cons` big `cons` ""
    return $ value big - value small

-- |An attoparsec parser that parses a string of roman numerals (e.g., \"VI\")
-- into an 'Int'.
roman :: Parser Int
roman = do
    m <- single 'M'
    d <- single 'D'
    c <- try (pair 'C' 'M') <|> try (pair 'C' 'D') <|> single 'C'
    l <- single 'L'
    x <- try (pair 'X' 'C') <|> try (pair 'X' 'L') <|> single 'X'
    v <- single 'V'
    i <- try (pair 'I' 'X') <|> try (pair 'I' 'V') <|> single 'I'
    return $ m + d + c + l + x + v + i
