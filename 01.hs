import Text.Parsec

main = print $ parse (char 'I') "fail" "I"
