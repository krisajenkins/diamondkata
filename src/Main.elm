module Main where

import Graphics.Element (..)
import Text (..)
import Char (..)

-- innerDiamond : Char -> Char -> String
-- innerDiamond target char =
--   let prefixCount = target - char
--   in

prefix : Char -> Char -> Int
prefix target current = (toCode target) - (toCode current)

suffix : Char -> Int
suffix current = (((toCode current) - (toCode 'A')) * 2) - 1

diamond : Char -> String
diamond char = "A"

main = plainText "Hello"
