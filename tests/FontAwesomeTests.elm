module FontAwesomeTests exposing (..)

import FontAwesome
import Fuzz
import Test exposing (Test, describe, fuzz, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


suite : Test
suite =
    describe "FontAwesome module"
        [ describe "icon" testIcon ]


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



-- FUZZERS


iconFuzzer : Fuzz.Fuzzer FontAwesome.Icon
iconFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant FontAwesome.AddressBook
        , Fuzz.constant FontAwesome.Edit
        ]



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
