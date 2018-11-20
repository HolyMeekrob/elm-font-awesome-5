module FontAwesome.Layers exposing
    ( layers
    , IconLayer(..), LayerOption(..), BadgePosition(..)
    )

{-| This module enables the layers feature of Font Awesome 5. Layers allows you
to stack any number of Font Awesome icons and elements, as well as overlay text
or counter badges.

Note that this feature requires using SVG Font Awesome elements.


# Entry point

@docs layers


# Options and layers

@docs IconLayer, LayerOption, BadgePosition

-}

import FontAwesome
    exposing
        ( Option
        , Style
        , Transform
        , iconWithOptions
        )
import FontAwesome.Icon exposing (Icon)
import FontAwesome.Utils exposing (dedup, onlyOne)
import Html exposing (Attribute, Html, span)
import Html.Attributes exposing (class, classList)


{-| Create a layered Font Awesome element.

    layers
        [ IconLayer envelope Solid [] [] ]
        [ LayerHasFixedWidth
        , Badge "821" TopLeft []
        ]

    -- <span class="fa-layers fa-fw">
    --     <i class="fas fa-envelope"></i>
    --     <span class="fa-layers-counter fa-layers-top-left">821</i>
    -- </span>

-}
layers : List (IconLayer msg) -> List (LayerOption msg) -> Html msg
layers iconsList options =
    span
        [ classes options ]
        (List.map icon iconsList ++ optionLayers options)


icon : IconLayer msg -> Html msg
icon (IconLayer iconType style options attributes) =
    iconWithOptions iconType style options attributes


classes : List (LayerOption msg) -> Attribute msg
classes options =
    if List.member LayerHasFixedWidth options then
        class "fa-layers fa-fw"

    else
        class "fa-layers"


optionLayers : List (LayerOption msg) -> List (Html msg)
optionLayers options =
    options
        |> dedup isText
        |> dedup isBadge
        |> optionElems


optionElems : List (LayerOption msg) -> List (Html msg)
optionElems options =
    textElem options ++ badgeElem options


textElem : List (LayerOption msg) -> List (Html msg)
textElem options =
    List.foldr text [] options


text : LayerOption msg -> List (Html msg) -> List (Html msg)
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
            "grow-" ++ String.fromFloat n

        FontAwesome.Shrink n ->
            "shrink-" ++ String.fromFloat n

        FontAwesome.ShiftDown n ->
            "down-" ++ String.fromFloat n

        FontAwesome.ShiftLeft n ->
            "left-" ++ String.fromFloat n

        FontAwesome.ShiftRight n ->
            "right-" ++ String.fromFloat n

        FontAwesome.ShiftUp n ->
            "up-" ++ String.fromFloat n

        FontAwesome.Rotate n ->
            "rotate-" ++ String.fromFloat n

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


badge : LayerOption msg -> List (Html msg) -> List (Html msg)
badge layerOption layerOptions =
    case layerOption of
        Badge str pos attributes ->
            let
                elem =
                    span
                        (classList
                            [ ( "fa-layers-counter", True )
                            , ( positionClass pos, True )
                            ]
                            :: attributes
                        )
                        [ Html.text str ]
            in
            elem :: layerOptions

        _ ->
            layerOptions


badgeElem : List (LayerOption msg) -> List (Html msg)
badgeElem options =
    List.foldr badge [] options


positionClass : BadgePosition -> String
positionClass position =
    case position of
        BottomLeft ->
            "fa-layers-bottom-left"

        BottomRight ->
            "fa-layers-bottom-right"

        TopLeft ->
            "fa-layers-top-left"

        TopRight ->
            "fa-layers-top-right"


isText : LayerOption msg -> Bool
isText option =
    case option of
        TextLayer _ _ _ ->
            True

        _ ->
            False


isBadge : LayerOption msg -> Bool
isBadge option =
    case option of
        Badge _ _ _ ->
            True

        _ ->
            False


{-| A layer consisting of any Font Awesome icon or logo.
-}
type IconLayer msg
    = IconLayer Icon Style (List Option) (List (Attribute msg))


{-| Other options for a set of layers.

Including the `LayerHasFixedWidth` option will align all layers.

Including the `TextLayer` option will place the given text on top
of your layers element.

Including the `Badge` option adds a badge with the given text on top
of your element. This is often used to display a counter.

-}
type LayerOption msg
    = LayerHasFixedWidth
    | TextLayer String (List Transform) (List (Attribute msg))
    | Badge String BadgePosition (List (Attribute msg))


{-| Positioning for a `Badge` layer option.
-}
type BadgePosition
    = BottomLeft
    | BottomRight
    | TopLeft
    | TopRight
