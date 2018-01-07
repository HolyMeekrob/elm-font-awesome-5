module FontAwesome
    exposing
        ( Animation(..)
        , Mask(..)
        , Name(..)
        , Pull(..)
        , Size(..)
        , Style(..)
        , create
        , elem
        , icon
        , setAnimation
        , setHasBorder
        , setHasFixedWidth
        , setMask
        , setPull
        , setSize
        , setStyle
        , setTransform
        )

import Html exposing (Attribute, Html, span)
import Html.Attributes exposing (attribute, class)
import String exposing (cons, isEmpty)


create : Name -> Icon
create n =
    { name = n
    , style = defaultStyle n
    , size = Normal
    , hasFixedWidth = False
    , hasBorder = False
    , pull = NoPull
    , animation = NoAnimation
    , transform = Nothing
    , mask = NoMask
    }


setStyle : Style -> Icon -> Icon
setStyle style icon =
    { icon | style = style }


setSize : Size -> Icon -> Icon
setSize size icon =
    { icon | size = size }


setHasFixedWidth : Bool -> Icon -> Icon
setHasFixedWidth hasFixedWidth icon =
    { icon | hasFixedWidth = hasFixedWidth }


setHasBorder : Bool -> Icon -> Icon
setHasBorder hasBorder icon =
    { icon | hasBorder = hasBorder }


setPull : Pull -> Icon -> Icon
setPull pull icon =
    { icon | pull = pull }


setAnimation : Animation -> Icon -> Icon
setAnimation animation icon =
    { icon | animation = animation }


setTransform : Maybe String -> Icon -> Icon
setTransform transform icon =
    { icon | transform = transform }


setMask : Mask -> Icon -> Icon
setMask mask icon =
    { icon | mask = mask }


icon : Name -> Html msg
icon name =
    let
        icon =
            create name
    in
        elem icon


elem : Icon -> Html msg
elem icon =
    let
        classAttr =
            class (classes icon)

        transformAttr =
            transform icon.transform

        maskAttr =
            mask icon.mask
    in
        span
            (classAttr
                :: transform icon.transform
                ++ mask icon.mask
            )
            []


classes : Icon -> String
classes icon =
    let
        classNames =
            [ style icon.style
            , name icon.name
            , size icon.size
            , width icon.hasFixedWidth
            , border icon.hasBorder
            , pull icon.pull
            , animation icon.animation
            ]

        prependSpace class classes =
            if (isEmpty classes) then
                class
            else if (isEmpty class) then
                classes
            else
                classes ++ " " ++ class
    in
        List.foldl prependSpace "" classNames


name : Name -> String
name n =
    "fa-" ++ nameOfName n


style : Style -> String
style s =
    case s of
        Solid ->
            "fas"

        Regular ->
            "far"

        Light ->
            "fal"

        Brand ->
            "fab"


size : Size -> String
size sz =
    case sz of
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


width : Bool -> String
width hasFixedWidth =
    if hasFixedWidth then
        "fa-fw"
    else
        ""


border : Bool -> String
border hasBorder =
    if hasBorder then
        "fa-border"
    else
        ""


pull : Pull -> String
pull p =
    case p of
        NoPull ->
            ""

        Left ->
            "fa-pull-left"

        Right ->
            "fa-pull-right"


animation : Animation -> String
animation a =
    case a of
        NoAnimation ->
            ""

        Spin ->
            "fa-spin"

        Pulse ->
            "fa-pulse"


transform : Maybe String -> List (Html.Attribute msg)
transform t =
    case t of
        Nothing ->
            []

        Just str ->
            [ attribute "data-fa-transform" str ]


mask : Mask -> List (Html.Attribute msg)
mask m =
    case m of
        NoMask ->
            []

        Mask n s ->
            [ attribute "data-fa-mask" <| style s ++ " " ++ name n ]


nameOfName : Name -> String
nameOfName n =
    case n of
        AddressBook ->
            "address-book"

        Edit ->
            "edit"


defaultStyle : Name -> Style
defaultStyle n =
    case n of
        _ ->
            Regular


type alias Icon =
    { name : Name
    , style : Style
    , size : Size
    , hasFixedWidth : Bool
    , hasBorder : Bool
    , pull : Pull
    , animation : Animation
    , transform : Maybe String
    , mask : Mask
    }


type Name
    = AddressBook
    | Edit


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
    = NoPull
    | Left
    | Right


type Animation
    = NoAnimation
    | Spin
    | Pulse


type Mask
    = NoMask
    | Mask Name Style
