import Text.Parsec
import Text.Parsec.String

roman :: Parser Int
roman = do
    i <- many (char 'I')
    eof
    return $ length i

main = print $ parse roman "fail" "II"
