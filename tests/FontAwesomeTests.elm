module FontAwesomeTests exposing (..)

import FontAwesome.Icon as Icon exposing (Icon)
import FontAwesome as FA
import Fuzzers
    exposing
        ( attributesFuzzer
        , iconFuzzer
        , optionsFuzzer
        , styleFuzzer
        , transformOptionFuzzer
        )
import TestUtils exposing (last, transform, transformAttr)
import Expect
import Fuzz
import Html exposing (Attribute)
import Html.Attributes
import Test exposing (Test, describe, fuzz, fuzz2, fuzz3, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


suite : Test
suite =
    describe "FontAwesome module"
        [ describe "useSvg" testUseSvg
        , describe "useCss" testUseCSS
        , describe "icon" testIcon
        , describe "iconWithOptions" testIconWithOptions
        ]


testUseSvg : List Test
testUseSvg =
    [ test "returns the correct script element" <|
        \_ ->
            FA.useSvg
                |> Query.fromHtml
                |> Expect.all
                    [ Query.has [ Selector.tag "script" ]
                    , Query.has
                        [ Selector.attribute (Html.Attributes.defer True) ]
                    , Query.has
                        [ Selector.attribute
                            (Html.Attributes.src
                                "https://use.fontawesome.com/releases/v5.0.3/js/all.js"
                            )
                        ]
                    ]
    ]


testUseCSS : List Test
testUseCSS =
    [ test "returns the correct link element" <|
        \_ ->
            FA.useCss
                |> Query.fromHtml
                |> Expect.all
                    [ Query.has [ Selector.tag "link" ]
                    , Query.has
                        [ Selector.attribute
                            (Html.Attributes.href
                                "https://use.fontawesome.com/releases/v5.0.3/css/all.css"
                            )
                        ]
                    , Query.has
                        [ Selector.attribute (Html.Attributes.rel "stylesheet") ]
                    ]
    ]


testIcon : List Test
testIcon =
    [ fuzz iconFuzzer "has icon name and default style only" <|
        \icon ->
            FA.icon icon
                |> Query.fromHtml
                |> Expect.all
                    [ Query.has [ Selector.tag "i" ]
                    , testStyle icon FA.Solid
                    ]
    ]


testIconWithOptions : List Test
testIconWithOptions =
    [ describe "without html attributes" testIconWithoutHtmlAttributes
    , describe "with html attributes" testIconWithHtmlAttributes
    ]


testIconWithoutHtmlAttributes : List Test
testIconWithoutHtmlAttributes =
    [ Test.fuzzWith
        { runs = 500 }
        (Fuzz.tuple4
            ( iconFuzzer
            , styleFuzzer
            , optionsFuzzer
            , attributesFuzzer
            )
        )
        "handles all options"
      <|
        \( icon, style, options, htmlAttributes ) ->
            FA.iconWithOptions icon style options htmlAttributes
                |> Query.fromHtml
                |> Expect.all
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
    ]


testIconWithHtmlAttributes : List Test
testIconWithHtmlAttributes =
    [ testIconWithCustomClasses
    , testIconWithStandardAttributes
    , testIconWithCustomAttributes
    ]


testIconWithCustomClasses : Test
testIconWithCustomClasses =
    testCustomClasses testIconHelper "custom classes for icon"


testCustomClasses :
    (String
     -> List (Attribute msg)
     -> (Query.Single msg -> Expect.Expectation)
     -> Test
    )
    -> String
    -> Test
testCustomClasses helper desc =
    let
        classOne =
            "custom-class-one"

        classTwo =
            "custom-class-two"
    in
        helper
            desc
            [ Html.Attributes.class classOne
            , Html.Attributes.class classTwo
            ]
            (\msg ->
                Query.has
                    [ Selector.class classOne
                    , Selector.class classTwo
                    ]
                    msg
            )


testIconWithStandardAttributes : Test
testIconWithStandardAttributes =
    testStandardAttributes testIconHelper "standard attributes for icon"


testStandardAttributes :
    (String
     -> List (Attribute msg)
     -> (Query.Single msg -> Expect.Expectation)
     -> Test
    )
    -> String
    -> Test
testStandardAttributes helper desc =
    let
        title =
            "This is the title"

        id =
            "custom-id"
    in
        helper
            desc
            [ Html.Attributes.title title
            , Html.Attributes.id
                id
            ]
            (\msg ->
                Query.has
                    [ Selector.id id
                    , Selector.attribute (Html.Attributes.title title)
                    ]
                    msg
            )


testIconWithCustomAttributes : Test
testIconWithCustomAttributes =
    testCustomAttributes testIconHelper "custom attributes for icon"


testCustomAttributes :
    (String
     -> List (Attribute msg)
     -> (Query.Single msg -> Expect.Expectation)
     -> Test
    )
    -> String
    -> Test
testCustomAttributes helper desc =
    let
        attr1Name =
            "data-attr"

        attr1Val =
            "attr one val"

        attr2Name =
            "attr-two"

        attr2Val =
            "attr two val"
    in
        helper
            desc
            [ Html.Attributes.attribute attr1Name attr1Val
            , Html.Attributes.attribute attr2Name attr2Val
            ]
            (\msg ->
                Query.has
                    [ Selector.attribute
                        (Html.Attributes.attribute attr1Name attr1Val)
                    , Selector.attribute
                        (Html.Attributes.attribute attr2Name attr2Val)
                    ]
                    msg
            )


testIconClass : Icon -> Query.Single msg -> Expect.Expectation
testIconClass icon =
    case icon of
        Icon.Icon name ->
            Query.has [ Selector.class ("fa-" ++ name) ]

        Icon.Logo name ->
            Query.has [ Selector.class ("fa-" ++ name) ]


testStyle : Icon -> FA.Style -> Query.Single msg -> Expect.Expectation
testStyle icon style =
    Query.has [ Selector.class (styleClass icon style) ]


testBorder : List FA.Option -> Query.Single msg -> Expect.Expectation
testBorder options =
    let
        expectation =
            if (List.member FA.HasBorder options) then
                Query.has
            else
                Query.hasNot
    in
        expectation [ Selector.class "fa-border" ]


testWidth : List FA.Option -> Query.Single msg -> Expect.Expectation
testWidth options =
    let
        expectation =
            if (List.member FA.HasFixedWidth options) then
                Query.has
            else
                Query.hasNot
    in
        expectation [ Selector.class "fa-fw" ]


testInvertColor : List FA.Option -> Query.Single msg -> Expect.Expectation
testInvertColor options =
    let
        expectation =
            if (List.member FA.InvertColor options) then
                Query.has
            else
                Query.hasNot
    in
        expectation [ Selector.class "fa-inverse" ]


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
                Query.has [ Selector.class ("fa-" ++ toString n ++ "x") ]

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


testHtmlAttribute : Attribute Never -> Query.Single msg -> Expect.Expectation
testHtmlAttribute htmlAttribute =
    Query.has [ Selector.attribute htmlAttribute ]



-- HELPERS


testIconHelper :
    String
    -> List (Attribute msg)
    -> (Query.Single msg -> Expect.Expectation)
    -> Test
testIconHelper desc htmlAttributes expectation =
    Test.fuzz3 iconFuzzer styleFuzzer optionsFuzzer desc <|
        \icon style options ->
            FA.iconWithOptions icon
                style
                options
                htmlAttributes
                |> Query.fromHtml
                |> Expect.all
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
                    , expectation
                    ]


isAnimation : FA.Option -> Bool
isAnimation option =
    case option of
        FA.Animation _ ->
            True

        _ ->
            False


isHtmlTag : FA.Option -> Bool
isHtmlTag option =
    case option of
        FA.HtmlTag _ ->
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


iconClass : Icon -> String
iconClass icon =
    case icon of
        Icon.Icon str ->
            "fa-" ++ str

        Icon.Logo str ->
            "fa-" ++ str
