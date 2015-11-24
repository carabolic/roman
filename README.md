# attoparsec-roman #

An Attoparsec parser library for roman numerals.

## Examples ##

The following section gives an overview on a simple use case for
`attoparsec-roman` and `ghci`.

At first we need a `ghci` session:

``` bash
ghci
```

In order to parse roman literals the following modules need to be imported:

``` haskell
*X> import Data.Attoparsec.Text
*X> import Data.Attoparsec.Text.Roman
```

Now we can access the attoparsec `Text` based parser and the parser for roman
numerals `roman`.

For easy usage of `Text` it is suggested to use the `OverloadedStrings` language
pragma:

``` haskell
*X> :set -XOverloadedStrings
```

Now we can parse any roman numeral using the `roman` parser:

``` haskell
*X> parseOnly roman "CCXIV"
Right 214
```

