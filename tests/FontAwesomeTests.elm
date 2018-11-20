module FontAwesomeTests exposing (suite, testCustomAttributes, testCustomClasses, testIcon, testIconHelper, testIconWithCustomAttributes, testIconWithCustomClasses, testIconWithHtmlAttributes, testIconWithOptions, testIconWithStandardAttributes, testIconWithoutHtmlAttributes, testStandardAttributes, testUseCSS)

import Expect
import FontAwesome as FA
import FuzzN as FuzzN
import Fuzzers
    exposing
        ( attributesFuzzer
        , iconFuzzer
        , optionsFuzzer
        , styleFuzzer
        , transformOptionFuzzer
        )
import Html exposing (Attribute)
import Html.Attributes
import Test exposing (Test, describe, fuzz, fuzz2, fuzz3, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import TestCommon
    exposing
        ( iconOptionsTests
        , last
        , styleClass
        , testStyle
        , transform
        , transformAttr
        )


suite : Test
suite =
    describe "FontAwesome module"
        [ describe "useCss" testUseCSS
        , describe "icon" testIcon
        , describe "iconWithOptions" testIconWithOptions
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
    [ FuzzN.fuzz4
        iconFuzzer
        styleFuzzer
        optionsFuzzer
        attributesFuzzer
        "handles all options"
      <|
        \icon style options htmlAttributes ->
            FA.iconWithOptions icon style options htmlAttributes
                |> Query.fromHtml
                |> Expect.all (iconOptionsTests icon style options)
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
                    (iconOptionsTests icon style options
                        ++ [ expectation ]
                    )
