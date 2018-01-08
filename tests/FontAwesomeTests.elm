module FontAwesomeTests exposing (..)

import FontAwesome
import Expect
import Fuzz
import Test exposing (Test, describe, fuzz, fuzz3, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


suite : Test
suite =
    describe "FontAwesome module"
        [ describe "icon" testIcon
        , describe "elem" testElem
        ]


testIcon : List Test
testIcon =
    [ fuzz iconFuzzer "is a span" <|
        \icon ->
            FontAwesome.icon icon
                |> Query.fromHtml
                |> Query.has [ Selector.tag "span" ]
    , fuzz iconFuzzer "has name and style class only" <|
        \icon ->
            FontAwesome.icon icon
                |> Query.fromHtml
                |> Query.has
                    [ Selector.exactClassName
                        (defaultClass icon ++ " fa-" ++ name icon)
                    ]
    ]


testElem : List Test
testElem =
    [ fuzz3 iconFuzzer styleFuzzer attributesFuzzer "handles all attributes" <|
        \icon style attributes ->
            FontAwesome.elem icon style attributes []
                |> Query.fromHtml
                |> Expect.all
                    [ testIconClass icon
                    , testStyle style
                    , testBorder attributes
                    ]
    ]


testIconClass : FontAwesome.Icon -> Query.Single msg -> Expect.Expectation
testIconClass icon =
    Query.has [ Selector.class ("fa-" ++ name icon) ]


testStyle : FontAwesome.Style -> Query.Single msg -> Expect.Expectation
testStyle style =
    Query.has [ Selector.class (styleClass style) ]


testBorder : List FontAwesome.Attribute -> Query.Single msg -> Expect.Expectation
testBorder attributes =
    let
        expectation =
            if (List.member FontAwesome.HasBorder attributes) then
                Query.has
            else
                Query.hasNot
    in
        expectation [ Selector.class "fa-border" ]



-- FUZZERS


iconFuzzer : Fuzz.Fuzzer FontAwesome.Icon
iconFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant FontAwesome.AddressBook
        , Fuzz.constant FontAwesome.Edit
        ]


styleFuzzer : Fuzz.Fuzzer FontAwesome.Style
styleFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant FontAwesome.Regular
        , Fuzz.constant FontAwesome.Solid
        , Fuzz.constant FontAwesome.Light
        , Fuzz.constant FontAwesome.Brand
        ]


borderFuzzer : Fuzz.Fuzzer (Maybe FontAwesome.Attribute)
borderFuzzer =
    Fuzz.maybe (Fuzz.constant FontAwesome.HasBorder)


widthFuzzer : Fuzz.Fuzzer (Maybe FontAwesome.Attribute)
widthFuzzer =
    Fuzz.maybe (Fuzz.constant FontAwesome.HasFixedWidth)


animationFuzzer : Fuzz.Fuzzer (Maybe FontAwesome.Attribute)
animationFuzzer =
    let
        fuzzer =
            Fuzz.oneOf
                [ Fuzz.constant FontAwesome.Spin
                , Fuzz.constant FontAwesome.Pulse
                ]
    in
        Fuzz.map FontAwesome.Animation fuzzer
            |> Fuzz.maybe


pullFuzzer : Fuzz.Fuzzer (Maybe FontAwesome.Attribute)
pullFuzzer =
    let
        fuzzer =
            Fuzz.oneOf
                [ Fuzz.constant FontAwesome.Left
                , Fuzz.constant FontAwesome.Right
                ]
    in
        Fuzz.map FontAwesome.Pull fuzzer
            |> Fuzz.maybe


sizeFuzzer : Fuzz.Fuzzer (Maybe FontAwesome.Attribute)
sizeFuzzer =
    let
        multFuzzer =
            Fuzz.map FontAwesome.Mult (Fuzz.intRange 2 10)

        fuzzer =
            Fuzz.oneOf
                [ Fuzz.constant FontAwesome.Normal
                , Fuzz.constant FontAwesome.ExtraSmall
                , Fuzz.constant FontAwesome.Small
                , Fuzz.constant FontAwesome.Large
                , multFuzzer
                ]
    in
        Fuzz.map FontAwesome.Size fuzzer
            |> Fuzz.maybe


transformFuzzer : Fuzz.Fuzzer (Maybe FontAwesome.Attribute)
transformFuzzer =
    Fuzz.map FontAwesome.Transform Fuzz.string
        |> Fuzz.maybe


maskFuzzer : Fuzz.Fuzzer (Maybe FontAwesome.Attribute)
maskFuzzer =
    Fuzz.map2 FontAwesome.Mask iconFuzzer styleFuzzer
        |> Fuzz.maybe


attributesFuzzer : Fuzz.Fuzzer (List FontAwesome.Attribute)
attributesFuzzer =
    let
        attributeFuzzer =
            Fuzz.oneOf
                [ animationFuzzer
                , borderFuzzer
                , widthFuzzer
                , maskFuzzer
                , pullFuzzer
                , sizeFuzzer
                , transformFuzzer
                ]

        removeMaybes =
            List.filterMap identity
    in
        Fuzz.list attributeFuzzer
            |> Fuzz.map (removeMaybes)



-- HELPERS


defaultClass : FontAwesome.Icon -> String
defaultClass =
    defaultStyle >> styleClass


styleClass : FontAwesome.Style -> String
styleClass style =
    case style of
        FontAwesome.Solid ->
            "fas"

        FontAwesome.Regular ->
            "far"

        FontAwesome.Light ->
            "fal"

        FontAwesome.Brand ->
            "fab"


name : FontAwesome.Icon -> String
name icon =
    case icon of
        FontAwesome.AddressBook ->
            "address-book"

        FontAwesome.Edit ->
            "edit"


defaultStyle : FontAwesome.Icon -> FontAwesome.Style
defaultStyle icon =
    case icon of
        _ ->
            FontAwesome.Regular
