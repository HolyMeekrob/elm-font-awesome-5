module FontAwesomeTests exposing (..)

import FontAwesome as FA
import FontAwesome.Types as Types exposing (Icon, Logo, Style)
import Fuzzers
    exposing
        ( attributesFuzzer
        , iconFuzzer
        , logoFuzzer
        , optionsFuzzer
        , transformOptionFuzzer
        )
import TestCommon
    exposing
        ( last
        , iconOptionsTests
        , logoOptionsTests
        , testStyle
        , transform
        , transformAttr
        )
import Expect
import Html exposing (Attribute, Html)
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
        , describe "solidIcon" testSolidIcon
        , describe "regularIcon" testRegularIcon
        , describe "lightIcon" testLightIcon
        , describe "brandIcon" testBrandIcon
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
                    , testStyle Types.Solid
                    ]
    ]


testSolidIcon : List Test
testSolidIcon =
    [ describe "without html attributes"
        (testIconWithoutHtmlAttributes FA.solidIcon Types.Solid)
    , describe "with html attributes"
        (testIconWithHtmlAttributes FA.solidIcon Types.Solid)
    ]


testRegularIcon : List Test
testRegularIcon =
    [ describe "without html attributes"
        (testIconWithoutHtmlAttributes FA.regularIcon Types.Regular)
    , describe "with html attributes"
        (testIconWithHtmlAttributes FA.regularIcon Types.Regular)
    ]


testLightIcon : List Test
testLightIcon =
    [ describe "without html attributes"
        (testIconWithoutHtmlAttributes FA.lightIcon Types.Light)
    , describe "with html attributes"
        (testIconWithHtmlAttributes FA.lightIcon Types.Light)
    ]


testBrandIcon : List Test
testBrandIcon =
    [ describe "without html attributes"
        (testLogoWithoutHtmlAttributes FA.brandIcon)
    , describe "with html attributes"
        (testLogoWithHtmlAttributes FA.brandIcon)
    ]


testIconWithoutHtmlAttributes :
    (Icon -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> Style
    -> List Test
testIconWithoutHtmlAttributes iconFunc style =
    [ fuzz3
        iconFuzzer
        optionsFuzzer
        attributesFuzzer
        "handles all options"
      <|
        \icon options htmlAttributes ->
            iconFunc icon options htmlAttributes
                |> Query.fromHtml
                |> Expect.all (iconOptionsTests icon style options)
    ]


testLogoWithoutHtmlAttributes :
    (Logo -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> List Test
testLogoWithoutHtmlAttributes logoFunc =
    [ fuzz3
        logoFuzzer
        optionsFuzzer
        attributesFuzzer
        "handles all options"
      <|
        \logo options htmlAttributes ->
            logoFunc logo options htmlAttributes
                |> Query.fromHtml
                |> Expect.all (logoOptionsTests logo options)
    ]


testIconWithHtmlAttributes :
    (Icon -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> Style
    -> List Test
testIconWithHtmlAttributes iconFunc style =
    [ testIconWithCustomClasses iconFunc style
    , testIconWithStandardAttributes iconFunc style
    , testIconWithCustomAttributes iconFunc style
    ]


testLogoWithHtmlAttributes :
    (Logo -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> List Test
testLogoWithHtmlAttributes logoFunc =
    [ testLogoWithCustomClasses logoFunc
    , testLogoWithStandardAttributes logoFunc
    , testLogoWithCustomAttributes logoFunc
    ]


testIconWithCustomClasses :
    (Icon -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> Style
    -> Test
testIconWithCustomClasses iconFunc style =
    testCustomClasses
        (testIconHelper iconFunc style)
        "custom classes for icon"


testLogoWithCustomClasses :
    (Logo -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> Test
testLogoWithCustomClasses logoFunc =
    testCustomClasses
        (testLogoHelper logoFunc)
        "custom classes for icon"


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


testIconWithStandardAttributes :
    (Icon -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> Style
    -> Test
testIconWithStandardAttributes iconFunc style =
    testStandardAttributes
        (testIconHelper iconFunc style)
        "standard attributes for icon"


testLogoWithStandardAttributes :
    (Logo -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> Test
testLogoWithStandardAttributes logoFunc =
    testStandardAttributes
        (testLogoHelper logoFunc)
        "standard attributes for icon"


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


testIconWithCustomAttributes :
    (Icon -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> Style
    -> Test
testIconWithCustomAttributes iconFunc style =
    testCustomAttributes
        (testIconHelper iconFunc style)
        "custom attributes for icon"


testLogoWithCustomAttributes :
    (Logo -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> Test
testLogoWithCustomAttributes logoFunc =
    testCustomAttributes
        (testLogoHelper logoFunc)
        "custom attributes for icon"


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
    (Icon -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> Style
    -> String
    -> List (Attribute msg)
    -> (Query.Single msg -> Expect.Expectation)
    -> Test
testIconHelper iconFunc style desc htmlAttributes expectation =
    fuzz2 iconFuzzer optionsFuzzer desc <|
        \icon options ->
            iconFunc icon
                options
                htmlAttributes
                |> Query.fromHtml
                |> Expect.all
                    ((iconOptionsTests icon style options)
                        ++ [ expectation ]
                    )


testLogoHelper :
    (Logo -> List FA.Option -> List (Attribute msg) -> Html msg)
    -> String
    -> List (Attribute msg)
    -> (Query.Single msg -> Expect.Expectation)
    -> Test
testLogoHelper logoFunc desc htmlAttributes expectation =
    fuzz2 logoFuzzer optionsFuzzer desc <|
        \logo options ->
            logoFunc logo
                options
                htmlAttributes
                |> Query.fromHtml
                |> Expect.all
                    ((logoOptionsTests logo options)
                        ++ [ expectation ]
                    )
