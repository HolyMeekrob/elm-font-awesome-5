module FontAwesomeTests exposing (..)

import FontAwesome.Icon as Icon exposing (Icon)
import FontAwesome as FA
import Expect
import Fuzz
import Html exposing (Attribute)
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
        , describe "iconWithOptions" testIconWithOptions
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
    [ Test.fuzzWith
        { runs = 500 }
        (Fuzz.tuple4
            ( iconFuzzer
            , styleFuzzer
            , optionsFuzzer
            , htmlAttributesFuzzer
            )
        )
        "handles all options"
      <|
        \( icon, style, options, htmlAttributes ) ->
            FA.iconWithOptions icon style options htmlAttributes
                |> Query.fromHtml
                |> Expect.all
                    [ testIconClass icon
                    , testStyle icon style
                    , testBorder options
                    , testWidth options
                    , testInvertColor options
                    , testHtmlTag options
                    , testAnimation options
                    , testPull options
                    , testSize options
                    , testTransform options
                    , testMask options
                    ]
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


testIconClass : Icon -> Query.Single msg -> Expect.Expectation
testIconClass icon =
    case icon of
        Icon.Icon name ->
            Query.has [ Selector.class ("fa-" ++ name) ]

        Icon.Logo name ->
            Query.has [ Selector.class ("fa-" ++ name) ]


testStyle : Icon -> FA.Style -> Query.Single msg -> Expect.Expectation
testStyle icon style =
    Query.has [ Selector.class (styleClass icon style) ]


testBorder : List FA.Option -> Query.Single msg -> Expect.Expectation
testBorder options =
    let
        expectation =
            if (List.member FA.HasBorder options) then
                Query.has
            else
                Query.hasNot
    in
        expectation [ Selector.class "fa-border" ]


testWidth : List FA.Option -> Query.Single msg -> Expect.Expectation
testWidth options =
    let
        expectation =
            if (List.member FA.HasFixedWidth options) then
                Query.has
            else
                Query.hasNot
    in
        expectation [ Selector.class "fa-fw" ]


testInvertColor : List FA.Option -> Query.Single msg -> Expect.Expectation
testInvertColor options =
    let
        expectation =
            if (List.member FA.InvertColor options) then
                Query.has
            else
                Query.hasNot
    in
        expectation [ Selector.class "fa-inverse" ]


testAnimation : List FA.Option -> Query.Single msg -> Expect.Expectation
testAnimation options =
    let
        opt =
            last isAnimation options
    in
        case opt of
            Just (FA.Animation FA.Spin) ->
                Query.has [ Selector.class "fa-spin" ]

            Just (FA.Animation FA.Pulse) ->
                Query.has [ Selector.class "fa-pulse" ]

            _ ->
                Query.hasNot
                    [ Selector.class "fa-spin"
                    , Selector.class "fa-pulse"
                    ]


testHtmlTag : List FA.Option -> Query.Single msg -> Expect.Expectation
testHtmlTag options =
    let
        opt =
            last isHtmlTag options
    in
        case opt of
            Just (FA.HtmlTag FA.Span) ->
                Query.has [ Selector.tag "span" ]

            _ ->
                Query.has [ Selector.tag "i" ]


testPull : List FA.Option -> Query.Single msg -> Expect.Expectation
testPull options =
    let
        opt =
            last isPull options
    in
        case opt of
            Just (FA.Pull FA.Left) ->
                Query.has [ Selector.class "fa-pull-left" ]

            Just (FA.Pull FA.Right) ->
                Query.has [ Selector.class "fa-pull-right" ]

            _ ->
                Query.hasNot
                    [ Selector.class "fa-pull-left"
                    , Selector.class "fa-right"
                    ]


testSize : List FA.Option -> Query.Single msg -> Expect.Expectation
testSize options =
    let
        opt =
            last isSize options
    in
        case opt of
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


transformText : FA.Transform -> String
transformText transform =
    case transform of
        FA.Grow n ->
            "grow-" ++ toString n

        FA.Shrink n ->
            "shrink-" ++ toString n

        FA.ShiftDown n ->
            "down-" ++ toString n

        FA.ShiftLeft n ->
            "left-" ++ toString n

        FA.ShiftRight n ->
            "right-" ++ toString n

        FA.ShiftUp n ->
            "up-" ++ toString n

        FA.Rotate n ->
            "rotate-" ++ toString n

        FA.FlipHorizontal ->
            "flip-h"

        FA.FlipVertical ->
            "flip-v"


transform : List FA.Transform -> String
transform transforms =
    transforms
        |> List.map transformText
        |> String.join " "


testTransform : List FA.Option -> Query.Single msg -> Expect.Expectation
testTransform options =
    let
        opt =
            last isTransform options

        htmlAttribute =
            Html.Attributes.attribute "data-fa-transform"
    in
        case opt of
            Just (FA.Transform transforms) ->
                Query.has
                    [ Selector.attribute
                        (htmlAttribute <| transform transforms)
                    ]

            -- TODO: How to ensure that an element does not have an attribute?
            _ ->
                Query.hasNot [ Selector.attribute (htmlAttribute "") ]


testMask : List FA.Option -> Query.Single msg -> Expect.Expectation
testMask options =
    let
        opt =
            last isMask options

        htmlAttribute =
            Html.Attributes.attribute "data-fa-mask"
    in
        case opt of
            Just (FA.Mask icon style) ->
                Query.has
                    [ Selector.attribute <|
                        htmlAttribute
                            (styleClass icon style ++ " " ++ iconClass icon)
                    ]

            -- TODO: How to ensure that an element does not have an attribute?
            _ ->
                Query.hasNot [ Selector.attribute (htmlAttribute "") ]


testHtmlAttribute : Attribute Never -> Query.Single msg -> Expect.Expectation
testHtmlAttribute htmlAttribute =
    Query.has [ Selector.attribute htmlAttribute ]



-- FUZZERS


iconFuzzer : Fuzz.Fuzzer Icon
iconFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant FA.accessibleIcon
        , Fuzz.constant FA.accusoft
        , Fuzz.constant FA.addressBook
        , Fuzz.constant FA.addressCard
        , Fuzz.constant FA.adjust
        , Fuzz.constant FA.adn
        , Fuzz.constant FA.adversal
        , Fuzz.constant FA.affiliateTheme
        , Fuzz.constant FA.alarmClock
        , Fuzz.constant FA.algolia
        , Fuzz.constant FA.alignCenter
        , Fuzz.constant FA.alignJustify
        , Fuzz.constant FA.alignLeft
        , Fuzz.constant FA.alignRight
        , Fuzz.constant FA.amazon
        , Fuzz.constant FA.amazonPay
        , Fuzz.constant FA.ambulance
        , Fuzz.constant FA.americanSignLanguageInterpreting
        , Fuzz.constant FA.amilia
        , Fuzz.constant FA.anchor
        , Fuzz.constant FA.android
        , Fuzz.constant FA.angelList
        , Fuzz.constant FA.angleDoubleDown
        , Fuzz.constant FA.angleDoubleLeft
        , Fuzz.constant FA.angleDoubleRight
        , Fuzz.constant FA.angleDoubleUp
        , Fuzz.constant FA.angleDown
        , Fuzz.constant FA.angleLeft
        , Fuzz.constant FA.angleRight
        , Fuzz.constant FA.angleUp
        , Fuzz.constant FA.angryCreative
        , Fuzz.constant FA.angular
        , Fuzz.constant FA.appStore
        , Fuzz.constant FA.appStoreIos
        , Fuzz.constant FA.apper
        , Fuzz.constant FA.apple
        , Fuzz.constant FA.applePay
        , Fuzz.constant FA.archive
        , Fuzz.constant FA.arrowAltCircleDown
        , Fuzz.constant FA.arrowAltCircleLeft
        , Fuzz.constant FA.arrowAltCircleRight
        , Fuzz.constant FA.arrowAltCircleUp
        , Fuzz.constant FA.arrowAltDown
        , Fuzz.constant FA.arrowAltFromBottom
        , Fuzz.constant FA.arrowAltFromLeft
        , Fuzz.constant FA.arrowAltFromRight
        , Fuzz.constant FA.arrowAltFromTop
        , Fuzz.constant FA.arrowAltLeft
        , Fuzz.constant FA.arrowAltRight
        , Fuzz.constant FA.arrowAltSquareDown
        , Fuzz.constant FA.arrowAltSquareLeft
        , Fuzz.constant FA.arrowAltSquareRight
        , Fuzz.constant FA.arrowAltSquareUp
        , Fuzz.constant FA.arrowAltToBottom
        , Fuzz.constant FA.arrowAltToLeft
        , Fuzz.constant FA.arrowAltToRight
        , Fuzz.constant FA.arrowAltToTop
        , Fuzz.constant FA.arrowAltUp
        , Fuzz.constant FA.arrowCircleDown
        , Fuzz.constant FA.arrowCircleLeft
        , Fuzz.constant FA.arrowCircleRight
        , Fuzz.constant FA.arrowCircleUp
        , Fuzz.constant FA.arrowDown
        , Fuzz.constant FA.arrowFromBottom
        , Fuzz.constant FA.arrowFromLeft
        , Fuzz.constant FA.arrowFromRight
        , Fuzz.constant FA.arrowFromTop
        , Fuzz.constant FA.arrowLeft
        , Fuzz.constant FA.arrowRight
        , Fuzz.constant FA.arrowSquareDown
        , Fuzz.constant FA.arrowSquareLeft
        , Fuzz.constant FA.arrowSquareRight
        , Fuzz.constant FA.arrowSquareUp
        , Fuzz.constant FA.arrowToBottom
        , Fuzz.constant FA.arrowToLeft
        , Fuzz.constant FA.arrowToRight
        , Fuzz.constant FA.arrowToTop
        , Fuzz.constant FA.arrowUp
        , Fuzz.constant FA.arrows
        , Fuzz.constant FA.arrowsAlt
        , Fuzz.constant FA.arrowsAltHorizontal
        , Fuzz.constant FA.arrowsAltVertical
        , Fuzz.constant FA.arrowsHorizontal
        , Fuzz.constant FA.arrowsVertical
        , Fuzz.constant FA.assistiveListeningSystems
        , Fuzz.constant FA.asterisk
        , Fuzz.constant FA.asymmetrik
        , Fuzz.constant FA.at
        , Fuzz.constant FA.audible
        , Fuzz.constant FA.audioDescription
        , Fuzz.constant FA.autoprefixer
        , Fuzz.constant FA.avianex
        , Fuzz.constant FA.aviato
        , Fuzz.constant FA.aws
        , Fuzz.constant FA.bimObject
        , Fuzz.constant FA.backward
        , Fuzz.constant FA.badge
        , Fuzz.constant FA.badgeCheck
        , Fuzz.constant FA.balanceScale
        , Fuzz.constant FA.ban
        , Fuzz.constant FA.bandcamp
        , Fuzz.constant FA.barcode
        , Fuzz.constant FA.bars
        , Fuzz.constant FA.bath
        , Fuzz.constant FA.batteryBolt
        , Fuzz.constant FA.batteryEmpty
        , Fuzz.constant FA.batteryFull
        , Fuzz.constant FA.batteryHalf
        , Fuzz.constant FA.batteryQuarter
        , Fuzz.constant FA.batterySlash
        , Fuzz.constant FA.batteryThreeQuarters
        , Fuzz.constant FA.bed
        , Fuzz.constant FA.beer
        , Fuzz.constant FA.behance
        , Fuzz.constant FA.behanceSquare
        , Fuzz.constant FA.bell
        , Fuzz.constant FA.bellSlash
        , Fuzz.constant FA.bicycle
        , Fuzz.constant FA.binoculars
        , Fuzz.constant FA.birthdayCake
        , Fuzz.constant FA.bitbucket
        , Fuzz.constant FA.bitcoin
        , Fuzz.constant FA.bity
        , Fuzz.constant FA.blackTie
        , Fuzz.constant FA.blackberry
        , Fuzz.constant FA.blind
        , Fuzz.constant FA.blogger
        , Fuzz.constant FA.bloggerB
        , Fuzz.constant FA.bluetooth
        , Fuzz.constant FA.bluetoothB
        , Fuzz.constant FA.bold
        , Fuzz.constant FA.bolt
        , Fuzz.constant FA.bomb
        , Fuzz.constant FA.book
        , Fuzz.constant FA.bookmark
        , Fuzz.constant FA.braille
        , Fuzz.constant FA.briefcase
        , Fuzz.constant FA.browser
        , Fuzz.constant FA.btc
        , Fuzz.constant FA.bug
        , Fuzz.constant FA.building
        , Fuzz.constant FA.bullhorn
        , Fuzz.constant FA.bullseye
        , Fuzz.constant FA.buromobelExperte
        , Fuzz.constant FA.bus
        , Fuzz.constant FA.buySellAds
        , Fuzz.constant FA.ccAmazonPay
        , Fuzz.constant FA.ccAmex
        , Fuzz.constant FA.ccApplePay
        , Fuzz.constant FA.ccDinersClub
        , Fuzz.constant FA.ccDiscover
        , Fuzz.constant FA.ccJcb
        , Fuzz.constant FA.ccMastercard
        , Fuzz.constant FA.ccPayPal
        , Fuzz.constant FA.ccStripe
        , Fuzz.constant FA.ccVisa
        , Fuzz.constant FA.css3
        , Fuzz.constant FA.css3Alt
        , Fuzz.constant FA.calculator
        , Fuzz.constant FA.calendar
        , Fuzz.constant FA.calendarAlt
        , Fuzz.constant FA.calendarCheck
        , Fuzz.constant FA.calendarEdit
        , Fuzz.constant FA.calendarExclamation
        , Fuzz.constant FA.calendarMinus
        , Fuzz.constant FA.calendarPlus
        , Fuzz.constant FA.calendarTimes
        , Fuzz.constant FA.camera
        , Fuzz.constant FA.cameraAlt
        , Fuzz.constant FA.cameraRetro
        , Fuzz.constant FA.car
        , Fuzz.constant FA.caretCircleDown
        , Fuzz.constant FA.caretCircleLeft
        , Fuzz.constant FA.caretCircleRight
        , Fuzz.constant FA.caretCircleUp
        , Fuzz.constant FA.caretDown
        , Fuzz.constant FA.caretLeft
        , Fuzz.constant FA.caretRight
        , Fuzz.constant FA.caretSquareDown
        , Fuzz.constant FA.caretSquareLeft
        , Fuzz.constant FA.caretSquareRight
        , Fuzz.constant FA.caretSquareUp
        , Fuzz.constant FA.caretUp
        , Fuzz.constant FA.cartArrowDown
        , Fuzz.constant FA.cartPlus
        , Fuzz.constant FA.centercode
        , Fuzz.constant FA.certificate
        , Fuzz.constant FA.chartArea
        , Fuzz.constant FA.chartBar
        , Fuzz.constant FA.chartLine
        , Fuzz.constant FA.chartPie
        , Fuzz.constant FA.check
        , Fuzz.constant FA.checkCircle
        , Fuzz.constant FA.checkSquare
        , Fuzz.constant FA.chevronCircleDown
        , Fuzz.constant FA.chevronCircleLeft
        , Fuzz.constant FA.chevronCircleRight
        , Fuzz.constant FA.chevronCircleUp
        , Fuzz.constant FA.chevronDoubleDown
        , Fuzz.constant FA.chevronDoubleLeft
        , Fuzz.constant FA.chevronDoubleRight
        , Fuzz.constant FA.chevronDoubleUp
        , Fuzz.constant FA.chevronDown
        , Fuzz.constant FA.chevronLeft
        , Fuzz.constant FA.chevronRight
        , Fuzz.constant FA.chevronSquareDown
        , Fuzz.constant FA.chevronSquareLeft
        , Fuzz.constant FA.chevronSquareRight
        , Fuzz.constant FA.chevronSquareUp
        , Fuzz.constant FA.chevronUp
        , Fuzz.constant FA.child
        , Fuzz.constant FA.chrome
        , Fuzz.constant FA.circle
        , Fuzz.constant FA.circleNotch
        , Fuzz.constant FA.clipboard
        , Fuzz.constant FA.clock
        , Fuzz.constant FA.clone
        , Fuzz.constant FA.closedCaptioning
        , Fuzz.constant FA.cloud
        , Fuzz.constant FA.cloudDownload
        , Fuzz.constant FA.cloudDownloadAlt
        , Fuzz.constant FA.cloudScale
        , Fuzz.constant FA.cloudUpload
        , Fuzz.constant FA.cloudUploadAlt
        , Fuzz.constant FA.cloudsmith
        , Fuzz.constant FA.cloudversify
        , Fuzz.constant FA.club
        , Fuzz.constant FA.code
        , Fuzz.constant FA.codeBranch
        , Fuzz.constant FA.codeCommit
        , Fuzz.constant FA.codeMerge
        , Fuzz.constant FA.codePen
        , Fuzz.constant FA.codiePie
        , Fuzz.constant FA.coffee
        , Fuzz.constant FA.cog
        , Fuzz.constant FA.cogs
        , Fuzz.constant FA.columns
        , Fuzz.constant FA.comment
        , Fuzz.constant FA.commentAlt
        , Fuzz.constant FA.comments
        , Fuzz.constant FA.compass
        , Fuzz.constant FA.compress
        , Fuzz.constant FA.compressAlt
        , Fuzz.constant FA.compressWide
        , Fuzz.constant FA.connectDevelop
        , Fuzz.constant FA.contao
        , Fuzz.constant FA.copy
        , Fuzz.constant FA.copyright
        , Fuzz.constant FA.cpanel
        , Fuzz.constant FA.creativeCommons
        , Fuzz.constant FA.creditCard
        , Fuzz.constant FA.creditCardBlank
        , Fuzz.constant FA.creditCardFront
        , Fuzz.constant FA.crop
        , Fuzz.constant FA.crosshairs
        , Fuzz.constant FA.cube
        , Fuzz.constant FA.cubes
        , Fuzz.constant FA.cut
        , Fuzz.constant FA.cuttlefish

        -- Note: The rest of these are commented out because including them
        -- results in a stack overflow when running elm-test. Practically, it
        -- shouldn't matter, as there's nothing special about the rest of these
        -- types that would result in different test outcomes.
        -- , Fuzz.constant FA.dAndD
        -- , Fuzz.constant FA.dashcube
        -- , Fuzz.constant FA.database
        -- , Fuzz.constant FA.deaf
        -- , Fuzz.constant FA.delicious
        -- , Fuzz.constant FA.deployDog
        -- , Fuzz.constant FA.deskpro
        -- , Fuzz.constant FA.desktop
        -- , Fuzz.constant FA.desktopAlt
        -- , Fuzz.constant FA.deviantArt
        -- , Fuzz.constant FA.diamond
        -- , Fuzz.constant FA.digg
        -- , Fuzz.constant FA.digitalOcean
        -- , Fuzz.constant FA.discord
        -- , Fuzz.constant FA.discourse
        -- , Fuzz.constant FA.docHub
        -- , Fuzz.constant FA.docker
        -- , Fuzz.constant FA.dollarSign
        -- , Fuzz.constant FA.dotCircle
        -- , Fuzz.constant FA.download
        -- , Fuzz.constant FA.draft2Digital
        -- , Fuzz.constant FA.dribbble
        -- , Fuzz.constant FA.dribbbleSquare
        -- , Fuzz.constant FA.dropbox
        -- , Fuzz.constant FA.drupal
        -- , Fuzz.constant FA.dyalog
        -- , Fuzz.constant FA.earlyBirds
        -- , Fuzz.constant FA.edge
        -- , Fuzz.constant FA.edit
        -- , Fuzz.constant FA.eject
        -- , Fuzz.constant FA.elementor
        -- , Fuzz.constant FA.ellipsisHorizontal
        -- , Fuzz.constant FA.ellipsisHorizontalAlt
        -- , Fuzz.constant FA.ellipsisVertical
        -- , Fuzz.constant FA.ellipsisVerticalAlt
        -- , Fuzz.constant FA.ember
        -- , Fuzz.constant FA.empire
        -- , Fuzz.constant FA.envelope
        -- , Fuzz.constant FA.envelopeOpen
        -- , Fuzz.constant FA.envelopeSquare
        -- , Fuzz.constant FA.envira
        -- , Fuzz.constant FA.eraser
        -- , Fuzz.constant FA.erlang
        -- , Fuzz.constant FA.ethereum
        -- , Fuzz.constant FA.etsy
        -- , Fuzz.constant FA.euroSign
        -- , Fuzz.constant FA.exchange
        -- , Fuzz.constant FA.exchangeAlt
        -- , Fuzz.constant FA.exclamation
        -- , Fuzz.constant FA.exclamationCircle
        -- , Fuzz.constant FA.exclamationSquare
        -- , Fuzz.constant FA.exclamationTriangle
        -- , Fuzz.constant FA.expand
        -- , Fuzz.constant FA.expandAlt
        -- , Fuzz.constant FA.expandArrows
        -- , Fuzz.constant FA.expandArrowsAlt
        -- , Fuzz.constant FA.expandWide
        -- , Fuzz.constant FA.expeditedSSL
        -- , Fuzz.constant FA.externalLink
        -- , Fuzz.constant FA.externalLinkAlt
        -- , Fuzz.constant FA.externalLinkSquare
        -- , Fuzz.constant FA.externalLinkSquareAlt
        -- , Fuzz.constant FA.eye
        -- , Fuzz.constant FA.eyeDropper
        -- , Fuzz.constant FA.eyeSlash
        -- , Fuzz.constant FA.facebook
        -- , Fuzz.constant FA.facebookF
        -- , Fuzz.constant FA.facebookMessenger
        -- , Fuzz.constant FA.facebookSquare
        -- , Fuzz.constant FA.fastBackward
        -- , Fuzz.constant FA.fastForward
        -- , Fuzz.constant FA.fax
        -- , Fuzz.constant FA.female
        -- , Fuzz.constant FA.fighterJet
        -- , Fuzz.constant FA.file
        -- , Fuzz.constant FA.fileAlt
        -- , Fuzz.constant FA.fileArchive
        -- , Fuzz.constant FA.fileAudio
        -- , Fuzz.constant FA.fileCheck
        -- , Fuzz.constant FA.fileCode
        -- , Fuzz.constant FA.fileEdit
        -- , Fuzz.constant FA.fileExcel
        -- , Fuzz.constant FA.fileExclamation
        -- , Fuzz.constant FA.fileImage
        -- , Fuzz.constant FA.fileMinus
        -- , Fuzz.constant FA.filePdf
        -- , Fuzz.constant FA.filePlus
        -- , Fuzz.constant FA.filePowerpoint
        -- , Fuzz.constant FA.fileTimes
        -- , Fuzz.constant FA.fileVideo
        -- , Fuzz.constant FA.fileWord
        -- , Fuzz.constant FA.film
        -- , Fuzz.constant FA.filmAlt
        -- , Fuzz.constant FA.filter
        -- , Fuzz.constant FA.fire
        -- , Fuzz.constant FA.fireExtinguisher
        -- , Fuzz.constant FA.firefox
        -- , Fuzz.constant FA.firstDraft
        -- , Fuzz.constant FA.firstOrder
        -- , Fuzz.constant FA.fiveHundredPx
        -- , Fuzz.constant FA.flag
        -- , Fuzz.constant FA.flagCheckered
        -- , Fuzz.constant FA.flask
        -- , Fuzz.constant FA.flickr
        -- , Fuzz.constant FA.fly
        -- , Fuzz.constant FA.folder
        -- , Fuzz.constant FA.folderOpen
        -- , Fuzz.constant FA.font
        -- , Fuzz.constant FA.fontAwesome
        -- , Fuzz.constant FA.fontAwesomeAlt
        -- , Fuzz.constant FA.fontAwesomeFlag
        -- , Fuzz.constant FA.fontIcons
        -- , Fuzz.constant FA.fontIconsFi
        -- , Fuzz.constant FA.fortAwesome
        -- , Fuzz.constant FA.fortAwesomeAlt
        -- , Fuzz.constant FA.forumbee
        -- , Fuzz.constant FA.forward
        -- , Fuzz.constant FA.foursquare
        -- , Fuzz.constant FA.freeBSD
        -- , Fuzz.constant FA.freeCodeCamp
        -- , Fuzz.constant FA.frown
        -- , Fuzz.constant FA.futbol
        -- , Fuzz.constant FA.gG
        -- , Fuzz.constant FA.gGCircle
        -- , Fuzz.constant FA.gamepad
        -- , Fuzz.constant FA.gavel
        -- , Fuzz.constant FA.gem
        -- , Fuzz.constant FA.genderless
        -- , Fuzz.constant FA.getPocket
        -- , Fuzz.constant FA.gift
        -- , Fuzz.constant FA.git
        -- , Fuzz.constant FA.gitHub
        -- , Fuzz.constant FA.gitHubAlt
        -- , Fuzz.constant FA.gitHubSquare
        -- , Fuzz.constant FA.gitKraken
        -- , Fuzz.constant FA.gitLab
        -- , Fuzz.constant FA.gitSquare
        -- , Fuzz.constant FA.gitter
        -- , Fuzz.constant FA.glassMartini
        -- , Fuzz.constant FA.glide
        -- , Fuzz.constant FA.glideG
        -- , Fuzz.constant FA.globe
        -- , Fuzz.constant FA.gofore
        -- , Fuzz.constant FA.goodreads
        -- , Fuzz.constant FA.goodreadsG
        -- , Fuzz.constant FA.google
        -- , Fuzz.constant FA.googleDrive
        -- , Fuzz.constant FA.googlePlay
        -- , Fuzz.constant FA.googlePlus
        -- , Fuzz.constant FA.googlePlusG
        -- , Fuzz.constant FA.googlePlusSquare
        -- , Fuzz.constant FA.googleWallet
        -- , Fuzz.constant FA.graduationCap
        -- , Fuzz.constant FA.gratipay
        -- , Fuzz.constant FA.grav
        -- , Fuzz.constant FA.gripfire
        -- , Fuzz.constant FA.grunt
        -- , Fuzz.constant FA.gulp
        -- , Fuzz.constant FA.h1
        -- , Fuzz.constant FA.h2
        -- , Fuzz.constant FA.h3
        -- , Fuzz.constant FA.hSquare
        -- , Fuzz.constant FA.hackerNews
        -- , Fuzz.constant FA.hackerNewsSquare
        -- , Fuzz.constant FA.handLizard
        -- , Fuzz.constant FA.handPaper
        -- , Fuzz.constant FA.handPeace
        -- , Fuzz.constant FA.handPointDown
        -- , Fuzz.constant FA.handPointLeft
        -- , Fuzz.constant FA.handPointRight
        -- , Fuzz.constant FA.handPointUp
        -- , Fuzz.constant FA.handPointer
        -- , Fuzz.constant FA.handRock
        -- , Fuzz.constant FA.handScissors
        -- , Fuzz.constant FA.handSpock
        -- , Fuzz.constant FA.handshake
        -- , Fuzz.constant FA.hashtag
        -- , Fuzz.constant FA.hdd
        -- , Fuzz.constant FA.heading
        -- , Fuzz.constant FA.headphones
        -- , Fuzz.constant FA.heart
        -- , Fuzz.constant FA.heartbeat
        -- , Fuzz.constant FA.hexagon
        -- , Fuzz.constant FA.hireAHelper
        -- , Fuzz.constant FA.history
        -- , Fuzz.constant FA.home
        -- , Fuzz.constant FA.hooli
        -- , Fuzz.constant FA.hospital
        -- , Fuzz.constant FA.hotjar
        -- , Fuzz.constant FA.hourglass
        -- , Fuzz.constant FA.hourglassEnd
        -- , Fuzz.constant FA.hourglassHalf
        -- , Fuzz.constant FA.hourglassStart
        -- , Fuzz.constant FA.houzz
        -- , Fuzz.constant FA.html5
        -- , Fuzz.constant FA.hubSpot
        -- , Fuzz.constant FA.iCursor
        -- , Fuzz.constant FA.idBadge
        -- , Fuzz.constant FA.idCard
        -- , Fuzz.constant FA.image
        -- , Fuzz.constant FA.images
        -- , Fuzz.constant FA.imdb
        -- , Fuzz.constant FA.inbox
        -- , Fuzz.constant FA.inboxIn
        -- , Fuzz.constant FA.inboxOut
        -- , Fuzz.constant FA.indent
        -- , Fuzz.constant FA.industry
        -- , Fuzz.constant FA.industryAlt
        -- , Fuzz.constant FA.info
        -- , Fuzz.constant FA.infoCircle
        -- , Fuzz.constant FA.infoSquare
        -- , Fuzz.constant FA.instagram
        -- , Fuzz.constant FA.internetExplorer
        -- , Fuzz.constant FA.ioxHost
        -- , Fuzz.constant FA.italic
        -- , Fuzz.constant FA.itunes
        -- , Fuzz.constant FA.itunesNote
        -- , Fuzz.constant FA.jSFiddle
        -- , Fuzz.constant FA.jackOLantern
        -- , Fuzz.constant FA.jenkins
        -- , Fuzz.constant FA.joget
        -- , Fuzz.constant FA.joomla
        -- , Fuzz.constant FA.js
        -- , Fuzz.constant FA.jsSquare
        -- , Fuzz.constant FA.key
        -- , Fuzz.constant FA.keyCDN
        -- , Fuzz.constant FA.keyboard
        -- , Fuzz.constant FA.kickstarter
        -- , Fuzz.constant FA.kickstarterK
        -- , Fuzz.constant FA.korvue
        -- , Fuzz.constant FA.language
        -- , Fuzz.constant FA.laptop
        -- , Fuzz.constant FA.laravel
        -- , Fuzz.constant FA.lastfm
        -- , Fuzz.constant FA.lastfmSquare
        -- , Fuzz.constant FA.leaf
        -- , Fuzz.constant FA.leanpub
        -- , Fuzz.constant FA.lemon
        -- , Fuzz.constant FA.less
        -- , Fuzz.constant FA.levelDown
        -- , Fuzz.constant FA.levelDownAlt
        -- , Fuzz.constant FA.levelUp
        -- , Fuzz.constant FA.levelUpAlt
        -- , Fuzz.constant FA.lifeRing
        -- , Fuzz.constant FA.lightbulb
        -- , Fuzz.constant FA.line
        -- , Fuzz.constant FA.link
        -- , Fuzz.constant FA.linkedIn
        -- , Fuzz.constant FA.linkedInInverted
        -- , Fuzz.constant FA.linode
        -- , Fuzz.constant FA.linux
        -- , Fuzz.constant FA.liraSign
        -- , Fuzz.constant FA.list
        -- , Fuzz.constant FA.listAlt
        -- , Fuzz.constant FA.listOl
        -- , Fuzz.constant FA.listUl
        -- , Fuzz.constant FA.locationArrow
        -- , Fuzz.constant FA.lock
        -- , Fuzz.constant FA.lockAlt
        -- , Fuzz.constant FA.lockOpen
        -- , Fuzz.constant FA.lockOpenAlt
        -- , Fuzz.constant FA.longArrowAltDown
        -- , Fuzz.constant FA.longArrowAltLeft
        -- , Fuzz.constant FA.longArrowAltRight
        -- , Fuzz.constant FA.longArrowAltUp
        -- , Fuzz.constant FA.longArrowDown
        -- , Fuzz.constant FA.longArrowLeft
        -- , Fuzz.constant FA.longArrowRight
        -- , Fuzz.constant FA.longArrowUp
        -- , Fuzz.constant FA.lowVision
        -- , Fuzz.constant FA.lyft
        -- , Fuzz.constant FA.mODX
        -- , Fuzz.constant FA.magento
        -- , Fuzz.constant FA.magic
        -- , Fuzz.constant FA.magnet
        -- , Fuzz.constant FA.male
        -- , Fuzz.constant FA.map
        -- , Fuzz.constant FA.mapMarker
        -- , Fuzz.constant FA.mapMarkerAlt
        -- , Fuzz.constant FA.mapPin
        -- , Fuzz.constant FA.mapSigns
        -- , Fuzz.constant FA.mars
        -- , Fuzz.constant FA.marsDouble
        -- , Fuzz.constant FA.marsStroke
        -- , Fuzz.constant FA.marsStrokeHorizontal
        -- , Fuzz.constant FA.marsStrokeVertical
        -- , Fuzz.constant FA.maxcdn
        -- , Fuzz.constant FA.medApps
        -- , Fuzz.constant FA.medium
        -- , Fuzz.constant FA.mediumM
        -- , Fuzz.constant FA.medkit
        -- , Fuzz.constant FA.medrt
        -- , Fuzz.constant FA.meetup
        -- , Fuzz.constant FA.meh
        -- , Fuzz.constant FA.mercury
        -- , Fuzz.constant FA.microchip
        -- , Fuzz.constant FA.microphone
        -- , Fuzz.constant FA.microphoneAlt
        -- , Fuzz.constant FA.microphoneSlash
        -- , Fuzz.constant FA.microsoft
        -- , Fuzz.constant FA.minus
        -- , Fuzz.constant FA.minusCircle
        -- , Fuzz.constant FA.minusHexagon
        -- , Fuzz.constant FA.minusOctagon
        -- , Fuzz.constant FA.minusSquare
        -- , Fuzz.constant FA.mix
        -- , Fuzz.constant FA.mixcloud
        -- , Fuzz.constant FA.mizuni
        -- , Fuzz.constant FA.mobile
        -- , Fuzz.constant FA.mobileAlt
        -- , Fuzz.constant FA.mobileAndroid
        -- , Fuzz.constant FA.mobileAndroidAlt
        -- , Fuzz.constant FA.monero
        -- , Fuzz.constant FA.moneyBill
        -- , Fuzz.constant FA.moneyBillAlt
        -- , Fuzz.constant FA.moon
        -- , Fuzz.constant FA.motorcycle
        -- , Fuzz.constant FA.mousePointer
        -- , Fuzz.constant FA.music
        -- , Fuzz.constant FA.nS8
        -- , Fuzz.constant FA.napster
        -- , Fuzz.constant FA.neuter
        -- , Fuzz.constant FA.newspaper
        -- , Fuzz.constant FA.nintendoSwitch
        -- , Fuzz.constant FA.node
        -- , Fuzz.constant FA.nodejs
        -- , Fuzz.constant FA.npm
        -- , Fuzz.constant FA.nutritionix
        -- , Fuzz.constant FA.objectGroup
        -- , Fuzz.constant FA.objectUngroup
        -- , Fuzz.constant FA.octagon
        -- , Fuzz.constant FA.odnoklassniki
        -- , Fuzz.constant FA.odnoklassnikiSquare
        -- , Fuzz.constant FA.openCart
        -- , Fuzz.constant FA.openID
        -- , Fuzz.constant FA.openSourceInitiative
        -- , Fuzz.constant FA.opera
        -- , Fuzz.constant FA.optinMonster
        -- , Fuzz.constant FA.outdent
        -- , Fuzz.constant FA.page4
        -- , Fuzz.constant FA.pageLines
        -- , Fuzz.constant FA.paintBrush
        -- , Fuzz.constant FA.palFed
        -- , Fuzz.constant FA.paperPlane
        -- , Fuzz.constant FA.paperclip
        -- , Fuzz.constant FA.paragraph
        -- , Fuzz.constant FA.paste
        -- , Fuzz.constant FA.patreon
        -- , Fuzz.constant FA.pause
        -- , Fuzz.constant FA.pauseCircle
        -- , Fuzz.constant FA.paw
        -- , Fuzz.constant FA.payPal
        -- , Fuzz.constant FA.pen
        -- , Fuzz.constant FA.penAlt
        -- , Fuzz.constant FA.penSquare
        -- , Fuzz.constant FA.pencil
        -- , Fuzz.constant FA.pencilAlt
        -- , Fuzz.constant FA.percent
        -- , Fuzz.constant FA.periscope
        -- , Fuzz.constant FA.phabricator
        -- , Fuzz.constant FA.phoenixFramework
        -- , Fuzz.constant FA.phone
        -- , Fuzz.constant FA.phoneSlash
        -- , Fuzz.constant FA.phoneSquare
        -- , Fuzz.constant FA.phoneVolume
        -- , Fuzz.constant FA.piedPiper
        -- , Fuzz.constant FA.piedPiperAlt
        -- , Fuzz.constant FA.piedPiperPp
        -- , Fuzz.constant FA.pinterest
        -- , Fuzz.constant FA.pinterestP
        -- , Fuzz.constant FA.pinterestSquare
        -- , Fuzz.constant FA.plane
        -- , Fuzz.constant FA.planeAlt
        -- , Fuzz.constant FA.play
        -- , Fuzz.constant FA.playCircle
        -- , Fuzz.constant FA.playstation
        -- , Fuzz.constant FA.plug
        -- , Fuzz.constant FA.plus
        -- , Fuzz.constant FA.plusCircle
        -- , Fuzz.constant FA.plusHexagon
        -- , Fuzz.constant FA.plusOctagon
        -- , Fuzz.constant FA.plusSquare
        -- , Fuzz.constant FA.podcast
        -- , Fuzz.constant FA.poo
        -- , Fuzz.constant FA.portrait
        -- , Fuzz.constant FA.poundSign
        -- , Fuzz.constant FA.powerOff
        -- , Fuzz.constant FA.print
        -- , Fuzz.constant FA.productHunt
        -- , Fuzz.constant FA.pushed
        -- , Fuzz.constant FA.puzzlePiece
        -- , Fuzz.constant FA.python
        -- , Fuzz.constant FA.qQ
        -- , Fuzz.constant FA.qrcode
        -- , Fuzz.constant FA.question
        -- , Fuzz.constant FA.questionCircle
        -- , Fuzz.constant FA.questionSquare
        -- , Fuzz.constant FA.quora
        -- , Fuzz.constant FA.quoteLeft
        -- , Fuzz.constant FA.quoteRight
        -- , Fuzz.constant FA.rSS
        -- , Fuzz.constant FA.rSSSquare
        -- , Fuzz.constant FA.random
        -- , Fuzz.constant FA.ravelry
        -- , Fuzz.constant FA.react
        -- , Fuzz.constant FA.rebel
        -- , Fuzz.constant FA.rectangleLandscape
        -- , Fuzz.constant FA.rectanglePortrait
        -- , Fuzz.constant FA.rectangleWide
        -- , Fuzz.constant FA.recycle
        -- , Fuzz.constant FA.redRiver
        -- , Fuzz.constant FA.reddit
        -- , Fuzz.constant FA.redditAlien
        -- , Fuzz.constant FA.redditSquare
        -- , Fuzz.constant FA.redo
        -- , Fuzz.constant FA.redoAlt
        -- , Fuzz.constant FA.registered
        -- , Fuzz.constant FA.rendact
        -- , Fuzz.constant FA.renren
        -- , Fuzz.constant FA.repeat
        -- , Fuzz.constant FA.repeat1
        -- , Fuzz.constant FA.repeat1Alt
        -- , Fuzz.constant FA.repeatAlt
        -- , Fuzz.constant FA.reply
        -- , Fuzz.constant FA.replyAll
        -- , Fuzz.constant FA.replyd
        -- , Fuzz.constant FA.resolving
        -- , Fuzz.constant FA.retweet
        -- , Fuzz.constant FA.retweetAlt
        -- , Fuzz.constant FA.road
        -- , Fuzz.constant FA.rockRMS
        -- , Fuzz.constant FA.rocket
        -- , Fuzz.constant FA.rocketChat
        -- , Fuzz.constant FA.rubleSign
        -- , Fuzz.constant FA.rupeeSign
        -- , Fuzz.constant FA.safari
        -- , Fuzz.constant FA.sass
        -- , Fuzz.constant FA.save
        -- , Fuzz.constant FA.schlix
        -- , Fuzz.constant FA.scribd
        -- , Fuzz.constant FA.scrubber
        -- , Fuzz.constant FA.search
        -- , Fuzz.constant FA.searchMinus
        -- , Fuzz.constant FA.searchPlus
        -- , Fuzz.constant FA.searchengin
        -- , Fuzz.constant FA.sellCast
        -- , Fuzz.constant FA.sellsy
        -- , Fuzz.constant FA.server
        -- , Fuzz.constant FA.serviceStack
        -- , Fuzz.constant FA.share
        -- , Fuzz.constant FA.shareAll
        -- , Fuzz.constant FA.shareAlt
        -- , Fuzz.constant FA.shareAltSquare
        -- , Fuzz.constant FA.shareSquare
        -- , Fuzz.constant FA.shekelSign
        -- , Fuzz.constant FA.shield
        -- , Fuzz.constant FA.shieldAlt
        -- , Fuzz.constant FA.shieldCheck
        -- , Fuzz.constant FA.ship
        -- , Fuzz.constant FA.shirtsInBulk
        -- , Fuzz.constant FA.shoppingBag
        -- , Fuzz.constant FA.shoppingBasket
        -- , Fuzz.constant FA.shoppingCart
        -- , Fuzz.constant FA.shower
        -- , Fuzz.constant FA.signIn
        -- , Fuzz.constant FA.signInAlt
        -- , Fuzz.constant FA.signLanguage
        -- , Fuzz.constant FA.signOut
        -- , Fuzz.constant FA.signOutAlt
        -- , Fuzz.constant FA.signal
        -- , Fuzz.constant FA.simplyBuilt
        -- , Fuzz.constant FA.sistrix
        -- , Fuzz.constant FA.sitemap
        -- , Fuzz.constant FA.skyAtlas
        -- , Fuzz.constant FA.skype
        -- , Fuzz.constant FA.slack
        -- , Fuzz.constant FA.slackHash
        -- , Fuzz.constant FA.slidersHorizontal
        -- , Fuzz.constant FA.slidersHorizontalSquare
        -- , Fuzz.constant FA.slidersV
        -- , Fuzz.constant FA.slidersVSquare
        -- , Fuzz.constant FA.slideshare
        -- , Fuzz.constant FA.smile
        -- , Fuzz.constant FA.snapchat
        -- , Fuzz.constant FA.snapchatGhost
        -- , Fuzz.constant FA.snapchatSquare
        -- , Fuzz.constant FA.snowflake
        -- , Fuzz.constant FA.sort
        -- , Fuzz.constant FA.sortAlphaDown
        -- , Fuzz.constant FA.sortAlphaUp
        -- , Fuzz.constant FA.sortAmountDown
        -- , Fuzz.constant FA.sortAmountUp
        -- , Fuzz.constant FA.sortDown
        -- , Fuzz.constant FA.sortNumericDown
        -- , Fuzz.constant FA.sortNumericUp
        -- , Fuzz.constant FA.sortUp
        -- , Fuzz.constant FA.soundCloud
        -- , Fuzz.constant FA.spaceShuttle
        -- , Fuzz.constant FA.spade
        -- , Fuzz.constant FA.speakap
        -- , Fuzz.constant FA.spinner
        -- , Fuzz.constant FA.spinnerThird
        -- , Fuzz.constant FA.spotify
        -- , Fuzz.constant FA.square
        -- , Fuzz.constant FA.stackExchange
        -- , Fuzz.constant FA.stackOverflow
        -- , Fuzz.constant FA.star
        -- , Fuzz.constant FA.starExclamation
        -- , Fuzz.constant FA.starHalf
        -- , Fuzz.constant FA.stayLinked
        -- , Fuzz.constant FA.steam
        -- , Fuzz.constant FA.steamSquare
        -- , Fuzz.constant FA.steamSymbol
        -- , Fuzz.constant FA.stepBackward
        -- , Fuzz.constant FA.stepForward
        -- , Fuzz.constant FA.stethoscope
        -- , Fuzz.constant FA.stickerMule
        -- , Fuzz.constant FA.stickyNote
        -- , Fuzz.constant FA.stop
        -- , Fuzz.constant FA.stopCircle
        -- , Fuzz.constant FA.stopwatch
        -- , Fuzz.constant FA.strava
        -- , Fuzz.constant FA.streetView
        -- , Fuzz.constant FA.strikethrough
        -- , Fuzz.constant FA.stripe
        -- , Fuzz.constant FA.stripeS
        -- , Fuzz.constant FA.studioVinari
        -- , Fuzz.constant FA.stumbleUpon
        -- , Fuzz.constant FA.stumbleUponCircle
        -- , Fuzz.constant FA.subscript
        -- , Fuzz.constant FA.subway
        -- , Fuzz.constant FA.suitcase
        -- , Fuzz.constant FA.sun
        -- , Fuzz.constant FA.superpowers
        -- , Fuzz.constant FA.superscript
        -- , Fuzz.constant FA.supple
        -- , Fuzz.constant FA.sync
        -- , Fuzz.constant FA.syncAlt
        -- , Fuzz.constant FA.tTY
        -- , Fuzz.constant FA.tV
        -- , Fuzz.constant FA.tVRetro
        -- , Fuzz.constant FA.table
        -- , Fuzz.constant FA.tablet
        -- , Fuzz.constant FA.tabletAlt
        -- , Fuzz.constant FA.tabletAndroid
        -- , Fuzz.constant FA.tabletAndroidAlt
        -- , Fuzz.constant FA.tachometer
        -- , Fuzz.constant FA.tachometerAlt
        -- , Fuzz.constant FA.tag
        -- , Fuzz.constant FA.tags
        -- , Fuzz.constant FA.tasks
        -- , Fuzz.constant FA.taxi
        -- , Fuzz.constant FA.telegram
        -- , Fuzz.constant FA.telegramPlane
        -- , Fuzz.constant FA.tencentWeibo
        -- , Fuzz.constant FA.terminal
        -- , Fuzz.constant FA.textHeight
        -- , Fuzz.constant FA.textWidth
        -- , Fuzz.constant FA.th
        -- , Fuzz.constant FA.thLarge
        -- , Fuzz.constant FA.thList
        -- , Fuzz.constant FA.themeIsle
        -- , Fuzz.constant FA.thermometerEmpty
        -- , Fuzz.constant FA.thermometerFull
        -- , Fuzz.constant FA.thermometerHalf
        -- , Fuzz.constant FA.thermometerQuarter
        -- , Fuzz.constant FA.thermometerThreeQuarters
        -- , Fuzz.constant FA.thumbsDown
        -- , Fuzz.constant FA.thumbsUp
        -- , Fuzz.constant FA.thumbtack
        -- , Fuzz.constant FA.ticket
        -- , Fuzz.constant FA.ticketAlt
        -- , Fuzz.constant FA.times
        -- , Fuzz.constant FA.timesCircle
        -- , Fuzz.constant FA.timesHexagon
        -- , Fuzz.constant FA.timesOctagon
        -- , Fuzz.constant FA.timesSquare
        -- , Fuzz.constant FA.tint
        -- , Fuzz.constant FA.toggleOff
        -- , Fuzz.constant FA.toggleOn
        -- , Fuzz.constant FA.trademark
        -- , Fuzz.constant FA.train
        -- , Fuzz.constant FA.transgender
        -- , Fuzz.constant FA.transgenderAlt
        -- , Fuzz.constant FA.trash
        -- , Fuzz.constant FA.trashAlt
        -- , Fuzz.constant FA.tree
        -- , Fuzz.constant FA.treeAlt
        -- , Fuzz.constant FA.trello
        -- , Fuzz.constant FA.triangle
        -- , Fuzz.constant FA.tripAdvisor
        -- , Fuzz.constant FA.trophy
        -- , Fuzz.constant FA.trophyAlt
        -- , Fuzz.constant FA.truck
        -- , Fuzz.constant FA.tumblr
        -- , Fuzz.constant FA.tumblrSquare
        -- , Fuzz.constant FA.twitch
        -- , Fuzz.constant FA.twitter
        -- , Fuzz.constant FA.twitterSquare
        -- , Fuzz.constant FA.typo3
        -- , Fuzz.constant FA.uIkit
        -- , Fuzz.constant FA.uSB
        -- , Fuzz.constant FA.uber
        -- , Fuzz.constant FA.umbrella
        -- , Fuzz.constant FA.underline
        -- , Fuzz.constant FA.undo
        -- , Fuzz.constant FA.undoAlt
        -- , Fuzz.constant FA.uniregistry
        -- , Fuzz.constant FA.universalAccess
        -- , Fuzz.constant FA.university
        -- , Fuzz.constant FA.unlink
        -- , Fuzz.constant FA.unlock
        -- , Fuzz.constant FA.unlockAlt
        -- , Fuzz.constant FA.untappd
        -- , Fuzz.constant FA.upload
        -- , Fuzz.constant FA.usSunnah
        -- , Fuzz.constant FA.usdCircle
        -- , Fuzz.constant FA.usdSquare
        -- , Fuzz.constant FA.user
        -- , Fuzz.constant FA.userAlt
        -- , Fuzz.constant FA.userCircle
        -- , Fuzz.constant FA.userMd
        -- , Fuzz.constant FA.userPlus
        -- , Fuzz.constant FA.userSecret
        -- , Fuzz.constant FA.userTimes
        -- , Fuzz.constant FA.users
        -- , Fuzz.constant FA.utensilFork
        -- , Fuzz.constant FA.utensilKnife
        -- , Fuzz.constant FA.utensilSpoon
        -- , Fuzz.constant FA.utensils
        -- , Fuzz.constant FA.utensilsAlt
        -- , Fuzz.constant FA.vK
        -- , Fuzz.constant FA.vaadin
        -- , Fuzz.constant FA.venus
        -- , Fuzz.constant FA.venusDouble
        -- , Fuzz.constant FA.venusMars
        -- , Fuzz.constant FA.viacoin
        -- , Fuzz.constant FA.viadeo
        -- , Fuzz.constant FA.viadeoSquare
        -- , Fuzz.constant FA.viber
        -- , Fuzz.constant FA.video
        -- , Fuzz.constant FA.vimeo
        -- , Fuzz.constant FA.vimeoSquare
        -- , Fuzz.constant FA.vimeoV
        -- , Fuzz.constant FA.vine
        -- , Fuzz.constant FA.vnv
        -- , Fuzz.constant FA.volumeDown
        -- , Fuzz.constant FA.volumeMute
        -- , Fuzz.constant FA.volumeOff
        -- , Fuzz.constant FA.volumeUp
        -- , Fuzz.constant FA.vuejs
        -- , Fuzz.constant FA.wHMCS
        -- , Fuzz.constant FA.wPBeginner
        -- , Fuzz.constant FA.wPExplorer
        -- , Fuzz.constant FA.wPForms
        -- , Fuzz.constant FA.watch
        -- , Fuzz.constant FA.weibo
        -- , Fuzz.constant FA.weixin
        -- , Fuzz.constant FA.whatsApp
        -- , Fuzz.constant FA.whatsAppSquare
        -- , Fuzz.constant FA.wheelchair
        -- , Fuzz.constant FA.wifi
        -- , Fuzz.constant FA.wikipedia
        -- , Fuzz.constant FA.window
        -- , Fuzz.constant FA.windowAlt
        -- , Fuzz.constant FA.windowClose
        -- , Fuzz.constant FA.windowMaximize
        -- , Fuzz.constant FA.windowMinimize
        -- , Fuzz.constant FA.windowRestore
        -- , Fuzz.constant FA.windows
        -- , Fuzz.constant FA.wonSign
        -- , Fuzz.constant FA.wordPress
        -- , Fuzz.constant FA.wordPressSimple
        -- , Fuzz.constant FA.wrench
        -- , Fuzz.constant FA.xING
        -- , Fuzz.constant FA.xINGSquare
        -- , Fuzz.constant FA.xbox
        -- , Fuzz.constant FA.yCombinator
        -- , Fuzz.constant FA.yahoo
        -- , Fuzz.constant FA.yandex
        -- , Fuzz.constant FA.yandexInternational
        -- , Fuzz.constant FA.yelp
        -- , Fuzz.constant FA.yenSign
        -- , Fuzz.constant FA.yoast
        -- , Fuzz.constant FA.youTube
        -- , Fuzz.constant FA.youTubeSquare
        ]


styleFuzzer : Fuzz.Fuzzer FA.Style
styleFuzzer =
    Fuzz.oneOf
        [ Fuzz.constant FA.Regular
        , Fuzz.constant FA.Solid
        , Fuzz.constant FA.Light
        ]


borderFuzzer : Fuzz.Fuzzer (Maybe FA.Option)
borderFuzzer =
    Fuzz.maybe (Fuzz.constant FA.HasBorder)


widthFuzzer : Fuzz.Fuzzer (Maybe FA.Option)
widthFuzzer =
    Fuzz.maybe (Fuzz.constant FA.HasFixedWidth)


invertFuzzer : Fuzz.Fuzzer (Maybe FA.Option)
invertFuzzer =
    Fuzz.maybe (Fuzz.constant FA.InvertColor)


htmlTagFuzzer : Fuzz.Fuzzer (Maybe FA.Option)
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


animationFuzzer : Fuzz.Fuzzer (Maybe FA.Option)
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


pullFuzzer : Fuzz.Fuzzer (Maybe FA.Option)
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


sizeFuzzer : Fuzz.Fuzzer (Maybe FA.Option)
sizeFuzzer =
    let
        multFuzzer =
            Fuzz.map FA.Mult (Fuzz.intRange 2 10)

        fuzzer =
            Fuzz.oneOf
                [ Fuzz.constant FA.ExtraSmall
                , Fuzz.constant FA.Small
                , Fuzz.constant FA.Large
                , multFuzzer
                ]
    in
        Fuzz.map FA.Size fuzzer
            |> Fuzz.maybe


transformFuzzer : Fuzz.Fuzzer (Maybe FA.Option)
transformFuzzer =
    let
        fuzzer =
            Fuzz.oneOf
                [ Fuzz.map FA.Grow Fuzz.float
                , Fuzz.map FA.Shrink Fuzz.float
                , Fuzz.map FA.ShiftDown Fuzz.float
                , Fuzz.map FA.ShiftLeft Fuzz.float
                , Fuzz.map FA.ShiftRight Fuzz.float
                , Fuzz.map FA.ShiftUp Fuzz.float
                , Fuzz.map FA.Rotate Fuzz.float
                , Fuzz.constant FA.FlipHorizontal
                , Fuzz.constant FA.FlipVertical
                ]
    in
        Fuzz.map FA.Transform (Fuzz.list fuzzer)
            |> Fuzz.maybe


maskFuzzer : Fuzz.Fuzzer (Maybe FA.Option)
maskFuzzer =
    Fuzz.map2 FA.Mask iconFuzzer styleFuzzer
        |> Fuzz.maybe


optionsFuzzer : Fuzz.Fuzzer (List FA.Option)
optionsFuzzer =
    let
        optionFuzzer =
            Fuzz.oneOf
                [ animationFuzzer
                , borderFuzzer
                , widthFuzzer
                , invertFuzzer
                , htmlTagFuzzer
                , maskFuzzer
                , pullFuzzer
                , sizeFuzzer
                , transformFuzzer
                ]

        removeMaybes =
            List.filterMap identity
    in
        Fuzz.list optionFuzzer
            |> Fuzz.map (removeMaybes)


htmlAttributesFuzzer : Fuzz.Fuzzer (List (Attribute msg))
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
                    [ testIconClass icon
                    , testStyle icon style
                    , testBorder options
                    , testWidth options
                    , testInvertColor options
                    , testHtmlTag options
                    , testAnimation options
                    , testPull options
                    , testSize options
                    , testTransform options
                    , testMask options
                    , expectation
                    ]


last : (a -> Bool) -> List a -> Maybe a
last f =
    List.filter f >> List.reverse >> List.head


isAnimation : FA.Option -> Bool
isAnimation option =
    case option of
        FA.Animation _ ->
            True

        _ ->
            False


isHtmlTag : FA.Option -> Bool
isHtmlTag option =
    case option of
        FA.HtmlTag _ ->
            True

        _ ->
            False


isPull : FA.Option -> Bool
isPull option =
    case option of
        FA.Pull _ ->
            True

        _ ->
            False


isSize : FA.Option -> Bool
isSize option =
    case option of
        FA.Size _ ->
            True

        _ ->
            False


isTransform : FA.Option -> Bool
isTransform option =
    case option of
        FA.Transform _ ->
            True

        _ ->
            False


isMask : FA.Option -> Bool
isMask option =
    case option of
        FA.Mask _ _ ->
            True

        _ ->
            False


styleClass : Icon -> FA.Style -> String
styleClass icon style =
    case icon of
        Icon.Logo _ ->
            "fab"

        Icon.Icon _ ->
            case style of
                FA.Solid ->
                    "fas"

                FA.Regular ->
                    "far"

                FA.Light ->
                    "fal"


iconClass : Icon -> String
iconClass icon =
    case icon of
        Icon.Icon str ->
            "fa-" ++ str

        Icon.Logo str ->
            "fa-" ++ str
