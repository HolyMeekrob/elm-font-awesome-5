module TestCommon exposing
    ( iconOptionsTests
    , last
    , styleClass
    , testStyle
    , transform
    , transformAttr
    )

import Expect
import FontAwesome as FA
import FontAwesome.Icon as Icon exposing (Icon)
import Html
import Html.Attributes
import Test.Html.Query as Query
import Test.Html.Selector as Selector


last : (a -> Bool) -> List a -> Maybe a
last f =
    List.filter f >> List.reverse >> List.head


transformAttr : String -> Html.Attribute msg
transformAttr =
    Html.Attributes.attribute "data-fa-transform"


transformText : FA.Transform -> String
transformText transformType =
    case transformType of
        FA.Grow n ->
            "grow-" ++ String.fromFloat n

        FA.Shrink n ->
            "shrink-" ++ String.fromFloat n

        FA.ShiftDown n ->
            "down-" ++ String.fromFloat n

        FA.ShiftLeft n ->
            "left-" ++ String.fromFloat n

        FA.ShiftRight n ->
            "right-" ++ String.fromFloat n

        FA.ShiftUp n ->
            "up-" ++ String.fromFloat n

        FA.Rotate n ->
            "rotate-" ++ String.fromFloat n

        FA.FlipHorizontal ->
            "flip-h"

        FA.FlipVertical ->
            "flip-v"


transform : List FA.Transform -> String
transform transforms =
    transforms
        |> List.map transformText
        |> String.join " "


iconOptionsTests :
    Icon
    -> FA.Style
    -> List FA.Option
    -> List (Query.Single msg -> Expect.Expectation)
iconOptionsTests icon style options =
    [ testIconClass icon
    , testStyle icon style
    , testBorder options
    , testWidth options
    , testInvertColor options
    , testHtmlTag options
    , testAnimation options
    , testPull options
    , testSize options
    , testTransform options
    , testMask options
    ]


testIconClass : Icon -> Query.Single msg -> Expect.Expectation
testIconClass icon =
    case icon of
        Icon.Icon name ->
            Query.has [ Selector.class ("fa-" ++ name) ]

        Icon.Logo name ->
            Query.has [ Selector.class ("fa-" ++ name) ]


styleClass : Icon -> FA.Style -> String
styleClass icon style =
    case icon of
        Icon.Logo _ ->
            "fab"

        Icon.Icon _ ->
            case style of
                FA.Solid ->
                    "fas"

                FA.Regular ->
                    "far"

                FA.Light ->
                    "fal"


testStyle : Icon -> FA.Style -> Query.Single msg -> Expect.Expectation
testStyle icon style =
    Query.has [ Selector.class (styleClass icon style) ]


testBorder : List FA.Option -> Query.Single msg -> Expect.Expectation
testBorder options =
    let
        expectation =
            if List.member FA.HasBorder options then
                Query.has

            else
                Query.hasNot
    in
    expectation [ Selector.class "fa-border" ]


testWidth : List FA.Option -> Query.Single msg -> Expect.Expectation
testWidth options =
    let
        expectation =
            if List.member FA.HasFixedWidth options then
                Query.has

            else
                Query.hasNot
    in
    expectation [ Selector.class "fa-fw" ]


testInvertColor : List FA.Option -> Query.Single msg -> Expect.Expectation
testInvertColor options =
    let
        expectation =
            if List.member FA.InvertColor options then
                Query.has

            else
                Query.hasNot
    in
    expectation [ Selector.class "fa-inverse" ]


testHtmlTag : List FA.Option -> Query.Single msg -> Expect.Expectation
testHtmlTag options =
    let
        opt =
            last isHtmlTag options
    in
    case opt of
        Just (FA.HtmlTag FA.Span) ->
            Query.has [ Selector.tag "span" ]

        _ ->
            Query.has [ Selector.tag "i" ]


testAnimation : List FA.Option -> Query.Single msg -> Expect.Expectation
testAnimation options =
    let
        opt =
            last isAnimation options
    in
    case opt of
        Just (FA.Animation FA.Spin) ->
            Query.has [ Selector.class "fa-spin" ]

        Just (FA.Animation FA.Pulse) ->
            Query.has [ Selector.class "fa-pulse" ]

        _ ->
            Query.hasNot
                [ Selector.class "fa-spin"
                , Selector.class "fa-pulse"
                ]


testPull : List FA.Option -> Query.Single msg -> Expect.Expectation
testPull options =
    let
        opt =
            last isPull options
    in
    case opt of
        Just (FA.Pull FA.Left) ->
            Query.has [ Selector.class "fa-pull-left" ]

        Just (FA.Pull FA.Right) ->
            Query.has [ Selector.class "fa-pull-right" ]

        _ ->
            Query.hasNot
                [ Selector.class "fa-pull-left"
                , Selector.class "fa-right"
                ]


testSize : List FA.Option -> Query.Single msg -> Expect.Expectation
testSize options =
    let
        opt =
            last isSize options
    in
    case opt of
        Just (FA.Size FA.ExtraSmall) ->
            Query.has [ Selector.class "fa-xs" ]

        Just (FA.Size FA.Small) ->
            Query.has [ Selector.class "fa-sm" ]

        Just (FA.Size FA.Large) ->
            Query.has [ Selector.class "fa-lg" ]

        Just (FA.Size (FA.Mult n)) ->
            Query.has [ Selector.class ("fa-" ++ String.fromInt n ++ "x") ]

        _ ->
            Query.hasNot
                [ Selector.class "fa-xs"
                , Selector.class "fa-sm"
                , Selector.class "fa-lg"
                , Selector.class "fa-sm"
                , Selector.class "fa-2x"
                , Selector.class "fa-3x"
                , Selector.class "fa-4x"
                , Selector.class "fa-5x"
                , Selector.class "fa-6x"
                , Selector.class "fa-7x"
                , Selector.class "fa-8x"
                , Selector.class "fa-9x"
                , Selector.class "fa-10x"
                ]


testTransform : List FA.Option -> Query.Single msg -> Expect.Expectation
testTransform options =
    let
        opt =
            last isTransform options
    in
    case opt of
        Just (FA.Transform transforms) ->
            Query.has
                [ Selector.attribute
                    (transformAttr <| transform transforms)
                ]

        -- TODO: How to ensure that an element does not have an attribute?
        _ ->
            Query.hasNot [ Selector.attribute (transformAttr "") ]


testMask : List FA.Option -> Query.Single msg -> Expect.Expectation
testMask options =
    let
        opt =
            last isMask options

        htmlAttribute =
            Html.Attributes.attribute "data-fa-mask"
    in
    case opt of
        Just (FA.Mask icon style) ->
            Query.has
                [ Selector.attribute <|
                    htmlAttribute
                        (styleClass icon style ++ " " ++ iconClass icon)
                ]

        -- TODO: How to ensure that an element does not have an attribute?
        _ ->
            Query.hasNot [ Selector.attribute (htmlAttribute "") ]


isHtmlTag : FA.Option -> Bool
isHtmlTag option =
    case option of
        FA.HtmlTag _ ->
            True

        _ ->
            False


isAnimation : FA.Option -> Bool
isAnimation option =
    case option of
        FA.Animation _ ->
            True

        _ ->
            False


isPull : FA.Option -> Bool
isPull option =
    case option of
        FA.Pull _ ->
            True

        _ ->
            False


isSize : FA.Option -> Bool
isSize option =
    case option of
        FA.Size _ ->
            True

        _ ->
            False


isTransform : FA.Option -> Bool
isTransform option =
    case option of
        FA.Transform _ ->
            True

        _ ->
            False


isMask : FA.Option -> Bool
isMask option =
    case option of
        FA.Mask _ _ ->
            True

        _ ->
            False


iconClass : Icon -> String
iconClass icon =
    case icon of
        Icon.Icon str ->
            "fa-" ++ str

        Icon.Logo str ->
            "fa-" ++ str
