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
import TestCommon exposing (last, iconOptionsTests, transform, transformAttr)
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
                    , testLayerWidth options
                    , testText options
                    , testBadge options
                    , testIcons icons
                    ]
    ]


testOuterElement : Query.Single msg -> Expect.Expectation
testOuterElement =
    Query.has [ Selector.tag "span", Selector.class "fa-layers" ]


testLayerWidth :
    List (Layers.LayerOption msg)
    -> Query.Single msg
    -> Expect.Expectation
testLayerWidth options =
    if (List.member Layers.LayerHasFixedWidth options) then
        Query.has [ Selector.class "fa-fw" ]
    else
        -- Cannot yet check if width class does not exist
        -- due to a bug in elm-html-test
        \_ -> Expect.pass


testText :
    List (Layers.LayerOption msg)
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
    List (Layers.LayerOption msg)
    -> Query.Single msg
    -> Expect.Expectation
testBadge options =
    let
        opt =
            last isBadge options
    in
        case opt of
            Just (Layers.Badge str pos attributes) ->
                Query.find [ Selector.tag "span", Selector.class "fa-layers-counter" ]
                    |> \_ ->
                        Expect.all
                            [ testTextIsPresent str
                            , testBadgePosition pos
                            , testAttributes attributes
                            ]

            _ ->
                \_ -> Expect.pass


testTextIsPresent : String -> Query.Single msg -> Expect.Expectation
testTextIsPresent str =
    Query.has [ Selector.text str ]


testBadgePosition : Layers.BadgePosition -> Query.Single msg -> Expect.Expectation
testBadgePosition position =
    let
        className =
            case position of
                Layers.BottomLeft ->
                    "fa-layers-bottom-left"

                Layers.BottomRight ->
                    "fa-layers-bottom-right"

                Layers.TopLeft ->
                    "fa-layers-top-left"

                Layers.TopRight ->
                    "fa-layers-top-right"
    in
        Query.has [ Selector.class className ]


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
            let
                indexedIcons =
                    List.indexedMap Tuple.pair icons
            in
                Expect.all (List.map testIconAt indexedIcons)


testIconAt :
    ( Int, Layers.IconLayer msg )
    -> Query.Single msg
    -> Expect.Expectation
testIconAt ( idx, layer ) parent =
    parent
        |> Query.children []
        |> Query.index idx
        |> testIcon layer


testIcon : Layers.IconLayer msg -> Query.Single msg -> Expect.Expectation
testIcon (Layers.IconLayer icon style options attributes) =
    let
        optionsTests =
            iconOptionsTests icon style options

        attributesTest =
            testAttributes attributes
    in
        Expect.all (attributesTest :: optionsTests)


isText : Layers.LayerOption msg -> Bool
isText option =
    case option of
        Layers.TextLayer _ _ _ ->
            True

        _ ->
            False


isBadge : Layers.LayerOption msg -> Bool
isBadge option =
    case option of
        Layers.Badge _ _ _ ->
            True

        _ ->
            False



-- Fuzzers


textLayerFuzzer : Fuzz.Fuzzer (Layers.LayerOption msg)
textLayerFuzzer =
    Fuzz.map3
        Layers.TextLayer
        Fuzz.string
        transformFuzzer
        attributesFuzzer


badgePositionFuzzer : Fuzz.Fuzzer Layers.BadgePosition
badgePositionFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant Layers.BottomLeft
        , Fuzz.constant Layers.BottomRight
        , Fuzz.constant Layers.TopLeft
        , Fuzz.constant Layers.TopRight
        ]


badgeFuzzer : Fuzz.Fuzzer (Layers.LayerOption msg)
badgeFuzzer =
    Fuzz.map3 Layers.Badge Fuzz.string badgePositionFuzzer attributesFuzzer


optionLayerFuzzer : Fuzz.Fuzzer (Layers.LayerOption msg)
optionLayerFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant Layers.LayerHasFixedWidth
        , textLayerFuzzer
        , badgeFuzzer
        ]


optionLayersFuzzer : Fuzz.Fuzzer (List (Layers.LayerOption msg))
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
