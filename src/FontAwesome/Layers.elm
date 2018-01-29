module FontAwesome.Layers exposing (IconLayer(..), OptionLayer(..), layers)

{-| This module enables the layers feature of Font Awesome. Layers allows you
to stack any number of Font Awesome icons and elements, as well as overlay text
or counter badges.

Note that this feature requires using SVG Font Awesome elements.


# Elements

@docs layers


# Layers

@docs IconLayer, OptionLayer

-}

import FontAwesome
    exposing
        ( Style
        , Option
        , Transform
        , iconWithOptions
        )
import FontAwesome.Icon exposing (Icon)
import FontAwesome.Utils exposing (dedup, onlyOne)
import Html exposing (Attribute, Html, span)
import Html.Attributes exposing (class)


{-| Create an element made up of Font AWesome layers.
-}
layers : List (IconLayer msg) -> List (OptionLayer msg) -> Html msg
layers icons options =
    span
        [ classes options ]
        (List.map icon icons ++ optionLayers options)


icon : IconLayer msg -> Html msg
icon (IconLayer icon style options attributes) =
    iconWithOptions icon style options attributes


classes : List (OptionLayer msg) -> Attribute msg
classes options =
    if (List.member LayerHasFixedWidth options) then
        class "fa-layers fa-fw"
    else
        class "fa-layers"


optionLayers : List (OptionLayer msg) -> List (Html msg)
optionLayers options =
    options
        |> dedup isText
        |> dedup isBadge
        |> optionElems


optionElems : List (OptionLayer msg) -> List (Html msg)
optionElems options =
    textElem options ++ badgeElem options


textElem : List (OptionLayer msg) -> List (Html msg)
textElem options =
    List.foldr text [] options


text : OptionLayer msg -> List (Html msg) -> List (Html msg)
text layerOption layerOptions =
    case layerOption of
        TextLayer txt transforms attributes ->
            let
                elem =
                    span
                        (class "fa-layers-text"
                            :: transformAttr transforms
                            :: attributes
                        )
                        [ Html.text txt ]
            in
                elem :: layerOptions

        _ ->
            layerOptions


transformVal : Transform -> String
transformVal transform =
    case transform of
        FontAwesome.Grow n ->
            "grow-" ++ toString n

        FontAwesome.Shrink n ->
            "shrink-" ++ toString n

        FontAwesome.ShiftDown n ->
            "down-" ++ toString n

        FontAwesome.ShiftLeft n ->
            "left-" ++ toString n

        FontAwesome.ShiftRight n ->
            "right-" ++ toString n

        FontAwesome.ShiftUp n ->
            "up-" ++ toString n

        FontAwesome.Rotate n ->
            "rotate-" ++ toString n

        FontAwesome.FlipHorizontal ->
            "flip-h"

        FontAwesome.FlipVertical ->
            "flip-v"


transformAttr : List Transform -> Attribute msg
transformAttr transforms =
    let
        val =
            transforms
                |> List.map transformVal
                |> String.join " "
    in
        Html.Attributes.attribute "data-fa-transform" val


badge : OptionLayer msg -> List (Html msg) -> List (Html msg)
badge layerOption layerOptions =
    case layerOption of
        Badge str attributes ->
            let
                elem =
                    span
                        (class "fa-layers-counter"
                            :: attributes
                        )
                        [ Html.text str ]
            in
                elem :: layerOptions

        _ ->
            layerOptions


badgeElem : List (OptionLayer msg) -> List (Html msg)
badgeElem options =
    List.foldr badge [] options


isText : OptionLayer msg -> Bool
isText option =
    case option of
        TextLayer _ _ _ ->
            True

        _ ->
            False


isBadge : OptionLayer msg -> Bool
isBadge option =
    case option of
        Badge _ _ ->
            True

        _ ->
            False


{-| A layer consisting of any Font Awesome icon or logo.
-}
type IconLayer msg
    = IconLayer Icon Style (List Option) (List (Attribute msg))


{-| Other options for a set of layers.

Including the LayerHasFixedWidth option will align all layers and is generally recommended.

Including the TextLayer option will place the given text on top of your layer.

Including the Badge option adds a badge with the given text to the top right of your element.
This is often used to display a counter.

-}
type OptionLayer msg
    = LayerHasFixedWidth
    | TextLayer String (List Transform) (List (Attribute msg))
    | Badge String (List (Attribute msg))
