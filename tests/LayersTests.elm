module LayersTests exposing (..)

import FontAwesome as FA
import FontAwesome.Layers as Layers
import Fuzzers
    exposing
        ( attributesFuzzer
        , iconFuzzer
        , optionsFuzzer
        , styleFuzzer
        , transformFuzzer
        )
import TestUtils exposing (last, transform, transformAttr)
import Expect
import Fuzz
import Html
import Test exposing (Test, describe)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


suite : Test
suite =
    describe "Layers module"
        [ describe "layers" testLayers ]


testLayers : List Test
testLayers =
    [ Test.fuzz2
        iconLayersFuzzer
        optionLayersFuzzer
        "handles all inputs"
      <|
        \icons options ->
            Layers.layers icons options
                |> Query.fromHtml
                |> Expect.all
                    [ testOuterElement
                    , testWidth options
                    , testText options
                    , testBadge options
                    , testIcons icons
                    ]
    ]


testOuterElement : Query.Single msg -> Expect.Expectation
testOuterElement =
    Query.has [ Selector.tag "span", Selector.class "fa-layers" ]


testWidth :
    List (Layers.OptionLayer msg)
    -> Query.Single msg
    -> Expect.Expectation
testWidth options =
    if (List.member Layers.LayerHasFixedWidth options) then
        Query.has [ Selector.class "fa-fw" ]
    else
        -- Cannot yet check if width class does not exist
        -- due to a bug in elm-html-test
        \_ -> Expect.pass


testText :
    List (Layers.OptionLayer msg)
    -> Query.Single msg
    -> Expect.Expectation
testText options =
    let
        opt =
            last isText options
    in
        case opt of
            Just (Layers.TextLayer str transforms attributes) ->
                Query.find [ Selector.tag "span", Selector.class "fa-layers-text" ]
                    |> \_ ->
                        Expect.all
                            [ testTextIsPresent str
                            , testTransforms transforms
                            , testAttributes attributes
                            ]

            _ ->
                \_ -> Expect.pass


testBadge :
    List (Layers.OptionLayer msg)
    -> Query.Single msg
    -> Expect.Expectation
testBadge options =
    let
        opt =
            last isBadge options
    in
        case opt of
            Just (Layers.Badge str attributes) ->
                Query.find [ Selector.tag "span", Selector.class "fa-layers-counter" ]
                    |> \_ ->
                        Expect.all
                            [ testTextIsPresent str
                            , testAttributes attributes
                            ]

            _ ->
                \_ -> Expect.pass


testTextIsPresent : String -> Query.Single msg -> Expect.Expectation
testTextIsPresent str =
    Query.has [ Selector.text str ]


testTransforms : List FA.Transform -> Query.Single msg -> Expect.Expectation
testTransforms transforms =
    Query.has
        [ Selector.attribute (transformAttr <| transform transforms) ]


testAttributes : List (Html.Attribute msg) -> Query.Single msg -> Expect.Expectation
testAttributes attributes =
    -- TODO: Figure out how to test random attributes or don't randomize attributes
    \_ -> Expect.pass


testIcons : List (Layers.IconLayer msg) -> Query.Single msg -> Expect.Expectation
testIcons icons =
    case icons of
        [] ->
            \_ -> Expect.pass

        _ ->
            Expect.all (List.map testIcon icons)


testIcon : Layers.IconLayer msg -> Query.Single msg -> Expect.Expectation
testIcon (Layers.IconLayer icon style options attributes) =
    -- TODO: How to test this?
    \_ -> Expect.pass


isText : Layers.OptionLayer msg -> Bool
isText option =
    case option of
        Layers.TextLayer _ _ _ ->
            True

        _ ->
            False


isBadge : Layers.OptionLayer msg -> Bool
isBadge option =
    case option of
        Layers.Badge _ _ ->
            True

        _ ->
            False



-- Fuzzers


textLayerFuzzer : Fuzz.Fuzzer (Layers.OptionLayer msg)
textLayerFuzzer =
    Fuzz.map3
        Layers.TextLayer
        Fuzz.string
        transformFuzzer
        attributesFuzzer


badgeFuzzer : Fuzz.Fuzzer (Layers.OptionLayer msg)
badgeFuzzer =
    Fuzz.map2 Layers.Badge Fuzz.string attributesFuzzer


optionLayerFuzzer : Fuzz.Fuzzer (Layers.OptionLayer msg)
optionLayerFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant Layers.LayerHasFixedWidth
        , textLayerFuzzer
        , badgeFuzzer
        ]


optionLayersFuzzer : Fuzz.Fuzzer (List (Layers.OptionLayer msg))
optionLayersFuzzer =
    Fuzz.list optionLayerFuzzer


iconLayerFuzzer : Fuzz.Fuzzer (Layers.IconLayer msg)
iconLayerFuzzer =
    Fuzz.map4
        Layers.IconLayer
        iconFuzzer
        styleFuzzer
        optionsFuzzer
        attributesFuzzer


iconLayersFuzzer : Fuzz.Fuzzer (List (Layers.IconLayer msg))
iconLayersFuzzer =
    Fuzz.list iconLayerFuzzer
