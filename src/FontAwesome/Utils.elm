module FontAwesome.Utils exposing (dedup, onlyOne)


onlyOne : (a -> Bool) -> a -> ( Bool, List a ) -> ( Bool, List a )
onlyOne f curr ( found, list ) =
    case ( f curr, found ) of
        ( True, False ) ->
            ( True, curr :: list )

        ( True, True ) ->
            ( found, list )

        ( False, _ ) ->
            ( found, curr :: list )


dedup : (a -> Bool) -> List a -> List a
dedup f list =
    List.foldr (onlyOne f) ( False, [] ) list
        |> Tuple.second
