module Tests where

import Graphics.Element (Element)
import ElmTest.Test (test, Test, suite, defaultTest)
import ElmTest.Assertion (assert, assertEqual)
import ElmTest.Runner.Element (runDisplay)
import String (concat,fromChar)
import List

import Main (..)

tests : Test
tests =
  suite "Test"
    [test "A" (assertEqual "A" (diamond 'A'))
    ,test "B" (assertEqual " A\nB B\n A" (diamond 'B'))

    ,test "Prefix A->A" (assertEqual 0 (prefix 'A' 'A'))
    ,test "Prefix D->B" (assertEqual 2 (prefix 'D' 'B'))

    ,test "Suffix B" (assertEqual 1 (suffix 'B'))
    ,test "Suffix D" (assertEqual 5 (suffix 'D'))

    ,test "Single Line A->A" (assertEqual "A" (singleLine 'A' 'A'))
    ,test "Single Line B->A" (assertEqual " A" (singleLine 'B' 'A'))
    ,test "Single Line B->B" (assertEqual "B B" (singleLine 'B' 'B'))
    ,test "Single Line D->C" (assertEqual " C   C" (singleLine 'D' 'C'))

    ,test "Currents A" (assertEqual "A" (concat <| List.map fromChar (currents 'A')))
    ,test "Currents C" (assertEqual "ABCBA" (concat <| List.map fromChar (currents 'C')))

    ,test "Diamond Inner A" (assertEqual ["A"] (diamondInner 'A'))
    ]

main : Element
main = runDisplay tests
