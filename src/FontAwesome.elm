module FontAwesome
    exposing
        ( Animation(..)
        , Attribute(..)
        , Icon(..)
        , Pull(..)
        , Size(..)
        , Style(..)
        , fa
        , icon
        )

import Html exposing (Html, span)
import Html.Attributes


icon : Icon -> Html msg
icon icon =
    let
        style =
            defaultStyle icon
    in
        fa icon style [] []


fa : Icon -> Style -> List Attribute -> List (Html.Attribute msg) -> Html msg
fa icon style attributes htmlAttributes =
    let
        attrs =
            filterAttrs attributes
    in
        span
            (classes icon style attrs
                :: transformAttr attrs
                ++ maskAttr attrs
                ++ htmlAttributes
            )
            []


isAnimation : Attribute -> Bool
isAnimation attribute =
    case attribute of
        Animation _ ->
            True

        _ ->
            False


isPull : Attribute -> Bool
isPull attribute =
    case attribute of
        Pull _ ->
            True

        _ ->
            False


isSize : Attribute -> Bool
isSize attribute =
    case attribute of
        Size _ ->
            True

        _ ->
            False


isBorder : Attribute -> Bool
isBorder attribute =
    case attribute of
        HasBorder ->
            True

        _ ->
            False


isWidth : Attribute -> Bool
isWidth attribute =
    case attribute of
        HasFixedWidth ->
            True

        _ ->
            False


isMask : Attribute -> Bool
isMask attribute =
    case attribute of
        Mask _ _ ->
            True

        _ ->
            False


isTransform : Attribute -> Bool
isTransform attribute =
    case attribute of
        Transform _ ->
            True

        _ ->
            False


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


filterAttrs : List Attribute -> List Attribute
filterAttrs attributes =
    -- TODO: Deduplicate each type of attribute
    attributes
        |> dedup isAnimation
        |> dedup isPull
        |> dedup isSize
        |> dedup isBorder
        |> dedup isWidth
        |> dedup isMask
        |> dedup isTransform


iconClass : Icon -> String
iconClass icon =
    let
        root =
            name icon
    in
        "fa-" ++ root


animationClass : Animation -> String
animationClass animation =
    case animation of
        Spin ->
            "fa-spin"

        Pulse ->
            "fa-pulse"


borderClass : String
borderClass =
    "fa-border"


widthClass : String
widthClass =
    "fa-fw"


pullClass : Pull -> String
pullClass p =
    case p of
        Left ->
            "fa-pull-left"

        Right ->
            "fa-pull-right"


sizeClass : Size -> String
sizeClass size =
    case size of
        Normal ->
            ""

        ExtraSmall ->
            "fa-xs"

        Small ->
            "fa-sm"

        Large ->
            "fa-lg"

        Mult n ->
            "fa-" ++ toString n ++ "x"


styleClass : Style -> String
styleClass style =
    case style of
        Solid ->
            "fas"

        Regular ->
            "far"

        Light ->
            "fal"

        Brand ->
            "fab"


className : Attribute -> ( String, Bool )
className attr =
    case attr of
        Animation animation ->
            ( animationClass animation, True )

        HasBorder ->
            ( borderClass, True )

        HasFixedWidth ->
            ( widthClass, True )

        Mask _ _ ->
            ( "", False )

        Pull direction ->
            ( pullClass direction, True )

        Size size ->
            ( sizeClass size, True )

        Transform _ ->
            ( "", False )


classes : Icon -> Style -> List Attribute -> Html.Attribute msg
classes icon style attributes =
    ( styleClass style, True )
        :: ( iconClass icon, True )
        :: List.map className attributes
        |> Html.Attributes.classList


transform : Attribute -> List (Html.Attribute msg) -> List (Html.Attribute msg)
transform attr attrs =
    case attr of
        Transform str ->
            (Html.Attributes.attribute "data-fa-transform" str) :: attrs

        _ ->
            attrs


transformAttr : List Attribute -> List (Html.Attribute msg)
transformAttr attributes =
    List.foldr transform [] attributes


mask : Attribute -> List (Html.Attribute msg) -> List (Html.Attribute msg)
mask attr attrs =
    case attr of
        Mask icon style ->
            let
                val =
                    styleClass style ++ " " ++ iconClass icon
            in
                (Html.Attributes.attribute "data-fa-mask" val) :: attrs

        _ ->
            attrs


maskAttr : List Attribute -> List (Html.Attribute msg)
maskAttr attributes =
    List.foldr mask [] attributes


type Attribute
    = Animation Animation
    | HasBorder
    | HasFixedWidth
    | Mask Icon Style
    | Pull Pull
    | Size Size
    | Transform String


type Style
    = Solid
    | Regular
    | Light
    | Brand


type Size
    = Normal
    | ExtraSmall
    | Small
    | Large
    | Mult Int


type Pull
    = Left
    | Right


type Animation
    = Spin
    | Pulse



-- The following section will need to be updated whenever
-- new icons are added. They've been placed at the bottom
-- so that all other lines are unchanged


type Icon
    = AddressBook
    | Edit


defaultStyle : Icon -> Style
defaultStyle icon =
    case icon of
        _ ->
            Regular


name : Icon -> String
name icon =
    case icon of
        AddressBook ->
            "address-book"

        Edit ->
            "edit"
