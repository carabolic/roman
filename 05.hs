import Text.Parsec
import Text.Parsec.String
import Data.Maybe (fromJust)

value :: Char -> Int
value c = fromJust . lookup c $ [
    ('I', 1),
    ('V', 5),
    ('X', 10)]

roman :: Parser Int
roman = do
    x <- many (char 'X') >>= return . (*) (value 'X') . length 
    v <- many (char 'V') >>= return . (*) (value 'V') . length 
    i <- many (char 'I') >>= return . (*) (value 'I') . length 
    eof
    return $ x + v + i

main = print $ parse roman "fail" "XVII"
