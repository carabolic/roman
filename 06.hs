import Text.Parsec
import Text.Parsec.String
import Data.Maybe (fromJust)

value :: Char -> Int
value c = fromJust . lookup c $ [
    ('I', 1),
    ('V', 5),
    ('X', 10)]

single :: Char -> Parser Int
single c = do
    x <- many (char c)
    return $ length x * value c

roman :: Parser Int
roman = do
    x <- single 'X'
    v <- single 'V'
    i <- single 'I'
    eof
    return $ x + v + i

main = print $ parse roman "fail" "XVII"
