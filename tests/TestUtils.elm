module TestUtils exposing (last, transform, transformAttr)

import FontAwesome as FA
import Html
import Html.Attributes


last : (a -> Bool) -> List a -> Maybe a
last f =
    List.filter f >> List.reverse >> List.head


transformAttr : String -> Html.Attribute msg
transformAttr =
    Html.Attributes.attribute "data-fa-transform"


transformText : FA.Transform -> String
transformText transform =
    case transform of
        FA.Grow n ->
            "grow-" ++ toString n

        FA.Shrink n ->
            "shrink-" ++ toString n

        FA.ShiftDown n ->
            "down-" ++ toString n

        FA.ShiftLeft n ->
            "left-" ++ toString n

        FA.ShiftRight n ->
            "right-" ++ toString n

        FA.ShiftUp n ->
            "up-" ++ toString n

        FA.Rotate n ->
            "rotate-" ++ toString n

        FA.FlipHorizontal ->
            "flip-h"

        FA.FlipVertical ->
            "flip-v"


transform : List FA.Transform -> String
transform transforms =
    transforms
        |> List.map transformText
        |> String.join " "
