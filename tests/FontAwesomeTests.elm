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
        , describe "iconWithOptions" testIconWithOptions
        , describe "logo" testLogo
        , describe "logoWithOptions" testLogoWithOptions
        ]


testLogo : List Test
testLogo =
    [ fuzz logoFuzzer "has logo name and style only" <|
        \logo ->
            FA.logo logo
                |> Query.fromHtml
                |> Expect.all
                    [ Query.has [ Selector.tag "i" ]
                    , Query.has
                        [ Selector.exactClassName ("fab " ++ logoClass logo) ]
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
                    , Query.has
                        [ Selector.exactClassName ("fas " ++ iconClass icon) ]
                    ]
    ]


testIconWithOptions : List Test
testIconWithOptions =
    [ describe "without html attributes" testIconWithoutHtmlAttributes
    , describe "with html attributes" testIconWithHtmlAttributes
    ]


testLogoWithOptions : List Test
testLogoWithOptions =
    [ describe "without html attributes" testLogoWithoutHtmlAttributes
    , describe "with html attributes" testLogoWithHtmlAttributes
    ]


testIconWithoutHtmlAttributes : List Test
testIconWithoutHtmlAttributes =
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
            FA.iconWithOptions icon style attributes htmlAttributes
                |> Query.fromHtml
                |> Expect.all
                    [ testIconClass icon
                    , testStyle style
                    , testBorder attributes
                    , testWidth attributes
                    , testHtmlTag attributes
                    , testAnimation attributes
                    , testPull attributes
                    , testSize attributes
                    , testTransform attributes
                    , testMask attributes
                    ]
    ]


testLogoWithoutHtmlAttributes : List Test
testLogoWithoutHtmlAttributes =
    [ Test.fuzzWith
        { runs = 500 }
        (Fuzz.tuple3
            ( logoFuzzer
            , attributesFuzzer
            , htmlAttributesFuzzer
            )
        )
        "handles all attributes"
      <|
        \( logo, attributes, htmlAttributes ) ->
            FA.logoWithOptions logo attributes htmlAttributes
                |> Query.fromHtml
                |> Expect.all
                    [ testLogoClass logo
                    , testBorder attributes
                    , testWidth attributes
                    , testHtmlTag attributes
                    , testAnimation attributes
                    , testPull attributes
                    , testSize attributes
                    , testTransform attributes
                    , testMask attributes
                    ]
    ]


testIconWithHtmlAttributes : List Test
testIconWithHtmlAttributes =
    [ testIconWithCustomClasses
    , testIconWithStandardAttributes
    , testIconWithCustomAttributes
    ]


testLogoWithHtmlAttributes : List Test
testLogoWithHtmlAttributes =
    [ testLogoWithCustomClasses
    , testLogoWithStandardAttributes
    , testLogoWithCustomAttributes
    ]


testIconWithCustomClasses : Test
testIconWithCustomClasses =
    testCustomClasses testIconHelper "custom classes for icon"


testLogoWithCustomClasses : Test
testLogoWithCustomClasses =
    testCustomClasses testLogoHelper "custom classes for logo"


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


testIconWithStandardAttributes : Test
testIconWithStandardAttributes =
    testStandardAttributes testIconHelper "standard attributes for icon"


testLogoWithStandardAttributes : Test
testLogoWithStandardAttributes =
    testStandardAttributes testLogoHelper "standard attributes for logo"


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


testIconWithCustomAttributes : Test
testIconWithCustomAttributes =
    testCustomAttributes testIconHelper "custom attributes for icon"


testLogoWithCustomAttributes : Test
testLogoWithCustomAttributes =
    testCustomAttributes testLogoHelper "custom attributes for logo"


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
                    [ Selector.attribute
                        (Html.Attributes.attribute attr1Name attr1Val)
                    , Selector.attribute
                        (Html.Attributes.attribute attr2Name attr2Val)
                    ]
                    msg
            )


testIconClass : FA.Icon -> Query.Single msg -> Expect.Expectation
testIconClass icon =
    Query.has [ Selector.class ("fa-" ++ name icon) ]


testLogoClass : FA.Logo -> Query.Single msg -> Expect.Expectation
testLogoClass logo =
    Query.has [ Selector.class ("fa-" ++ logoName logo) ]


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


testHtmlTag : List FA.Attribute -> Query.Single msg -> Expect.Expectation
testHtmlTag attributes =
    let
        attr =
            last isHtmlTag attributes
    in
        case attr of
            Just (FA.HtmlTag FA.Span) ->
                Query.has [ Selector.tag "span" ]

            _ ->
                Query.has [ Selector.tag "i" ]


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


testHtmlAttribute :
    Html.Attribute Never
    -> Query.Single msg
    -> Expect.Expectation
testHtmlAttribute htmlAttribute =
    Query.has [ Selector.attribute htmlAttribute ]



-- FUZZERS


iconFuzzer : Fuzz.Fuzzer FA.Icon
iconFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant FA.AddressBook
        , Fuzz.constant FA.AddressCard
        , Fuzz.constant FA.Adjust
        , Fuzz.constant FA.AlarmClock
        , Fuzz.constant FA.AlignCenter
        , Fuzz.constant FA.AlignJustify
        , Fuzz.constant FA.AlignLeft
        , Fuzz.constant FA.AlignRight
        , Fuzz.constant FA.Ambulance
        , Fuzz.constant FA.AmericanSignLanguageInterpreting

        -- Note: The rest of these are commented out because including
        -- them results in slow compile times and eventually a stack overflow
        -- when running elm-test. Practically, it shouldn't matter, as there's
        -- nothing special about the rest of these types that would
        -- result in different test outcomes.
        -- , Fuzz.constant FA.Anchor
        -- , Fuzz.constant FA.AngleDoubleDown
        -- , Fuzz.constant FA.AngleDoubleLeft
        -- , Fuzz.constant FA.AngleDoubleRight
        -- , Fuzz.constant FA.AngleDoubleUp
        -- , Fuzz.constant FA.AngleDown
        -- , Fuzz.constant FA.AngleLeft
        -- , Fuzz.constant FA.AngleRight
        -- , Fuzz.constant FA.AngleUp
        -- , Fuzz.constant FA.Archive
        -- , Fuzz.constant FA.ArrowAltCircleDown
        -- , Fuzz.constant FA.ArrowAltCircleLeft
        -- , Fuzz.constant FA.ArrowAltCircleRight
        -- , Fuzz.constant FA.ArrowAltCircleUp
        -- , Fuzz.constant FA.ArrowAltDown
        -- , Fuzz.constant FA.ArrowAltFromBottom
        -- , Fuzz.constant FA.ArrowAltFromLeft
        -- , Fuzz.constant FA.ArrowAltFromRight
        -- , Fuzz.constant FA.ArrowAltFromTop
        -- , Fuzz.constant FA.ArrowAltLeft
        -- , Fuzz.constant FA.ArrowAltRight
        -- , Fuzz.constant FA.ArrowAltSquareDown
        -- , Fuzz.constant FA.ArrowAltSquareLeft
        -- , Fuzz.constant FA.ArrowAltSquareRight
        -- , Fuzz.constant FA.ArrowAltSquareUp
        -- , Fuzz.constant FA.ArrowAltToBottom
        -- , Fuzz.constant FA.ArrowAltToLeft
        -- , Fuzz.constant FA.ArrowAltToRight
        -- , Fuzz.constant FA.ArrowAltToTop
        -- , Fuzz.constant FA.ArrowAltUp
        -- , Fuzz.constant FA.ArrowCircleDown
        -- , Fuzz.constant FA.ArrowCircleLeft
        -- , Fuzz.constant FA.ArrowCircleRight
        -- , Fuzz.constant FA.ArrowCircleUp
        -- , Fuzz.constant FA.ArrowDown
        -- , Fuzz.constant FA.ArrowFromBottom
        -- , Fuzz.constant FA.ArrowFromLeft
        -- , Fuzz.constant FA.ArrowFromRight
        -- , Fuzz.constant FA.ArrowFromTop
        -- , Fuzz.constant FA.ArrowLeft
        -- , Fuzz.constant FA.ArrowRight
        -- , Fuzz.constant FA.ArrowSquareDown
        -- , Fuzz.constant FA.ArrowSquareLeft
        -- , Fuzz.constant FA.ArrowSquareRight
        -- , Fuzz.constant FA.ArrowSquareUp
        -- , Fuzz.constant FA.ArrowToBottom
        -- , Fuzz.constant FA.ArrowToLeft
        -- , Fuzz.constant FA.ArrowToRight
        -- , Fuzz.constant FA.ArrowToTop
        -- , Fuzz.constant FA.ArrowUp
        -- , Fuzz.constant FA.Arrows
        -- , Fuzz.constant FA.ArrowsAlt
        -- , Fuzz.constant FA.ArrowsAltHorizontal
        -- , Fuzz.constant FA.ArrowsAltVertical
        -- , Fuzz.constant FA.ArrowsHorizontal
        -- , Fuzz.constant FA.ArrowsVertical
        -- , Fuzz.constant FA.AssistiveListeningSystems
        -- , Fuzz.constant FA.Asterisk
        -- , Fuzz.constant FA.At
        -- , Fuzz.constant FA.AudioDescription
        -- , Fuzz.constant FA.Backward
        -- , Fuzz.constant FA.Badge
        -- , Fuzz.constant FA.BadgeCheck
        -- , Fuzz.constant FA.BalanceScale
        -- , Fuzz.constant FA.Ban
        -- , Fuzz.constant FA.Barcode
        -- , Fuzz.constant FA.Bars
        -- , Fuzz.constant FA.Bath
        -- , Fuzz.constant FA.BatteryBolt
        -- , Fuzz.constant FA.BatteryEmpty
        -- , Fuzz.constant FA.BatteryFull
        -- , Fuzz.constant FA.BatteryHalf
        -- , Fuzz.constant FA.BatteryQuarter
        -- , Fuzz.constant FA.BatterySlash
        -- , Fuzz.constant FA.BatteryThreeQuarters
        -- , Fuzz.constant FA.Bed
        -- , Fuzz.constant FA.Beer
        -- , Fuzz.constant FA.Bell
        -- , Fuzz.constant FA.BellSlash
        -- , Fuzz.constant FA.Bicycle
        -- , Fuzz.constant FA.Binoculars
        -- , Fuzz.constant FA.BirthdayCake
        -- , Fuzz.constant FA.Blind
        -- , Fuzz.constant FA.Bold
        -- , Fuzz.constant FA.Bolt
        -- , Fuzz.constant FA.Bomb
        -- , Fuzz.constant FA.Book
        -- , Fuzz.constant FA.Bookmark
        -- , Fuzz.constant FA.Braille
        -- , Fuzz.constant FA.Briefcase
        -- , Fuzz.constant FA.Browser
        -- , Fuzz.constant FA.Bug
        -- , Fuzz.constant FA.Building
        -- , Fuzz.constant FA.Bullhorn
        -- , Fuzz.constant FA.Bullseye
        -- , Fuzz.constant FA.Bus
        -- , Fuzz.constant FA.Calculator
        -- , Fuzz.constant FA.Calendar
        -- , Fuzz.constant FA.CalendarAlt
        -- , Fuzz.constant FA.CalendarCheck
        -- , Fuzz.constant FA.CalendarEdit
        -- , Fuzz.constant FA.CalendarExclamation
        -- , Fuzz.constant FA.CalendarMinus
        -- , Fuzz.constant FA.CalendarPlus
        -- , Fuzz.constant FA.CalendarTimes
        -- , Fuzz.constant FA.Camera
        -- , Fuzz.constant FA.CameraAlt
        -- , Fuzz.constant FA.CameraRetro
        -- , Fuzz.constant FA.Car
        -- , Fuzz.constant FA.CaretCircleDown
        -- , Fuzz.constant FA.CaretCircleLeft
        -- , Fuzz.constant FA.CaretCircleRight
        -- , Fuzz.constant FA.CaretCircleUp
        -- , Fuzz.constant FA.CaretDown
        -- , Fuzz.constant FA.CaretLeft
        -- , Fuzz.constant FA.CaretRight
        -- , Fuzz.constant FA.CaretSquareDown
        -- , Fuzz.constant FA.CaretSquareLeft
        -- , Fuzz.constant FA.CaretSquareRight
        -- , Fuzz.constant FA.CaretSquareUp
        -- , Fuzz.constant FA.CaretUp
        -- , Fuzz.constant FA.CartArrowDown
        -- , Fuzz.constant FA.CartPlus
        -- , Fuzz.constant FA.Certificate
        -- , Fuzz.constant FA.ChartArea
        -- , Fuzz.constant FA.ChartBar
        -- , Fuzz.constant FA.ChartLine
        -- , Fuzz.constant FA.ChartPie
        -- , Fuzz.constant FA.Check
        -- , Fuzz.constant FA.CheckCircle
        -- , Fuzz.constant FA.CheckSquare
        -- , Fuzz.constant FA.ChevronCircleDown
        -- , Fuzz.constant FA.ChevronCircleLeft
        -- , Fuzz.constant FA.ChevronCircleRight
        -- , Fuzz.constant FA.ChevronCircleUp
        -- , Fuzz.constant FA.ChevronDoubleDown
        -- , Fuzz.constant FA.ChevronDoubleLeft
        -- , Fuzz.constant FA.ChevronDoubleRight
        -- , Fuzz.constant FA.ChevronDoubleUp
        -- , Fuzz.constant FA.ChevronDown
        -- , Fuzz.constant FA.ChevronLeft
        -- , Fuzz.constant FA.ChevronRight
        -- , Fuzz.constant FA.ChevronSquareDown
        -- , Fuzz.constant FA.ChevronSquareLeft
        -- , Fuzz.constant FA.ChevronSquareRight
        -- , Fuzz.constant FA.ChevronSquareUp
        -- , Fuzz.constant FA.ChevronUp
        -- , Fuzz.constant FA.Child
        -- , Fuzz.constant FA.Circle
        -- , Fuzz.constant FA.CircleNotch
        -- , Fuzz.constant FA.Clipboard
        -- , Fuzz.constant FA.Clock
        -- , Fuzz.constant FA.Clone
        -- , Fuzz.constant FA.ClosedCaptioning
        -- , Fuzz.constant FA.Cloud
        -- , Fuzz.constant FA.CloudDownload
        -- , Fuzz.constant FA.CloudDownloadAlt
        -- , Fuzz.constant FA.CloudUpload
        -- , Fuzz.constant FA.CloudUploadAlt
        -- , Fuzz.constant FA.Club
        -- , Fuzz.constant FA.Code
        -- , Fuzz.constant FA.CodeBranch
        -- , Fuzz.constant FA.CodeCommit
        -- , Fuzz.constant FA.CodeMerge
        -- , Fuzz.constant FA.Coffee
        -- , Fuzz.constant FA.Cog
        -- , Fuzz.constant FA.Cogs
        -- , Fuzz.constant FA.Columns
        -- , Fuzz.constant FA.Comment
        -- , Fuzz.constant FA.CommentAlt
        -- , Fuzz.constant FA.Comments
        -- , Fuzz.constant FA.Compass
        -- , Fuzz.constant FA.Compress
        -- , Fuzz.constant FA.CompressAlt
        -- , Fuzz.constant FA.CompressWide
        -- , Fuzz.constant FA.Copy
        -- , Fuzz.constant FA.Copyright
        -- , Fuzz.constant FA.CreditCard
        -- , Fuzz.constant FA.CreditCardBlank
        -- , Fuzz.constant FA.CreditCardFront
        -- , Fuzz.constant FA.Crop
        -- , Fuzz.constant FA.Crosshairs
        -- , Fuzz.constant FA.Cube
        -- , Fuzz.constant FA.Cubes
        -- , Fuzz.constant FA.Cut
        -- , Fuzz.constant FA.Database
        -- , Fuzz.constant FA.Deaf
        -- , Fuzz.constant FA.Desktop
        -- , Fuzz.constant FA.DesktopAlt
        -- , Fuzz.constant FA.Diamond
        -- , Fuzz.constant FA.DollarSign
        -- , Fuzz.constant FA.DotCircle
        -- , Fuzz.constant FA.Download
        -- , Fuzz.constant FA.Edit
        -- , Fuzz.constant FA.Eject
        -- , Fuzz.constant FA.EllipsisHorizontal
        -- , Fuzz.constant FA.EllipsisHorizontalAlt
        -- , Fuzz.constant FA.EllipsisVertical
        -- , Fuzz.constant FA.EllipsisVerticalAlt
        -- , Fuzz.constant FA.Envelope
        -- , Fuzz.constant FA.EnvelopeOpen
        -- , Fuzz.constant FA.EnvelopeSquare
        -- , Fuzz.constant FA.Eraser
        -- , Fuzz.constant FA.EuroSign
        -- , Fuzz.constant FA.Exchange
        -- , Fuzz.constant FA.ExchangeAlt
        -- , Fuzz.constant FA.Exclamation
        -- , Fuzz.constant FA.ExclamationCircle
        -- , Fuzz.constant FA.ExclamationSquare
        -- , Fuzz.constant FA.ExclamationTriangle
        -- , Fuzz.constant FA.Expand
        -- , Fuzz.constant FA.ExpandAlt
        -- , Fuzz.constant FA.ExpandArrows
        -- , Fuzz.constant FA.ExpandArrowsAlt
        -- , Fuzz.constant FA.ExpandWide
        -- , Fuzz.constant FA.ExternalLink
        -- , Fuzz.constant FA.ExternalLinkAlt
        -- , Fuzz.constant FA.ExternalLinkSquare
        -- , Fuzz.constant FA.ExternalLinkSquareAlt
        -- , Fuzz.constant FA.Eye
        -- , Fuzz.constant FA.EyeDropper
        -- , Fuzz.constant FA.EyeSlash
        -- , Fuzz.constant FA.FastBackward
        -- , Fuzz.constant FA.FastForward
        -- , Fuzz.constant FA.Fax
        -- , Fuzz.constant FA.Female
        -- , Fuzz.constant FA.FighterJet
        -- , Fuzz.constant FA.File
        -- , Fuzz.constant FA.FileAlt
        -- , Fuzz.constant FA.FileArchive
        -- , Fuzz.constant FA.FileAudio
        -- , Fuzz.constant FA.FileCheck
        -- , Fuzz.constant FA.FileCode
        -- , Fuzz.constant FA.FileEdit
        -- , Fuzz.constant FA.FileExcel
        -- , Fuzz.constant FA.FileExclamation
        -- , Fuzz.constant FA.FileImage
        -- , Fuzz.constant FA.FileMinus
        -- , Fuzz.constant FA.FilePdf
        -- , Fuzz.constant FA.FilePlus
        -- , Fuzz.constant FA.FilePowerpoint
        -- , Fuzz.constant FA.FileTimes
        -- , Fuzz.constant FA.FileVideo
        -- , Fuzz.constant FA.FileWord
        -- , Fuzz.constant FA.Film
        -- , Fuzz.constant FA.FilmAlt
        -- , Fuzz.constant FA.Filter
        -- , Fuzz.constant FA.Fire
        -- , Fuzz.constant FA.FireExtinguisher
        -- , Fuzz.constant FA.Flag
        -- , Fuzz.constant FA.FlagCheckered
        -- , Fuzz.constant FA.Flask
        -- , Fuzz.constant FA.Folder
        -- , Fuzz.constant FA.FolderOpen
        -- , Fuzz.constant FA.Font
        -- , Fuzz.constant FA.Forward
        -- , Fuzz.constant FA.Frown
        -- , Fuzz.constant FA.Futbol
        -- , Fuzz.constant FA.Gamepad
        -- , Fuzz.constant FA.Gavel
        -- , Fuzz.constant FA.Gem
        -- , Fuzz.constant FA.Genderless
        -- , Fuzz.constant FA.Gift
        -- , Fuzz.constant FA.GlassMartini
        -- , Fuzz.constant FA.Globe
        -- , Fuzz.constant FA.GraduationCap
        -- , Fuzz.constant FA.HSquare
        -- , Fuzz.constant FA.H1
        -- , Fuzz.constant FA.H2
        -- , Fuzz.constant FA.H3
        -- , Fuzz.constant FA.HandLizard
        -- , Fuzz.constant FA.HandPaper
        -- , Fuzz.constant FA.HandPeace
        -- , Fuzz.constant FA.HandPointDown
        -- , Fuzz.constant FA.HandPointLeft
        -- , Fuzz.constant FA.HandPointRight
        -- , Fuzz.constant FA.HandPointUp
        -- , Fuzz.constant FA.HandPointer
        -- , Fuzz.constant FA.HandRock
        -- , Fuzz.constant FA.HandScissors
        -- , Fuzz.constant FA.HandSpock
        -- , Fuzz.constant FA.Handshake
        -- , Fuzz.constant FA.Hashtag
        -- , Fuzz.constant FA.Hdd
        -- , Fuzz.constant FA.Heading
        -- , Fuzz.constant FA.Headphones
        -- , Fuzz.constant FA.Heart
        -- , Fuzz.constant FA.Heartbeat
        -- , Fuzz.constant FA.Hexagon
        -- , Fuzz.constant FA.History
        -- , Fuzz.constant FA.Home
        -- , Fuzz.constant FA.Hospital
        -- , Fuzz.constant FA.Hourglass
        -- , Fuzz.constant FA.HourglassEnd
        -- , Fuzz.constant FA.HourglassHalf
        -- , Fuzz.constant FA.HourglassStart
        -- , Fuzz.constant FA.ICursor
        -- , Fuzz.constant FA.IdBadge
        -- , Fuzz.constant FA.IdCard
        -- , Fuzz.constant FA.Image
        -- , Fuzz.constant FA.Images
        -- , Fuzz.constant FA.Inbox
        -- , Fuzz.constant FA.InboxIn
        -- , Fuzz.constant FA.InboxOut
        -- , Fuzz.constant FA.Indent
        -- , Fuzz.constant FA.Industry
        -- , Fuzz.constant FA.IndustryAlt
        -- , Fuzz.constant FA.Info
        -- , Fuzz.constant FA.InfoCircle
        -- , Fuzz.constant FA.InfoSquare
        -- , Fuzz.constant FA.Italic
        -- , Fuzz.constant FA.JackOLantern
        -- , Fuzz.constant FA.Key
        -- , Fuzz.constant FA.Keyboard
        -- , Fuzz.constant FA.Language
        -- , Fuzz.constant FA.Laptop
        -- , Fuzz.constant FA.Leaf
        -- , Fuzz.constant FA.Lemon
        -- , Fuzz.constant FA.LevelDown
        -- , Fuzz.constant FA.LevelDownAlt
        -- , Fuzz.constant FA.LevelUp
        -- , Fuzz.constant FA.LevelUpAlt
        -- , Fuzz.constant FA.LifeRing
        -- , Fuzz.constant FA.Lightbulb
        -- , Fuzz.constant FA.Link
        -- , Fuzz.constant FA.LiraSign
        -- , Fuzz.constant FA.List
        -- , Fuzz.constant FA.ListAlt
        -- , Fuzz.constant FA.ListOl
        -- , Fuzz.constant FA.ListUl
        -- , Fuzz.constant FA.LocationArrow
        -- , Fuzz.constant FA.Lock
        -- , Fuzz.constant FA.LockAlt
        -- , Fuzz.constant FA.LockOpen
        -- , Fuzz.constant FA.LockOpenAlt
        -- , Fuzz.constant FA.LongArrowAltDown
        -- , Fuzz.constant FA.LongArrowAltLeft
        -- , Fuzz.constant FA.LongArrowAltRight
        -- , Fuzz.constant FA.LongArrowAltUp
        -- , Fuzz.constant FA.LongArrowDown
        -- , Fuzz.constant FA.LongArrowLeft
        -- , Fuzz.constant FA.LongArrowRight
        -- , Fuzz.constant FA.LongArrowUp
        -- , Fuzz.constant FA.LowVision
        -- , Fuzz.constant FA.Magic
        -- , Fuzz.constant FA.Magnet
        -- , Fuzz.constant FA.Male
        -- , Fuzz.constant FA.Map
        -- , Fuzz.constant FA.MapMarker
        -- , Fuzz.constant FA.MapMarkerAlt
        -- , Fuzz.constant FA.MapPin
        -- , Fuzz.constant FA.MapSigns
        -- , Fuzz.constant FA.Mars
        -- , Fuzz.constant FA.MarsDouble
        -- , Fuzz.constant FA.MarsStroke
        -- , Fuzz.constant FA.MarsStrokeHorizontal
        -- , Fuzz.constant FA.MarsStrokeVertical
        -- , Fuzz.constant FA.Medkit
        -- , Fuzz.constant FA.Meh
        -- , Fuzz.constant FA.Mercury
        -- , Fuzz.constant FA.Microchip
        -- , Fuzz.constant FA.Microphone
        -- , Fuzz.constant FA.MicrophoneAlt
        -- , Fuzz.constant FA.MicrophoneSlash
        -- , Fuzz.constant FA.Minus
        -- , Fuzz.constant FA.MinusCircle
        -- , Fuzz.constant FA.MinusHexagon
        -- , Fuzz.constant FA.MinusOctagon
        -- , Fuzz.constant FA.MinusSquare
        -- , Fuzz.constant FA.Mobile
        -- , Fuzz.constant FA.MobileAlt
        -- , Fuzz.constant FA.MobileAndroid
        -- , Fuzz.constant FA.MobileAndroidAlt
        -- , Fuzz.constant FA.MoneyBill
        -- , Fuzz.constant FA.MoneyBillAlt
        -- , Fuzz.constant FA.Moon
        -- , Fuzz.constant FA.Motorcycle
        -- , Fuzz.constant FA.MousePointer
        -- , Fuzz.constant FA.Music
        -- , Fuzz.constant FA.Neuter
        -- , Fuzz.constant FA.Newspaper
        -- , Fuzz.constant FA.ObjectGroup
        -- , Fuzz.constant FA.ObjectUngroup
        -- , Fuzz.constant FA.Octagon
        -- , Fuzz.constant FA.Outdent
        -- , Fuzz.constant FA.PaintBrush
        -- , Fuzz.constant FA.PaperPlane
        -- , Fuzz.constant FA.Paperclip
        -- , Fuzz.constant FA.Paragraph
        -- , Fuzz.constant FA.Paste
        -- , Fuzz.constant FA.Pause
        -- , Fuzz.constant FA.PauseCircle
        -- , Fuzz.constant FA.Paw
        -- , Fuzz.constant FA.Pen
        -- , Fuzz.constant FA.PenAlt
        -- , Fuzz.constant FA.PenSquare
        -- , Fuzz.constant FA.Pencil
        -- , Fuzz.constant FA.PencilAlt
        -- , Fuzz.constant FA.Percent
        -- , Fuzz.constant FA.Phone
        -- , Fuzz.constant FA.PhoneSlash
        -- , Fuzz.constant FA.PhoneSquare
        -- , Fuzz.constant FA.PhoneVolume
        -- , Fuzz.constant FA.Plane
        -- , Fuzz.constant FA.PlaneAlt
        -- , Fuzz.constant FA.Play
        -- , Fuzz.constant FA.PlayCircle
        -- , Fuzz.constant FA.Plug
        -- , Fuzz.constant FA.Plus
        -- , Fuzz.constant FA.PlusCircle
        -- , Fuzz.constant FA.PlusHexagon
        -- , Fuzz.constant FA.PlusOctagon
        -- , Fuzz.constant FA.PlusSquare
        -- , Fuzz.constant FA.Podcast
        -- , Fuzz.constant FA.Poo
        -- , Fuzz.constant FA.Portrait
        -- , Fuzz.constant FA.PoundSign
        -- , Fuzz.constant FA.PowerOff
        -- , Fuzz.constant FA.Print
        -- , Fuzz.constant FA.PuzzlePiece
        -- , Fuzz.constant FA.Qrcode
        -- , Fuzz.constant FA.Question
        -- , Fuzz.constant FA.QuestionCircle
        -- , Fuzz.constant FA.QuestionSquare
        -- , Fuzz.constant FA.QuoteLeft
        -- , Fuzz.constant FA.QuoteRight
        -- , Fuzz.constant FA.Random
        -- , Fuzz.constant FA.RectangleLandscape
        -- , Fuzz.constant FA.RectanglePortrait
        -- , Fuzz.constant FA.RectangleWide
        -- , Fuzz.constant FA.Recycle
        -- , Fuzz.constant FA.Redo
        -- , Fuzz.constant FA.RedoAlt
        -- , Fuzz.constant FA.Registered
        -- , Fuzz.constant FA.Repeat
        -- , Fuzz.constant FA.Repeat1
        -- , Fuzz.constant FA.Repeat1Alt
        -- , Fuzz.constant FA.RepeatAlt
        -- , Fuzz.constant FA.Reply
        -- , Fuzz.constant FA.ReplyAll
        -- , Fuzz.constant FA.Retweet
        -- , Fuzz.constant FA.RetweetAlt
        -- , Fuzz.constant FA.Road
        -- , Fuzz.constant FA.Rocket
        -- , Fuzz.constant FA.RSS
        -- , Fuzz.constant FA.RSSSquare
        -- , Fuzz.constant FA.RubleSign
        -- , Fuzz.constant FA.RupeeSign
        -- , Fuzz.constant FA.Save
        -- , Fuzz.constant FA.Scrubber
        -- , Fuzz.constant FA.Search
        -- , Fuzz.constant FA.SearchMinus
        -- , Fuzz.constant FA.SearchPlus
        -- , Fuzz.constant FA.Server
        -- , Fuzz.constant FA.Share
        -- , Fuzz.constant FA.ShareAll
        -- , Fuzz.constant FA.ShareAlt
        -- , Fuzz.constant FA.ShareAltSquare
        -- , Fuzz.constant FA.ShareSquare
        -- , Fuzz.constant FA.ShekelSign
        -- , Fuzz.constant FA.Shield
        -- , Fuzz.constant FA.ShieldAlt
        -- , Fuzz.constant FA.ShieldCheck
        -- , Fuzz.constant FA.Ship
        -- , Fuzz.constant FA.ShoppingBag
        -- , Fuzz.constant FA.ShoppingBasket
        -- , Fuzz.constant FA.ShoppingCart
        -- , Fuzz.constant FA.Shower
        -- , Fuzz.constant FA.SignIn
        -- , Fuzz.constant FA.SignInAlt
        -- , Fuzz.constant FA.SignLanguage
        -- , Fuzz.constant FA.SignOut
        -- , Fuzz.constant FA.SignOutAlt
        -- , Fuzz.constant FA.Signal
        -- , Fuzz.constant FA.Sitemap
        -- , Fuzz.constant FA.SlidersHorizontal
        -- , Fuzz.constant FA.SlidersHorizontalSquare
        -- , Fuzz.constant FA.SlidersV
        -- , Fuzz.constant FA.SlidersVSquare
        -- , Fuzz.constant FA.Smile
        -- , Fuzz.constant FA.Snowflake
        -- , Fuzz.constant FA.Sort
        -- , Fuzz.constant FA.SortAlphaDown
        -- , Fuzz.constant FA.SortAlphaUp
        -- , Fuzz.constant FA.SortAmountDown
        -- , Fuzz.constant FA.SortAmountUp
        -- , Fuzz.constant FA.SortDown
        -- , Fuzz.constant FA.SortNumericDown
        -- , Fuzz.constant FA.SortNumericUp
        -- , Fuzz.constant FA.SortUp
        -- , Fuzz.constant FA.SpaceShuttle
        -- , Fuzz.constant FA.Spade
        -- , Fuzz.constant FA.Spinner
        -- , Fuzz.constant FA.SpinnerThird
        -- , Fuzz.constant FA.Square
        -- , Fuzz.constant FA.Star
        -- , Fuzz.constant FA.StarExclamation
        -- , Fuzz.constant FA.StarHalf
        -- , Fuzz.constant FA.StepBackward
        -- , Fuzz.constant FA.StepForward
        -- , Fuzz.constant FA.Stethoscope
        -- , Fuzz.constant FA.StickyNote
        -- , Fuzz.constant FA.Stop
        -- , Fuzz.constant FA.StopCircle
        -- , Fuzz.constant FA.Stopwatch
        -- , Fuzz.constant FA.StreetView
        -- , Fuzz.constant FA.Strikethrough
        -- , Fuzz.constant FA.Subscript
        -- , Fuzz.constant FA.Subway
        -- , Fuzz.constant FA.Suitcase
        -- , Fuzz.constant FA.Sun
        -- , Fuzz.constant FA.Superscript
        -- , Fuzz.constant FA.Sync
        -- , Fuzz.constant FA.SyncAlt
        -- , Fuzz.constant FA.Table
        -- , Fuzz.constant FA.Tablet
        -- , Fuzz.constant FA.TabletAlt
        -- , Fuzz.constant FA.TabletAndroid
        -- , Fuzz.constant FA.TabletAndroidAlt
        -- , Fuzz.constant FA.Tachometer
        -- , Fuzz.constant FA.TachometerAlt
        -- , Fuzz.constant FA.Tag
        -- , Fuzz.constant FA.Tags
        -- , Fuzz.constant FA.Tasks
        -- , Fuzz.constant FA.Taxi
        -- , Fuzz.constant FA.Terminal
        -- , Fuzz.constant FA.TextHeight
        -- , Fuzz.constant FA.TextWidth
        -- , Fuzz.constant FA.Th
        -- , Fuzz.constant FA.ThLarge
        -- , Fuzz.constant FA.ThList
        -- , Fuzz.constant FA.ThermometerEmpty
        -- , Fuzz.constant FA.ThermometerFull
        -- , Fuzz.constant FA.ThermometerHalf
        -- , Fuzz.constant FA.ThermometerQuarter
        -- , Fuzz.constant FA.ThermometerThreeQuarters
        -- , Fuzz.constant FA.ThumbsDown
        -- , Fuzz.constant FA.ThumbsUp
        -- , Fuzz.constant FA.Thumbtack
        -- , Fuzz.constant FA.Ticket
        -- , Fuzz.constant FA.TicketAlt
        -- , Fuzz.constant FA.Times
        -- , Fuzz.constant FA.TimesCircle
        -- , Fuzz.constant FA.TimesHexagon
        -- , Fuzz.constant FA.TimesOctagon
        -- , Fuzz.constant FA.TimesSquare
        -- , Fuzz.constant FA.Tint
        -- , Fuzz.constant FA.ToggleOff
        -- , Fuzz.constant FA.ToggleOn
        -- , Fuzz.constant FA.Trademark
        -- , Fuzz.constant FA.Train
        -- , Fuzz.constant FA.Transgender
        -- , Fuzz.constant FA.TransgenderAlt
        -- , Fuzz.constant FA.Trash
        -- , Fuzz.constant FA.TrashAlt
        -- , Fuzz.constant FA.Tree
        -- , Fuzz.constant FA.TreeAlt
        -- , Fuzz.constant FA.Triangle
        -- , Fuzz.constant FA.Trophy
        -- , Fuzz.constant FA.TrophyAlt
        -- , Fuzz.constant FA.Truck
        -- , Fuzz.constant FA.TTY
        -- , Fuzz.constant FA.TV
        -- , Fuzz.constant FA.TVRetro
        -- , Fuzz.constant FA.Umbrella
        -- , Fuzz.constant FA.Underline
        -- , Fuzz.constant FA.Undo
        -- , Fuzz.constant FA.UndoAlt
        -- , Fuzz.constant FA.UniversalAccess
        -- , Fuzz.constant FA.University
        -- , Fuzz.constant FA.Unlink
        -- , Fuzz.constant FA.Unlock
        -- , Fuzz.constant FA.UnlockAlt
        -- , Fuzz.constant FA.Upload
        -- , Fuzz.constant FA.UsdCircle
        -- , Fuzz.constant FA.UsdSquare
        -- , Fuzz.constant FA.User
        -- , Fuzz.constant FA.UserAlt
        -- , Fuzz.constant FA.UserCircle
        -- , Fuzz.constant FA.UserMd
        -- , Fuzz.constant FA.UserPlus
        -- , Fuzz.constant FA.UserSecret
        -- , Fuzz.constant FA.UserTimes
        -- , Fuzz.constant FA.Users
        -- , Fuzz.constant FA.UtensilFork
        -- , Fuzz.constant FA.UtensilKnife
        -- , Fuzz.constant FA.UtensilSpoon
        -- , Fuzz.constant FA.Utensils
        -- , Fuzz.constant FA.UtensilsAlt
        -- , Fuzz.constant FA.Venus
        -- , Fuzz.constant FA.VenusDouble
        -- , Fuzz.constant FA.VenusMars
        -- , Fuzz.constant FA.Video
        -- , Fuzz.constant FA.VolumeDown
        -- , Fuzz.constant FA.VolumeMute
        -- , Fuzz.constant FA.VolumeOff
        -- , Fuzz.constant FA.VolumeUp
        -- , Fuzz.constant FA.Watch
        -- , Fuzz.constant FA.Wheelchair
        -- , Fuzz.constant FA.Wifi
        -- , Fuzz.constant FA.Window
        -- , Fuzz.constant FA.WindowAlt
        -- , Fuzz.constant FA.WindowClose
        -- , Fuzz.constant FA.WindowMaximize
        -- , Fuzz.constant FA.WindowMinimize
        -- , Fuzz.constant FA.WindowRestore
        -- , Fuzz.constant FA.WonSign
        -- , Fuzz.constant FA.Wrench
        -- , Fuzz.constant FA.YenSign
        ]


logoFuzzer : Fuzz.Fuzzer FA.Logo
logoFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant FA.FiveHundredPx
        , Fuzz.constant FA.AccessibleIcon
        , Fuzz.constant FA.Accusoft
        , Fuzz.constant FA.Adn
        , Fuzz.constant FA.Adversal
        , Fuzz.constant FA.AffiliateTheme
        , Fuzz.constant FA.Algolia

        -- Note: The rest of these are commented out because including
        -- them results in slow compile times and eventually a stack overflow
        -- when running elm-test. Practically, it shouldn't matter, as there's
        -- nothing special about the rest of these types that would
        -- result in different test outcomes.
        -- , Fuzz.constant FA.Amazon
        -- , Fuzz.constant FA.AmazonPay
        -- , Fuzz.constant FA.Amilia
        -- , Fuzz.constant FA.Android
        -- , Fuzz.constant FA.AngelList
        -- , Fuzz.constant FA.AngryCreative
        -- , Fuzz.constant FA.Angular
        -- , Fuzz.constant FA.AppStore
        -- , Fuzz.constant FA.AppStoreIos
        -- , Fuzz.constant FA.Apper
        -- , Fuzz.constant FA.Apple
        -- , Fuzz.constant FA.ApplePay
        -- , Fuzz.constant FA.Asymmetrik
        -- , Fuzz.constant FA.Audible
        -- , Fuzz.constant FA.Autoprefixer
        -- , Fuzz.constant FA.Avianex
        -- , Fuzz.constant FA.Aviato
        -- , Fuzz.constant FA.Aws
        -- , Fuzz.constant FA.Bandcamp
        -- , Fuzz.constant FA.Behance
        -- , Fuzz.constant FA.BehanceSquare
        -- , Fuzz.constant FA.BIMobject
        -- , Fuzz.constant FA.Bitbucket
        -- , Fuzz.constant FA.Bitcoin
        -- , Fuzz.constant FA.Bity
        -- , Fuzz.constant FA.BlackTie
        -- , Fuzz.constant FA.Blackberry
        -- , Fuzz.constant FA.Blogger
        -- , Fuzz.constant FA.BloggerB
        -- , Fuzz.constant FA.Bluetooth
        -- , Fuzz.constant FA.BluetoothB
        -- , Fuzz.constant FA.Btc
        -- , Fuzz.constant FA.BuromobelExperte
        -- , Fuzz.constant FA.BuySellAds
        -- , Fuzz.constant FA.CCAmazonPay
        -- , Fuzz.constant FA.CCAmex
        -- , Fuzz.constant FA.CCApplePay
        -- , Fuzz.constant FA.CCDinersClub
        -- , Fuzz.constant FA.CCDiscover
        -- , Fuzz.constant FA.CCJcb
        -- , Fuzz.constant FA.CCMastercard
        -- , Fuzz.constant FA.CCPayPal
        -- , Fuzz.constant FA.CCStripe
        -- , Fuzz.constant FA.CCVisa
        -- , Fuzz.constant FA.Centercode
        -- , Fuzz.constant FA.Chrome
        -- , Fuzz.constant FA.CloudScale
        -- , Fuzz.constant FA.Cloudsmith
        -- , Fuzz.constant FA.Cloudversify
        -- , Fuzz.constant FA.CodePen
        -- , Fuzz.constant FA.CodiePie
        -- , Fuzz.constant FA.ConnectDevelop
        -- , Fuzz.constant FA.Contao
        -- , Fuzz.constant FA.Cpanel
        -- , Fuzz.constant FA.CreativeCommons
        -- , Fuzz.constant FA.CSS3
        -- , Fuzz.constant FA.CSS3Alt
        -- , Fuzz.constant FA.Cuttlefish
        -- , Fuzz.constant FA.DAndD
        -- , Fuzz.constant FA.Dashcube
        -- , Fuzz.constant FA.Delicious
        -- , Fuzz.constant FA.DeployDog
        -- , Fuzz.constant FA.Deskpro
        -- , Fuzz.constant FA.DeviantArt
        -- , Fuzz.constant FA.Digg
        -- , Fuzz.constant FA.DigitalOcean
        -- , Fuzz.constant FA.Discord
        -- , Fuzz.constant FA.Discourse
        -- , Fuzz.constant FA.DocHub
        -- , Fuzz.constant FA.Docker
        -- , Fuzz.constant FA.Draft2Digital
        -- , Fuzz.constant FA.Dribbble
        -- , Fuzz.constant FA.DribbbleSquare
        -- , Fuzz.constant FA.Dropbox
        -- , Fuzz.constant FA.Drupal
        -- , Fuzz.constant FA.Dyalog
        -- , Fuzz.constant FA.EarlyBirds
        -- , Fuzz.constant FA.Edge
        -- , Fuzz.constant FA.Elementor
        -- , Fuzz.constant FA.Ember
        -- , Fuzz.constant FA.Empire
        -- , Fuzz.constant FA.Envira
        -- , Fuzz.constant FA.Erlang
        -- , Fuzz.constant FA.Ethereum
        -- , Fuzz.constant FA.Etsy
        -- , Fuzz.constant FA.ExpeditedSSL
        -- , Fuzz.constant FA.Facebook
        -- , Fuzz.constant FA.FacebookF
        -- , Fuzz.constant FA.FacebookMessenger
        -- , Fuzz.constant FA.FacebookSquare
        -- , Fuzz.constant FA.Firefox
        -- , Fuzz.constant FA.FirstOrder
        -- , Fuzz.constant FA.FirstDraft
        -- , Fuzz.constant FA.Flickr
        -- , Fuzz.constant FA.Fly
        -- , Fuzz.constant FA.FontAwesome
        -- , Fuzz.constant FA.FontAwesomeAlt
        -- , Fuzz.constant FA.FontAwesomeFlag
        -- , Fuzz.constant FA.FontIcons
        -- , Fuzz.constant FA.FontIconsFi
        -- , Fuzz.constant FA.FortAwesome
        -- , Fuzz.constant FA.FortAwesomeAlt
        -- , Fuzz.constant FA.Forumbee
        -- , Fuzz.constant FA.Foursquare
        -- , Fuzz.constant FA.FreeCodeCamp
        -- , Fuzz.constant FA.FreeBSD
        -- , Fuzz.constant FA.GetPocket
        -- , Fuzz.constant FA.GG
        -- , Fuzz.constant FA.GGCircle
        -- , Fuzz.constant FA.Git
        -- , Fuzz.constant FA.GitSquare
        -- , Fuzz.constant FA.GitHub
        -- , Fuzz.constant FA.GitHubAlt
        -- , Fuzz.constant FA.GitHubSquare
        -- , Fuzz.constant FA.GitKraken
        -- , Fuzz.constant FA.GitLab
        -- , Fuzz.constant FA.Gitter
        -- , Fuzz.constant FA.Glide
        -- , Fuzz.constant FA.GlideG
        -- , Fuzz.constant FA.Gofore
        -- , Fuzz.constant FA.Goodreads
        -- , Fuzz.constant FA.GoodreadsG
        -- , Fuzz.constant FA.Google
        -- , Fuzz.constant FA.GoogleDrive
        -- , Fuzz.constant FA.GooglePlay
        -- , Fuzz.constant FA.GooglePlus
        -- , Fuzz.constant FA.GooglePlusG
        -- , Fuzz.constant FA.GooglePlusSquare
        -- , Fuzz.constant FA.GoogleWallet
        -- , Fuzz.constant FA.Gratipay
        -- , Fuzz.constant FA.Grav
        -- , Fuzz.constant FA.Gripfire
        -- , Fuzz.constant FA.Grunt
        -- , Fuzz.constant FA.Gulp
        -- , Fuzz.constant FA.HackerNews
        -- , Fuzz.constant FA.HackerNewsSquare
        -- , Fuzz.constant FA.HireAHelper
        -- , Fuzz.constant FA.Hooli
        -- , Fuzz.constant FA.Hotjar
        -- , Fuzz.constant FA.Houzz
        -- , Fuzz.constant FA.Html5
        -- , Fuzz.constant FA.HubSpot
        -- , Fuzz.constant FA.Imdb
        -- , Fuzz.constant FA.Instagram
        -- , Fuzz.constant FA.InternetExplorer
        -- , Fuzz.constant FA.IoxHost
        -- , Fuzz.constant FA.Itunes
        -- , Fuzz.constant FA.ItunesNote
        -- , Fuzz.constant FA.Jenkins
        -- , Fuzz.constant FA.Joget
        -- , Fuzz.constant FA.Joomla
        -- , Fuzz.constant FA.Js
        -- , Fuzz.constant FA.JsSquare
        -- , Fuzz.constant FA.JSFiddle
        -- , Fuzz.constant FA.KeyCDN
        -- , Fuzz.constant FA.Kickstarter
        -- , Fuzz.constant FA.KickstarterK
        -- , Fuzz.constant FA.Korvue
        -- , Fuzz.constant FA.Laravel
        -- , Fuzz.constant FA.Lastfm
        -- , Fuzz.constant FA.LastfmSquare
        -- , Fuzz.constant FA.Leanpub
        -- , Fuzz.constant FA.Less
        -- , Fuzz.constant FA.Line
        -- , Fuzz.constant FA.LinkedIn
        -- , Fuzz.constant FA.LinkedInInverted
        -- , Fuzz.constant FA.Linode
        -- , Fuzz.constant FA.Linux
        -- , Fuzz.constant FA.Lyft
        -- , Fuzz.constant FA.Magento
        -- , Fuzz.constant FA.Maxcdn
        -- , Fuzz.constant FA.MedApps
        -- , Fuzz.constant FA.Medium
        -- , Fuzz.constant FA.MediumM
        -- , Fuzz.constant FA.Medrt
        -- , Fuzz.constant FA.Meetup
        -- , Fuzz.constant FA.Microsoft
        -- , Fuzz.constant FA.Mix
        -- , Fuzz.constant FA.Mixcloud
        -- , Fuzz.constant FA.Mizuni
        -- , Fuzz.constant FA.MODX
        -- , Fuzz.constant FA.Monero
        -- , Fuzz.constant FA.Napster
        -- , Fuzz.constant FA.NintendoSwitch
        -- , Fuzz.constant FA.Node
        -- , Fuzz.constant FA.Nodejs
        -- , Fuzz.constant FA.Npm
        -- , Fuzz.constant FA.NS8
        -- , Fuzz.constant FA.Nutritionix
        -- , Fuzz.constant FA.Odnoklassniki
        -- , Fuzz.constant FA.OdnoklassnikiSquare
        -- , Fuzz.constant FA.OpenCart
        -- , Fuzz.constant FA.OpenID
        -- , Fuzz.constant FA.Opera
        -- , Fuzz.constant FA.OptinMonster
        -- , Fuzz.constant FA.OpenSourceInitiative
        -- , Fuzz.constant FA.Page4
        -- , Fuzz.constant FA.PageLines
        -- , Fuzz.constant FA.PalFed
        -- , Fuzz.constant FA.Patreon
        -- , Fuzz.constant FA.PayPal
        -- , Fuzz.constant FA.Periscope
        -- , Fuzz.constant FA.Phabricator
        -- , Fuzz.constant FA.PhoenixFramework
        -- , Fuzz.constant FA.PiedPiper
        -- , Fuzz.constant FA.PiedPiperAlt
        -- , Fuzz.constant FA.PiedPiperPp
        -- , Fuzz.constant FA.Pinterest
        -- , Fuzz.constant FA.PinterestP
        -- , Fuzz.constant FA.PinterestSquare
        -- , Fuzz.constant FA.Playstation
        -- , Fuzz.constant FA.ProductHunt
        -- , Fuzz.constant FA.Pushed
        -- , Fuzz.constant FA.Python
        -- , Fuzz.constant FA.QQ
        -- , Fuzz.constant FA.Quora
        -- , Fuzz.constant FA.Ravelry
        -- , Fuzz.constant FA.React
        -- , Fuzz.constant FA.Rebel
        -- , Fuzz.constant FA.RedRiver
        -- , Fuzz.constant FA.Reddit
        -- , Fuzz.constant FA.RedditAlien
        -- , Fuzz.constant FA.RedditSquare
        -- , Fuzz.constant FA.Rendact
        -- , Fuzz.constant FA.Renren
        -- , Fuzz.constant FA.Replyd
        -- , Fuzz.constant FA.Resolving
        -- , Fuzz.constant FA.RocketChat
        -- , Fuzz.constant FA.RockRMS
        -- , Fuzz.constant FA.Safari
        -- , Fuzz.constant FA.Sass
        -- , Fuzz.constant FA.Schlix
        -- , Fuzz.constant FA.Scribd
        -- , Fuzz.constant FA.Searchengin
        -- , Fuzz.constant FA.SellCast
        -- , Fuzz.constant FA.Sellsy
        -- , Fuzz.constant FA.ServiceStack
        -- , Fuzz.constant FA.ShirtsInBulk
        -- , Fuzz.constant FA.SimplyBuilt
        -- , Fuzz.constant FA.Sistrix
        -- , Fuzz.constant FA.SkyAtlas
        -- , Fuzz.constant FA.Skype
        -- , Fuzz.constant FA.Slack
        -- , Fuzz.constant FA.SlackHash
        -- , Fuzz.constant FA.Slideshare
        -- , Fuzz.constant FA.Snapchat
        -- , Fuzz.constant FA.SnapchatGhost
        -- , Fuzz.constant FA.SnapchatSquare
        -- , Fuzz.constant FA.SoundCloud
        -- , Fuzz.constant FA.Speakap
        -- , Fuzz.constant FA.Spotify
        -- , Fuzz.constant FA.StackExchange
        -- , Fuzz.constant FA.StackOverflow
        -- , Fuzz.constant FA.StayLinked
        -- , Fuzz.constant FA.Steam
        -- , Fuzz.constant FA.SteamSquare
        -- , Fuzz.constant FA.SteamSymbol
        -- , Fuzz.constant FA.StickerMule
        -- , Fuzz.constant FA.Strava
        -- , Fuzz.constant FA.Stripe
        -- , Fuzz.constant FA.StripeS
        -- , Fuzz.constant FA.StudioVinari
        -- , Fuzz.constant FA.StumbleUpon
        -- , Fuzz.constant FA.StumbleUponCircle
        -- , Fuzz.constant FA.Superpowers
        -- , Fuzz.constant FA.Supple
        -- , Fuzz.constant FA.Telegram
        -- , Fuzz.constant FA.TelegramPlane
        -- , Fuzz.constant FA.TencentWeibo
        -- , Fuzz.constant FA.ThemeIsle
        -- , Fuzz.constant FA.Trello
        -- , Fuzz.constant FA.TripAdvisor
        -- , Fuzz.constant FA.Tumblr
        -- , Fuzz.constant FA.TumblrSquare
        -- , Fuzz.constant FA.Twitch
        -- , Fuzz.constant FA.Twitter
        -- , Fuzz.constant FA.TwitterSquare
        -- , Fuzz.constant FA.Typo3
        -- , Fuzz.constant FA.Uber
        -- , Fuzz.constant FA.UIkit
        -- , Fuzz.constant FA.Uniregistry
        -- , Fuzz.constant FA.Untappd
        -- , Fuzz.constant FA.USB
        -- , Fuzz.constant FA.UsSunnah
        -- , Fuzz.constant FA.Vaadin
        -- , Fuzz.constant FA.Viacoin
        -- , Fuzz.constant FA.Viadeo
        -- , Fuzz.constant FA.ViadeoSquare
        -- , Fuzz.constant FA.Viber
        -- , Fuzz.constant FA.Vimeo
        -- , Fuzz.constant FA.VimeoSquare
        -- , Fuzz.constant FA.VimeoV
        -- , Fuzz.constant FA.Vine
        -- , Fuzz.constant FA.VK
        -- , Fuzz.constant FA.Vnv
        -- , Fuzz.constant FA.Vuejs
        -- , Fuzz.constant FA.Weibo
        -- , Fuzz.constant FA.Weixin
        -- , Fuzz.constant FA.WhatsApp
        -- , Fuzz.constant FA.WhatsAppSquare
        -- , Fuzz.constant FA.WHMCS
        -- , Fuzz.constant FA.Wikipedia
        -- , Fuzz.constant FA.Windows
        -- , Fuzz.constant FA.WordPress
        -- , Fuzz.constant FA.WordPressSimple
        -- , Fuzz.constant FA.WPBeginner
        -- , Fuzz.constant FA.WPExplorer
        -- , Fuzz.constant FA.WPForms
        -- , Fuzz.constant FA.Xbox
        -- , Fuzz.constant FA.XING
        -- , Fuzz.constant FA.XINGSquare
        -- , Fuzz.constant FA.YCombinator
        -- , Fuzz.constant FA.Yahoo
        -- , Fuzz.constant FA.Yandex
        -- , Fuzz.constant FA.YandexInternational
        -- , Fuzz.constant FA.Yelp
        -- , Fuzz.constant FA.Yoast
        -- , Fuzz.constant FA.YouTube
        -- , Fuzz.constant FA.YouTubeSquare
        ]


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


htmlTagFuzzer : Fuzz.Fuzzer (Maybe FA.Attribute)
htmlTagFuzzer =
    let
        fuzzer =
            Fuzz.oneOf
                [ Fuzz.constant FA.I
                , Fuzz.constant FA.Span
                ]
    in
        Fuzz.map FA.HtmlTag fuzzer
            |> Fuzz.maybe


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
                , htmlTagFuzzer
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


testIconHelper :
    String
    -> List (Html.Attribute msg)
    -> (Query.Single msg -> Expect.Expectation)
    -> Test
testIconHelper desc htmlAttributes expectation =
    Test.fuzz3 iconFuzzer styleFuzzer attributesFuzzer desc <|
        \icon style attributes ->
            FA.iconWithOptions icon
                style
                attributes
                htmlAttributes
                |> Query.fromHtml
                |> Expect.all
                    [ testIconClass icon
                    , testStyle style
                    , testBorder attributes
                    , testWidth attributes
                    , testHtmlTag attributes
                    , testAnimation attributes
                    , testPull attributes
                    , testSize attributes
                    , testTransform attributes
                    , testMask attributes
                    , expectation
                    ]


testLogoHelper :
    String
    -> List (Html.Attribute msg)
    -> (Query.Single msg -> Expect.Expectation)
    -> Test
testLogoHelper desc htmlAttributes expectation =
    Test.fuzz2 logoFuzzer attributesFuzzer desc <|
        \logo attributes ->
            FA.logoWithOptions logo
                attributes
                htmlAttributes
                |> Query.fromHtml
                |> Expect.all
                    [ testLogoClass logo
                    , testBorder attributes
                    , testWidth attributes
                    , testHtmlTag attributes
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


isHtmlTag : FA.Attribute -> Bool
isHtmlTag attribute =
    case attribute of
        FA.HtmlTag _ ->
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


logoClass : FA.Logo -> String
logoClass logo =
    "fa-" ++ logoName logo


name : FA.Icon -> String
name icon =
    case icon of
        FA.AddressBook ->
            "address-book"

        FA.AddressCard ->
            "address-card"

        FA.Adjust ->
            "adjust"

        FA.AlarmClock ->
            "alarm-clock"

        FA.AlignCenter ->
            "align-center"

        FA.AlignJustify ->
            "align-justify"

        FA.AlignLeft ->
            "align-left"

        FA.AlignRight ->
            "align-right"

        FA.Ambulance ->
            "ambulance"

        FA.AmericanSignLanguageInterpreting ->
            "american-sign-language-interpreting"

        FA.Anchor ->
            "anchor"

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

        FA.ArrowAltDown ->
            "arrow-alt-down"

        FA.ArrowAltFromBottom ->
            "arrow-alt-from-bottom"

        FA.ArrowAltFromLeft ->
            "arrow-alt-from-left"

        FA.ArrowAltFromRight ->
            "arrow-alt-from-right"

        FA.ArrowAltFromTop ->
            "arrow-alt-from-top"

        FA.ArrowAltLeft ->
            "arrow-alt-left"

        FA.ArrowAltRight ->
            "arrow-alt-right"

        FA.ArrowAltSquareDown ->
            "arrow-alt-square-down"

        FA.ArrowAltSquareLeft ->
            "arrow-alt-square-left"

        FA.ArrowAltSquareRight ->
            "arrow-alt-square-right"

        FA.ArrowAltSquareUp ->
            "arrow-alt-square-up"

        FA.ArrowAltToBottom ->
            "arrow-alt-to-bottom"

        FA.ArrowAltToLeft ->
            "arrow-alt-to-left"

        FA.ArrowAltToRight ->
            "arrow-alt-to-right"

        FA.ArrowAltToTop ->
            "arrow-alt-to-top"

        FA.ArrowAltUp ->
            "arrow-alt-up"

        FA.ArrowCircleDown ->
            "arrow-circle-down"

        FA.ArrowCircleLeft ->
            "arrow-circle-left"

        FA.ArrowCircleRight ->
            "arrow-circle-right"

        FA.ArrowCircleUp ->
            "arrow-circle-up"

        FA.ArrowDown ->
            "arrow-down"

        FA.ArrowFromBottom ->
            "arrow-from-bottom"

        FA.ArrowFromLeft ->
            "arrow-from-left"

        FA.ArrowFromRight ->
            "arrow-from-right"

        FA.ArrowFromTop ->
            "arrow-from-top"

        FA.ArrowLeft ->
            "arrow-left"

        FA.ArrowRight ->
            "arrow-right"

        FA.ArrowSquareDown ->
            "arrow-square-down"

        FA.ArrowSquareLeft ->
            "arrow-square-left"

        FA.ArrowSquareRight ->
            "arrow-square-right"

        FA.ArrowSquareUp ->
            "arrow-square-up"

        FA.ArrowToBottom ->
            "arrow-to-bottom"

        FA.ArrowToLeft ->
            "arrow-to-left"

        FA.ArrowToRight ->
            "arrow-to-right"

        FA.ArrowToTop ->
            "arrow-to-top"

        FA.ArrowUp ->
            "arrow-up"

        FA.Arrows ->
            "arrows"

        FA.ArrowsAlt ->
            "arrows-alt"

        FA.ArrowsAltHorizontal ->
            "arrows-alt-h"

        FA.ArrowsAltVertical ->
            "arrows-alt-v"

        FA.ArrowsHorizontal ->
            "arrows-h"

        FA.ArrowsVertical ->
            "arrows-v"

        FA.AssistiveListeningSystems ->
            "assistive-listening-systems"

        FA.Asterisk ->
            "asterisk"

        FA.At ->
            "at"

        FA.AudioDescription ->
            "audio-description"

        FA.Backward ->
            "backward"

        FA.Badge ->
            "badge"

        FA.BadgeCheck ->
            "badge-check"

        FA.BalanceScale ->
            "balance-scale"

        FA.Ban ->
            "ban"

        FA.Barcode ->
            "barcode"

        FA.Bars ->
            "bars"

        FA.Bath ->
            "bath"

        FA.BatteryBolt ->
            "battery-bolt"

        FA.BatteryEmpty ->
            "battery-empty"

        FA.BatteryFull ->
            "battery-full"

        FA.BatteryHalf ->
            "battery-half"

        FA.BatteryQuarter ->
            "battery-quarter"

        FA.BatterySlash ->
            "battery-slash"

        FA.BatteryThreeQuarters ->
            "battery-three-quarters"

        FA.Bed ->
            "bed"

        FA.Beer ->
            "beer"

        FA.Bell ->
            "bell"

        FA.BellSlash ->
            "bell-slash"

        FA.Bicycle ->
            "bicycle"

        FA.Binoculars ->
            "binoculars"

        FA.BirthdayCake ->
            "birthday-cake"

        FA.Blind ->
            "blind"

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

        FA.Browser ->
            "browser"

        FA.Bug ->
            "bug"

        FA.Building ->
            "building"

        FA.Bullhorn ->
            "bullhorn"

        FA.Bullseye ->
            "bullseye"

        FA.Bus ->
            "bus"

        FA.Calculator ->
            "calculator"

        FA.Calendar ->
            "calendar"

        FA.CalendarAlt ->
            "calendar-alt"

        FA.CalendarCheck ->
            "calendar-check"

        FA.CalendarEdit ->
            "calendar-edit"

        FA.CalendarExclamation ->
            "calendar-exclamation"

        FA.CalendarMinus ->
            "calendar-minus"

        FA.CalendarPlus ->
            "calendar-plus"

        FA.CalendarTimes ->
            "calendar-times"

        FA.Camera ->
            "camera"

        FA.CameraAlt ->
            "camera-alt"

        FA.CameraRetro ->
            "camera-retro"

        FA.Car ->
            "car"

        FA.CaretCircleDown ->
            "caret-circle-down"

        FA.CaretCircleLeft ->
            "caret-circle-left"

        FA.CaretCircleRight ->
            "caret-circle-right"

        FA.CaretCircleUp ->
            "caret-circle-up"

        FA.CaretDown ->
            "caret-down"

        FA.CaretLeft ->
            "caret-left"

        FA.CaretRight ->
            "caret-right"

        FA.CaretSquareDown ->
            "caret-square-down"

        FA.CaretSquareLeft ->
            "caret-square-left"

        FA.CaretSquareRight ->
            "caret-square-right"

        FA.CaretSquareUp ->
            "caret-square-up"

        FA.CaretUp ->
            "caret-up"

        FA.CartArrowDown ->
            "cart-arrow-down"

        FA.CartPlus ->
            "cart-plus"

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

        FA.ChevronDoubleDown ->
            "chevron-double-down"

        FA.ChevronDoubleLeft ->
            "chevron-double-left"

        FA.ChevronDoubleRight ->
            "chevron-double-right"

        FA.ChevronDoubleUp ->
            "chevron-double-up"

        FA.ChevronDown ->
            "chevron-down"

        FA.ChevronLeft ->
            "chevron-left"

        FA.ChevronRight ->
            "chevron-right"

        FA.ChevronSquareDown ->
            "chevron-square-down"

        FA.ChevronSquareLeft ->
            "chevron-square-left"

        FA.ChevronSquareRight ->
            "chevron-square-right"

        FA.ChevronSquareUp ->
            "chevron-square-up"

        FA.ChevronUp ->
            "chevron-up"

        FA.Child ->
            "child"

        FA.Circle ->
            "circle"

        FA.CircleNotch ->
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

        FA.CloudDownload ->
            "cloud-download"

        FA.CloudDownloadAlt ->
            "cloud-download-alt"

        FA.CloudUpload ->
            "cloud-upload"

        FA.CloudUploadAlt ->
            "cloud-upload-alt"

        FA.Club ->
            "club"

        FA.Code ->
            "code"

        FA.CodeBranch ->
            "code-branch"

        FA.CodeCommit ->
            "code-commit"

        FA.CodeMerge ->
            "code-merge"

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

        FA.CompressAlt ->
            "compress-alt"

        FA.CompressWide ->
            "compress-wide"

        FA.Copy ->
            "copy"

        FA.Copyright ->
            "copyright"

        FA.CreditCard ->
            "credit-card"

        FA.CreditCardBlank ->
            "credit-card-blank"

        FA.CreditCardFront ->
            "credit-card-front"

        FA.Crop ->
            "crop"

        FA.Crosshairs ->
            "crosshairs"

        FA.Cube ->
            "cube"

        FA.Cubes ->
            "cubes"

        FA.Cut ->
            "cut"

        FA.Database ->
            "database"

        FA.Deaf ->
            "deaf"

        FA.Desktop ->
            "desktop"

        FA.DesktopAlt ->
            "desktop-alt"

        FA.Diamond ->
            "diamond"

        FA.DollarSign ->
            "dollar-sign"

        FA.DotCircle ->
            "dot-circle"

        FA.Download ->
            "download"

        FA.Edit ->
            "edit"

        FA.Eject ->
            "eject"

        FA.EllipsisHorizontal ->
            "ellipsis-h"

        FA.EllipsisHorizontalAlt ->
            "ellipsis-h-alt"

        FA.EllipsisVertical ->
            "ellipsis-v"

        FA.EllipsisVerticalAlt ->
            "ellipsis-v-alt"

        FA.Envelope ->
            "envelope"

        FA.EnvelopeOpen ->
            "envelope-open"

        FA.EnvelopeSquare ->
            "envelope-square"

        FA.Eraser ->
            "eraser"

        FA.EuroSign ->
            "euro-sign"

        FA.Exchange ->
            "exchange"

        FA.ExchangeAlt ->
            "exchange-alt"

        FA.Exclamation ->
            "exclamation"

        FA.ExclamationCircle ->
            "exclamation-circle"

        FA.ExclamationSquare ->
            "exclamation-square"

        FA.ExclamationTriangle ->
            "exclamation-triangle"

        FA.Expand ->
            "expand"

        FA.ExpandAlt ->
            "expand-alt"

        FA.ExpandArrows ->
            "expand-arrows"

        FA.ExpandArrowsAlt ->
            "expand-arrows-alt"

        FA.ExpandWide ->
            "expand-wide"

        FA.ExternalLink ->
            "external-link"

        FA.ExternalLinkAlt ->
            "external-link-alt"

        FA.ExternalLinkSquare ->
            "external-link-square"

        FA.ExternalLinkSquareAlt ->
            "external-link-square-alt"

        FA.Eye ->
            "eye"

        FA.EyeDropper ->
            "eye-dropper"

        FA.EyeSlash ->
            "eye-slash"

        FA.FastBackward ->
            "fast-backward"

        FA.FastForward ->
            "fast-forward"

        FA.Fax ->
            "fax"

        FA.Female ->
            "female"

        FA.FighterJet ->
            "fighter-jet"

        FA.File ->
            "file"

        FA.FileAlt ->
            "file-alt"

        FA.FileArchive ->
            "file-archive"

        FA.FileAudio ->
            "file-audio"

        FA.FileCheck ->
            "file-check"

        FA.FileCode ->
            "file-code"

        FA.FileEdit ->
            "file-edit"

        FA.FileExcel ->
            "file-excel"

        FA.FileExclamation ->
            "file-exclamation"

        FA.FileImage ->
            "file-image"

        FA.FileMinus ->
            "file-minus"

        FA.FilePdf ->
            "file-pdf"

        FA.FilePlus ->
            "file-plus"

        FA.FilePowerpoint ->
            "file-powerpoint"

        FA.FileTimes ->
            "file-times"

        FA.FileVideo ->
            "file-video"

        FA.FileWord ->
            "file-word"

        FA.Film ->
            "film"

        FA.FilmAlt ->
            "film-alt"

        FA.Filter ->
            "filter"

        FA.Fire ->
            "fire"

        FA.FireExtinguisher ->
            "fire-extinguisher"

        FA.Flag ->
            "flag"

        FA.FlagCheckered ->
            "flag-checkered"

        FA.Flask ->
            "flask"

        FA.Folder ->
            "folder"

        FA.FolderOpen ->
            "folder-open"

        FA.Font ->
            "font"

        FA.Forward ->
            "forward"

        FA.Frown ->
            "frown"

        FA.Futbol ->
            "futbol"

        FA.Gamepad ->
            "gamepad"

        FA.Gavel ->
            "gavel"

        FA.Gem ->
            "gem"

        FA.Genderless ->
            "genderless"

        FA.Gift ->
            "gift"

        FA.GlassMartini ->
            "glass-martini"

        FA.Globe ->
            "globe"

        FA.GraduationCap ->
            "graduation-cap"

        FA.HSquare ->
            "h-square"

        FA.H1 ->
            "h1"

        FA.H2 ->
            "h2"

        FA.H3 ->
            "h3"

        FA.HandLizard ->
            "hand-lizard"

        FA.HandPaper ->
            "hand-paper"

        FA.HandPeace ->
            "hand-peace"

        FA.HandPointDown ->
            "hand-point-down"

        FA.HandPointLeft ->
            "hand-point-left"

        FA.HandPointRight ->
            "hand-point-right"

        FA.HandPointUp ->
            "hand-point-up"

        FA.HandPointer ->
            "hand-pointer"

        FA.HandRock ->
            "hand-rock"

        FA.HandScissors ->
            "hand-scissors"

        FA.HandSpock ->
            "hand-spock"

        FA.Handshake ->
            "handshake"

        FA.Hashtag ->
            "hashtag"

        FA.Hdd ->
            "hdd"

        FA.Heading ->
            "heading"

        FA.Headphones ->
            "headphones"

        FA.Heart ->
            "heart"

        FA.Heartbeat ->
            "heartbeat"

        FA.Hexagon ->
            "hexagon"

        FA.History ->
            "history"

        FA.Home ->
            "home"

        FA.Hospital ->
            "hospital"

        FA.Hourglass ->
            "hourglass"

        FA.HourglassEnd ->
            "hourglass-end"

        FA.HourglassHalf ->
            "hourglass-half"

        FA.HourglassStart ->
            "hourglass-start"

        FA.ICursor ->
            "i-cursor"

        FA.IdBadge ->
            "id-badge"

        FA.IdCard ->
            "id-card"

        FA.Image ->
            "image"

        FA.Images ->
            "images"

        FA.Inbox ->
            "inbox"

        FA.InboxIn ->
            "inbox-in"

        FA.InboxOut ->
            "inbox-out"

        FA.Indent ->
            "indent"

        FA.Industry ->
            "industry"

        FA.IndustryAlt ->
            "industry-alt"

        FA.Info ->
            "info"

        FA.InfoCircle ->
            "info-circle"

        FA.InfoSquare ->
            "info-square"

        FA.Italic ->
            "italic"

        FA.JackOLantern ->
            "jack-o-lantern"

        FA.Key ->
            "key"

        FA.Keyboard ->
            "keyboard"

        FA.Language ->
            "language"

        FA.Laptop ->
            "laptop"

        FA.Leaf ->
            "leaf"

        FA.Lemon ->
            "lemon"

        FA.LevelDown ->
            "level-down"

        FA.LevelDownAlt ->
            "level-down-alt"

        FA.LevelUp ->
            "level-up"

        FA.LevelUpAlt ->
            "level-up-alt"

        FA.LifeRing ->
            "life-ring"

        FA.Lightbulb ->
            "lightbulb"

        FA.Link ->
            "link"

        FA.LiraSign ->
            "lira-sign"

        FA.List ->
            "list"

        FA.ListAlt ->
            "list-alt"

        FA.ListOl ->
            "list-ol"

        FA.ListUl ->
            "list-ul"

        FA.LocationArrow ->
            "location-arrow"

        FA.Lock ->
            "lock"

        FA.LockAlt ->
            "lock-alt"

        FA.LockOpen ->
            "lock-open"

        FA.LockOpenAlt ->
            "lock-open-alt"

        FA.LongArrowAltDown ->
            "long-arrow-alt-down"

        FA.LongArrowAltLeft ->
            "long-arrow-alt-left"

        FA.LongArrowAltRight ->
            "long-arrow-alt-right"

        FA.LongArrowAltUp ->
            "long-arrow-alt-up"

        FA.LongArrowDown ->
            "long-arrow-down"

        FA.LongArrowLeft ->
            "long-arrow-left"

        FA.LongArrowRight ->
            "long-arrow-right"

        FA.LongArrowUp ->
            "long-arrow-up"

        FA.LowVision ->
            "low-vision"

        FA.Magic ->
            "magic"

        FA.Magnet ->
            "magnet"

        FA.Male ->
            "male"

        FA.Map ->
            "map"

        FA.MapMarker ->
            "map-marker"

        FA.MapMarkerAlt ->
            "map-marker-alt"

        FA.MapPin ->
            "map-pin"

        FA.MapSigns ->
            "map-signs"

        FA.Mars ->
            "mars"

        FA.MarsDouble ->
            "mars-double"

        FA.MarsStroke ->
            "mars-stroke"

        FA.MarsStrokeHorizontal ->
            "mars-stroke-h"

        FA.MarsStrokeVertical ->
            "mars-stroke-v"

        FA.Medkit ->
            "medkit"

        FA.Meh ->
            "meh"

        FA.Mercury ->
            "mercury"

        FA.Microchip ->
            "microchip"

        FA.Microphone ->
            "microphone"

        FA.MicrophoneAlt ->
            "microphone-alt"

        FA.MicrophoneSlash ->
            "microphone-slash"

        FA.Minus ->
            "minus"

        FA.MinusCircle ->
            "minus-circle"

        FA.MinusHexagon ->
            "minus-hexagon"

        FA.MinusOctagon ->
            "minus-octagon"

        FA.MinusSquare ->
            "minus-square"

        FA.Mobile ->
            "mobile"

        FA.MobileAlt ->
            "mobile-alt"

        FA.MobileAndroid ->
            "mobile-android"

        FA.MobileAndroidAlt ->
            "mobile-android-alt"

        FA.MoneyBill ->
            "money-bill"

        FA.MoneyBillAlt ->
            "money-bill-alt"

        FA.Moon ->
            "moon"

        FA.Motorcycle ->
            "motorcycle"

        FA.MousePointer ->
            "mouse-pointer"

        FA.Music ->
            "music"

        FA.Neuter ->
            "neuter"

        FA.Newspaper ->
            "newspaper"

        FA.ObjectGroup ->
            "object-group"

        FA.ObjectUngroup ->
            "object-ungroup"

        FA.Octagon ->
            "octagon"

        FA.Outdent ->
            "outdent"

        FA.PaintBrush ->
            "paint-brush"

        FA.PaperPlane ->
            "paper-plane"

        FA.Paperclip ->
            "paperclip"

        FA.Paragraph ->
            "paragraph"

        FA.Paste ->
            "paste"

        FA.Pause ->
            "pause"

        FA.PauseCircle ->
            "pause-circle"

        FA.Paw ->
            "paw"

        FA.Pen ->
            "pen"

        FA.PenAlt ->
            "pen-alt"

        FA.PenSquare ->
            "pen-square"

        FA.Pencil ->
            "pencil"

        FA.PencilAlt ->
            "pencil-alt"

        FA.Percent ->
            "percent"

        FA.Phone ->
            "phone"

        FA.PhoneSlash ->
            "phone-slash"

        FA.PhoneSquare ->
            "phone-square"

        FA.PhoneVolume ->
            "phone-volume"

        FA.Plane ->
            "plane"

        FA.PlaneAlt ->
            "plane-alt"

        FA.Play ->
            "play"

        FA.PlayCircle ->
            "play-circle"

        FA.Plug ->
            "plug"

        FA.Plus ->
            "plus"

        FA.PlusCircle ->
            "plus-circle"

        FA.PlusHexagon ->
            "plus-hexagon"

        FA.PlusOctagon ->
            "plus-octagon"

        FA.PlusSquare ->
            "plus-square"

        FA.Podcast ->
            "podcast"

        FA.Poo ->
            "poo"

        FA.Portrait ->
            "portrait"

        FA.PoundSign ->
            "pound-sign"

        FA.PowerOff ->
            "power-off"

        FA.Print ->
            "print"

        FA.PuzzlePiece ->
            "puzzle-piece"

        FA.Qrcode ->
            "qrcode"

        FA.Question ->
            "question"

        FA.QuestionCircle ->
            "question-circle"

        FA.QuestionSquare ->
            "question-square"

        FA.QuoteLeft ->
            "quote-left"

        FA.QuoteRight ->
            "quote-right"

        FA.Random ->
            "random"

        FA.RectangleLandscape ->
            "rectangle-landscape"

        FA.RectanglePortrait ->
            "rectangle-portrait"

        FA.RectangleWide ->
            "rectangle-wide"

        FA.Recycle ->
            "recycle"

        FA.Redo ->
            "redo"

        FA.RedoAlt ->
            "redo-alt"

        FA.Registered ->
            "registered"

        FA.Repeat ->
            "repeat"

        FA.Repeat1 ->
            "repeat-1"

        FA.Repeat1Alt ->
            "repeat-1-alt"

        FA.RepeatAlt ->
            "repeat-alt"

        FA.Reply ->
            "reply"

        FA.ReplyAll ->
            "reply-all"

        FA.Retweet ->
            "retweet"

        FA.RetweetAlt ->
            "retweet-alt"

        FA.Road ->
            "road"

        FA.Rocket ->
            "rocket"

        FA.RSS ->
            "rss"

        FA.RSSSquare ->
            "rss-square"

        FA.RubleSign ->
            "ruble-sign"

        FA.RupeeSign ->
            "rupee-sign"

        FA.Save ->
            "save"

        FA.Scrubber ->
            "scrubber"

        FA.Search ->
            "search"

        FA.SearchMinus ->
            "search-minus"

        FA.SearchPlus ->
            "search-plus"

        FA.Server ->
            "server"

        FA.Share ->
            "share"

        FA.ShareAll ->
            "share-all"

        FA.ShareAlt ->
            "share-alt"

        FA.ShareAltSquare ->
            "share-alt-square"

        FA.ShareSquare ->
            "share-square"

        FA.ShekelSign ->
            "shekel-sign"

        FA.Shield ->
            "shield"

        FA.ShieldAlt ->
            "shield-alt"

        FA.ShieldCheck ->
            "shield-check"

        FA.Ship ->
            "ship"

        FA.ShoppingBag ->
            "shopping-bag"

        FA.ShoppingBasket ->
            "shopping-basket"

        FA.ShoppingCart ->
            "shopping-cart"

        FA.Shower ->
            "shower"

        FA.SignIn ->
            "sign-in"

        FA.SignInAlt ->
            "sign-in-alt"

        FA.SignLanguage ->
            "sign-language"

        FA.SignOut ->
            "sign-out"

        FA.SignOutAlt ->
            "sign-out-alt"

        FA.Signal ->
            "signal"

        FA.Sitemap ->
            "sitemap"

        FA.SlidersHorizontal ->
            "sliders-h"

        FA.SlidersHorizontalSquare ->
            "sliders-h-square"

        FA.SlidersV ->
            "sliders-v"

        FA.SlidersVSquare ->
            "sliders-v-square"

        FA.Smile ->
            "smile"

        FA.Snowflake ->
            "snowflake"

        FA.Sort ->
            "sort"

        FA.SortAlphaDown ->
            "sort-alpha-down"

        FA.SortAlphaUp ->
            "sort-alpha-up"

        FA.SortAmountDown ->
            "sort-amount-down"

        FA.SortAmountUp ->
            "sort-amount-up"

        FA.SortDown ->
            "sort-down"

        FA.SortNumericDown ->
            "sort-numeric-down"

        FA.SortNumericUp ->
            "sort-numeric-up"

        FA.SortUp ->
            "sort-up"

        FA.SpaceShuttle ->
            "space-shuttle"

        FA.Spade ->
            "spade"

        FA.Spinner ->
            "spinner"

        FA.SpinnerThird ->
            "spinner-third"

        FA.Square ->
            "square"

        FA.Star ->
            "star"

        FA.StarExclamation ->
            "star-exclamation"

        FA.StarHalf ->
            "star-half"

        FA.StepBackward ->
            "step-backward"

        FA.StepForward ->
            "step-forward"

        FA.Stethoscope ->
            "stethoscope"

        FA.StickyNote ->
            "sticky-note"

        FA.Stop ->
            "stop"

        FA.StopCircle ->
            "stop-circle"

        FA.Stopwatch ->
            "stopwatch"

        FA.StreetView ->
            "street-view"

        FA.Strikethrough ->
            "strikethrough"

        FA.Subscript ->
            "subscript"

        FA.Subway ->
            "subway"

        FA.Suitcase ->
            "suitcase"

        FA.Sun ->
            "sun"

        FA.Superscript ->
            "superscript"

        FA.Sync ->
            "sync"

        FA.SyncAlt ->
            "sync-alt"

        FA.Table ->
            "table"

        FA.Tablet ->
            "tablet"

        FA.TabletAlt ->
            "tablet-alt"

        FA.TabletAndroid ->
            "tablet-android"

        FA.TabletAndroidAlt ->
            "tablet-android-alt"

        FA.Tachometer ->
            "tachometer"

        FA.TachometerAlt ->
            "tachometer-alt"

        FA.Tag ->
            "tag"

        FA.Tags ->
            "tags"

        FA.Tasks ->
            "tasks"

        FA.Taxi ->
            "taxi"

        FA.Terminal ->
            "terminal"

        FA.TextHeight ->
            "text-height"

        FA.TextWidth ->
            "text-width"

        FA.Th ->
            "th"

        FA.ThLarge ->
            "th-large"

        FA.ThList ->
            "th-list"

        FA.ThermometerEmpty ->
            "thermometer-empty"

        FA.ThermometerFull ->
            "thermometer-full"

        FA.ThermometerHalf ->
            "thermometer-half"

        FA.ThermometerQuarter ->
            "thermometer-quarter"

        FA.ThermometerThreeQuarters ->
            "thermometer-three-quarters"

        FA.ThumbsDown ->
            "thumbs-down"

        FA.ThumbsUp ->
            "thumbs-up"

        FA.Thumbtack ->
            "thumbtack"

        FA.Ticket ->
            "ticket"

        FA.TicketAlt ->
            "ticket-alt"

        FA.Times ->
            "times"

        FA.TimesCircle ->
            "times-circle"

        FA.TimesHexagon ->
            "times-hexagon"

        FA.TimesOctagon ->
            "times-octagon"

        FA.TimesSquare ->
            "times-square"

        FA.Tint ->
            "tint"

        FA.ToggleOff ->
            "toggle-off"

        FA.ToggleOn ->
            "toggle-on"

        FA.Trademark ->
            "trademark"

        FA.Train ->
            "train"

        FA.Transgender ->
            "transgender"

        FA.TransgenderAlt ->
            "transgender-alt"

        FA.Trash ->
            "trash"

        FA.TrashAlt ->
            "trash-alt"

        FA.Tree ->
            "tree"

        FA.TreeAlt ->
            "tree-alt"

        FA.Triangle ->
            "triangle"

        FA.Trophy ->
            "trophy"

        FA.TrophyAlt ->
            "trophy-alt"

        FA.Truck ->
            "truck"

        FA.TTY ->
            "tty"

        FA.TV ->
            "tv"

        FA.TVRetro ->
            "tv-retro"

        FA.Umbrella ->
            "umbrella"

        FA.Underline ->
            "underline"

        FA.Undo ->
            "undo"

        FA.UndoAlt ->
            "undo-alt"

        FA.UniversalAccess ->
            "universal-access"

        FA.University ->
            "university"

        FA.Unlink ->
            "unlink"

        FA.Unlock ->
            "unlock"

        FA.UnlockAlt ->
            "unlock-alt"

        FA.Upload ->
            "upload"

        FA.UsdCircle ->
            "usd-circle"

        FA.UsdSquare ->
            "usd-square"

        FA.User ->
            "user"

        FA.UserAlt ->
            "user-alt"

        FA.UserCircle ->
            "user-circle"

        FA.UserMd ->
            "user-md"

        FA.UserPlus ->
            "user-plus"

        FA.UserSecret ->
            "user-secret"

        FA.UserTimes ->
            "user-times"

        FA.Users ->
            "users"

        FA.UtensilFork ->
            "utensil-fork"

        FA.UtensilKnife ->
            "utensil-knife"

        FA.UtensilSpoon ->
            "utensil-spoon"

        FA.Utensils ->
            "utensils"

        FA.UtensilsAlt ->
            "utensils-alt"

        FA.Venus ->
            "venus"

        FA.VenusDouble ->
            "venus-double"

        FA.VenusMars ->
            "venus-mars"

        FA.Video ->
            "video"

        FA.VolumeDown ->
            "volume-down"

        FA.VolumeMute ->
            "volume-mute"

        FA.VolumeOff ->
            "volume-off"

        FA.VolumeUp ->
            "volume-up"

        FA.Watch ->
            "watch"

        FA.Wheelchair ->
            "wheelchair"

        FA.Wifi ->
            "wifi"

        FA.Window ->
            "window"

        FA.WindowAlt ->
            "window-alt"

        FA.WindowClose ->
            "window-close"

        FA.WindowMaximize ->
            "window-maximize"

        FA.WindowMinimize ->
            "window-minimize"

        FA.WindowRestore ->
            "window-restore"

        FA.WonSign ->
            "won-sign"

        FA.Wrench ->
            "wrench"

        FA.YenSign ->
            "yen-sign"


logoName : FA.Logo -> String
logoName logo =
    case logo of
        FA.FiveHundredPx ->
            "500px"

        FA.AccessibleIcon ->
            "accessible-icon"

        FA.Accusoft ->
            "accusoft"

        FA.Adn ->
            "adn"

        FA.Adversal ->
            "adversal"

        FA.AffiliateTheme ->
            "affiliatetheme"

        FA.Algolia ->
            "algolia"

        FA.Amazon ->
            "amazon"

        FA.AmazonPay ->
            "amazon-pay"

        FA.Amilia ->
            "amilia"

        FA.Android ->
            "android"

        FA.AngelList ->
            "angellist"

        FA.AngryCreative ->
            "angrycreative"

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

        FA.Asymmetrik ->
            "asymmetrik"

        FA.Audible ->
            "audible"

        FA.Autoprefixer ->
            "autoprefixer"

        FA.Avianex ->
            "avianex"

        FA.Aviato ->
            "aviato"

        FA.Aws ->
            "aws"

        FA.Bandcamp ->
            "bandcamp"

        FA.Behance ->
            "behance"

        FA.BehanceSquare ->
            "behance-square"

        FA.BIMobject ->
            "bimobject"

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

        FA.Blogger ->
            "blogger"

        FA.BloggerB ->
            "blogger-b"

        FA.Bluetooth ->
            "bluetooth"

        FA.BluetoothB ->
            "bluetooth-b"

        FA.Btc ->
            "btc"

        FA.BuromobelExperte ->
            "buromobelexperte"

        FA.BuySellAds ->
            "buysellads"

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

        FA.CCJcb ->
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

        FA.Chrome ->
            "chrome"

        FA.CloudScale ->
            "cloudscale"

        FA.Cloudsmith ->
            "cloudsmith"

        FA.Cloudversify ->
            "cloudversify"

        FA.CodePen ->
            "codepen"

        FA.CodiePie ->
            "codiepie"

        FA.ConnectDevelop ->
            "connectdevelop"

        FA.Contao ->
            "contao"

        FA.Cpanel ->
            "cpanel"

        FA.CreativeCommons ->
            "creative-commons"

        FA.CSS3 ->
            "css3"

        FA.CSS3Alt ->
            "css3-alt"

        FA.Cuttlefish ->
            "cuttlefish"

        FA.DAndD ->
            "d-and-d"

        FA.Dashcube ->
            "dashcube"

        FA.Delicious ->
            "delicious"

        FA.DeployDog ->
            "deploydog"

        FA.Deskpro ->
            "deskpro"

        FA.DeviantArt ->
            "deviantart"

        FA.Digg ->
            "digg"

        FA.DigitalOcean ->
            "digital-ocean"

        FA.Discord ->
            "discord"

        FA.Discourse ->
            "discourse"

        FA.DocHub ->
            "dochub"

        FA.Docker ->
            "docker"

        FA.Draft2Digital ->
            "draft2digital"

        FA.Dribbble ->
            "dribbble"

        FA.DribbbleSquare ->
            "dribbble-square"

        FA.Dropbox ->
            "dropbox"

        FA.Drupal ->
            "drupal"

        FA.Dyalog ->
            "dyalog"

        FA.EarlyBirds ->
            "earlybirds"

        FA.Edge ->
            "edge"

        FA.Elementor ->
            "elementor"

        FA.Ember ->
            "ember"

        FA.Empire ->
            "empire"

        FA.Envira ->
            "envira"

        FA.Erlang ->
            "erlang"

        FA.Ethereum ->
            "ethereum"

        FA.Etsy ->
            "etsy"

        FA.ExpeditedSSL ->
            "expeditedssl"

        FA.Facebook ->
            "facebook"

        FA.FacebookF ->
            "facebook-f"

        FA.FacebookMessenger ->
            "facebook-messenger"

        FA.FacebookSquare ->
            "facebook-square"

        FA.Firefox ->
            "firefox"

        FA.FirstOrder ->
            "first-order"

        FA.FirstDraft ->
            "firstdraft"

        FA.Flickr ->
            "flickr"

        FA.Fly ->
            "fly"

        FA.FontAwesome ->
            "font-awesome"

        FA.FontAwesomeAlt ->
            "font-awesome-alt"

        FA.FontAwesomeFlag ->
            "font-awesome-flag"

        FA.FontIcons ->
            "fonticons"

        FA.FontIconsFi ->
            "fonticons-fi"

        FA.FortAwesome ->
            "fort-awesome"

        FA.FortAwesomeAlt ->
            "fort-awesome-alt"

        FA.Forumbee ->
            "forumbee"

        FA.Foursquare ->
            "foursquare"

        FA.FreeCodeCamp ->
            "free-code-camp"

        FA.FreeBSD ->
            "freebsd"

        FA.GetPocket ->
            "get-pocket"

        FA.GG ->
            "gg"

        FA.GGCircle ->
            "gg-circle"

        FA.Git ->
            "git"

        FA.GitSquare ->
            "git-square"

        FA.GitHub ->
            "github"

        FA.GitHubAlt ->
            "github-alt"

        FA.GitHubSquare ->
            "github-square"

        FA.GitKraken ->
            "gitkraken"

        FA.GitLab ->
            "gitlab"

        FA.Gitter ->
            "gitter"

        FA.Glide ->
            "glide"

        FA.GlideG ->
            "glide-g"

        FA.Gofore ->
            "gofore"

        FA.Goodreads ->
            "goodreads"

        FA.GoodreadsG ->
            "goodreads-g"

        FA.Google ->
            "google"

        FA.GoogleDrive ->
            "google-drive"

        FA.GooglePlay ->
            "google-play"

        FA.GooglePlus ->
            "google-plus"

        FA.GooglePlusG ->
            "google-plus-g"

        FA.GooglePlusSquare ->
            "google-plus-square"

        FA.GoogleWallet ->
            "google-wallet"

        FA.Gratipay ->
            "gratipay"

        FA.Grav ->
            "grav"

        FA.Gripfire ->
            "gripfire"

        FA.Grunt ->
            "grunt"

        FA.Gulp ->
            "gulp"

        FA.HackerNews ->
            "hacker-news"

        FA.HackerNewsSquare ->
            "hacker-news-square"

        FA.HireAHelper ->
            "hire-a-helper"

        FA.Hooli ->
            "hooli"

        FA.Hotjar ->
            "hotjar"

        FA.Houzz ->
            "houzz"

        FA.Html5 ->
            "html5"

        FA.HubSpot ->
            "hubspot"

        FA.Imdb ->
            "imdb"

        FA.Instagram ->
            "instagram"

        FA.InternetExplorer ->
            "internet-explorer"

        FA.IoxHost ->
            "ioxhost"

        FA.Itunes ->
            "itunes"

        FA.ItunesNote ->
            "itunes-note"

        FA.Jenkins ->
            "jenkins"

        FA.Joget ->
            "joget"

        FA.Joomla ->
            "joomla"

        FA.Js ->
            "js"

        FA.JsSquare ->
            "js-square"

        FA.JSFiddle ->
            "jsfiddle"

        FA.KeyCDN ->
            "keycdn"

        FA.Kickstarter ->
            "kickstarter"

        FA.KickstarterK ->
            "kickstarter-k"

        FA.Korvue ->
            "korvue"

        FA.Laravel ->
            "laravel"

        FA.Lastfm ->
            "lastfm"

        FA.LastfmSquare ->
            "lastfm-square"

        FA.Leanpub ->
            "leanpub"

        FA.Less ->
            "less"

        FA.Line ->
            "line"

        FA.LinkedIn ->
            "linkedin"

        FA.LinkedInInverted ->
            "linkedin-in"

        FA.Linode ->
            "linode"

        FA.Linux ->
            "linux"

        FA.Lyft ->
            "lyft"

        FA.Magento ->
            "magento"

        FA.Maxcdn ->
            "maxcdn"

        FA.MedApps ->
            "medapps"

        FA.Medium ->
            "medium"

        FA.MediumM ->
            "medium-m"

        FA.Medrt ->
            "medrt"

        FA.Meetup ->
            "meetup"

        FA.Microsoft ->
            "microsoft"

        FA.Mix ->
            "mix"

        FA.Mixcloud ->
            "mixcloud"

        FA.Mizuni ->
            "mizuni"

        FA.MODX ->
            "modx"

        FA.Monero ->
            "monero"

        FA.Napster ->
            "napster"

        FA.NintendoSwitch ->
            "nintendo-switch"

        FA.Node ->
            "node"

        FA.Nodejs ->
            "node-js"

        FA.Npm ->
            "npm"

        FA.NS8 ->
            "ns8"

        FA.Nutritionix ->
            "nutritionix"

        FA.Odnoklassniki ->
            "odnoklassniki"

        FA.OdnoklassnikiSquare ->
            "odnoklassniki-square"

        FA.OpenCart ->
            "opencart"

        FA.OpenID ->
            "openid"

        FA.Opera ->
            "opera"

        FA.OptinMonster ->
            "optin-monster"

        FA.OpenSourceInitiative ->
            "osi"

        FA.Page4 ->
            "page4"

        FA.PageLines ->
            "pagelines"

        FA.PalFed ->
            "palfed"

        FA.Patreon ->
            "patreon"

        FA.PayPal ->
            "paypal"

        FA.Periscope ->
            "periscope"

        FA.Phabricator ->
            "phabricator"

        FA.PhoenixFramework ->
            "phoenix-framework"

        FA.PiedPiper ->
            "pied-piper"

        FA.PiedPiperAlt ->
            "pied-piper-alt"

        FA.PiedPiperPp ->
            "pied-piper-pp"

        FA.Pinterest ->
            "pinterest"

        FA.PinterestP ->
            "pinterest-p"

        FA.PinterestSquare ->
            "pinterest-square"

        FA.Playstation ->
            "playstation"

        FA.ProductHunt ->
            "product-hunt"

        FA.Pushed ->
            "pushed"

        FA.Python ->
            "python"

        FA.QQ ->
            "qq"

        FA.Quora ->
            "quora"

        FA.Ravelry ->
            "ravelry"

        FA.React ->
            "react"

        FA.Rebel ->
            "rebel"

        FA.RedRiver ->
            "red-river"

        FA.Reddit ->
            "reddit"

        FA.RedditAlien ->
            "reddit-alien"

        FA.RedditSquare ->
            "reddit-square"

        FA.Rendact ->
            "rendact"

        FA.Renren ->
            "renren"

        FA.Replyd ->
            "replyd"

        FA.Resolving ->
            "resolving"

        FA.RocketChat ->
            "rocketchat"

        FA.RockRMS ->
            "rockrms"

        FA.Safari ->
            "safari"

        FA.Sass ->
            "sass"

        FA.Schlix ->
            "schlix"

        FA.Scribd ->
            "scribd"

        FA.Searchengin ->
            "searchengin"

        FA.SellCast ->
            "sellcast"

        FA.Sellsy ->
            "sellsy"

        FA.ServiceStack ->
            "servicestack"

        FA.ShirtsInBulk ->
            "shirtsinbulk"

        FA.SimplyBuilt ->
            "simplybuilt"

        FA.Sistrix ->
            "sistrix"

        FA.SkyAtlas ->
            "skyatlas"

        FA.Skype ->
            "skype"

        FA.Slack ->
            "slack"

        FA.SlackHash ->
            "slack-hash"

        FA.Slideshare ->
            "slideshare"

        FA.Snapchat ->
            "snapchat"

        FA.SnapchatGhost ->
            "snapchat-ghost"

        FA.SnapchatSquare ->
            "snapchat-square"

        FA.SoundCloud ->
            "soundcloud"

        FA.Speakap ->
            "speakap"

        FA.Spotify ->
            "spotify"

        FA.StackExchange ->
            "stack-exchange"

        FA.StackOverflow ->
            "stack-overflow"

        FA.StayLinked ->
            "staylinked"

        FA.Steam ->
            "steam"

        FA.SteamSquare ->
            "steam-square"

        FA.SteamSymbol ->
            "steam-symbol"

        FA.StickerMule ->
            "sticker-mule"

        FA.Strava ->
            "strava"

        FA.Stripe ->
            "stripe"

        FA.StripeS ->
            "stripe-s"

        FA.StudioVinari ->
            "studiovinari"

        FA.StumbleUpon ->
            "stumbleupon"

        FA.StumbleUponCircle ->
            "stumbleupon-circle"

        FA.Superpowers ->
            "superpowers"

        FA.Supple ->
            "supple"

        FA.Telegram ->
            "telegram"

        FA.TelegramPlane ->
            "telegram-plane"

        FA.TencentWeibo ->
            "tencent-weibo"

        FA.ThemeIsle ->
            "themeisle"

        FA.Trello ->
            "trello"

        FA.TripAdvisor ->
            "tripadvisor"

        FA.Tumblr ->
            "tumblr"

        FA.TumblrSquare ->
            "tumblr-square"

        FA.Twitch ->
            "twitch"

        FA.Twitter ->
            "twitter"

        FA.TwitterSquare ->
            "twitter-square"

        FA.Typo3 ->
            "typo3"

        FA.Uber ->
            "uber"

        FA.UIkit ->
            "uikit"

        FA.Uniregistry ->
            "uniregistry"

        FA.Untappd ->
            "untappd"

        FA.USB ->
            "usb"

        FA.UsSunnah ->
            "ussunnah"

        FA.Vaadin ->
            "vaadin"

        FA.Viacoin ->
            "viacoin"

        FA.Viadeo ->
            "viadeo"

        FA.ViadeoSquare ->
            "viadeo-square"

        FA.Viber ->
            "viber"

        FA.Vimeo ->
            "vimeo"

        FA.VimeoSquare ->
            "vimeo-square"

        FA.VimeoV ->
            "vimeo-v"

        FA.Vine ->
            "vine"

        FA.VK ->
            "vk"

        FA.Vnv ->
            "vnv"

        FA.Vuejs ->
            "vuejs"

        FA.Weibo ->
            "weibo"

        FA.Weixin ->
            "weixin"

        FA.WhatsApp ->
            "whatsapp"

        FA.WhatsAppSquare ->
            "whatsapp-square"

        FA.WHMCS ->
            "whmcs"

        FA.Wikipedia ->
            "wikipedia-w"

        FA.Windows ->
            "windows"

        FA.WordPress ->
            "wordpress"

        FA.WordPressSimple ->
            "wordpress-simple"

        FA.WPBeginner ->
            "wpbeginner"

        FA.WPExplorer ->
            "wpexplorer"

        FA.WPForms ->
            "wpforms"

        FA.Xbox ->
            "xbox"

        FA.XING ->
            "xing"

        FA.XINGSquare ->
            "xing-square"

        FA.YCombinator ->
            "y-combinator"

        FA.Yahoo ->
            "yahoo"

        FA.Yandex ->
            "yandex"

        FA.YandexInternational ->
            "yandex-international"

        FA.Yelp ->
            "yelp"

        FA.Yoast ->
            "yoast"

        FA.YouTube ->
            "youtube"

        FA.YouTubeSquare ->
            "youtube-square"
