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

pair :: Char -> Char -> Parser Int
pair small big = do
    string $ small:big:""
    return $ value big - value small

roman :: Parser Int
roman = do
    x <- single 'X'
    v <- single 'V'
    i <- try (pair 'I' 'X') <|> try (pair 'I' 'V') <|> (single 'I')
    eof
    return $ x + v + i

main = do
    print $ parse roman "fail" "XVII"
    print $ parse roman "fail" "IV"
    print $ parse roman "fail" "IX"
