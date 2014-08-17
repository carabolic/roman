import Text.Parsec
import Text.Parsec.String

roman :: Parser Int
roman = do
    x <- many (char 'X')
    v <- many (char 'V')
    i <- many (char 'I')
    eof
    return $ (length x * 10) + (length v * 5) + length i

main = print $ parse roman "fail" "XVII"
