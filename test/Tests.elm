module Tests where

import Graphics.Element (Element)
import ElmTest.Test (test, Test, suite, defaultTest)
import ElmTest.Assertion (assert, assertEqual)
import ElmTest.Runner.Element (runDisplay)

import Main (..)

tests : Test
tests =
  suite "Test"
    [test "A" (assertEqual "A" (diamond 'A'))

    -- ,test "B" (assertEqual " A\nB B\n A" (diamond 'B'))

    ,test "Prefix A->A" (assertEqual 0 (prefix 'A' 'A'))
    ,test "Prefix D->B" (assertEqual 2 (prefix 'D' 'B'))

    ,test "Suffix B" (assertEqual 1 (suffix 'B'))
    ,test "Suffix D" (assertEqual 5 (suffix 'D'))
    ]

main : Element
main = runDisplay tests
