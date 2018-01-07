module FontAwesomeTests exposing (..)

import FontAwesome exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


nameFuzzer : Fuzzer Name
nameFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant AddressBook
        , Fuzz.constant Edit
        ]


styleFuzzer : Fuzzer Style
styleFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant Regular
        , Fuzz.constant Solid
        , Fuzz.constant Light
        , Fuzz.constant Brand
        ]


suite : Test
suite =
    describe "The FontAwesome module"
        [ describe "create" testCreate
        , describe "setAnimation" testSetAnimation
        , describe "setHasBorder" testSetHasBorder
        , describe "setHasFixedWidth" testSetHasFixedWidth
        , describe "setMask" testSetMask
        , describe "setPull" testSetPull
        , describe "setSize" testSetSize
        , describe "setStyle" testSetStyle
        , describe "setTransform" testSetTransform
        ]


testCreate : List Test
testCreate =
    List.concat
        [ testCreateSpecific AddressBook Regular "Address Book"
        , testCreateSpecific Edit Regular "Edit"
        ]


testCreateSpecific : Name -> Style -> String -> List Test
testCreateSpecific name style nameStr =
    [ describe (nameStr ++ " icon")
        [ test "has the correct name" <|
            \_ ->
                create name
                    |> .name
                    |> Expect.equal name
        , test "has the correct style" <|
            \_ ->
                create name
                    |> .style
                    |> Expect.equal style
        , test "defaults to normal size" <|
            \_ ->
                create name
                    |> .size
                    |> Expect.equal Normal
        , test "is not fixed width" <|
            \_ ->
                create name
                    |> .hasFixedWidth
                    |> Expect.false "should not have a fixed width"
        , test "does not have a border" <|
            \_ ->
                create name
                    |> .hasBorder
                    |> Expect.false "should not have a border"
        , test "is not pulled" <|
            \_ ->
                create name
                    |> .pull
                    |> Expect.equal NoPull
        , test "is not animated" <|
            \_ ->
                create name
                    |> .animation
                    |> Expect.equal NoAnimation
        , test "has no transform" <|
            \_ ->
                create name
                    |> .transform
                    |> Expect.equal Nothing
        , test "has no mask" <|
            \_ ->
                create name
                    |> .mask
                    |> Expect.equal NoMask
        ]
    ]


testSetAnimation : List Test
testSetAnimation =
    [ fuzz nameFuzzer "set to spin" <|
        \name ->
            create name
                |> setAnimation Spin
                |> .animation
                |> Expect.equal Spin
    , fuzz nameFuzzer "set to pulse" <|
        \name ->
            create name
                |> setAnimation Pulse
                |> .animation
                |> Expect.equal Pulse
    ]


testSetHasBorder : List Test
testSetHasBorder =
    [ fuzz nameFuzzer "set to not have a border" <|
        \name ->
            create name
                |> setHasBorder False
                |> .hasBorder
                |> Expect.false "should not have a border"
    , fuzz nameFuzzer "set to have a border" <|
        \name ->
            create name
                |> setHasBorder True
                |> .hasBorder
                |> Expect.true "should have a border"
    ]


testSetHasFixedWidth : List Test
testSetHasFixedWidth =
    [ fuzz nameFuzzer "set to not have a fixed width" <|
        \name ->
            create name
                |> setHasFixedWidth False
                |> .hasFixedWidth
                |> Expect.false "should not have a fixed width"
    , fuzz nameFuzzer "set to have a fixed width" <|
        \name ->
            create name
                |> setHasFixedWidth True
                |> .hasFixedWidth
                |> Expect.true "should have a fixed width"
    ]


testSetMask : List Test
testSetMask =
    [ fuzz nameFuzzer "remove mask" <|
        \name ->
            create name
                |> setMask NoMask
                |> .mask
                |> Expect.equal NoMask
    , fuzz3 nameFuzzer nameFuzzer styleFuzzer "set mask" <|
        \name maskName maskStyle ->
            create name
                |> setMask (Mask maskName maskStyle)
                |> .mask
                |> Expect.equal (Mask maskName maskStyle)
    ]


testSetPull : List Test
testSetPull =
    [ fuzz nameFuzzer "remove pull" <|
        \name ->
            create name
                |> setPull NoPull
                |> .pull
                |> Expect.equal NoPull
    , fuzz nameFuzzer "set pull to left" <|
        \name ->
            create name
                |> setPull Left
                |> .pull
                |> Expect.equal Left
    , fuzz nameFuzzer "set pull to right" <|
        \name ->
            create name
                |> setPull Right
                |> .pull
                |> Expect.equal Right
    ]


testSetSize : List Test
testSetSize =
    [ testSetSizeSpecific Normal "normal"
    , testSetSizeSpecific ExtraSmall "extra small"
    , testSetSizeSpecific Small "small"
    , testSetSizeSpecific Large "large"
    , testCustomSize
    ]


testSetSizeSpecific : Size -> String -> Test
testSetSizeSpecific size sizeName =
    fuzz nameFuzzer ("set to " ++ sizeName) <|
        \name ->
            create name
                |> setSize size
                |> .size
                |> Expect.equal size


testCustomSize : Test
testCustomSize =
    fuzz2 nameFuzzer int "test custom size" <|
        \name mult ->
            create name
                |> setSize (Mult mult)
                |> .size
                |> Expect.equal (Mult mult)


testSetStyle : List Test
testSetStyle =
    [ testSetStyleSpecific Regular "regular"
    , testSetStyleSpecific Solid "solid"
    , testSetStyleSpecific Light "light"
    , testSetStyleSpecific Brand "brand"
    ]


testSetStyleSpecific : Style -> String -> Test
testSetStyleSpecific style styleName =
    fuzz nameFuzzer ("set to " ++ styleName) <|
        \name ->
            create name
                |> setStyle style
                |> .style
                |> Expect.equal style


testSetTransform : List Test
testSetTransform =
    [ fuzz nameFuzzer "remove transform" <|
        \name ->
            create name
                |> setTransform Nothing
                |> .transform
                |> Expect.equal Nothing
    , fuzz2 nameFuzzer string "set transform" <|
        \name str ->
            create name
                |> setTransform (Just str)
                |> .transform
                |> Expect.equal (Just str)
    ]
