module Tests where

import Graphics.Element (Element)
import ElmTest.Test (test, Test, suite, defaultTest)
import ElmTest.Assertion (assert, assertEqual)
import ElmTest.Runner.Element (runDisplay)

import Main (..)

tests : Test
tests =
  suite "Test"
    [test "diff 1" (assertEqual "A" (diamond 'A'))
    ]

main : Element
main = runDisplay tests
