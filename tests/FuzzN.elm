module FuzzN exposing (fuzz4)
{- Taken from https://github.com/ianmackenzie/elm-geometry/blob/71ce593b0c0130613c96c673d566db50cc448b91/tests/Test/FuzzN.elm -}

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer)
import Test exposing (Test)


type alias Arguments4 a b c d =
    { argument1 : a
    , argument2 : b
    , argument3 : c
    , argument4 : d
    }


fuzz4 : Fuzzer a -> Fuzzer b -> Fuzzer c -> Fuzzer d -> String -> (a -> b -> c -> d -> Expectation) -> Test
fuzz4 fuzzer1 fuzzer2 fuzzer3 fuzzer4 description expectation =
    Test.fuzz
        (Fuzz.map4 Arguments4 fuzzer1 fuzzer2 fuzzer3 fuzzer4)
        description
        (\{ argument1, argument2, argument3, argument4 } ->
            expectation argument1 argument2 argument3 argument4
        )
