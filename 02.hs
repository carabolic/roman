import Text.Parsec
import Text.Parsec.String

roman :: Parser Int
roman = do
    (char 'I')
    return 1

main = print $ parse roman "fail" "I"
