module FontAwesomeTests exposing (..)

import FontAwesome as FA
import Expect
import Fuzz
import Html
import Html.Attributes
import Test exposing (Test, describe, fuzz, fuzz3, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


suite : Test
suite =
    describe "FontAwesome module"
        [ describe "icon" testIcon
        , describe "fa" testFa
        ]


testIcon : List Test
testIcon =
    [ fuzz iconFuzzer "is a span" <|
        \icon ->
            FA.icon icon
                |> Query.fromHtml
                |> Query.has [ Selector.tag "span" ]
    , fuzz iconFuzzer "has name and style class only" <|
        \icon ->
            FA.icon icon
                |> Query.fromHtml
                |> Query.has
                    [ Selector.exactClassName
                        (defaultClass icon ++ " " ++ iconClass icon)
                    ]
    ]


testFa : List Test
testFa =
    [ describe "without html attributes" testFaWithoutHtmlAttributes
    , describe "with html attributes" testFaWithHtmlAttributes
    ]


testFaWithoutHtmlAttributes : List Test
testFaWithoutHtmlAttributes =
    [ Test.fuzzWith
        { runs = 1000 }
        (Fuzz.tuple4
            ( iconFuzzer
            , styleFuzzer
            , attributesFuzzer
            , htmlAttributesFuzzer
            )
        )
        "handles all attributes"
      <|
        \( icon, style, attributes, htmlAttributes ) ->
            FA.fa icon style attributes htmlAttributes
                |> Query.fromHtml
                |> Expect.all
                    [ testIconClass icon
                    , testStyle style
                    , testBorder attributes
                    , testWidth attributes
                    , testAnimation attributes
                    , testPull attributes
                    , testSize attributes
                    , testTransform attributes
                    , testMask attributes
                    ]
    ]


testFaWithHtmlAttributes : List Test
testFaWithHtmlAttributes =
    [ testFaWithCustomClasses
    , testFaWithStandardAttributes
    , testFaWithCustomAttributes
    ]


testFaWithCustomClasses : Test
testFaWithCustomClasses =
    let
        classOne =
            "custom-class-one"

        classTwo =
            "custom-class-two"
    in
        testFaHelper
            "handles custom classes"
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


testFaWithStandardAttributes : Test
testFaWithStandardAttributes =
    let
        title =
            "This is the title"

        id =
            "custom-id"
    in
        testFaHelper
            "handles standard attributes"
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


testFaWithCustomAttributes : Test
testFaWithCustomAttributes =
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
        testFaHelper
            "handles custom attributes"
            [ Html.Attributes.attribute attr1Name attr1Val
            , Html.Attributes.attribute attr2Name attr2Val
            ]
            (\msg ->
                Query.has
                    [ Selector.attribute (Html.Attributes.attribute attr1Name attr1Val)
                    , Selector.attribute (Html.Attributes.attribute attr2Name attr2Val)
                    ]
                    msg
            )


testIconClass : FA.Icon -> Query.Single msg -> Expect.Expectation
testIconClass icon =
    Query.has [ Selector.class ("fa-" ++ name icon) ]


testStyle : FA.Style -> Query.Single msg -> Expect.Expectation
testStyle style =
    Query.has [ Selector.class (styleClass style) ]


testBorder : List FA.Attribute -> Query.Single msg -> Expect.Expectation
testBorder attributes =
    let
        expectation =
            if (List.member FA.HasBorder attributes) then
                Query.has
            else
                Query.hasNot
    in
        expectation [ Selector.class "fa-border" ]


testWidth : List FA.Attribute -> Query.Single msg -> Expect.Expectation
testWidth attributes =
    let
        expectation =
            if (List.member FA.HasFixedWidth attributes) then
                Query.has
            else
                Query.hasNot
    in
        expectation [ Selector.class "fa-fw" ]


testAnimation : List FA.Attribute -> Query.Single msg -> Expect.Expectation
testAnimation attributes =
    let
        attr =
            last isAnimation attributes
    in
        case attr of
            Just (FA.Animation FA.Spin) ->
                Query.has [ Selector.class "fa-spin" ]

            Just (FA.Animation FA.Pulse) ->
                Query.has [ Selector.class "fa-pulse" ]

            _ ->
                Query.hasNot
                    [ Selector.class "fa-spin"
                    , Selector.class "fa-pulse"
                    ]


testPull : List FA.Attribute -> Query.Single msg -> Expect.Expectation
testPull attributes =
    let
        attr =
            last isPull attributes
    in
        case attr of
            Just (FA.Pull FA.Left) ->
                Query.has [ Selector.class "fa-pull-left" ]

            Just (FA.Pull FA.Right) ->
                Query.has [ Selector.class "fa-pull-right" ]

            _ ->
                Query.hasNot
                    [ Selector.class "fa-pull-left"
                    , Selector.class "fa-right"
                    ]


testSize : List FA.Attribute -> Query.Single msg -> Expect.Expectation
testSize attributes =
    let
        attr =
            last isSize attributes
    in
        case attr of
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


testTransform : List FA.Attribute -> Query.Single msg -> Expect.Expectation
testTransform attributes =
    let
        attr =
            last isTransform attributes

        htmlAttribute =
            Html.Attributes.attribute "data-fa-transform"
    in
        case attr of
            Just (FA.Transform str) ->
                Query.has [ Selector.attribute (htmlAttribute str) ]

            -- TODO: How to ensure that an element does not have an attribute?
            _ ->
                Query.hasNot [ Selector.attribute (htmlAttribute "") ]


testMask : List FA.Attribute -> Query.Single msg -> Expect.Expectation
testMask attributes =
    let
        attr =
            last isMask attributes

        htmlAttribute =
            Html.Attributes.attribute "data-fa-mask"
    in
        case attr of
            Just (FA.Mask icon style) ->
                Query.has
                    [ Selector.attribute <|
                        htmlAttribute
                            (styleClass style ++ " " ++ iconClass icon)
                    ]

            -- TODO: How to ensure that an element does not have an attribute?
            _ ->
                Query.hasNot [ Selector.attribute (htmlAttribute "") ]


testHtmlAttribute : Html.Attribute Never -> Query.Single msg -> Expect.Expectation
testHtmlAttribute htmlAttribute =
    Query.has [ Selector.attribute htmlAttribute ]



-- FUZZERS


iconFuzzer : Fuzz.Fuzzer FA.Icon
iconFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant FA.AccessibleIcon
        , Fuzz.constant FA.Accusoft
        , Fuzz.constant FA.AddressBook
        , Fuzz.constant FA.AddressCard
        , Fuzz.constant FA.Adjust
        , Fuzz.constant FA.Adn
        , Fuzz.constant FA.Adversal
        , Fuzz.constant FA.AffiliateTheme
        , Fuzz.constant FA.Algolia
        , Fuzz.constant FA.AlignCenter
        , Fuzz.constant FA.AlignJustify
        , Fuzz.constant FA.AlignLeft
        , Fuzz.constant FA.AlignRight
        , Fuzz.constant FA.Amazon
        , Fuzz.constant FA.AmazonPay
        , Fuzz.constant FA.Ambulance
        , Fuzz.constant FA.AmericanSignLanguageInterpreting
        , Fuzz.constant FA.Amilia
        , Fuzz.constant FA.Anchor
        , Fuzz.constant FA.Android
        , Fuzz.constant FA.AngelList
        , Fuzz.constant FA.AngleDoubleDown
        , Fuzz.constant FA.AngleDoubleLeft
        , Fuzz.constant FA.AngleDoubleRight
        , Fuzz.constant FA.AngleDoubleUp
        , Fuzz.constant FA.AngleDown
        , Fuzz.constant FA.AngleLeft
        , Fuzz.constant FA.AngleRight
        , Fuzz.constant FA.AngleUp
        , Fuzz.constant FA.AngryCreative
        , Fuzz.constant FA.Angular
        , Fuzz.constant FA.AppStore
        , Fuzz.constant FA.AppStoreIos
        , Fuzz.constant FA.Apper
        , Fuzz.constant FA.Apple
        , Fuzz.constant FA.ApplePay
        , Fuzz.constant FA.Archive
        , Fuzz.constant FA.ArrowAltCircleDown
        , Fuzz.constant FA.ArrowAltCircleLeft
        , Fuzz.constant FA.ArrowAltCircleRight
        , Fuzz.constant FA.ArrowAltCircleUp
        , Fuzz.constant FA.ArrowCircleDown
        , Fuzz.constant FA.ArrowCircleLeft
        , Fuzz.constant FA.ArrowCircleRight
        , Fuzz.constant FA.ArrowCircleUp
        , Fuzz.constant FA.ArrowDown
        , Fuzz.constant FA.ArrowLeft
        , Fuzz.constant FA.ArrowRight
        , Fuzz.constant FA.ArrowUp
        , Fuzz.constant FA.ArrowsAlt
        , Fuzz.constant FA.ArrowsAltHorizontal
        , Fuzz.constant FA.ArrowsAltVertical
        , Fuzz.constant FA.AssistiveListeningSystems
        , Fuzz.constant FA.Asterisk
        , Fuzz.constant FA.Asymmetrik
        , Fuzz.constant FA.At
        , Fuzz.constant FA.Audible
        , Fuzz.constant FA.AudioDescription
        , Fuzz.constant FA.AutoPrefixer
        , Fuzz.constant FA.Avianex
        , Fuzz.constant FA.Aviato
        , Fuzz.constant FA.AWS
        , Fuzz.constant FA.Backward
        , Fuzz.constant FA.BalanceScale
        , Fuzz.constant FA.Ban
        , Fuzz.constant FA.Bandcamp
        , Fuzz.constant FA.Barcode
        , Fuzz.constant FA.Bars
        , Fuzz.constant FA.Bath
        , Fuzz.constant FA.BatteryEmpty
        , Fuzz.constant FA.BatteryFull
        , Fuzz.constant FA.BatteryHalf
        , Fuzz.constant FA.BatteryQuarter
        , Fuzz.constant FA.BatteryThreeQuarters
        , Fuzz.constant FA.Bed
        , Fuzz.constant FA.Beer
        , Fuzz.constant FA.Behance
        , Fuzz.constant FA.BehanceSquare
        , Fuzz.constant FA.Bell
        , Fuzz.constant FA.BellSlash
        , Fuzz.constant FA.Bicycle
        , Fuzz.constant FA.BIMobject
        , Fuzz.constant FA.Binoculars
        , Fuzz.constant FA.BirthdayCake
        , Fuzz.constant FA.Bitbucket
        , Fuzz.constant FA.Bitcoin
        , Fuzz.constant FA.Bity
        , Fuzz.constant FA.BlackTie
        , Fuzz.constant FA.Blackberry
        , Fuzz.constant FA.Blind
        , Fuzz.constant FA.Blogger
        , Fuzz.constant FA.BloggerB
        , Fuzz.constant FA.Bluetooth
        , Fuzz.constant FA.BluetoothB
        , Fuzz.constant FA.Bold
        , Fuzz.constant FA.Bolt
        , Fuzz.constant FA.Bomb
        , Fuzz.constant FA.Book
        , Fuzz.constant FA.Bookmark
        , Fuzz.constant FA.Braille
        , Fuzz.constant FA.Briefcase
        , Fuzz.constant FA.Btc
        , Fuzz.constant FA.Bug
        , Fuzz.constant FA.Building
        , Fuzz.constant FA.Bullhorn
        , Fuzz.constant FA.Bullseye
        , Fuzz.constant FA.BuromobelExperte
        , Fuzz.constant FA.Bus
        , Fuzz.constant FA.BuySellAds
        , Fuzz.constant FA.Calculator
        , Fuzz.constant FA.Calendar
        , Fuzz.constant FA.CalendarAlt
        , Fuzz.constant FA.CalendarCheck
        , Fuzz.constant FA.CalendarMinus
        , Fuzz.constant FA.CalendarPlus
        , Fuzz.constant FA.CalendarTimes
        , Fuzz.constant FA.Camera
        , Fuzz.constant FA.CameraRetro
        , Fuzz.constant FA.Car
        , Fuzz.constant FA.CaretDown
        , Fuzz.constant FA.CaretLeft
        , Fuzz.constant FA.CaretRight
        , Fuzz.constant FA.CaretUp
        , Fuzz.constant FA.CaretSquareDown
        , Fuzz.constant FA.CaretSquareLeft
        , Fuzz.constant FA.CaretSquareRight
        , Fuzz.constant FA.CaretSquareUp
        , Fuzz.constant FA.CartArrowDown
        , Fuzz.constant FA.CartPlus
        , Fuzz.constant FA.CCAmazonPay
        , Fuzz.constant FA.CCAmex
        , Fuzz.constant FA.CCApplePay
        , Fuzz.constant FA.CCDinersClub
        , Fuzz.constant FA.CCDiscover
        , Fuzz.constant FA.CCJCB
        , Fuzz.constant FA.CCMastercard
        , Fuzz.constant FA.CCPayPal
        , Fuzz.constant FA.CCStripe
        , Fuzz.constant FA.CCVisa
        , Fuzz.constant FA.Centercode
        , Fuzz.constant FA.Certificate
        , Fuzz.constant FA.ChartArea
        , Fuzz.constant FA.ChartBar
        , Fuzz.constant FA.ChartLine
        , Fuzz.constant FA.ChartPie
        , Fuzz.constant FA.Check
        , Fuzz.constant FA.CheckCircle
        , Fuzz.constant FA.CheckSquare
        , Fuzz.constant FA.ChevronCircleDown
        , Fuzz.constant FA.ChevronCircleLeft
        , Fuzz.constant FA.ChevronCircleRight
        , Fuzz.constant FA.ChevronCircleUp
        , Fuzz.constant FA.ChevronDown
        , Fuzz.constant FA.ChevronLeft
        , Fuzz.constant FA.ChevronRight
        , Fuzz.constant FA.ChevronUp
        , Fuzz.constant FA.Child
        , Fuzz.constant FA.Chrome
        , Fuzz.constant FA.Circle
        , Fuzz.constant FA.CircleNotched
        , Fuzz.constant FA.Clipboard
        , Fuzz.constant FA.Clock
        , Fuzz.constant FA.Clone
        , Fuzz.constant FA.ClosedCaptioning
        , Fuzz.constant FA.Cloud
        , Fuzz.constant FA.CloudDownloadAlt
        , Fuzz.constant FA.CloudUploadAlt
        , Fuzz.constant FA.CloudScale
        , Fuzz.constant FA.Cloudsmith
        , Fuzz.constant FA.Cloudversify
        , Fuzz.constant FA.Code
        , Fuzz.constant FA.CodeBranch
        , Fuzz.constant FA.CodePen
        , Fuzz.constant FA.CodiePie
        , Fuzz.constant FA.Coffee
        , Fuzz.constant FA.Cog
        , Fuzz.constant FA.Cogs
        , Fuzz.constant FA.Columns
        , Fuzz.constant FA.Comment
        , Fuzz.constant FA.CommentAlt
        , Fuzz.constant FA.Comments
        , Fuzz.constant FA.Compass
        , Fuzz.constant FA.Compress
        , Fuzz.constant FA.ConnectDevelop
        , Fuzz.constant FA.Contao
        , Fuzz.constant FA.Copy
        , Fuzz.constant FA.Copyright
        , Fuzz.constant FA.CPanel
        , Fuzz.constant FA.CreativeCommons
        , Fuzz.constant FA.CreditCard
        , Fuzz.constant FA.Crop
        , Fuzz.constant FA.Crosshairs
        , Fuzz.constant FA.CSS3
        , Fuzz.constant FA.CSS3Alt
        , Fuzz.constant FA.Cube
        , Fuzz.constant FA.Cubes
        , Fuzz.constant FA.Cut
        , Fuzz.constant FA.Cuttlefish
        , Fuzz.constant FA.Edit
        , Fuzz.constant FA.FiveHundredPx
        ]


styleFuzzer : Fuzz.Fuzzer FA.Style
styleFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant FA.Regular
        , Fuzz.constant FA.Solid
        , Fuzz.constant FA.Light
        , Fuzz.constant FA.Brand
        ]


borderFuzzer : Fuzz.Fuzzer (Maybe FA.Attribute)
borderFuzzer =
    Fuzz.maybe (Fuzz.constant FA.HasBorder)


widthFuzzer : Fuzz.Fuzzer (Maybe FA.Attribute)
widthFuzzer =
    Fuzz.maybe (Fuzz.constant FA.HasFixedWidth)


animationFuzzer : Fuzz.Fuzzer (Maybe FA.Attribute)
animationFuzzer =
    let
        fuzzer =
            Fuzz.oneOf
                [ Fuzz.constant FA.Spin
                , Fuzz.constant FA.Pulse
                ]
    in
        Fuzz.map FA.Animation fuzzer
            |> Fuzz.maybe


pullFuzzer : Fuzz.Fuzzer (Maybe FA.Attribute)
pullFuzzer =
    let
        fuzzer =
            Fuzz.oneOf
                [ Fuzz.constant FA.Left
                , Fuzz.constant FA.Right
                ]
    in
        Fuzz.map FA.Pull fuzzer
            |> Fuzz.maybe


sizeFuzzer : Fuzz.Fuzzer (Maybe FA.Attribute)
sizeFuzzer =
    let
        multFuzzer =
            Fuzz.map FA.Mult (Fuzz.intRange 2 10)

        fuzzer =
            Fuzz.oneOf
                [ Fuzz.constant FA.Normal
                , Fuzz.constant FA.ExtraSmall
                , Fuzz.constant FA.Small
                , Fuzz.constant FA.Large
                , multFuzzer
                ]
    in
        Fuzz.map FA.Size fuzzer
            |> Fuzz.maybe


transformFuzzer : Fuzz.Fuzzer (Maybe FA.Attribute)
transformFuzzer =
    Fuzz.map FA.Transform Fuzz.string
        |> Fuzz.maybe


maskFuzzer : Fuzz.Fuzzer (Maybe FA.Attribute)
maskFuzzer =
    Fuzz.map2 FA.Mask iconFuzzer styleFuzzer
        |> Fuzz.maybe


attributesFuzzer : Fuzz.Fuzzer (List FA.Attribute)
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


htmlAttributesFuzzer : Fuzz.Fuzzer (List (Html.Attribute msg))
htmlAttributesFuzzer =
    let
        htmlAttributeFuzzer =
            Fuzz.oneOf
                [ Fuzz.map Html.Attributes.class Fuzz.string
                , Fuzz.map Html.Attributes.title Fuzz.string
                , Fuzz.map2 Html.Attributes.attribute Fuzz.string Fuzz.string
                ]
    in
        Fuzz.list htmlAttributeFuzzer



-- HELPERS


testFaHelper :
    String
    -> List (Html.Attribute msg)
    -> (Query.Single msg -> Expect.Expectation)
    -> Test
testFaHelper desc htmlAttributes expectation =
    Test.fuzz3
        iconFuzzer
        styleFuzzer
        attributesFuzzer
        desc
    <|
        \icon style attributes ->
            FA.fa icon
                style
                attributes
                htmlAttributes
                |> Query.fromHtml
                |> Expect.all
                    [ testIconClass icon
                    , testStyle style
                    , testBorder attributes
                    , testWidth attributes
                    , testAnimation attributes
                    , testPull attributes
                    , testSize attributes
                    , testTransform attributes
                    , testMask attributes
                    , expectation
                    ]


last : (a -> Bool) -> List a -> Maybe a
last f =
    List.filter f >> List.reverse >> List.head


isAnimation : FA.Attribute -> Bool
isAnimation attribute =
    case attribute of
        FA.Animation _ ->
            True

        _ ->
            False


isPull : FA.Attribute -> Bool
isPull attribute =
    case attribute of
        FA.Pull _ ->
            True

        _ ->
            False


isSize : FA.Attribute -> Bool
isSize attribute =
    case attribute of
        FA.Size _ ->
            True

        _ ->
            False


isTransform : FA.Attribute -> Bool
isTransform attribute =
    case attribute of
        FA.Transform _ ->
            True

        _ ->
            False


isMask : FA.Attribute -> Bool
isMask attribute =
    case attribute of
        FA.Mask _ _ ->
            True

        _ ->
            False


iconClass : FA.Icon -> String
iconClass icon =
    "fa-" ++ name icon


defaultClass : FA.Icon -> String
defaultClass =
    defaultStyle >> styleClass


styleClass : FA.Style -> String
styleClass style =
    case style of
        FA.Solid ->
            "fas"

        FA.Regular ->
            "far"

        FA.Light ->
            "fal"

        FA.Brand ->
            "fab"


name : FA.Icon -> String
name icon =
    case icon of
        FA.AccessibleIcon ->
            "accessible-icon"

        FA.Accusoft ->
            "accusoft"

        FA.AddressBook ->
            "address-book"

        FA.AddressCard ->
            "address-card"

        FA.Adjust ->
            "adjust"

        FA.Adn ->
            "adn"

        FA.Adversal ->
            "adversal"

        FA.AffiliateTheme ->
            "affiliatetheme"

        FA.Algolia ->
            "algolia"

        FA.AlignCenter ->
            "align-center"

        FA.AlignJustify ->
            "align-justify"

        FA.AlignLeft ->
            "align-left"

        FA.AlignRight ->
            "align-right"

        FA.Amazon ->
            "amazon"

        FA.AmazonPay ->
            "amazon-pay"

        FA.Ambulance ->
            "ambulance"

        FA.AmericanSignLanguageInterpreting ->
            "american-sign-language-interpreting"

        FA.Amilia ->
            "amilia"

        FA.Anchor ->
            "anchor"

        FA.Android ->
            "android"

        FA.AngelList ->
            "angellist"

        FA.AngleDoubleDown ->
            "angle-double-down"

        FA.AngleDoubleLeft ->
            "angle-double-left"

        FA.AngleDoubleRight ->
            "angle-double-right"

        FA.AngleDoubleUp ->
            "angle-double-up"

        FA.AngleDown ->
            "angle-down"

        FA.AngleLeft ->
            "angle-left"

        FA.AngleRight ->
            "angle-right"

        FA.AngleUp ->
            "angle-up"

        FA.AngryCreative ->
            "angry-creative"

        FA.Angular ->
            "angular"

        FA.AppStore ->
            "app-store"

        FA.AppStoreIos ->
            "app-store-ios"

        FA.Apper ->
            "apper"

        FA.Apple ->
            "apple"

        FA.ApplePay ->
            "apple-pay"

        FA.Archive ->
            "archive"

        FA.ArrowAltCircleDown ->
            "arrow-alt-circle-down"

        FA.ArrowAltCircleLeft ->
            "arrow-alt-circle-left"

        FA.ArrowAltCircleRight ->
            "arrow-alt-circle-right"

        FA.ArrowAltCircleUp ->
            "arrow-alt-circle-up"

        FA.ArrowCircleDown ->
            "arrow-circle-down"

        FA.ArrowCircleLeft ->
            "arrow-circle-left"

        FA.ArrowCircleRight ->
            "arrow-circle-right"

        FA.ArrowCircleUp ->
            "arrow-circle-up"

        FA.ArrowDown ->
            "arrow-up"

        FA.ArrowLeft ->
            "arrow-left"

        FA.ArrowRight ->
            "arrow-right"

        FA.ArrowUp ->
            "arrow-up"

        FA.ArrowsAlt ->
            "arrows-alt"

        FA.ArrowsAltHorizontal ->
            "arrows-alt-h"

        FA.ArrowsAltVertical ->
            "arrows-alt-v"

        FA.AssistiveListeningSystems ->
            "assistive-listening-systems"

        FA.Asterisk ->
            "asterisk"

        FA.Asymmetrik ->
            "asymmetrik"

        FA.At ->
            "at"

        FA.Audible ->
            "audible"

        FA.AudioDescription ->
            "audio-description"

        FA.AutoPrefixer ->
            "autoprefixer"

        FA.Avianex ->
            "avianex"

        FA.Aviato ->
            "aviato"

        FA.AWS ->
            "aws"

        FA.Backward ->
            "backward"

        FA.BalanceScale ->
            "balance-scale"

        FA.Ban ->
            "ban"

        FA.Bandcamp ->
            "bandcamp"

        FA.Barcode ->
            "barcode"

        FA.Bars ->
            "bars"

        FA.Bath ->
            "bath"

        FA.BatteryEmpty ->
            "battery-empty"

        FA.BatteryFull ->
            "battery-full"

        FA.BatteryHalf ->
            "battery-half"

        FA.BatteryQuarter ->
            "battery-quarter"

        FA.BatteryThreeQuarters ->
            "battery-three-quarters"

        FA.Bed ->
            "bed"

        FA.Beer ->
            "beer"

        FA.Behance ->
            "behance"

        FA.BehanceSquare ->
            "behance-square"

        FA.Bell ->
            "bell"

        FA.BellSlash ->
            "bell-slash"

        FA.Bicycle ->
            "bicycle"

        FA.BIMobject ->
            "bimobject"

        FA.Binoculars ->
            "binoculars"

        FA.BirthdayCake ->
            "birthday-cake"

        FA.Bitbucket ->
            "bitbucket"

        FA.Bitcoin ->
            "bitcoin"

        FA.Bity ->
            "bity"

        FA.BlackTie ->
            "black-tie"

        FA.Blackberry ->
            "blackberry"

        FA.Blind ->
            "blind"

        FA.Blogger ->
            "blogger"

        FA.BloggerB ->
            "blogger-b"

        FA.Bluetooth ->
            "bluetooth"

        FA.BluetoothB ->
            "bluetooth-b"

        FA.Bold ->
            "bold"

        FA.Bolt ->
            "bolt"

        FA.Bomb ->
            "bomb"

        FA.Book ->
            "book"

        FA.Bookmark ->
            "bookmark"

        FA.Braille ->
            "braille"

        FA.Briefcase ->
            "briefcase"

        FA.Btc ->
            "btc"

        FA.Bug ->
            "bug"

        FA.Building ->
            "building"

        FA.Bullhorn ->
            "bullhorn"

        FA.Bullseye ->
            "bullseye"

        FA.BuromobelExperte ->
            "buromobelexperte"

        FA.Bus ->
            "bus"

        FA.BuySellAds ->
            "buysellads"

        FA.Calculator ->
            "calculator"

        FA.Calendar ->
            "calendar"

        FA.CalendarAlt ->
            "calendar-alt"

        FA.CalendarCheck ->
            "calendar-check"

        FA.CalendarMinus ->
            "calendar-minus"

        FA.CalendarPlus ->
            "calendar-plus"

        FA.CalendarTimes ->
            "calendar-times"

        FA.Camera ->
            "camera"

        FA.CameraRetro ->
            "camera-retro"

        FA.Car ->
            "car"

        FA.CaretDown ->
            "caret-down"

        FA.CaretLeft ->
            "caret-left"

        FA.CaretRight ->
            "caret-right"

        FA.CaretUp ->
            "caret-up"

        FA.CaretSquareDown ->
            "caret-square-down"

        FA.CaretSquareLeft ->
            "caret-square-left"

        FA.CaretSquareRight ->
            "caret-square-right"

        FA.CaretSquareUp ->
            "caret-square-up"

        FA.CartArrowDown ->
            "cart-arrow-down"

        FA.CartPlus ->
            "cart-plus"

        FA.CCAmazonPay ->
            "cc-amazon-pay"

        FA.CCAmex ->
            "cc-amex"

        FA.CCApplePay ->
            "cc-apple-pay"

        FA.CCDinersClub ->
            "cc-diners-club"

        FA.CCDiscover ->
            "cc-discover"

        FA.CCJCB ->
            "cc-jcb"

        FA.CCMastercard ->
            "cc-mastercard"

        FA.CCPayPal ->
            "cc-paypal"

        FA.CCStripe ->
            "cc-stripe"

        FA.CCVisa ->
            "cc-visa"

        FA.Centercode ->
            "centercode"

        FA.Certificate ->
            "certificate"

        FA.ChartArea ->
            "chart-area"

        FA.ChartBar ->
            "chart-bar"

        FA.ChartLine ->
            "chart-line"

        FA.ChartPie ->
            "chart-pie"

        FA.Check ->
            "check"

        FA.CheckCircle ->
            "check-circle"

        FA.CheckSquare ->
            "check-square"

        FA.ChevronCircleDown ->
            "chevron-circle-down"

        FA.ChevronCircleLeft ->
            "chevron-circle-left"

        FA.ChevronCircleRight ->
            "chevron-circle-right"

        FA.ChevronCircleUp ->
            "chevron-circle-up"

        FA.ChevronDown ->
            "chevron-down"

        FA.ChevronLeft ->
            "chevron-left"

        FA.ChevronRight ->
            "chevron-right"

        FA.ChevronUp ->
            "chevron-up"

        FA.Child ->
            "child"

        FA.Chrome ->
            "chrome"

        FA.Circle ->
            "circle"

        FA.CircleNotched ->
            "circle-notch"

        FA.Clipboard ->
            "clipboard"

        FA.Clock ->
            "clock"

        FA.Clone ->
            "clone"

        FA.ClosedCaptioning ->
            "closed-captioning"

        FA.Cloud ->
            "cloud"

        FA.CloudDownloadAlt ->
            "cloud-download-alt"

        FA.CloudUploadAlt ->
            "cloud-upload-alt"

        FA.CloudScale ->
            "cloudscale"

        FA.Cloudsmith ->
            "cloudsmith"

        FA.Cloudversify ->
            "cloudversify"

        FA.Code ->
            "code"

        FA.CodeBranch ->
            "code-branch"

        FA.CodePen ->
            "codepen"

        FA.CodiePie ->
            "codiepie"

        FA.Coffee ->
            "coffee"

        FA.Cog ->
            "cog"

        FA.Cogs ->
            "cogs"

        FA.Columns ->
            "columns"

        FA.Comment ->
            "comment"

        FA.CommentAlt ->
            "comment-alt"

        FA.Comments ->
            "comments"

        FA.Compass ->
            "compass"

        FA.Compress ->
            "compress"

        FA.ConnectDevelop ->
            "connectdevelop"

        FA.Contao ->
            "contao"

        FA.Copy ->
            "copy"

        FA.Copyright ->
            "copyright"

        FA.CPanel ->
            "cpanel"

        FA.CreativeCommons ->
            "creative-commons"

        FA.CreditCard ->
            "credit-card"

        FA.Crop ->
            "crop"

        FA.Crosshairs ->
            "crosshairs"

        FA.CSS3 ->
            "css3"

        FA.CSS3Alt ->
            "css3-alt"

        FA.Cube ->
            "cube"

        FA.Cubes ->
            "cubes"

        FA.Cut ->
            "cut"

        FA.Cuttlefish ->
            "cuttlefish"

        FA.Edit ->
            "edit"

        FA.FiveHundredPx ->
            "500px"


brandStyles : List FA.Icon
brandStyles =
    [ FA.Accusoft
    , FA.AccessibleIcon
    , FA.Adn
    , FA.Adversal
    , FA.AffiliateTheme
    , FA.Algolia
    , FA.Amazon
    , FA.AmazonPay
    , FA.Amilia
    , FA.Android
    , FA.AngelList
    , FA.AngryCreative
    , FA.Angular
    , FA.AppStore
    , FA.AppStoreIos
    , FA.Apper
    , FA.Apple
    , FA.ApplePay
    , FA.Asymmetrik
    , FA.Audible
    , FA.AutoPrefixer
    , FA.Avianex
    , FA.Aviato
    , FA.AWS
    , FA.Bandcamp
    , FA.Behance
    , FA.BehanceSquare
    , FA.BIMobject
    , FA.Bitbucket
    , FA.Bitcoin
    , FA.Bity
    , FA.BlackTie
    , FA.Blackberry
    , FA.Blogger
    , FA.BloggerB
    , FA.Bluetooth
    , FA.BluetoothB
    , FA.Btc
    , FA.BuromobelExperte
    , FA.BuySellAds
    , FA.CCAmazonPay
    , FA.CCAmex
    , FA.CCApplePay
    , FA.CCDinersClub
    , FA.CCDiscover
    , FA.CCJCB
    , FA.CCMastercard
    , FA.CCPayPal
    , FA.CCStripe
    , FA.CCVisa
    , FA.Centercode
    , FA.Chrome
    , FA.CloudScale
    , FA.Cloudsmith
    , FA.Cloudversify
    , FA.CodePen
    , FA.CodiePie
    , FA.ConnectDevelop
    , FA.Contao
    , FA.CPanel
    , FA.CreativeCommons
    , FA.CSS3
    , FA.CSS3Alt
    , FA.Cuttlefish
    , FA.FiveHundredPx
    ]


defaultStyle : FA.Icon -> FA.Style
defaultStyle icon =
    if (List.member icon brandStyles) then
        FA.Brand
    else
        FA.Solid
