module Fuzzers exposing (..)

import FontAwesome as FA
import FontAwesome.Icon exposing (Icon)
import Fuzz
    exposing
        ( Fuzzer
        , constant
        , float
        , list
        , maybe
        , map
        , map2
        , oneOf
        )
import Html exposing (Attribute)
import Html.Attributes


styleFuzzer : Fuzzer FA.Style
styleFuzzer =
    oneOf
        [ constant FA.Regular
        , constant FA.Solid
        , constant FA.Light
        ]


transformFuzzer : Fuzzer (List FA.Transform)
transformFuzzer =
    let
        fuzzer =
            Fuzz.oneOf
                [ map FA.Grow float
                , map FA.Shrink float
                , map FA.ShiftDown float
                , map FA.ShiftLeft float
                , map FA.ShiftRight float
                , map FA.ShiftUp float
                , map FA.Rotate float
                , constant FA.FlipHorizontal
                , constant FA.FlipVertical
                ]
    in
        list fuzzer


transformOptionFuzzer : Fuzzer FA.Option
transformOptionFuzzer =
    map FA.Transform transformFuzzer


attributesFuzzer : Fuzz.Fuzzer (List (Attribute msg))
attributesFuzzer =
    -- Fuzzing attributes caused massive slowdown in test running, so the
    -- implementation has been modified to use constants
    let
        attributeFuzzer =
            Fuzz.oneOf
                [ Fuzz.constant (Html.Attributes.class "test-class")
                , Fuzz.constant (Html.Attributes.title "test title")
                , Fuzz.constant (Html.Attributes.attribute "data-test-attr" "attr val")
                ]
    in
        Fuzz.list attributeFuzzer


borderFuzzer : Fuzz.Fuzzer FA.Option
borderFuzzer =
    Fuzz.constant FA.HasBorder


widthFuzzer : Fuzz.Fuzzer FA.Option
widthFuzzer =
    Fuzz.constant FA.HasFixedWidth


invertFuzzer : Fuzz.Fuzzer FA.Option
invertFuzzer =
    Fuzz.constant FA.InvertColor


htmlTagFuzzer : Fuzz.Fuzzer FA.Option
htmlTagFuzzer =
    let
        fuzzer =
            Fuzz.oneOf
                [ Fuzz.constant FA.I
                , Fuzz.constant FA.Span
                ]
    in
        Fuzz.map FA.HtmlTag fuzzer


animationFuzzer : Fuzz.Fuzzer FA.Option
animationFuzzer =
    let
        fuzzer =
            Fuzz.oneOf
                [ Fuzz.constant FA.Spin
                , Fuzz.constant FA.Pulse
                ]
    in
        Fuzz.map FA.Animation fuzzer


pullFuzzer : Fuzz.Fuzzer FA.Option
pullFuzzer =
    let
        fuzzer =
            Fuzz.oneOf
                [ Fuzz.constant FA.Left
                , Fuzz.constant FA.Right
                ]
    in
        Fuzz.map FA.Pull fuzzer


sizeFuzzer : Fuzz.Fuzzer FA.Option
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


maskFuzzer : Fuzz.Fuzzer FA.Option
maskFuzzer =
    Fuzz.map2 FA.Mask iconFuzzer styleFuzzer


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
                , transformOptionFuzzer
                ]
    in
        Fuzz.list optionFuzzer


iconFuzzer : Fuzzer Icon
iconFuzzer =
    oneOf
        [ constant FA.accessibleIcon
        , constant FA.accusoft
        , constant FA.addressBook
        , constant FA.addressCard
        , constant FA.adjust
        , constant FA.adn
        , constant FA.adversal
        , constant FA.affiliateTheme
        , constant FA.alarmClock
        , constant FA.algolia
        , constant FA.alignCenter
        , constant FA.alignJustify
        , constant FA.alignLeft
        , constant FA.alignRight
        , constant FA.amazon
        , constant FA.amazonPay
        , constant FA.ambulance
        , constant FA.americanSignLanguageInterpreting
        , constant FA.amilia
        , constant FA.anchor
        , constant FA.android
        , constant FA.angelList
        , constant FA.angleDoubleDown
        , constant FA.angleDoubleLeft
        , constant FA.angleDoubleRight
        , constant FA.angleDoubleUp
        , constant FA.angleDown
        , constant FA.angleLeft
        , constant FA.angleRight
        , constant FA.angleUp
        , constant FA.angryCreative
        , constant FA.angular
        , constant FA.appStore
        , constant FA.appStoreIos
        , constant FA.apper
        , constant FA.apple
        , constant FA.applePay
        , constant FA.archive
        , constant FA.arrowAltCircleDown
        , constant FA.arrowAltCircleLeft
        , constant FA.arrowAltCircleRight
        , constant FA.arrowAltCircleUp
        , constant FA.arrowAltDown
        , constant FA.arrowAltFromBottom
        , constant FA.arrowAltFromLeft
        , constant FA.arrowAltFromRight
        , constant FA.arrowAltFromTop
        , constant FA.arrowAltLeft
        , constant FA.arrowAltRight
        , constant FA.arrowAltSquareDown
        , constant FA.arrowAltSquareLeft
        , constant FA.arrowAltSquareRight
        , constant FA.arrowAltSquareUp
        , constant FA.arrowAltToBottom
        , constant FA.arrowAltToLeft
        , constant FA.arrowAltToRight
        , constant FA.arrowAltToTop
        , constant FA.arrowAltUp
        , constant FA.arrowCircleDown
        , constant FA.arrowCircleLeft
        , constant FA.arrowCircleRight
        , constant FA.arrowCircleUp
        , constant FA.arrowDown
        , constant FA.arrowFromBottom
        , constant FA.arrowFromLeft
        , constant FA.arrowFromRight
        , constant FA.arrowFromTop
        , constant FA.arrowLeft
        , constant FA.arrowRight
        , constant FA.arrowSquareDown
        , constant FA.arrowSquareLeft
        , constant FA.arrowSquareRight
        , constant FA.arrowSquareUp
        , constant FA.arrowToBottom
        , constant FA.arrowToLeft
        , constant FA.arrowToRight
        , constant FA.arrowToTop
        , constant FA.arrowUp
        , constant FA.arrows
        , constant FA.arrowsAlt
        , constant FA.arrowsAltHorizontal
        , constant FA.arrowsAltVertical
        , constant FA.arrowsHorizontal
        , constant FA.arrowsVertical
        , constant FA.assistiveListeningSystems
        , constant FA.asterisk
        , constant FA.asymmetrik
        , constant FA.at
        , constant FA.audible
        , constant FA.audioDescription
        , constant FA.autoprefixer
        , constant FA.avianex
        , constant FA.aviato
        , constant FA.aws
        , constant FA.bimObject
        , constant FA.backward
        , constant FA.badge
        , constant FA.badgeCheck
        , constant FA.balanceScale
        , constant FA.ban
        , constant FA.bandcamp
        , constant FA.barcode
        , constant FA.bars
        , constant FA.bath
        , constant FA.batteryBolt
        , constant FA.batteryEmpty
        , constant FA.batteryFull
        , constant FA.batteryHalf
        , constant FA.batteryQuarter
        , constant FA.batterySlash
        , constant FA.batteryThreeQuarters
        , constant FA.bed
        , constant FA.beer
        , constant FA.behance
        , constant FA.behanceSquare
        , constant FA.bell
        , constant FA.bellSlash
        , constant FA.bicycle
        , constant FA.binoculars
        , constant FA.birthdayCake
        , constant FA.bitbucket
        , constant FA.bitcoin
        , constant FA.bity
        , constant FA.blackTie
        , constant FA.blackberry
        , constant FA.blind
        , constant FA.blogger
        , constant FA.bloggerB
        , constant FA.bluetooth
        , constant FA.bluetoothB
        , constant FA.bold
        , constant FA.bolt
        , constant FA.bomb
        , constant FA.book
        , constant FA.bookmark
        , constant FA.braille
        , constant FA.briefcase
        , constant FA.browser
        , constant FA.btc
        , constant FA.bug
        , constant FA.building
        , constant FA.bullhorn
        , constant FA.bullseye
        , constant FA.buromobelExperte
        , constant FA.bus
        , constant FA.buySellAds
        , constant FA.ccAmazonPay
        , constant FA.ccAmex
        , constant FA.ccApplePay
        , constant FA.ccDinersClub
        , constant FA.ccDiscover
        , constant FA.ccJcb
        , constant FA.ccMastercard
        , constant FA.ccPayPal
        , constant FA.ccStripe
        , constant FA.ccVisa
        , constant FA.css3
        , constant FA.css3Alt
        , constant FA.calculator
        , constant FA.calendar
        , constant FA.calendarAlt
        , constant FA.calendarCheck
        , constant FA.calendarEdit
        , constant FA.calendarExclamation
        , constant FA.calendarMinus
        , constant FA.calendarPlus
        , constant FA.calendarTimes
        , constant FA.camera
        , constant FA.cameraAlt
        , constant FA.cameraRetro
        , constant FA.car
        , constant FA.caretCircleDown
        , constant FA.caretCircleLeft
        , constant FA.caretCircleRight
        , constant FA.caretCircleUp
        , constant FA.caretDown
        , constant FA.caretLeft
        , constant FA.caretRight
        , constant FA.caretSquareDown
        , constant FA.caretSquareLeft
        , constant FA.caretSquareRight
        , constant FA.caretSquareUp
        , constant FA.caretUp
        , constant FA.cartArrowDown
        , constant FA.cartPlus
        , constant FA.centercode
        , constant FA.certificate
        , constant FA.chartArea
        , constant FA.chartBar
        , constant FA.chartLine
        , constant FA.chartPie
        , constant FA.check
        , constant FA.checkCircle
        , constant FA.checkSquare
        , constant FA.chevronCircleDown
        , constant FA.chevronCircleLeft
        , constant FA.chevronCircleRight
        , constant FA.chevronCircleUp
        , constant FA.chevronDoubleDown
        , constant FA.chevronDoubleLeft
        , constant FA.chevronDoubleRight
        , constant FA.chevronDoubleUp
        , constant FA.chevronDown
        , constant FA.chevronLeft
        , constant FA.chevronRight
        , constant FA.chevronSquareDown
        , constant FA.chevronSquareLeft
        , constant FA.chevronSquareRight
        , constant FA.chevronSquareUp
        , constant FA.chevronUp
        , constant FA.child
        , constant FA.chrome
        , constant FA.circle
        , constant FA.circleNotch
        , constant FA.clipboard
        , constant FA.clock
        , constant FA.clone
        , constant FA.closedCaptioning
        , constant FA.cloud
        , constant FA.cloudDownload
        , constant FA.cloudDownloadAlt
        , constant FA.cloudScale
        , constant FA.cloudUpload
        , constant FA.cloudUploadAlt
        , constant FA.cloudsmith
        , constant FA.cloudversify
        , constant FA.club
        , constant FA.code
        , constant FA.codeBranch
        , constant FA.codeCommit
        , constant FA.codeMerge
        , constant FA.codePen
        , constant FA.codiePie
        , constant FA.coffee
        , constant FA.cog
        , constant FA.cogs
        , constant FA.columns
        , constant FA.comment
        , constant FA.commentAlt
        , constant FA.comments
        , constant FA.compass
        , constant FA.compress
        , constant FA.compressAlt
        , constant FA.compressWide
        , constant FA.connectDevelop
        , constant FA.contao
        , constant FA.copy
        , constant FA.copyright
        , constant FA.cpanel
        , constant FA.creativeCommons
        , constant FA.creditCard
        , constant FA.creditCardBlank
        , constant FA.creditCardFront
        , constant FA.crop
        , constant FA.crosshairs
        , constant FA.cube
        , constant FA.cubes
        , constant FA.cut
        , constant FA.cuttlefish

        -- Note: The rest of these are commented out because including them
        -- results in a stack overflow when running elm-test. Practically, it
        -- shouldn't matter, as there's nothing special about the rest of these
        -- types that would result in different test outcomes.
        -- , constant FA.dAndD
        -- , constant FA.dashcube
        -- , constant FA.database
        -- , constant FA.deaf
        -- , constant FA.delicious
        -- , constant FA.deployDog
        -- , constant FA.deskpro
        -- , constant FA.desktop
        -- , constant FA.desktopAlt
        -- , constant FA.deviantArt
        -- , constant FA.diamond
        -- , constant FA.digg
        -- , constant FA.digitalOcean
        -- , constant FA.discord
        -- , constant FA.discourse
        -- , constant FA.docHub
        -- , constant FA.docker
        -- , constant FA.dollarSign
        -- , constant FA.dotCircle
        -- , constant FA.download
        -- , constant FA.draft2Digital
        -- , constant FA.dribbble
        -- , constant FA.dribbbleSquare
        -- , constant FA.dropbox
        -- , constant FA.drupal
        -- , constant FA.dyalog
        -- , constant FA.earlyBirds
        -- , constant FA.edge
        -- , constant FA.edit
        -- , constant FA.eject
        -- , constant FA.elementor
        -- , constant FA.ellipsisHorizontal
        -- , constant FA.ellipsisHorizontalAlt
        -- , constant FA.ellipsisVertical
        -- , constant FA.ellipsisVerticalAlt
        -- , constant FA.ember
        -- , constant FA.empire
        -- , constant FA.envelope
        -- , constant FA.envelopeOpen
        -- , constant FA.envelopeSquare
        -- , constant FA.envira
        -- , constant FA.eraser
        -- , constant FA.erlang
        -- , constant FA.ethereum
        -- , constant FA.etsy
        -- , constant FA.euroSign
        -- , constant FA.exchange
        -- , constant FA.exchangeAlt
        -- , constant FA.exclamation
        -- , constant FA.exclamationCircle
        -- , constant FA.exclamationSquare
        -- , constant FA.exclamationTriangle
        -- , constant FA.expand
        -- , constant FA.expandAlt
        -- , constant FA.expandArrows
        -- , constant FA.expandArrowsAlt
        -- , constant FA.expandWide
        -- , constant FA.expeditedSSL
        -- , constant FA.externalLink
        -- , constant FA.externalLinkAlt
        -- , constant FA.externalLinkSquare
        -- , constant FA.externalLinkSquareAlt
        -- , constant FA.eye
        -- , constant FA.eyeDropper
        -- , constant FA.eyeSlash
        -- , constant FA.facebook
        -- , constant FA.facebookF
        -- , constant FA.facebookMessenger
        -- , constant FA.facebookSquare
        -- , constant FA.fastBackward
        -- , constant FA.fastForward
        -- , constant FA.fax
        -- , constant FA.female
        -- , constant FA.fighterJet
        -- , constant FA.file
        -- , constant FA.fileAlt
        -- , constant FA.fileArchive
        -- , constant FA.fileAudio
        -- , constant FA.fileCheck
        -- , constant FA.fileCode
        -- , constant FA.fileEdit
        -- , constant FA.fileExcel
        -- , constant FA.fileExclamation
        -- , constant FA.fileImage
        -- , constant FA.fileMinus
        -- , constant FA.filePdf
        -- , constant FA.filePlus
        -- , constant FA.filePowerpoint
        -- , constant FA.fileTimes
        -- , constant FA.fileVideo
        -- , constant FA.fileWord
        -- , constant FA.film
        -- , constant FA.filmAlt
        -- , constant FA.filter
        -- , constant FA.fire
        -- , constant FA.fireExtinguisher
        -- , constant FA.firefox
        -- , constant FA.firstDraft
        -- , constant FA.firstOrder
        -- , constant FA.fiveHundredPx
        -- , constant FA.flag
        -- , constant FA.flagCheckered
        -- , constant FA.flask
        -- , constant FA.flickr
        -- , constant FA.fly
        -- , constant FA.folder
        -- , constant FA.folderOpen
        -- , constant FA.font
        -- , constant FA.fontAwesome
        -- , constant FA.fontAwesomeAlt
        -- , constant FA.fontAwesomeFlag
        -- , constant FA.fontIcons
        -- , constant FA.fontIconsFi
        -- , constant FA.fortAwesome
        -- , constant FA.fortAwesomeAlt
        -- , constant FA.forumbee
        -- , constant FA.forward
        -- , constant FA.foursquare
        -- , constant FA.freeBSD
        -- , constant FA.freeCodeCamp
        -- , constant FA.frown
        -- , constant FA.futbol
        -- , constant FA.gG
        -- , constant FA.gGCircle
        -- , constant FA.gamepad
        -- , constant FA.gavel
        -- , constant FA.gem
        -- , constant FA.genderless
        -- , constant FA.getPocket
        -- , constant FA.gift
        -- , constant FA.git
        -- , constant FA.gitHub
        -- , constant FA.gitHubAlt
        -- , constant FA.gitHubSquare
        -- , constant FA.gitKraken
        -- , constant FA.gitLab
        -- , constant FA.gitSquare
        -- , constant FA.gitter
        -- , constant FA.glassMartini
        -- , constant FA.glide
        -- , constant FA.glideG
        -- , constant FA.globe
        -- , constant FA.gofore
        -- , constant FA.goodreads
        -- , constant FA.goodreadsG
        -- , constant FA.google
        -- , constant FA.googleDrive
        -- , constant FA.googlePlay
        -- , constant FA.googlePlus
        -- , constant FA.googlePlusG
        -- , constant FA.googlePlusSquare
        -- , constant FA.googleWallet
        -- , constant FA.graduationCap
        -- , constant FA.gratipay
        -- , constant FA.grav
        -- , constant FA.gripfire
        -- , constant FA.grunt
        -- , constant FA.gulp
        -- , constant FA.h1
        -- , constant FA.h2
        -- , constant FA.h3
        -- , constant FA.hSquare
        -- , constant FA.hackerNews
        -- , constant FA.hackerNewsSquare
        -- , constant FA.handLizard
        -- , constant FA.handPaper
        -- , constant FA.handPeace
        -- , constant FA.handPointDown
        -- , constant FA.handPointLeft
        -- , constant FA.handPointRight
        -- , constant FA.handPointUp
        -- , constant FA.handPointer
        -- , constant FA.handRock
        -- , constant FA.handScissors
        -- , constant FA.handSpock
        -- , constant FA.handshake
        -- , constant FA.hashtag
        -- , constant FA.hdd
        -- , constant FA.heading
        -- , constant FA.headphones
        -- , constant FA.heart
        -- , constant FA.heartbeat
        -- , constant FA.hexagon
        -- , constant FA.hireAHelper
        -- , constant FA.history
        -- , constant FA.home
        -- , constant FA.hooli
        -- , constant FA.hospital
        -- , constant FA.hotjar
        -- , constant FA.hourglass
        -- , constant FA.hourglassEnd
        -- , constant FA.hourglassHalf
        -- , constant FA.hourglassStart
        -- , constant FA.houzz
        -- , constant FA.html5
        -- , constant FA.hubSpot
        -- , constant FA.iCursor
        -- , constant FA.idBadge
        -- , constant FA.idCard
        -- , constant FA.image
        -- , constant FA.images
        -- , constant FA.imdb
        -- , constant FA.inbox
        -- , constant FA.inboxIn
        -- , constant FA.inboxOut
        -- , constant FA.indent
        -- , constant FA.industry
        -- , constant FA.industryAlt
        -- , constant FA.info
        -- , constant FA.infoCircle
        -- , constant FA.infoSquare
        -- , constant FA.instagram
        -- , constant FA.internetExplorer
        -- , constant FA.ioxHost
        -- , constant FA.italic
        -- , constant FA.itunes
        -- , constant FA.itunesNote
        -- , constant FA.jSFiddle
        -- , constant FA.jackOLantern
        -- , constant FA.jenkins
        -- , constant FA.joget
        -- , constant FA.joomla
        -- , constant FA.js
        -- , constant FA.jsSquare
        -- , constant FA.key
        -- , constant FA.keyCDN
        -- , constant FA.keyboard
        -- , constant FA.kickstarter
        -- , constant FA.kickstarterK
        -- , constant FA.korvue
        -- , constant FA.language
        -- , constant FA.laptop
        -- , constant FA.laravel
        -- , constant FA.lastfm
        -- , constant FA.lastfmSquare
        -- , constant FA.leaf
        -- , constant FA.leanpub
        -- , constant FA.lemon
        -- , constant FA.less
        -- , constant FA.levelDown
        -- , constant FA.levelDownAlt
        -- , constant FA.levelUp
        -- , constant FA.levelUpAlt
        -- , constant FA.lifeRing
        -- , constant FA.lightbulb
        -- , constant FA.line
        -- , constant FA.link
        -- , constant FA.linkedIn
        -- , constant FA.linkedInInverted
        -- , constant FA.linode
        -- , constant FA.linux
        -- , constant FA.liraSign
        -- , constant FA.list
        -- , constant FA.listAlt
        -- , constant FA.listOl
        -- , constant FA.listUl
        -- , constant FA.locationArrow
        -- , constant FA.lock
        -- , constant FA.lockAlt
        -- , constant FA.lockOpen
        -- , constant FA.lockOpenAlt
        -- , constant FA.longArrowAltDown
        -- , constant FA.longArrowAltLeft
        -- , constant FA.longArrowAltRight
        -- , constant FA.longArrowAltUp
        -- , constant FA.longArrowDown
        -- , constant FA.longArrowLeft
        -- , constant FA.longArrowRight
        -- , constant FA.longArrowUp
        -- , constant FA.lowVision
        -- , constant FA.lyft
        -- , constant FA.mODX
        -- , constant FA.magento
        -- , constant FA.magic
        -- , constant FA.magnet
        -- , constant FA.male
        -- , constant FA.map
        -- , constant FA.mapMarker
        -- , constant FA.mapMarkerAlt
        -- , constant FA.mapPin
        -- , constant FA.mapSigns
        -- , constant FA.mars
        -- , constant FA.marsDouble
        -- , constant FA.marsStroke
        -- , constant FA.marsStrokeHorizontal
        -- , constant FA.marsStrokeVertical
        -- , constant FA.maxcdn
        -- , constant FA.medApps
        -- , constant FA.medium
        -- , constant FA.mediumM
        -- , constant FA.medkit
        -- , constant FA.medrt
        -- , constant FA.meetup
        -- , constant FA.meh
        -- , constant FA.mercury
        -- , constant FA.microchip
        -- , constant FA.microphone
        -- , constant FA.microphoneAlt
        -- , constant FA.microphoneSlash
        -- , constant FA.microsoft
        -- , constant FA.minus
        -- , constant FA.minusCircle
        -- , constant FA.minusHexagon
        -- , constant FA.minusOctagon
        -- , constant FA.minusSquare
        -- , constant FA.mix
        -- , constant FA.mixcloud
        -- , constant FA.mizuni
        -- , constant FA.mobile
        -- , constant FA.mobileAlt
        -- , constant FA.mobileAndroid
        -- , constant FA.mobileAndroidAlt
        -- , constant FA.monero
        -- , constant FA.moneyBill
        -- , constant FA.moneyBillAlt
        -- , constant FA.moon
        -- , constant FA.motorcycle
        -- , constant FA.mousePointer
        -- , constant FA.music
        -- , constant FA.nS8
        -- , constant FA.napster
        -- , constant FA.neuter
        -- , constant FA.newspaper
        -- , constant FA.nintendoSwitch
        -- , constant FA.node
        -- , constant FA.nodejs
        -- , constant FA.npm
        -- , constant FA.nutritionix
        -- , constant FA.objectGroup
        -- , constant FA.objectUngroup
        -- , constant FA.octagon
        -- , constant FA.odnoklassniki
        -- , constant FA.odnoklassnikiSquare
        -- , constant FA.openCart
        -- , constant FA.openID
        -- , constant FA.openSourceInitiative
        -- , constant FA.opera
        -- , constant FA.optinMonster
        -- , constant FA.outdent
        -- , constant FA.page4
        -- , constant FA.pageLines
        -- , constant FA.paintBrush
        -- , constant FA.palFed
        -- , constant FA.paperPlane
        -- , constant FA.paperclip
        -- , constant FA.paragraph
        -- , constant FA.paste
        -- , constant FA.patreon
        -- , constant FA.pause
        -- , constant FA.pauseCircle
        -- , constant FA.paw
        -- , constant FA.payPal
        -- , constant FA.pen
        -- , constant FA.penAlt
        -- , constant FA.penSquare
        -- , constant FA.pencil
        -- , constant FA.pencilAlt
        -- , constant FA.percent
        -- , constant FA.periscope
        -- , constant FA.phabricator
        -- , constant FA.phoenixFramework
        -- , constant FA.phone
        -- , constant FA.phoneSlash
        -- , constant FA.phoneSquare
        -- , constant FA.phoneVolume
        -- , constant FA.piedPiper
        -- , constant FA.piedPiperAlt
        -- , constant FA.piedPiperPp
        -- , constant FA.pinterest
        -- , constant FA.pinterestP
        -- , constant FA.pinterestSquare
        -- , constant FA.plane
        -- , constant FA.planeAlt
        -- , constant FA.play
        -- , constant FA.playCircle
        -- , constant FA.playstation
        -- , constant FA.plug
        -- , constant FA.plus
        -- , constant FA.plusCircle
        -- , constant FA.plusHexagon
        -- , constant FA.plusOctagon
        -- , constant FA.plusSquare
        -- , constant FA.podcast
        -- , constant FA.poo
        -- , constant FA.portrait
        -- , constant FA.poundSign
        -- , constant FA.powerOff
        -- , constant FA.print
        -- , constant FA.productHunt
        -- , constant FA.pushed
        -- , constant FA.puzzlePiece
        -- , constant FA.python
        -- , constant FA.qQ
        -- , constant FA.qrcode
        -- , constant FA.question
        -- , constant FA.questionCircle
        -- , constant FA.questionSquare
        -- , constant FA.quora
        -- , constant FA.quoteLeft
        -- , constant FA.quoteRight
        -- , constant FA.rSS
        -- , constant FA.rSSSquare
        -- , constant FA.random
        -- , constant FA.ravelry
        -- , constant FA.react
        -- , constant FA.rebel
        -- , constant FA.rectangleLandscape
        -- , constant FA.rectanglePortrait
        -- , constant FA.rectangleWide
        -- , constant FA.recycle
        -- , constant FA.redRiver
        -- , constant FA.reddit
        -- , constant FA.redditAlien
        -- , constant FA.redditSquare
        -- , constant FA.redo
        -- , constant FA.redoAlt
        -- , constant FA.registered
        -- , constant FA.rendact
        -- , constant FA.renren
        -- , constant FA.repeat
        -- , constant FA.repeat1
        -- , constant FA.repeat1Alt
        -- , constant FA.repeatAlt
        -- , constant FA.reply
        -- , constant FA.replyAll
        -- , constant FA.replyd
        -- , constant FA.resolving
        -- , constant FA.retweet
        -- , constant FA.retweetAlt
        -- , constant FA.road
        -- , constant FA.rockRMS
        -- , constant FA.rocket
        -- , constant FA.rocketChat
        -- , constant FA.rubleSign
        -- , constant FA.rupeeSign
        -- , constant FA.safari
        -- , constant FA.sass
        -- , constant FA.save
        -- , constant FA.schlix
        -- , constant FA.scribd
        -- , constant FA.scrubber
        -- , constant FA.search
        -- , constant FA.searchMinus
        -- , constant FA.searchPlus
        -- , constant FA.searchengin
        -- , constant FA.sellCast
        -- , constant FA.sellsy
        -- , constant FA.server
        -- , constant FA.serviceStack
        -- , constant FA.share
        -- , constant FA.shareAll
        -- , constant FA.shareAlt
        -- , constant FA.shareAltSquare
        -- , constant FA.shareSquare
        -- , constant FA.shekelSign
        -- , constant FA.shield
        -- , constant FA.shieldAlt
        -- , constant FA.shieldCheck
        -- , constant FA.ship
        -- , constant FA.shirtsInBulk
        -- , constant FA.shoppingBag
        -- , constant FA.shoppingBasket
        -- , constant FA.shoppingCart
        -- , constant FA.shower
        -- , constant FA.signIn
        -- , constant FA.signInAlt
        -- , constant FA.signLanguage
        -- , constant FA.signOut
        -- , constant FA.signOutAlt
        -- , constant FA.signal
        -- , constant FA.simplyBuilt
        -- , constant FA.sistrix
        -- , constant FA.sitemap
        -- , constant FA.skyAtlas
        -- , constant FA.skype
        -- , constant FA.slack
        -- , constant FA.slackHash
        -- , constant FA.slidersHorizontal
        -- , constant FA.slidersHorizontalSquare
        -- , constant FA.slidersV
        -- , constant FA.slidersVSquare
        -- , constant FA.slideshare
        -- , constant FA.smile
        -- , constant FA.snapchat
        -- , constant FA.snapchatGhost
        -- , constant FA.snapchatSquare
        -- , constant FA.snowflake
        -- , constant FA.sort
        -- , constant FA.sortAlphaDown
        -- , constant FA.sortAlphaUp
        -- , constant FA.sortAmountDown
        -- , constant FA.sortAmountUp
        -- , constant FA.sortDown
        -- , constant FA.sortNumericDown
        -- , constant FA.sortNumericUp
        -- , constant FA.sortUp
        -- , constant FA.soundCloud
        -- , constant FA.spaceShuttle
        -- , constant FA.spade
        -- , constant FA.speakap
        -- , constant FA.spinner
        -- , constant FA.spinnerThird
        -- , constant FA.spotify
        -- , constant FA.square
        -- , constant FA.stackExchange
        -- , constant FA.stackOverflow
        -- , constant FA.star
        -- , constant FA.starExclamation
        -- , constant FA.starHalf
        -- , constant FA.stayLinked
        -- , constant FA.steam
        -- , constant FA.steamSquare
        -- , constant FA.steamSymbol
        -- , constant FA.stepBackward
        -- , constant FA.stepForward
        -- , constant FA.stethoscope
        -- , constant FA.stickerMule
        -- , constant FA.stickyNote
        -- , constant FA.stop
        -- , constant FA.stopCircle
        -- , constant FA.stopwatch
        -- , constant FA.strava
        -- , constant FA.streetView
        -- , constant FA.strikethrough
        -- , constant FA.stripe
        -- , constant FA.stripeS
        -- , constant FA.studioVinari
        -- , constant FA.stumbleUpon
        -- , constant FA.stumbleUponCircle
        -- , constant FA.subscript
        -- , constant FA.subway
        -- , constant FA.suitcase
        -- , constant FA.sun
        -- , constant FA.superpowers
        -- , constant FA.superscript
        -- , constant FA.supple
        -- , constant FA.sync
        -- , constant FA.syncAlt
        -- , constant FA.tTY
        -- , constant FA.tV
        -- , constant FA.tVRetro
        -- , constant FA.table
        -- , constant FA.tablet
        -- , constant FA.tabletAlt
        -- , constant FA.tabletAndroid
        -- , constant FA.tabletAndroidAlt
        -- , constant FA.tachometer
        -- , constant FA.tachometerAlt
        -- , constant FA.tag
        -- , constant FA.tags
        -- , constant FA.tasks
        -- , constant FA.taxi
        -- , constant FA.telegram
        -- , constant FA.telegramPlane
        -- , constant FA.tencentWeibo
        -- , constant FA.terminal
        -- , constant FA.textHeight
        -- , constant FA.textWidth
        -- , constant FA.th
        -- , constant FA.thLarge
        -- , constant FA.thList
        -- , constant FA.themeIsle
        -- , constant FA.thermometerEmpty
        -- , constant FA.thermometerFull
        -- , constant FA.thermometerHalf
        -- , constant FA.thermometerQuarter
        -- , constant FA.thermometerThreeQuarters
        -- , constant FA.thumbsDown
        -- , constant FA.thumbsUp
        -- , constant FA.thumbtack
        -- , constant FA.ticket
        -- , constant FA.ticketAlt
        -- , constant FA.times
        -- , constant FA.timesCircle
        -- , constant FA.timesHexagon
        -- , constant FA.timesOctagon
        -- , constant FA.timesSquare
        -- , constant FA.tint
        -- , constant FA.toggleOff
        -- , constant FA.toggleOn
        -- , constant FA.trademark
        -- , constant FA.train
        -- , constant FA.transgender
        -- , constant FA.transgenderAlt
        -- , constant FA.trash
        -- , constant FA.trashAlt
        -- , constant FA.tree
        -- , constant FA.treeAlt
        -- , constant FA.trello
        -- , constant FA.triangle
        -- , constant FA.tripAdvisor
        -- , constant FA.trophy
        -- , constant FA.trophyAlt
        -- , constant FA.truck
        -- , constant FA.tumblr
        -- , constant FA.tumblrSquare
        -- , constant FA.twitch
        -- , constant FA.twitter
        -- , constant FA.twitterSquare
        -- , constant FA.typo3
        -- , constant FA.uIkit
        -- , constant FA.uSB
        -- , constant FA.uber
        -- , constant FA.umbrella
        -- , constant FA.underline
        -- , constant FA.undo
        -- , constant FA.undoAlt
        -- , constant FA.uniregistry
        -- , constant FA.universalAccess
        -- , constant FA.university
        -- , constant FA.unlink
        -- , constant FA.unlock
        -- , constant FA.unlockAlt
        -- , constant FA.untappd
        -- , constant FA.upload
        -- , constant FA.usSunnah
        -- , constant FA.usdCircle
        -- , constant FA.usdSquare
        -- , constant FA.user
        -- , constant FA.userAlt
        -- , constant FA.userCircle
        -- , constant FA.userMd
        -- , constant FA.userPlus
        -- , constant FA.userSecret
        -- , constant FA.userTimes
        -- , constant FA.users
        -- , constant FA.utensilFork
        -- , constant FA.utensilKnife
        -- , constant FA.utensilSpoon
        -- , constant FA.utensils
        -- , constant FA.utensilsAlt
        -- , constant FA.vK
        -- , constant FA.vaadin
        -- , constant FA.venus
        -- , constant FA.venusDouble
        -- , constant FA.venusMars
        -- , constant FA.viacoin
        -- , constant FA.viadeo
        -- , constant FA.viadeoSquare
        -- , constant FA.viber
        -- , constant FA.video
        -- , constant FA.vimeo
        -- , constant FA.vimeoSquare
        -- , constant FA.vimeoV
        -- , constant FA.vine
        -- , constant FA.vnv
        -- , constant FA.volumeDown
        -- , constant FA.volumeMute
        -- , constant FA.volumeOff
        -- , constant FA.volumeUp
        -- , constant FA.vuejs
        -- , constant FA.wHMCS
        -- , constant FA.wPBeginner
        -- , constant FA.wPExplorer
        -- , constant FA.wPForms
        -- , constant FA.watch
        -- , constant FA.weibo
        -- , constant FA.weixin
        -- , constant FA.whatsApp
        -- , constant FA.whatsAppSquare
        -- , constant FA.wheelchair
        -- , constant FA.wifi
        -- , constant FA.wikipedia
        -- , constant FA.window
        -- , constant FA.windowAlt
        -- , constant FA.windowClose
        -- , constant FA.windowMaximize
        -- , constant FA.windowMinimize
        -- , constant FA.windowRestore
        -- , constant FA.windows
        -- , constant FA.wonSign
        -- , constant FA.wordPress
        -- , constant FA.wordPressSimple
        -- , constant FA.wrench
        -- , constant FA.xING
        -- , constant FA.xINGSquare
        -- , constant FA.xbox
        -- , constant FA.yCombinator
        -- , constant FA.yahoo
        -- , constant FA.yandex
        -- , constant FA.yandexInternational
        -- , constant FA.yelp
        -- , constant FA.yenSign
        -- , constant FA.yoast
        -- , constant FA.youTube
        -- , constant FA.youTubeSquare
        ]
