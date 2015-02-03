module Main where

import Graphics.Element (..)
import Text (plainText)
import List
import Char (..)
import String (..)
import Debug

prefix : Char -> Char -> Int
prefix target current = (toCode target) - (toCode current)

suffix : Char -> Int
suffix current = (((toCode current) - (toCode 'A')) * 2) - 1

singleLine : Char -> Char -> String
singleLine target current =
  let prefixString = repeat (prefix target current) " "
      midString = if current == 'A'
                    then ""
                    else (repeat (suffix current) " ")
                         ++ (fromChar current)
  in prefixString ++ (fromChar current) ++ midString

currents : Char -> List Char
currents c =
  let up = List.map fromCode [(toCode 'A')..(toCode c)]
      down = (List.tail (List.reverse up))
  in up ++ down

diamondInner : Char -> List String
diamondInner c = List.map (singleLine c) (currents c)

diamond : Char -> String
diamond char = join "\n" <| diamondInner char

main = plainText "Hello"
