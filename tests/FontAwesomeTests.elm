module FontAwesomeTests exposing (..)

import FontAwesome as FA
import Expect
import Fuzz
import Html
import Html.Attributes
import Test exposing (Test, describe, fuzz, fuzz2, fuzz3, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


suite : Test
suite =
    describe "FontAwesome module"
        [ describe "icon" testIcon
        , describe "iconStyled" testIconStyled
        , describe "fa" testFa
        , describe "logo" testLogo
        , describe "fab" testFab
        ]


testLogo : List Test
testLogo =
    [ fuzz brandFuzzer "has brand name and style only" <|
        \brand ->
            FA.logo brand
                |> Query.fromHtml
                |> Expect.all
                    [ Query.has [ Selector.tag "span" ]
                    , Query.has
                        [ Selector.exactClassName ("fab " ++ brandClass brand) ]
                    ]
    ]


testIcon : List Test
testIcon =
    [ fuzz iconFuzzer "has icon name and default style only" <|
        \icon ->
            FA.icon icon
                |> Query.fromHtml
                |> Expect.all
                    [ Query.has [ Selector.tag "span" ]
                    , Query.has
                        [ Selector.exactClassName ("fas " ++ iconClass icon) ]
                    ]
    ]


testIconStyled : List Test
testIconStyled =
    [ fuzz2 iconFuzzer styleFuzzer "has icon name and style only" <|
        \icon style ->
            FA.iconStyled icon style
                |> Query.fromHtml
                |> Expect.all
                    [ Query.has [ Selector.tag "span" ]
                    , Query.has
                        [ Selector.exactClassName (styleClass style ++ " " ++ iconClass icon) ]
                    ]
    ]


testFa : List Test
testFa =
    [ describe "without html attributes" testFaWithoutHtmlAttributes
    , describe "with html attributes" testFaWithHtmlAttributes
    ]


testFab : List Test
testFab =
    [ describe "without html attributes" testFabWithoutHtmlAttributes
    , describe "with html attributes" testFabWithHtmlAttributes
    ]


testFaWithoutHtmlAttributes : List Test
testFaWithoutHtmlAttributes =
    [ Test.fuzzWith
        { runs = 500 }
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


testFabWithoutHtmlAttributes : List Test
testFabWithoutHtmlAttributes =
    [ Test.fuzzWith
        { runs = 500 }
        (Fuzz.tuple3
            ( brandFuzzer
            , attributesFuzzer
            , htmlAttributesFuzzer
            )
        )
        "handles all attributes"
      <|
        \( brand, attributes, htmlAttributes ) ->
            FA.fab brand attributes htmlAttributes
                |> Query.fromHtml
                |> Expect.all
                    [ testBrandClass brand
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


testFabWithHtmlAttributes : List Test
testFabWithHtmlAttributes =
    [ testFabWithCustomClasses
    , testFabWithStandardAttributes
    , testFabWithCustomAttributes
    ]


testFaWithCustomClasses : Test
testFaWithCustomClasses =
    testCustomClasses testFaHelper "custom classes for icon"


testFabWithCustomClasses : Test
testFabWithCustomClasses =
    testCustomClasses testFabHelper "custom classes for brand"


testCustomClasses :
    (String
     -> List (Html.Attribute msg)
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


testFaWithStandardAttributes : Test
testFaWithStandardAttributes =
    testStandardAttributes testFaHelper "standard attributes for icon"


testFabWithStandardAttributes : Test
testFabWithStandardAttributes =
    testStandardAttributes testFabHelper "standard attributes for brand"


testStandardAttributes :
    (String
     -> List (Html.Attribute msg)
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


testFaWithCustomAttributes : Test
testFaWithCustomAttributes =
    testCustomAttributes testFaHelper "custom attributes for icon"


testFabWithCustomAttributes : Test
testFabWithCustomAttributes =
    testCustomAttributes testFabHelper "custom attributes for brand"


testCustomAttributes :
    (String
     -> List (Html.Attribute msg)
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
                    [ Selector.attribute (Html.Attributes.attribute attr1Name attr1Val)
                    , Selector.attribute (Html.Attributes.attribute attr2Name attr2Val)
                    ]
                    msg
            )


testIconClass : FA.Icon -> Query.Single msg -> Expect.Expectation
testIconClass icon =
    Query.has [ Selector.class ("fa-" ++ name icon) ]


testBrandClass : FA.Brand -> Query.Single msg -> Expect.Expectation
testBrandClass brand =
    Query.has [ Selector.class ("fa-" ++ brandName brand) ]


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
        [ Fuzz.constant FA.AddressBook
        , Fuzz.constant FA.Edit
        ]


brandFuzzer : Fuzz.Fuzzer FA.Brand
brandFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant FA.Apple
        , Fuzz.constant FA.Facebook
        ]



-- iconFuzzer : Fuzz.Fuzzer FA.Icon
-- iconFuzzer =
--     Fuzz.oneOf
--         [ Fuzz.constant FA.FiveHundredPx
--         , Fuzz.constant FA.AccessibleIcon
--         , Fuzz.constant FA.Accusoft
--         , Fuzz.constant FA.AddressBook
--         , Fuzz.constant FA.AddressCard
--         , Fuzz.constant FA.Adjust
--         , Fuzz.constant FA.Adn
--         , Fuzz.constant FA.Adversal
--         , Fuzz.constant FA.AffiliateTheme
--         , Fuzz.constant FA.Algolia
--         , Fuzz.constant FA.AlignCenter
--         , Fuzz.constant FA.AlignJustify
--         , Fuzz.constant FA.AlignLeft
--         , Fuzz.constant FA.AlignRight
--         , Fuzz.constant FA.Amazon
--         , Fuzz.constant FA.AmazonPay
--         , Fuzz.constant FA.Ambulance
--         , Fuzz.constant FA.AmericanSignLanguageInterpreting
--         , Fuzz.constant FA.Amilia
--         , Fuzz.constant FA.Anchor
--         , Fuzz.constant FA.Android
--         , Fuzz.constant FA.AngelList
--         , Fuzz.constant FA.AngleDoubleDown
--         , Fuzz.constant FA.AngleDoubleLeft
--         , Fuzz.constant FA.AngleDoubleRight
--         , Fuzz.constant FA.AngleDoubleUp
--         , Fuzz.constant FA.AngleDown
--         , Fuzz.constant FA.AngleLeft
--         , Fuzz.constant FA.AngleRight
--         , Fuzz.constant FA.AngleUp
--         , Fuzz.constant FA.AngryCreative
--         , Fuzz.constant FA.Angular
--         , Fuzz.constant FA.AppStore
--         , Fuzz.constant FA.AppStoreIos
--         , Fuzz.constant FA.Apper
--         , Fuzz.constant FA.Apple
--         , Fuzz.constant FA.ApplePay
--         , Fuzz.constant FA.Archive
--         , Fuzz.constant FA.ArrowAltCircleDown
--         , Fuzz.constant FA.ArrowAltCircleLeft
--         , Fuzz.constant FA.ArrowAltCircleRight
--         , Fuzz.constant FA.ArrowAltCircleUp
--         , Fuzz.constant FA.ArrowCircleDown
--         , Fuzz.constant FA.ArrowCircleLeft
--         , Fuzz.constant FA.ArrowCircleRight
--         , Fuzz.constant FA.ArrowCircleUp
--         , Fuzz.constant FA.ArrowDown
--         , Fuzz.constant FA.ArrowLeft
--         , Fuzz.constant FA.ArrowRight
--         , Fuzz.constant FA.ArrowUp
--         , Fuzz.constant FA.ArrowsAlt
--         , Fuzz.constant FA.ArrowsAltHorizontal
--         , Fuzz.constant FA.ArrowsAltVertical
--         , Fuzz.constant FA.AssistiveListeningSystems
--         , Fuzz.constant FA.Asterisk
--         , Fuzz.constant FA.Asymmetrik
--         , Fuzz.constant FA.At
--         , Fuzz.constant FA.Audible
--         , Fuzz.constant FA.AudioDescription
--         , Fuzz.constant FA.AutoPrefixer
--         , Fuzz.constant FA.Avianex
--         , Fuzz.constant FA.Aviato
--         , Fuzz.constant FA.AWS
--         , Fuzz.constant FA.Backward
--         , Fuzz.constant FA.BalanceScale
--         , Fuzz.constant FA.Ban
--         , Fuzz.constant FA.Bandcamp
--         , Fuzz.constant FA.Barcode
--         , Fuzz.constant FA.Bars
--         , Fuzz.constant FA.Bath
--         , Fuzz.constant FA.BatteryEmpty
--         , Fuzz.constant FA.BatteryFull
--         , Fuzz.constant FA.BatteryHalf
--         , Fuzz.constant FA.BatteryQuarter
--         , Fuzz.constant FA.BatteryThreeQuarters
--         , Fuzz.constant FA.Bed
--         , Fuzz.constant FA.Beer
--         , Fuzz.constant FA.Behance
--         , Fuzz.constant FA.BehanceSquare
--         , Fuzz.constant FA.Bell
--         , Fuzz.constant FA.BellSlash
--         , Fuzz.constant FA.Bicycle
--         , Fuzz.constant FA.BIMobject
--         , Fuzz.constant FA.Binoculars
--         , Fuzz.constant FA.BirthdayCake
--         , Fuzz.constant FA.Bitbucket
--         , Fuzz.constant FA.Bitcoin
--         , Fuzz.constant FA.Bity
--         , Fuzz.constant FA.BlackTie
--         , Fuzz.constant FA.Blackberry
--         , Fuzz.constant FA.Blind
--         , Fuzz.constant FA.Blogger
--         , Fuzz.constant FA.BloggerB
--         , Fuzz.constant FA.Bluetooth
--         , Fuzz.constant FA.BluetoothB
--         , Fuzz.constant FA.Bold
--         , Fuzz.constant FA.Bolt
--         , Fuzz.constant FA.Bomb
--         , Fuzz.constant FA.Book
--         , Fuzz.constant FA.Bookmark
--         , Fuzz.constant FA.Braille
--         , Fuzz.constant FA.Briefcase
--         , Fuzz.constant FA.Btc
--         , Fuzz.constant FA.Bug
--         , Fuzz.constant FA.Building
--         , Fuzz.constant FA.Bullhorn
--         , Fuzz.constant FA.Bullseye
--         , Fuzz.constant FA.BuromobelExperte
--         , Fuzz.constant FA.Bus
--         , Fuzz.constant FA.BuySellAds
--         , Fuzz.constant FA.Calculator
--         , Fuzz.constant FA.Calendar
--         , Fuzz.constant FA.CalendarAlt
--         , Fuzz.constant FA.CalendarCheck
--         , Fuzz.constant FA.CalendarMinus
--         , Fuzz.constant FA.CalendarPlus
--         , Fuzz.constant FA.CalendarTimes
--         , Fuzz.constant FA.Camera
--         , Fuzz.constant FA.CameraRetro
--         , Fuzz.constant FA.Car
--         , Fuzz.constant FA.CaretDown
--         , Fuzz.constant FA.CaretLeft
--         , Fuzz.constant FA.CaretRight
--         , Fuzz.constant FA.CaretUp
--         , Fuzz.constant FA.CaretSquareDown
--         , Fuzz.constant FA.CaretSquareLeft
--         , Fuzz.constant FA.CaretSquareRight
--         , Fuzz.constant FA.CaretSquareUp
--         , Fuzz.constant FA.CartArrowDown
--         , Fuzz.constant FA.CartPlus
--         , Fuzz.constant FA.CCAmazonPay
--         , Fuzz.constant FA.CCAmex
--         , Fuzz.constant FA.CCApplePay
--         , Fuzz.constant FA.CCDinersClub
--         , Fuzz.constant FA.CCDiscover
--         , Fuzz.constant FA.CCJCB
--         , Fuzz.constant FA.CCMastercard
--         , Fuzz.constant FA.CCPayPal
--         , Fuzz.constant FA.CCStripe
--         , Fuzz.constant FA.CCVisa
--         , Fuzz.constant FA.Centercode
--         , Fuzz.constant FA.Certificate
--         , Fuzz.constant FA.ChartArea
--         , Fuzz.constant FA.ChartBar
--         , Fuzz.constant FA.ChartLine
--         , Fuzz.constant FA.ChartPie
--         , Fuzz.constant FA.Check
--         , Fuzz.constant FA.CheckCircle
--         , Fuzz.constant FA.CheckSquare
--         , Fuzz.constant FA.ChevronCircleDown
--         , Fuzz.constant FA.ChevronCircleLeft
--         , Fuzz.constant FA.ChevronCircleRight
--         , Fuzz.constant FA.ChevronCircleUp
--         , Fuzz.constant FA.ChevronDown
--         , Fuzz.constant FA.ChevronLeft
--         , Fuzz.constant FA.ChevronRight
--         , Fuzz.constant FA.ChevronUp
--         , Fuzz.constant FA.Child
--         , Fuzz.constant FA.Chrome
--         , Fuzz.constant FA.Circle
--         , Fuzz.constant FA.CircleNotched
--         , Fuzz.constant FA.Clipboard
--         , Fuzz.constant FA.Clock
--         , Fuzz.constant FA.Clone
--         , Fuzz.constant FA.ClosedCaptioning
--         , Fuzz.constant FA.Cloud
--         , Fuzz.constant FA.CloudDownloadAlt
--         , Fuzz.constant FA.CloudUploadAlt
--         , Fuzz.constant FA.CloudScale
--         , Fuzz.constant FA.Cloudsmith
--         , Fuzz.constant FA.Cloudversify
--         , Fuzz.constant FA.Code
--         , Fuzz.constant FA.CodeBranch
--         , Fuzz.constant FA.CodePen
--         , Fuzz.constant FA.CodiePie
--         , Fuzz.constant FA.Coffee
--         , Fuzz.constant FA.Cog
--         , Fuzz.constant FA.Cogs
--         , Fuzz.constant FA.Columns
--         , Fuzz.constant FA.Comment
--         , Fuzz.constant FA.CommentAlt
--         , Fuzz.constant FA.Comments
--         , Fuzz.constant FA.Compass
--         , Fuzz.constant FA.Compress
--         , Fuzz.constant FA.ConnectDevelop
--         , Fuzz.constant FA.Contao
--         , Fuzz.constant FA.Copy
--         , Fuzz.constant FA.Copyright
--         , Fuzz.constant FA.CPanel
--         , Fuzz.constant FA.CreativeCommons
--         , Fuzz.constant FA.CreditCard
--         , Fuzz.constant FA.Crop
--         , Fuzz.constant FA.Crosshairs
--         , Fuzz.constant FA.CSS3
--         , Fuzz.constant FA.CSS3Alt
--         , Fuzz.constant FA.Cube
--         , Fuzz.constant FA.Cubes
--         , Fuzz.constant FA.Cut
--         , Fuzz.constant FA.Cuttlefish
--         , Fuzz.constant FA.DAndD
--         , Fuzz.constant FA.Dashcube
--         , Fuzz.constant FA.Database
--         , Fuzz.constant FA.Deaf
--         , Fuzz.constant FA.Delicious
--         , Fuzz.constant FA.DeployDog
--         , Fuzz.constant FA.Deskpro
--         , Fuzz.constant FA.Desktop
--         , Fuzz.constant FA.DeviantArt
--         , Fuzz.constant FA.Digg
--         , Fuzz.constant FA.DigitalOcean
--         , Fuzz.constant FA.Discord
--         , Fuzz.constant FA.Discourse
--         , Fuzz.constant FA.DocHub
--         , Fuzz.constant FA.Docker
--         , Fuzz.constant FA.DollarSign
--         , Fuzz.constant FA.DotCircle
--         , Fuzz.constant FA.Download
--         , Fuzz.constant FA.Draft2Digital
--         , Fuzz.constant FA.Dribbble
--         , Fuzz.constant FA.DribbbleSquare
--         , Fuzz.constant FA.Dropbox
--         , Fuzz.constant FA.Drupal
--         , Fuzz.constant FA.Dyalog
--         , Fuzz.constant FA.EarlyBirds
--         , Fuzz.constant FA.Edge
--         , Fuzz.constant FA.Edit
--         , Fuzz.constant FA.Eject
--         , Fuzz.constant FA.EllipsisHorizontal
--         , Fuzz.constant FA.EllipsisVertical
--         , Fuzz.constant FA.Ember
--         , Fuzz.constant FA.Empire
--         , Fuzz.constant FA.Envelope
--         , Fuzz.constant FA.EnvelopeOpen
--         , Fuzz.constant FA.EnvelopeSquare
--         , Fuzz.constant FA.Envira
--         , Fuzz.constant FA.Eraser
--         , Fuzz.constant FA.Erlang
--         , Fuzz.constant FA.Ethereum
--         , Fuzz.constant FA.Etsy
--         , Fuzz.constant FA.EuroSign
--         , Fuzz.constant FA.ExchangeAlt
--         , Fuzz.constant FA.Exclamation
--         , Fuzz.constant FA.ExclamationCircle
--         , Fuzz.constant FA.ExclamationTriangle
--         , Fuzz.constant FA.Expand
--         , Fuzz.constant FA.ExpandArrowsAlt
--         , Fuzz.constant FA.ExpeditedSSL
--         , Fuzz.constant FA.ExternalLinkAlt
--         , Fuzz.constant FA.ExternalLinkSquareAlt
--         , Fuzz.constant FA.Eye
--         , Fuzz.constant FA.EyeDropper
--         , Fuzz.constant FA.EyeSlash
--         , Fuzz.constant FA.Facebook
--         , Fuzz.constant FA.Facebook_f
--         , Fuzz.constant FA.FacebookMessenger
--         , Fuzz.constant FA.FacebookSquare
--         , Fuzz.constant FA.FastBackward
--         , Fuzz.constant FA.FastForward
--         , Fuzz.constant FA.Fax
--         , Fuzz.constant FA.Female
--         , Fuzz.constant FA.FighterJet
--         , Fuzz.constant FA.File
--         , Fuzz.constant FA.FileAlt
--         , Fuzz.constant FA.FileArchive
--         , Fuzz.constant FA.FileAudio
--         , Fuzz.constant FA.FileCode
--         , Fuzz.constant FA.FileExcel
--         , Fuzz.constant FA.FileImage
--         , Fuzz.constant FA.FilePdf
--         , Fuzz.constant FA.FilePowerPoint
--         , Fuzz.constant FA.FileVideo
--         , Fuzz.constant FA.FileWord
--         , Fuzz.constant FA.Film
--         , Fuzz.constant FA.Filter
--         , Fuzz.constant FA.Fire
--         , Fuzz.constant FA.FireExtinguisher
--         , Fuzz.constant FA.Firefox
--         , Fuzz.constant FA.FirstOrder
--         , Fuzz.constant FA.FirstDraft
--         , Fuzz.constant FA.Flag
--         , Fuzz.constant FA.FlagCheckered
--         , Fuzz.constant FA.Flask
--         , Fuzz.constant FA.Flickr
--         , Fuzz.constant FA.Fly
--         , Fuzz.constant FA.Folder
--         , Fuzz.constant FA.FolderOpen
--         , Fuzz.constant FA.Font
--         , Fuzz.constant FA.FontAwesome
--         , Fuzz.constant FA.FontAwesomeAlt
--         , Fuzz.constant FA.FontAwesomeFlag
--         , Fuzz.constant FA.FontIcons
--         , Fuzz.constant FA.FontIcons_fi
--         , Fuzz.constant FA.FortAwesome
--         , Fuzz.constant FA.FortAwesomeAlt
--         , Fuzz.constant FA.Forumbee
--         , Fuzz.constant FA.Forward
--         , Fuzz.constant FA.Foursquare
--         , Fuzz.constant FA.FreeCodeCamp
--         , Fuzz.constant FA.FreeBSD
--         , Fuzz.constant FA.Frown
--         , Fuzz.constant FA.Futbol
--         ]


styleFuzzer : Fuzz.Fuzzer FA.Style
styleFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant FA.Regular
        , Fuzz.constant FA.Solid
        , Fuzz.constant FA.Light
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
    Test.fuzz3 iconFuzzer styleFuzzer attributesFuzzer desc <|
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


testFabHelper :
    String
    -> List (Html.Attribute msg)
    -> (Query.Single msg -> Expect.Expectation)
    -> Test
testFabHelper desc htmlAttributes expectation =
    Test.fuzz2 brandFuzzer attributesFuzzer desc <|
        \brand attributes ->
            FA.fab brand
                attributes
                htmlAttributes
                |> Query.fromHtml
                |> Expect.all
                    [ testBrandClass brand
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


styleClass : FA.Style -> String
styleClass style =
    case style of
        FA.Solid ->
            "fas"

        FA.Regular ->
            "far"

        FA.Light ->
            "fal"


iconClass : FA.Icon -> String
iconClass icon =
    "fa-" ++ name icon


brandClass : FA.Brand -> String
brandClass brand =
    "fa-" ++ brandName brand


name : FA.Icon -> String
name icon =
    case icon of
        FA.AddressBook ->
            "address-book"

        FA.Edit ->
            "edit"


brandName : FA.Brand -> String
brandName brand =
    case brand of
        FA.Apple ->
            "apple"

        FA.Facebook ->
            "facebook"
