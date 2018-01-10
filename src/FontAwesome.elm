module FontAwesome
    exposing
        ( Animation(..)
        , Logo(..)
        , Attribute(..)
        , Icon(..)
        , Pull(..)
        , Size(..)
        , Style(..)
        , fa
        , fab
        , icon
        , iconStyled
        , logo
        )

import Html exposing (Html, span)
import Html.Attributes


icon : Icon -> Html msg
icon icon =
    iconStyled icon Solid


iconStyled : Icon -> Style -> Html msg
iconStyled icon style =
    fa icon style [] []


fa : Icon -> Style -> List Attribute -> List (Html.Attribute msg) -> Html msg
fa icon style attributes htmlAttributes =
    let
        attrs =
            filterAttrs attributes
    in
        span
            (classes icon style attrs
                :: htmlAttrs attrs htmlAttributes
            )
            []


logo : Logo -> Html msg
logo logo =
    fab logo [] []


fab : Logo -> List Attribute -> List (Html.Attribute msg) -> Html msg
fab logo attributes htmlAttributes =
    let
        attrs =
            filterAttrs attributes
    in
        span
            (logoClasses logo attributes
                :: htmlAttrs attrs htmlAttributes
            )
            []


htmlAttrs :
    List Attribute
    -> List (Html.Attribute msg)
    -> List (Html.Attribute msg)
htmlAttrs attributes htmlAttributes =
    transformAttr attributes
        ++ maskAttr attributes
        ++ htmlAttributes


isAnimation : Attribute -> Bool
isAnimation attribute =
    case attribute of
        Animation _ ->
            True

        _ ->
            False


isPull : Attribute -> Bool
isPull attribute =
    case attribute of
        Pull _ ->
            True

        _ ->
            False


isSize : Attribute -> Bool
isSize attribute =
    case attribute of
        Size _ ->
            True

        _ ->
            False


isBorder : Attribute -> Bool
isBorder attribute =
    case attribute of
        HasBorder ->
            True

        _ ->
            False


isWidth : Attribute -> Bool
isWidth attribute =
    case attribute of
        HasFixedWidth ->
            True

        _ ->
            False


isMask : Attribute -> Bool
isMask attribute =
    case attribute of
        Mask _ _ ->
            True

        _ ->
            False


isTransform : Attribute -> Bool
isTransform attribute =
    case attribute of
        Transform _ ->
            True

        _ ->
            False


onlyOne : (a -> Bool) -> a -> ( Bool, List a ) -> ( Bool, List a )
onlyOne f curr ( found, list ) =
    case ( f curr, found ) of
        ( True, False ) ->
            ( True, curr :: list )

        ( True, True ) ->
            ( found, list )

        ( False, _ ) ->
            ( found, curr :: list )


dedup : (a -> Bool) -> List a -> List a
dedup f list =
    List.foldr (onlyOne f) ( False, [] ) list
        |> Tuple.second


filterAttrs : List Attribute -> List Attribute
filterAttrs attributes =
    attributes
        |> dedup isAnimation
        |> dedup isPull
        |> dedup isSize
        |> dedup isBorder
        |> dedup isWidth
        |> dedup isMask
        |> dedup isTransform


iconClass : Icon -> String
iconClass icon =
    let
        root =
            name icon
    in
        "fa-" ++ root


logoClass : Logo -> String
logoClass logo =
    let
        root =
            logoName logo
    in
        "fa-" ++ root


animationClass : Animation -> String
animationClass animation =
    case animation of
        Spin ->
            "fa-spin"

        Pulse ->
            "fa-pulse"


borderClass : String
borderClass =
    "fa-border"


widthClass : String
widthClass =
    "fa-fw"


pullClass : Pull -> String
pullClass p =
    case p of
        Left ->
            "fa-pull-left"

        Right ->
            "fa-pull-right"


sizeClass : Size -> String
sizeClass size =
    case size of
        Normal ->
            ""

        ExtraSmall ->
            "fa-xs"

        Small ->
            "fa-sm"

        Large ->
            "fa-lg"

        Mult n ->
            "fa-" ++ toString n ++ "x"


styleClass : Style -> String
styleClass style =
    case style of
        Solid ->
            "fas"

        Regular ->
            "far"

        Light ->
            "fal"


className : Attribute -> ( String, Bool )
className attr =
    case attr of
        Animation animation ->
            ( animationClass animation, True )

        HasBorder ->
            ( borderClass, True )

        HasFixedWidth ->
            ( widthClass, True )

        Mask _ _ ->
            ( "", False )

        Pull direction ->
            ( pullClass direction, True )

        Size size ->
            ( sizeClass size, True )

        Transform _ ->
            ( "", False )


classes : Icon -> Style -> List Attribute -> Html.Attribute msg
classes icon style attributes =
    ( styleClass style, True )
        :: ( iconClass icon, True )
        :: List.map className attributes
        |> Html.Attributes.classList


logoClasses : Logo -> List Attribute -> Html.Attribute msg
logoClasses logo attributes =
    ( "fab", True )
        :: ( logoClass logo, True )
        :: List.map className attributes
        |> Html.Attributes.classList


transform : Attribute -> List (Html.Attribute msg) -> List (Html.Attribute msg)
transform attr attrs =
    case attr of
        Transform str ->
            Html.Attributes.attribute "data-fa-transform" str :: attrs

        _ ->
            attrs


transformAttr : List Attribute -> List (Html.Attribute msg)
transformAttr attributes =
    List.foldr transform [] attributes


mask : Attribute -> List (Html.Attribute msg) -> List (Html.Attribute msg)
mask attr attrs =
    case attr of
        Mask icon style ->
            let
                val =
                    styleClass style ++ " " ++ iconClass icon
            in
                Html.Attributes.attribute "data-fa-mask" val :: attrs

        _ ->
            attrs


maskAttr : List Attribute -> List (Html.Attribute msg)
maskAttr attributes =
    List.foldr mask [] attributes


type Attribute
    = Animation Animation
    | HasBorder
    | HasFixedWidth
    | Mask Icon Style
    | Pull Pull
    | Size Size
    | Transform String


type Style
    = Solid
    | Regular
    | Light


type Size
    = Normal
    | ExtraSmall
    | Small
    | Large
    | Mult Int


type Pull
    = Left
    | Right


type Animation
    = Spin
    | Pulse



-- The following section will need to be updated whenever
-- new icons are added. They've been placed at the bottom
-- so that all other lines are unchanged


type Icon
    = AddressBook
    | AddressCard
    | Adjust
    | AlarmClock
    | AlignCenter
    | AlignJustify
    | AlignLeft
    | AlignRight
    | Ambulance
    | AmericanSignLanguageInterpreting
    | Anchor
    | AngleDoubleDown
    | AngleDoubleLeft
    | AngleDoubleRight
    | AngleDoubleUp
    | AngleDown
    | AngleLeft
    | AngleRight
    | AngleUp
    | Archive
    | ArrowAltCircleDown
    | ArrowAltCircleLeft
    | ArrowAltCircleRight
    | ArrowAltCircleUp
    | ArrowAltDown
    | ArrowAltFromBottom
    | ArrowAltFromLeft
    | ArrowAltFromRight
    | ArrowAltFromTop
    | ArrowAltLeft
    | ArrowAltRight
    | ArrowAltSquareDown
    | ArrowAltSquareLeft
    | ArrowAltSquareRight
    | ArrowAltSquareUp
    | ArrowAltToBottom
    | ArrowAltToLeft
    | ArrowAltToRight
    | ArrowAltToTop
    | ArrowAltUp
    | ArrowCircleDown
    | ArrowCircleLeft
    | ArrowCircleRight
    | ArrowCircleUp
    | ArrowDown
    | ArrowFromBottom
    | ArrowFromLeft
    | ArrowFromRight
    | ArrowFromTop
    | ArrowLeft
    | ArrowRight
    | ArrowSquareDown
    | ArrowSquareLeft
    | ArrowSquareRight
    | ArrowSquareUp
    | ArrowToBottom
    | ArrowToLeft
    | ArrowToRight
    | ArrowToTop
    | ArrowUp
    | Arrows
    | ArrowsAlt
    | ArrowsAltHorizontal
    | ArrowsAltVertical
    | ArrowsHorizontal
    | ArrowsVertical
    | AssistiveListeningSystems
    | Asterisk
    | At
    | AudioDescription
    | Backward
    | Badge
    | BadgeCheck
    | BalanceScale
    | Ban
    | Barcode
    | Bars
    | Bath
    | BatteryBolt
    | BatteryEmpty
    | BatteryFull
    | BatteryHalf
    | BatteryQuarter
    | BatterySlash
    | BatteryThreeQuarters
    | Bed
    | Beer
    | Bell
    | BellSlash
    | Bicycle
    | Binoculars
    | BirthdayCake
    | Blind
    | Bold
    | Bolt
    | Bomb
    | Book
    | Bookmark
    | Braille
    | Briefcase
    | Browser
    | Bug
    | Building
    | Bullhorn
    | Bullseye
    | Bus
    | Calculator
    | Calendar
    | CalendarAlt
    | CalendarCheck
    | CalendarEdit
    | CalendarExclamation
    | CalendarMinus
    | CalendarPlus
    | CalendarTimes
    | Camera
    | CameraAlt
    | CameraRetro
    | Car
    | CaretCircleDown
    | CaretCircleLeft
    | CaretCircleRight
    | CaretCircleUp
    | CaretDown
    | CaretLeft
    | CaretRight
    | CaretSquareDown
    | CaretSquareLeft
    | CaretSquareRight
    | CaretSquareUp
    | CaretUp
    | CartArrowDown
    | CartPlus
    | Certificate
    | ChartArea
    | ChartBar
    | ChartLine
    | ChartPie
    | Check
    | CheckCircle
    | CheckSquare
    | ChevronCircleDown
    | ChevronCircleLeft
    | ChevronCircleRight
    | ChevronCircleUp
    | ChevronDoubleDown
    | ChevronDoubleLeft
    | ChevronDoubleRight
    | ChevronDoubleUp
    | ChevronDown
    | ChevronLeft
    | ChevronRight
    | ChevronSquareDown
    | ChevronSquareLeft
    | ChevronSquareRight
    | ChevronSquareUp
    | ChevronUp
    | Child
    | Circle
    | CircleNotch
    | Clipboard
    | Clock
    | Clone
    | ClosedCaptioning
    | Cloud
    | CloudDownload
    | CloudDownloadAlt
    | CloudUpload
    | CloudUploadAlt
    | Club
    | Code
    | CodeBranch
    | CodeCommit
    | CodeMerge
    | Coffee
    | Cog
    | Cogs
    | Columns
    | Comment
    | CommentAlt
    | Comments
    | Compass
    | Compress
    | CompressAlt
    | CompressWide
    | Copy
    | Copyright
    | CreditCard
    | CreditCardBlank
    | CreditCardFront
    | Crop
    | Crosshairs
    | Cube
    | Cubes
    | Cut
    | Database
    | Deaf
    | Desktop
    | DesktopAlt
    | Diamond
    | DollarSign
    | DotCircle
    | Download
    | Edit
    | Eject
    | EllipsisHorizontal
    | EllipsisHorizontalAlt
    | EllipsisVertical
    | EllipsisVerticalAlt
    | Envelope
    | EnvelopeOpen
    | EnvelopeSquare
    | Eraser
    | EuroSign
    | Exchange
    | ExchangeAlt
    | Exclamation
    | ExclamationCircle
    | ExclamationSquare
    | ExclamationTriangle
    | Expand
    | ExpandAlt
    | ExpandArrows
    | ExpandArrowsAlt
    | ExpandWide
    | ExternalLink
    | ExternalLinkAlt
    | ExternalLinkSquare
    | ExternalLinkSquareAlt
    | Eye
    | EyeDropper
    | EyeSlash
    | FastBackward
    | FastForward
    | Fax
    | Female
    | FighterJet
    | File
    | FileAlt
    | FileArchive
    | FileAudio
    | FileCheck
    | FileCode
    | FileEdit
    | FileExcel
    | FileExclamation
    | FileImage
    | FileMinus
    | FilePdf
    | FilePlus
    | FilePowerpoint
    | FileTimes
    | FileVideo
    | FileWord
    | Film
    | FilmAlt
    | Filter
    | Fire
    | FireExtinguisher
    | Flag
    | FlagCheckered
    | Flask
    | Folder
    | FolderOpen
    | Font
    | Forward
    | Frown
    | Futbol
    | Gamepad
    | Gavel
    | Gem
    | Genderless
    | Gift
    | GlassMartini
    | Globe
    | GraduationCap
    | HSquare
    | H1
    | H2
    | H3
    | HandLizard
    | HandPaper
    | HandPeace
    | HandPointDown
    | HandPointLeft
    | HandPointRight
    | HandPointUp
    | HandPointer
    | HandRock
    | HandScissors
    | HandSpock
    | Handshake
    | Hashtag
    | Hdd
    | Heading
    | Headphones
    | Heart
    | Heartbeat
    | Hexagon
    | History
    | Home
    | Hospital
    | Hourglass
    | HourglassEnd
    | HourglassHalf
    | HourglassStart
    | ICursor
    | IdBadge
    | IdCard
    | Image
    | Images
    | Inbox
    | InboxIn
    | InboxOut
    | Indent
    | Industry
    | IndustryAlt
    | Info
    | InfoCircle
    | InfoSquare
    | Italic
    | JackOLantern
    | Key
    | Keyboard
    | Language
    | Laptop
    | Leaf
    | Lemon
    | LevelDown
    | LevelDownAlt
    | LevelUp
    | LevelUpAlt
    | LifeRing
    | Lightbulb
    | Link
    | LiraSign
    | List
    | ListAlt
    | ListOl
    | ListUl
    | LocationArrow
    | Lock
    | LockAlt
    | LockOpen
    | LockOpenAlt
    | LongArrowAltDown
    | LongArrowAltLeft
    | LongArrowAltRight
    | LongArrowAltUp
    | LongArrowDown
    | LongArrowLeft
    | LongArrowRight
    | LongArrowUp
    | LowVision
    | Magic
    | Magnet
    | Male
    | Map
    | MapMarker
    | MapMarkerAlt
    | MapPin
    | MapSigns
    | Mars
    | MarsDouble
    | MarsStroke
    | MarsStrokeHorizontal
    | MarsStrokeVertical
    | Medkit
    | Meh
    | Mercury
    | Microchip
    | Microphone
    | MicrophoneAlt
    | MicrophoneSlash
    | Minus
    | MinusCircle
    | MinusHexagon
    | MinusOctagon
    | MinusSquare
    | Mobile
    | MobileAlt
    | MobileAndroid
    | MobileAndroidAlt
    | MoneyBill
    | MoneyBillAlt
    | Moon
    | Motorcycle
    | MousePointer
    | Music
    | Neuter
    | Newspaper
    | ObjectGroup
    | ObjectUngroup
    | Octagon
    | Outdent
    | PaintBrush
    | PaperPlane
    | Paperclip
    | Paragraph
    | Paste
    | Pause
    | PauseCircle
    | Paw
    | Pen
    | PenAlt
    | PenSquare
    | Pencil
    | PencilAlt
    | Percent
    | Phone
    | PhoneSlash
    | PhoneSquare
    | PhoneVolume
    | Plane
    | PlaneAlt
    | Play
    | PlayCircle
    | Plug
    | Plus
    | PlusCircle
    | PlusHexagon
    | PlusOctagon
    | PlusSquare
    | Podcast
    | Poo
    | Portrait
    | PoundSign
    | PowerOff
    | Print
    | PuzzlePiece
    | Qrcode
    | Question
    | QuestionCircle
    | QuestionSquare
    | QuoteLeft
    | QuoteRight
    | Random
    | RectangleLandscape
    | RectanglePortrait
    | RectangleWide
    | Recycle
    | Redo
    | RedoAlt
    | Registered
    | Repeat
    | Repeat1
    | Repeat1Alt
    | RepeatAlt
    | Reply
    | ReplyAll
    | Retweet
    | RetweetAlt
    | Road
    | Rocket
    | RSS
    | RSSSquare
    | RubleSign
    | RupeeSign
    | Save
    | Scrubber
    | Search
    | SearchMinus
    | SearchPlus
    | Server
    | Share
    | ShareAll
    | ShareAlt
    | ShareAltSquare
    | ShareSquare
    | ShekelSign
    | Shield
    | ShieldAlt
    | ShieldCheck
    | Ship
    | ShoppingBag
    | ShoppingBasket
    | ShoppingCart
    | Shower
    | SignIn
    | SignInAlt
    | SignLanguage
    | SignOut
    | SignOutAlt
    | Signal
    | Sitemap
    | SlidersHorizontal
    | SlidersHorizontalSquare
    | SlidersV
    | SlidersVSquare
    | Smile
    | Snowflake
    | Sort
    | SortAlphaDown
    | SortAlphaUp
    | SortAmountDown
    | SortAmountUp
    | SortDown
    | SortNumericDown
    | SortNumericUp
    | SortUp
    | SpaceShuttle
    | Spade
    | Spinner
    | SpinnerThird
    | Square
    | Star
    | StarExclamation
    | StarHalf
    | StepBackward
    | StepForward
    | Stethoscope
    | StickyNote
    | Stop
    | StopCircle
    | Stopwatch
    | StreetView
    | Strikethrough
    | Subscript
    | Subway
    | Suitcase
    | Sun
    | Superscript
    | Sync
    | SyncAlt
    | Table
    | Tablet
    | TabletAlt
    | TabletAndroid
    | TabletAndroidAlt
    | Tachometer
    | TachometerAlt
    | Tag
    | Tags
    | Tasks
    | Taxi
    | Terminal
    | TextHeight
    | TextWidth
    | Th
    | ThLarge
    | ThList
    | ThermometerEmpty
    | ThermometerFull
    | ThermometerHalf
    | ThermometerQuarter
    | ThermometerThreeQuarters
    | ThumbsDown
    | ThumbsUp
    | Thumbtack
    | Ticket
    | TicketAlt
    | Times
    | TimesCircle
    | TimesHexagon
    | TimesOctagon
    | TimesSquare
    | Tint
    | ToggleOff
    | ToggleOn
    | Trademark
    | Train
    | Transgender
    | TransgenderAlt
    | Trash
    | TrashAlt
    | Tree
    | TreeAlt
    | Triangle
    | Trophy
    | TrophyAlt
    | Truck
    | TTY
    | TV
    | TVRetro
    | Umbrella
    | Underline
    | Undo
    | UndoAlt
    | UniversalAccess
    | University
    | Unlink
    | Unlock
    | UnlockAlt
    | Upload
    | UsdCircle
    | UsdSquare
    | User
    | UserAlt
    | UserCircle
    | UserMd
    | UserPlus
    | UserSecret
    | UserTimes
    | Users
    | UtensilFork
    | UtensilKnife
    | UtensilSpoon
    | Utensils
    | UtensilsAlt
    | Venus
    | VenusDouble
    | VenusMars
    | Video
    | VolumeDown
    | VolumeMute
    | VolumeOff
    | VolumeUp
    | Watch
    | Wheelchair
    | Wifi
    | Window
    | WindowAlt
    | WindowClose
    | WindowMaximize
    | WindowMinimize
    | WindowRestore
    | WonSign
    | Wrench
    | YenSign


type Logo
    = FiveHundredPx
    | AccessibleIcon
    | Accusoft
    | Adn
    | Adversal
    | AffiliateTheme
    | Algolia
    | Amazon
    | AmazonPay
    | Amilia
    | Android
    | AngelList
    | AngelCreative
    | Angular
    | AppStore
    | AppStoreIos
    | Apper
    | Apple
    | ApplePay
    | Asymmetrik
    | Audible
    | Autoprefixer
    | Avianex
    | Aviato
    | Aws
    | Bandcamp
    | Behance
    | BehanceSquare
    | BIMobject
    | Bitbucket
    | Bitcoin
    | Bity
    | BlackTie
    | Blackberry
    | Blogger
    | BloggerB
    | Bluetooth
    | BluetoothB
    | Btc
    | BuromobelExperte
    | BuySellAds
    | CCAmazonPay
    | CCAmex
    | CCApplePay
    | CCDinersClub
    | CCDiscover
    | CCJcb
    | CCMastercard
    | CCPayPal
    | CCStripe
    | CCVisa
    | Centercode
    | Chrome
    | CloudScale
    | Cloudsmith
    | Cloudversify
    | CodePen
    | CodiePie
    | ConnectDevelop
    | Contao
    | Cpanel
    | CreativeCommons
    | CSS3
    | CSS3Alt
    | Cuttlefish
    | DAndD
    | Dashcube
    | Delicious
    | DeployDog
    | Deskpro
    | DeviantArt
    | Digg
    | DigitalOcean
    | Discord
    | Discourse
    | DocHub
    | Docker
    | Draft2Digital
    | Dribbble
    | DribbbleSquare
    | Dropbox
    | Drupal
    | Dyalog
    | EarlyBirds
    | Edge
    | Elementor
    | Ember
    | Empire
    | Envira
    | Erlang
    | Ethereum
    | Etsy
    | ExpeditedSSL
    | Facebook
    | FacebookF
    | FacebookMessenger
    | FacebookSquare
    | Firefox
    | FirstOrder
    | FirstDraft
    | Flickr
    | Fly
    | FontAwesome
    | FontAwesomeAlt
    | FontAwesomeFlag
    | FontIcons
    | FontIconsFi
    | FortAwesome
    | FortAwesomeAlt
    | Forumbee
    | Foursquare
    | FreeCodeCamp
    | FreeBSD
    | GetPocket
    | GG
    | GGCircle
    | Git
    | GitSquare
    | GitHub
    | GitHubAlt
    | GitHubSquare
    | GitKraken
    | GitLab
    | Gitter
    | Glide
    | GlideG
    | Gofore
    | Goodreads
    | GoodreadsG
    | Google
    | GoogleDrive
    | GooglePlay
    | GooglePlus
    | GooglePlusG
    | GooglePlusSquare
    | GoogleWallet
    | Gratipay
    | Grav
    | Gripfire
    | Grunt
    | Gulp
    | HackerNews
    | HackerNewsSquare
    | HireAHelper
    | Hooli
    | Hotjar
    | Houzz
    | Html5
    | HubSpot
    | Imdb
    | Instagram
    | InternetExplorer
    | IoxHost
    | Itunes
    | ItunesNote
    | Jenkins
    | Joget
    | Joomla
    | Js
    | JsSquare
    | JSFiddle
    | KeyCDN
    | Kickstarter
    | KickstarterK
    | Korvue
    | Laravel
    | Lastfm
    | LastfmSquare
    | Leanpub
    | Less
    | Line
    | LinkedIn
    | LinkedInInverted
    | Linode
    | Linux
    | Lyft
    | Magento
    | Maxcdn
    | MedApps
    | Medium
    | MediumM
    | Medrt
    | Meetup
    | Microsoft
    | Mix
    | Mixcloud
    | Mizuni
    | MODX
    | Monero
    | Napster
    | NintendoSwitch
    | Node
    | Nodejs
    | Npm
    | NS8
    | Nutritionix
    | Odnoklassniki
    | OdnoklassnikiSquare
    | OpenCart
    | OpenID
    | Opera
    | OptinMonster
    | OpenSourceInitiative
    | Page4
    | PageLines
    | PalFed
    | Patreon
    | PayPal
    | Periscope
    | Phabricator
    | PhoenixFramework
    | PiedPiper
    | PiedPiperAlt
    | PiedPiperPp
    | Pinterest
    | PinterestP
    | PinterestSquare
    | Playstation
    | ProductHunt
    | Pushed
    | Python
    | QQ
    | Quora
    | Ravelry
    | React
    | Rebel
    | RedRiver
    | Reddit
    | RedditAlien
    | RedditSquare
    | Rendact
    | Renren
    | Replyd
    | Resolving
    | RocketChat
    | RockRMS
    | Safari
    | Sass
    | Schlix
    | Scribd
    | Searchengin
    | SellCast
    | Sellsy
    | ServiceStack
    | ShirtsInBulk
    | SimplyBuilt
    | Sistrix
    | SkyAtlas
    | Skype
    | Slack
    | SlackHash
    | Slideshare
    | Snapchat
    | SnapchatGhost
    | SnapchatSquare
    | SoundCloud
    | Speakap
    | Spotify
    | StackExchange
    | StackOverflow
    | StayLinked
    | Steam
    | SteamSquare
    | SteamSymbol
    | StickerMule
    | Strava
    | Stripe
    | StripeS
    | StudioVinari
    | StumbleUpon
    | StumbleUponCircle
    | Superpowers
    | Supple
    | Telegram
    | TelegramPlane
    | TencentWeibo
    | ThemeIsle
    | Trello
    | TripAdvisor
    | Tumblr
    | TumblrSquare
    | Twitch
    | Twitter
    | TwitterSquare
    | Typo3
    | Uber
    | UIkit
    | Uniregistry
    | Untappd
    | USB
    | UsSunnah
    | Vaadin
    | Viacoin
    | Viadeo
    | ViadeoSquare
    | Viber
    | Vimeo
    | VimeoSquare
    | VimeoV
    | Vine
    | VK
    | Vnv
    | Vuejs
    | Weibo
    | Weixin
    | WhatsApp
    | WhatsAppSquare
    | WHMCS
    | Wikipedia
    | Windows
    | WordPress
    | WordPressSimple
    | WPBeginner
    | WPExplorer
    | WPForms
    | Xbox
    | XING
    | XINGSquare
    | YCombinator
    | Yahoo
    | Yandex
    | YandexInternational
    | Yelp
    | Yoast
    | YouTube
    | YouTubeSquare


name : Icon -> String
name icon =
    case icon of
        AddressBook ->
            "address-book"

        AddressCard ->
            "address-card"

        Adjust ->
            "adjust"

        AlarmClock ->
            "alarm-clock"

        AlignCenter ->
            "align-center"

        AlignJustify ->
            "align-justify"

        AlignLeft ->
            "align-left"

        AlignRight ->
            "align-right"

        Ambulance ->
            "ambulance"

        AmericanSignLanguageInterpreting ->
            "american-sign-language-interpreting"

        Anchor ->
            "anchor"

        AngleDoubleDown ->
            "angle-double-down"

        AngleDoubleLeft ->
            "angle-double-left"

        AngleDoubleRight ->
            "angle-double-right"

        AngleDoubleUp ->
            "angle-double-up"

        AngleDown ->
            "angle-down"

        AngleLeft ->
            "angle-left"

        AngleRight ->
            "angle-right"

        AngleUp ->
            "angle-up"

        Archive ->
            "archive"

        ArrowAltCircleDown ->
            "arrow-alt-circle-down"

        ArrowAltCircleLeft ->
            "arrow-alt-circle-left"

        ArrowAltCircleRight ->
            "arrow-alt-circle-right"

        ArrowAltCircleUp ->
            "arrow-alt-circle-up"

        ArrowAltDown ->
            "arrow-alt-down"

        ArrowAltFromBottom ->
            "arrow-alt-from-bottom"

        ArrowAltFromLeft ->
            "arrow-alt-from-left"

        ArrowAltFromRight ->
            "arrow-alt-from-right"

        ArrowAltFromTop ->
            "arrow-alt-from-top"

        ArrowAltLeft ->
            "arrow-alt-left"

        ArrowAltRight ->
            "arrow-alt-right"

        ArrowAltSquareDown ->
            "arrow-alt-square-down"

        ArrowAltSquareLeft ->
            "arrow-alt-square-left"

        ArrowAltSquareRight ->
            "arrow-alt-square-right"

        ArrowAltSquareUp ->
            "arrow-alt-square-up"

        ArrowAltToBottom ->
            "arrow-alt-to-bottom"

        ArrowAltToLeft ->
            "arrow-alt-to-left"

        ArrowAltToRight ->
            "arrow-alt-to-right"

        ArrowAltToTop ->
            "arrow-alt-to-top"

        ArrowAltUp ->
            "arrow-alt-up"

        ArrowCircleDown ->
            "arrow-circle-down"

        ArrowCircleLeft ->
            "arrow-circle-left"

        ArrowCircleRight ->
            "arrow-circle-right"

        ArrowCircleUp ->
            "arrow-circle-up"

        ArrowDown ->
            "arrow-down"

        ArrowFromBottom ->
            "arrow-from-bottom"

        ArrowFromLeft ->
            "arrow-from-left"

        ArrowFromRight ->
            "arrow-from-right"

        ArrowFromTop ->
            "arrow-from-top"

        ArrowLeft ->
            "arrow-left"

        ArrowRight ->
            "arrow-right"

        ArrowSquareDown ->
            "arrow-square-down"

        ArrowSquareLeft ->
            "arrow-square-left"

        ArrowSquareRight ->
            "arrow-square-right"

        ArrowSquareUp ->
            "arrow-square-up"

        ArrowToBottom ->
            "arrow-to-bottom"

        ArrowToLeft ->
            "arrow-to-left"

        ArrowToRight ->
            "arrow-to-right"

        ArrowToTop ->
            "arrow-to-top"

        ArrowUp ->
            "arrow-up"

        Arrows ->
            "arrows"

        ArrowsAlt ->
            "arrows-alt"

        ArrowsAltHorizontal ->
            "arrows-alt-h"

        ArrowsAltVertical ->
            "arrows-alt-v"

        ArrowsHorizontal ->
            "arrows-h"

        ArrowsVertical ->
            "arrows-v"

        AssistiveListeningSystems ->
            "assistive-listening-systems"

        Asterisk ->
            "asterisk"

        At ->
            "at"

        AudioDescription ->
            "audio-description"

        Backward ->
            "backward"

        Badge ->
            "badge"

        BadgeCheck ->
            "badge-check"

        BalanceScale ->
            "balance-scale"

        Ban ->
            "ban"

        Barcode ->
            "barcode"

        Bars ->
            "bars"

        Bath ->
            "bath"

        BatteryBolt ->
            "battery-bolt"

        BatteryEmpty ->
            "battery-empty"

        BatteryFull ->
            "battery-full"

        BatteryHalf ->
            "battery-half"

        BatteryQuarter ->
            "battery-quarter"

        BatterySlash ->
            "battery-slash"

        BatteryThreeQuarters ->
            "battery-three-quarters"

        Bed ->
            "bed"

        Beer ->
            "beer"

        Bell ->
            "bell"

        BellSlash ->
            "bell-slash"

        Bicycle ->
            "bicycle"

        Binoculars ->
            "binoculars"

        BirthdayCake ->
            "birthday-cake"

        Blind ->
            "blind"

        Bold ->
            "bold"

        Bolt ->
            "bolt"

        Bomb ->
            "bomb"

        Book ->
            "book"

        Bookmark ->
            "bookmark"

        Braille ->
            "braille"

        Briefcase ->
            "briefcase"

        Browser ->
            "browser"

        Bug ->
            "bug"

        Building ->
            "building"

        Bullhorn ->
            "bullhorn"

        Bullseye ->
            "bullseye"

        Bus ->
            "bus"

        Calculator ->
            "calculator"

        Calendar ->
            "calendar"

        CalendarAlt ->
            "calendar-alt"

        CalendarCheck ->
            "calendar-check"

        CalendarEdit ->
            "calendar-edit"

        CalendarExclamation ->
            "calendar-exclamation"

        CalendarMinus ->
            "calendar-minus"

        CalendarPlus ->
            "calendar-plus"

        CalendarTimes ->
            "calendar-times"

        Camera ->
            "camera"

        CameraAlt ->
            "camera-alt"

        CameraRetro ->
            "camera-retro"

        Car ->
            "car"

        CaretCircleDown ->
            "caret-circle-down"

        CaretCircleLeft ->
            "caret-circle-left"

        CaretCircleRight ->
            "caret-circle-right"

        CaretCircleUp ->
            "caret-circle-up"

        CaretDown ->
            "caret-down"

        CaretLeft ->
            "caret-left"

        CaretRight ->
            "caret-right"

        CaretSquareDown ->
            "caret-square-down"

        CaretSquareLeft ->
            "caret-square-left"

        CaretSquareRight ->
            "caret-square-right"

        CaretSquareUp ->
            "caret-square-up"

        CaretUp ->
            "caret-up"

        CartArrowDown ->
            "cart-arrow-down"

        CartPlus ->
            "cart-plus"

        Certificate ->
            "certificate"

        ChartArea ->
            "chart-area"

        ChartBar ->
            "chart-bar"

        ChartLine ->
            "chart-line"

        ChartPie ->
            "chart-pie"

        Check ->
            "check"

        CheckCircle ->
            "check-circle"

        CheckSquare ->
            "check-square"

        ChevronCircleDown ->
            "chevron-circle-down"

        ChevronCircleLeft ->
            "chevron-circle-left"

        ChevronCircleRight ->
            "chevron-circle-right"

        ChevronCircleUp ->
            "chevron-circle-up"

        ChevronDoubleDown ->
            "chevron-double-down"

        ChevronDoubleLeft ->
            "chevron-double-left"

        ChevronDoubleRight ->
            "chevron-double-right"

        ChevronDoubleUp ->
            "chevron-double-up"

        ChevronDown ->
            "chevron-down"

        ChevronLeft ->
            "chevron-left"

        ChevronRight ->
            "chevron-right"

        ChevronSquareDown ->
            "chevron-square-down"

        ChevronSquareLeft ->
            "chevron-square-left"

        ChevronSquareRight ->
            "chevron-square-right"

        ChevronSquareUp ->
            "chevron-square-up"

        ChevronUp ->
            "chevron-up"

        Child ->
            "child"

        Circle ->
            "circle"

        CircleNotch ->
            "circle-notch"

        Clipboard ->
            "clipboard"

        Clock ->
            "clock"

        Clone ->
            "clone"

        ClosedCaptioning ->
            "closed-captioning"

        Cloud ->
            "cloud"

        CloudDownload ->
            "cloud-download"

        CloudDownloadAlt ->
            "cloud-download-alt"

        CloudUpload ->
            "cloud-upload"

        CloudUploadAlt ->
            "cloud-upload-alt"

        Club ->
            "club"

        Code ->
            "code"

        CodeBranch ->
            "code-branch"

        CodeCommit ->
            "code-commit"

        CodeMerge ->
            "code-merge"

        Coffee ->
            "coffee"

        Cog ->
            "cog"

        Cogs ->
            "cogs"

        Columns ->
            "columns"

        Comment ->
            "comment"

        CommentAlt ->
            "comment-alt"

        Comments ->
            "comments"

        Compass ->
            "compass"

        Compress ->
            "compress"

        CompressAlt ->
            "compress-alt"

        CompressWide ->
            "compress-wide"

        Copy ->
            "copy"

        Copyright ->
            "copyright"

        CreditCard ->
            "credit-card"

        CreditCardBlank ->
            "credit-card-blank"

        CreditCardFront ->
            "credit-card-front"

        Crop ->
            "crop"

        Crosshairs ->
            "crosshairs"

        Cube ->
            "cube"

        Cubes ->
            "cubes"

        Cut ->
            "cut"

        Database ->
            "database"

        Deaf ->
            "deaf"

        Desktop ->
            "desktop"

        DesktopAlt ->
            "desktop-alt"

        Diamond ->
            "diamond"

        DollarSign ->
            "dollar-sign"

        DotCircle ->
            "dot-circle"

        Download ->
            "download"

        Edit ->
            "edit"

        Eject ->
            "eject"

        EllipsisHorizontal ->
            "ellipsis-h"

        EllipsisHorizontalAlt ->
            "ellipsis-h-alt"

        EllipsisVertical ->
            "ellipsis-v"

        EllipsisVerticalAlt ->
            "ellipsis-v-alt"

        Envelope ->
            "envelope"

        EnvelopeOpen ->
            "envelope-open"

        EnvelopeSquare ->
            "envelope-square"

        Eraser ->
            "eraser"

        EuroSign ->
            "euro-sign"

        Exchange ->
            "exchange"

        ExchangeAlt ->
            "exchange-alt"

        Exclamation ->
            "exclamation"

        ExclamationCircle ->
            "exclamation-circle"

        ExclamationSquare ->
            "exclamation-square"

        ExclamationTriangle ->
            "exclamation-triangle"

        Expand ->
            "expand"

        ExpandAlt ->
            "expand-alt"

        ExpandArrows ->
            "expand-arrows"

        ExpandArrowsAlt ->
            "expand-arrows-alt"

        ExpandWide ->
            "expand-wide"

        ExternalLink ->
            "external-link"

        ExternalLinkAlt ->
            "external-link-alt"

        ExternalLinkSquare ->
            "external-link-square"

        ExternalLinkSquareAlt ->
            "external-link-square-alt"

        Eye ->
            "eye"

        EyeDropper ->
            "eye-dropper"

        EyeSlash ->
            "eye-slash"

        FastBackward ->
            "fast-backward"

        FastForward ->
            "fast-forward"

        Fax ->
            "fax"

        Female ->
            "female"

        FighterJet ->
            "fighter-jet"

        File ->
            "file"

        FileAlt ->
            "file-alt"

        FileArchive ->
            "file-archive"

        FileAudio ->
            "file-audio"

        FileCheck ->
            "file-check"

        FileCode ->
            "file-code"

        FileEdit ->
            "file-edit"

        FileExcel ->
            "file-excel"

        FileExclamation ->
            "file-exclamation"

        FileImage ->
            "file-image"

        FileMinus ->
            "file-minus"

        FilePdf ->
            "file-pdf"

        FilePlus ->
            "file-plus"

        FilePowerpoint ->
            "file-powerpoint"

        FileTimes ->
            "file-times"

        FileVideo ->
            "file-video"

        FileWord ->
            "file-word"

        Film ->
            "film"

        FilmAlt ->
            "film-alt"

        Filter ->
            "filter"

        Fire ->
            "fire"

        FireExtinguisher ->
            "fire-extinguisher"

        Flag ->
            "flag"

        FlagCheckered ->
            "flag-checkered"

        Flask ->
            "flask"

        Folder ->
            "folder"

        FolderOpen ->
            "folder-open"

        Font ->
            "font"

        Forward ->
            "forward"

        Frown ->
            "frown"

        Futbol ->
            "futbol"

        Gamepad ->
            "gamepad"

        Gavel ->
            "gavel"

        Gem ->
            "gem"

        Genderless ->
            "genderless"

        Gift ->
            "gift"

        GlassMartini ->
            "glass-martini"

        Globe ->
            "globe"

        GraduationCap ->
            "graduation-cap"

        HSquare ->
            "h-square"

        H1 ->
            "h1"

        H2 ->
            "h2"

        H3 ->
            "h3"

        HandLizard ->
            "hand-lizard"

        HandPaper ->
            "hand-paper"

        HandPeace ->
            "hand-peace"

        HandPointDown ->
            "hand-point-down"

        HandPointLeft ->
            "hand-point-left"

        HandPointRight ->
            "hand-point-right"

        HandPointUp ->
            "hand-point-up"

        HandPointer ->
            "hand-pointer"

        HandRock ->
            "hand-rock"

        HandScissors ->
            "hand-scissors"

        HandSpock ->
            "hand-spock"

        Handshake ->
            "handshake"

        Hashtag ->
            "hashtag"

        Hdd ->
            "hdd"

        Heading ->
            "heading"

        Headphones ->
            "headphones"

        Heart ->
            "heart"

        Heartbeat ->
            "heartbeat"

        Hexagon ->
            "hexagon"

        History ->
            "history"

        Home ->
            "home"

        Hospital ->
            "hospital"

        Hourglass ->
            "hourglass"

        HourglassEnd ->
            "hourglass-end"

        HourglassHalf ->
            "hourglass-half"

        HourglassStart ->
            "hourglass-start"

        ICursor ->
            "i-cursor"

        IdBadge ->
            "id-badge"

        IdCard ->
            "id-card"

        Image ->
            "image"

        Images ->
            "images"

        Inbox ->
            "inbox"

        InboxIn ->
            "inbox-in"

        InboxOut ->
            "inbox-out"

        Indent ->
            "indent"

        Industry ->
            "industry"

        IndustryAlt ->
            "industry-alt"

        Info ->
            "info"

        InfoCircle ->
            "info-circle"

        InfoSquare ->
            "info-square"

        Italic ->
            "italic"

        JackOLantern ->
            "jack-o-lantern"

        Key ->
            "key"

        Keyboard ->
            "keyboard"

        Language ->
            "language"

        Laptop ->
            "laptop"

        Leaf ->
            "leaf"

        Lemon ->
            "lemon"

        LevelDown ->
            "level-down"

        LevelDownAlt ->
            "level-down-alt"

        LevelUp ->
            "level-up"

        LevelUpAlt ->
            "level-up-alt"

        LifeRing ->
            "life-ring"

        Lightbulb ->
            "lightbulb"

        Link ->
            "link"

        LiraSign ->
            "lira-sign"

        List ->
            "list"

        ListAlt ->
            "list-alt"

        ListOl ->
            "list-ol"

        ListUl ->
            "list-ul"

        LocationArrow ->
            "location-arrow"

        Lock ->
            "lock"

        LockAlt ->
            "lock-alt"

        LockOpen ->
            "lock-open"

        LockOpenAlt ->
            "lock-open-alt"

        LongArrowAltDown ->
            "long-arrow-alt-down"

        LongArrowAltLeft ->
            "long-arrow-alt-left"

        LongArrowAltRight ->
            "long-arrow-alt-right"

        LongArrowAltUp ->
            "long-arrow-alt-up"

        LongArrowDown ->
            "long-arrow-down"

        LongArrowLeft ->
            "long-arrow-left"

        LongArrowRight ->
            "long-arrow-right"

        LongArrowUp ->
            "long-arrow-up"

        LowVision ->
            "low-vision"

        Magic ->
            "magic"

        Magnet ->
            "magnet"

        Male ->
            "male"

        Map ->
            "map"

        MapMarker ->
            "map-marker"

        MapMarkerAlt ->
            "map-marker-alt"

        MapPin ->
            "map-pin"

        MapSigns ->
            "map-signs"

        Mars ->
            "mars"

        MarsDouble ->
            "mars-double"

        MarsStroke ->
            "mars-stroke"

        MarsStrokeHorizontal ->
            "mars-stroke-h"

        MarsStrokeVertical ->
            "mars-stroke-v"

        Medkit ->
            "medkit"

        Meh ->
            "meh"

        Mercury ->
            "mercury"

        Microchip ->
            "microchip"

        Microphone ->
            "microphone"

        MicrophoneAlt ->
            "microphone-alt"

        MicrophoneSlash ->
            "microphone-slash"

        Minus ->
            "minus"

        MinusCircle ->
            "minus-circle"

        MinusHexagon ->
            "minus-hexagon"

        MinusOctagon ->
            "minus-octagon"

        MinusSquare ->
            "minus-square"

        Mobile ->
            "mobile"

        MobileAlt ->
            "mobile-alt"

        MobileAndroid ->
            "mobile-android"

        MobileAndroidAlt ->
            "mobile-android-alt"

        MoneyBill ->
            "money-bill"

        MoneyBillAlt ->
            "money-bill-alt"

        Moon ->
            "moon"

        Motorcycle ->
            "motorcycle"

        MousePointer ->
            "mouse-pointer"

        Music ->
            "music"

        Neuter ->
            "neuter"

        Newspaper ->
            "newspaper"

        ObjectGroup ->
            "object-group"

        ObjectUngroup ->
            "object-ungroup"

        Octagon ->
            "octagon"

        Outdent ->
            "outdent"

        PaintBrush ->
            "paint-brush"

        PaperPlane ->
            "paper-plane"

        Paperclip ->
            "paperclip"

        Paragraph ->
            "paragraph"

        Paste ->
            "paste"

        Pause ->
            "pause"

        PauseCircle ->
            "pause-circle"

        Paw ->
            "paw"

        Pen ->
            "pen"

        PenAlt ->
            "pen-alt"

        PenSquare ->
            "pen-square"

        Pencil ->
            "pencil"

        PencilAlt ->
            "pencil-alt"

        Percent ->
            "percent"

        Phone ->
            "phone"

        PhoneSlash ->
            "phone-slash"

        PhoneSquare ->
            "phone-square"

        PhoneVolume ->
            "phone-volume"

        Plane ->
            "plane"

        PlaneAlt ->
            "plane-alt"

        Play ->
            "play"

        PlayCircle ->
            "play-circle"

        Plug ->
            "plug"

        Plus ->
            "plus"

        PlusCircle ->
            "plus-circle"

        PlusHexagon ->
            "plus-hexagon"

        PlusOctagon ->
            "plus-octagon"

        PlusSquare ->
            "plus-square"

        Podcast ->
            "podcast"

        Poo ->
            "poo"

        Portrait ->
            "portrait"

        PoundSign ->
            "pound-sign"

        PowerOff ->
            "power-off"

        Print ->
            "print"

        PuzzlePiece ->
            "puzzle-piece"

        Qrcode ->
            "qrcode"

        Question ->
            "question"

        QuestionCircle ->
            "question-circle"

        QuestionSquare ->
            "question-square"

        QuoteLeft ->
            "quote-left"

        QuoteRight ->
            "quote-right"

        Random ->
            "random"

        RectangleLandscape ->
            "rectangle-landscape"

        RectanglePortrait ->
            "rectangle-portrait"

        RectangleWide ->
            "rectangle-wide"

        Recycle ->
            "recycle"

        Redo ->
            "redo"

        RedoAlt ->
            "redo-alt"

        Registered ->
            "registered"

        Repeat ->
            "repeat"

        Repeat1 ->
            "repeat-1"

        Repeat1Alt ->
            "repeat-1-alt"

        RepeatAlt ->
            "repeat-alt"

        Reply ->
            "reply"

        ReplyAll ->
            "reply-all"

        Retweet ->
            "retweet"

        RetweetAlt ->
            "retweet-alt"

        Road ->
            "road"

        Rocket ->
            "rocket"

        RSS ->
            "rss"

        RSSSquare ->
            "rss-square"

        RubleSign ->
            "ruble-sign"

        RupeeSign ->
            "rupee-sign"

        Save ->
            "save"

        Scrubber ->
            "scrubber"

        Search ->
            "search"

        SearchMinus ->
            "search-minus"

        SearchPlus ->
            "search-plus"

        Server ->
            "server"

        Share ->
            "share"

        ShareAll ->
            "share-all"

        ShareAlt ->
            "share-alt"

        ShareAltSquare ->
            "share-alt-square"

        ShareSquare ->
            "share-square"

        ShekelSign ->
            "shekel-sign"

        Shield ->
            "shield"

        ShieldAlt ->
            "shield-alt"

        ShieldCheck ->
            "shield-check"

        Ship ->
            "ship"

        ShoppingBag ->
            "shopping-bag"

        ShoppingBasket ->
            "shopping-basket"

        ShoppingCart ->
            "shopping-cart"

        Shower ->
            "shower"

        SignIn ->
            "sign-in"

        SignInAlt ->
            "sign-in-alt"

        SignLanguage ->
            "sign-language"

        SignOut ->
            "sign-out"

        SignOutAlt ->
            "sign-out-alt"

        Signal ->
            "signal"

        Sitemap ->
            "sitemap"

        SlidersHorizontal ->
            "sliders-h"

        SlidersHorizontalSquare ->
            "sliders-h-square"

        SlidersV ->
            "sliders-v"

        SlidersVSquare ->
            "sliders-v-square"

        Smile ->
            "smile"

        Snowflake ->
            "snowflake"

        Sort ->
            "sort"

        SortAlphaDown ->
            "sort-alpha-down"

        SortAlphaUp ->
            "sort-alpha-up"

        SortAmountDown ->
            "sort-amount-down"

        SortAmountUp ->
            "sort-amount-up"

        SortDown ->
            "sort-down"

        SortNumericDown ->
            "sort-numeric-down"

        SortNumericUp ->
            "sort-numeric-up"

        SortUp ->
            "sort-up"

        SpaceShuttle ->
            "space-shuttle"

        Spade ->
            "spade"

        Spinner ->
            "spinner"

        SpinnerThird ->
            "spinner-third"

        Square ->
            "square"

        Star ->
            "star"

        StarExclamation ->
            "star-exclamation"

        StarHalf ->
            "star-half"

        StepBackward ->
            "step-backward"

        StepForward ->
            "step-forward"

        Stethoscope ->
            "stethoscope"

        StickyNote ->
            "sticky-note"

        Stop ->
            "stop"

        StopCircle ->
            "stop-circle"

        Stopwatch ->
            "stopwatch"

        StreetView ->
            "street-view"

        Strikethrough ->
            "strikethrough"

        Subscript ->
            "subscript"

        Subway ->
            "subway"

        Suitcase ->
            "suitcase"

        Sun ->
            "sun"

        Superscript ->
            "superscript"

        Sync ->
            "sync"

        SyncAlt ->
            "sync-alt"

        Table ->
            "table"

        Tablet ->
            "tablet"

        TabletAlt ->
            "tablet-alt"

        TabletAndroid ->
            "tablet-android"

        TabletAndroidAlt ->
            "tablet-android-alt"

        Tachometer ->
            "tachometer"

        TachometerAlt ->
            "tachometer-alt"

        Tag ->
            "tag"

        Tags ->
            "tags"

        Tasks ->
            "tasks"

        Taxi ->
            "taxi"

        Terminal ->
            "terminal"

        TextHeight ->
            "text-height"

        TextWidth ->
            "text-width"

        Th ->
            "th"

        ThLarge ->
            "th-large"

        ThList ->
            "th-list"

        ThermometerEmpty ->
            "thermometer-empty"

        ThermometerFull ->
            "thermometer-full"

        ThermometerHalf ->
            "thermometer-half"

        ThermometerQuarter ->
            "thermometer-quarter"

        ThermometerThreeQuarters ->
            "thermometer-three-quarters"

        ThumbsDown ->
            "thumbs-down"

        ThumbsUp ->
            "thumbs-up"

        Thumbtack ->
            "thumbtack"

        Ticket ->
            "ticket"

        TicketAlt ->
            "ticket-alt"

        Times ->
            "times"

        TimesCircle ->
            "times-circle"

        TimesHexagon ->
            "times-hexagon"

        TimesOctagon ->
            "times-octagon"

        TimesSquare ->
            "times-square"

        Tint ->
            "tint"

        ToggleOff ->
            "toggle-off"

        ToggleOn ->
            "toggle-on"

        Trademark ->
            "trademark"

        Train ->
            "train"

        Transgender ->
            "transgender"

        TransgenderAlt ->
            "transgender-alt"

        Trash ->
            "trash"

        TrashAlt ->
            "trash-alt"

        Tree ->
            "tree"

        TreeAlt ->
            "tree-alt"

        Triangle ->
            "triangle"

        Trophy ->
            "trophy"

        TrophyAlt ->
            "trophy-alt"

        Truck ->
            "truck"

        TTY ->
            "tty"

        TV ->
            "tv"

        TVRetro ->
            "tv-retro"

        Umbrella ->
            "umbrella"

        Underline ->
            "underline"

        Undo ->
            "undo"

        UndoAlt ->
            "undo-alt"

        UniversalAccess ->
            "universal-access"

        University ->
            "university"

        Unlink ->
            "unlink"

        Unlock ->
            "unlock"

        UnlockAlt ->
            "unlock-alt"

        Upload ->
            "upload"

        UsdCircle ->
            "usd-circle"

        UsdSquare ->
            "usd-square"

        User ->
            "user"

        UserAlt ->
            "user-alt"

        UserCircle ->
            "user-circle"

        UserMd ->
            "user-md"

        UserPlus ->
            "user-plus"

        UserSecret ->
            "user-secret"

        UserTimes ->
            "user-times"

        Users ->
            "users"

        UtensilFork ->
            "utensil-fork"

        UtensilKnife ->
            "utensil-knife"

        UtensilSpoon ->
            "utensil-spoon"

        Utensils ->
            "utensils"

        UtensilsAlt ->
            "utensils-alt"

        Venus ->
            "venus"

        VenusDouble ->
            "venus-double"

        VenusMars ->
            "venus-mars"

        Video ->
            "video"

        VolumeDown ->
            "volume-down"

        VolumeMute ->
            "volume-mute"

        VolumeOff ->
            "volume-off"

        VolumeUp ->
            "volume-up"

        Watch ->
            "watch"

        Wheelchair ->
            "wheelchair"

        Wifi ->
            "wifi"

        Window ->
            "window"

        WindowAlt ->
            "window-alt"

        WindowClose ->
            "window-close"

        WindowMaximize ->
            "window-maximize"

        WindowMinimize ->
            "window-minimize"

        WindowRestore ->
            "window-restore"

        WonSign ->
            "won-sign"

        Wrench ->
            "wrench"

        YenSign ->
            "yen-sign"


logoName : Logo -> String
logoName logo =
    case logo of
        FiveHundredPx ->
            "500px"

        AccessibleIcon ->
            "accessible-icon"

        Accusoft ->
            "accusoft"

        Adn ->
            "adn"

        Adversal ->
            "adversal"

        AffiliateTheme ->
            "affiliatetheme"

        Algolia ->
            "algolia"

        Amazon ->
            "amazon"

        AmazonPay ->
            "amazon-pay"

        Amilia ->
            "amilia"

        Android ->
            "android"

        AngelList ->
            "angellist"

        AngelCreative ->
            "angrycreative"

        Angular ->
            "angular"

        AppStore ->
            "app-store"

        AppStoreIos ->
            "app-store-ios"

        Apper ->
            "apper"

        Apple ->
            "apple"

        ApplePay ->
            "apple-pay"

        Asymmetrik ->
            "asymmetrik"

        Audible ->
            "audible"

        Autoprefixer ->
            "autoprefixer"

        Avianex ->
            "avianex"

        Aviato ->
            "aviato"

        Aws ->
            "aws"

        Bandcamp ->
            "bandcamp"

        Behance ->
            "behance"

        BehanceSquare ->
            "behance-square"

        BIMobject ->
            "bimobject"

        Bitbucket ->
            "bitbucket"

        Bitcoin ->
            "bitcoin"

        Bity ->
            "bity"

        BlackTie ->
            "black-tie"

        Blackberry ->
            "blackberry"

        Blogger ->
            "blogger"

        BloggerB ->
            "blogger-b"

        Bluetooth ->
            "bluetooth"

        BluetoothB ->
            "bluetooth-b"

        Btc ->
            "btc"

        BuromobelExperte ->
            "buromobelexperte"

        BuySellAds ->
            "buysellads"

        CCAmazonPay ->
            "cc-amazon-pay"

        CCAmex ->
            "cc-amex"

        CCApplePay ->
            "cc-apple-pay"

        CCDinersClub ->
            "cc-diners-club"

        CCDiscover ->
            "cc-discover"

        CCJcb ->
            "cc-jcb"

        CCMastercard ->
            "cc-mastercard"

        CCPayPal ->
            "cc-paypal"

        CCStripe ->
            "cc-stripe"

        CCVisa ->
            "cc-visa"

        Centercode ->
            "centercode"

        Chrome ->
            "chrome"

        CloudScale ->
            "cloudscale"

        Cloudsmith ->
            "cloudsmith"

        Cloudversify ->
            "cloudversify"

        CodePen ->
            "codepen"

        CodiePie ->
            "codiepie"

        ConnectDevelop ->
            "connectdevelop"

        Contao ->
            "contao"

        Cpanel ->
            "cpanel"

        CreativeCommons ->
            "creative-commons"

        CSS3 ->
            "css3"

        CSS3Alt ->
            "css3-alt"

        Cuttlefish ->
            "cuttlefish"

        DAndD ->
            "d-and-d"

        Dashcube ->
            "dashcube"

        Delicious ->
            "delicious"

        DeployDog ->
            "deploydog"

        Deskpro ->
            "deskpro"

        DeviantArt ->
            "deviantart"

        Digg ->
            "digg"

        DigitalOcean ->
            "digital-ocean"

        Discord ->
            "discord"

        Discourse ->
            "discourse"

        DocHub ->
            "dochub"

        Docker ->
            "docker"

        Draft2Digital ->
            "draft2digital"

        Dribbble ->
            "dribbble"

        DribbbleSquare ->
            "dribbble-square"

        Dropbox ->
            "dropbox"

        Drupal ->
            "drupal"

        Dyalog ->
            "dyalog"

        EarlyBirds ->
            "earlybirds"

        Edge ->
            "edge"

        Elementor ->
            "elementor"

        Ember ->
            "ember"

        Empire ->
            "empire"

        Envira ->
            "envira"

        Erlang ->
            "erlang"

        Ethereum ->
            "ethereum"

        Etsy ->
            "etsy"

        ExpeditedSSL ->
            "expeditedssl"

        Facebook ->
            "facebook"

        FacebookF ->
            "facebook-f"

        FacebookMessenger ->
            "facebook-messenger"

        FacebookSquare ->
            "facebook-square"

        Firefox ->
            "firefox"

        FirstOrder ->
            "first-order"

        FirstDraft ->
            "firstdraft"

        Flickr ->
            "flickr"

        Fly ->
            "fly"

        FontAwesome ->
            "font-awesome"

        FontAwesomeAlt ->
            "font-awesome-alt"

        FontAwesomeFlag ->
            "font-awesome-flag"

        FontIcons ->
            "fonticons"

        FontIconsFi ->
            "fonticons-fi"

        FortAwesome ->
            "fort-awesome"

        FortAwesomeAlt ->
            "fort-awesome-alt"

        Forumbee ->
            "forumbee"

        Foursquare ->
            "foursquare"

        FreeCodeCamp ->
            "free-code-camp"

        FreeBSD ->
            "freebsd"

        GetPocket ->
            "get-pocket"

        GG ->
            "gg"

        GGCircle ->
            "gg-circle"

        Git ->
            "git"

        GitSquare ->
            "git-square"

        GitHub ->
            "github"

        GitHubAlt ->
            "github-alt"

        GitHubSquare ->
            "github-square"

        GitKraken ->
            "gitkraken"

        GitLab ->
            "gitlab"

        Gitter ->
            "gitter"

        Glide ->
            "glide"

        GlideG ->
            "glide-g"

        Gofore ->
            "gofore"

        Goodreads ->
            "goodreads"

        GoodreadsG ->
            "goodreads-g"

        Google ->
            "google"

        GoogleDrive ->
            "google-drive"

        GooglePlay ->
            "google-play"

        GooglePlus ->
            "google-plus"

        GooglePlusG ->
            "google-plus-g"

        GooglePlusSquare ->
            "google-plus-square"

        GoogleWallet ->
            "google-wallet"

        Gratipay ->
            "gratipay"

        Grav ->
            "grav"

        Gripfire ->
            "gripfire"

        Grunt ->
            "grunt"

        Gulp ->
            "gulp"

        HackerNews ->
            "hacker-news"

        HackerNewsSquare ->
            "hacker-news-square"

        HireAHelper ->
            "hire-a-helper"

        Hooli ->
            "hooli"

        Hotjar ->
            "hotjar"

        Houzz ->
            "houzz"

        Html5 ->
            "html5"

        HubSpot ->
            "hubspot"

        Imdb ->
            "imdb"

        Instagram ->
            "instagram"

        InternetExplorer ->
            "internet-explorer"

        IoxHost ->
            "ioxhost"

        Itunes ->
            "itunes"

        ItunesNote ->
            "itunes-note"

        Jenkins ->
            "jenkins"

        Joget ->
            "joget"

        Joomla ->
            "joomla"

        Js ->
            "js"

        JsSquare ->
            "js-square"

        JSFiddle ->
            "jsfiddle"

        KeyCDN ->
            "keycdn"

        Kickstarter ->
            "kickstarter"

        KickstarterK ->
            "kickstarter-k"

        Korvue ->
            "korvue"

        Laravel ->
            "laravel"

        Lastfm ->
            "lastfm"

        LastfmSquare ->
            "lastfm-square"

        Leanpub ->
            "leanpub"

        Less ->
            "less"

        Line ->
            "line"

        LinkedIn ->
            "linkedin"

        LinkedInInverted ->
            "linkedin-in"

        Linode ->
            "linode"

        Linux ->
            "linux"

        Lyft ->
            "lyft"

        Magento ->
            "magento"

        Maxcdn ->
            "maxcdn"

        MedApps ->
            "medapps"

        Medium ->
            "medium"

        MediumM ->
            "medium-m"

        Medrt ->
            "medrt"

        Meetup ->
            "meetup"

        Microsoft ->
            "microsoft"

        Mix ->
            "mix"

        Mixcloud ->
            "mixcloud"

        Mizuni ->
            "mizuni"

        MODX ->
            "modx"

        Monero ->
            "monero"

        Napster ->
            "napster"

        NintendoSwitch ->
            "nintendo-switch"

        Node ->
            "node"

        Nodejs ->
            "node-js"

        Npm ->
            "npm"

        NS8 ->
            "ns8"

        Nutritionix ->
            "nutritionix"

        Odnoklassniki ->
            "odnoklassniki"

        OdnoklassnikiSquare ->
            "odnoklassniki-square"

        OpenCart ->
            "opencart"

        OpenID ->
            "openid"

        Opera ->
            "opera"

        OptinMonster ->
            "optin-monster"

        OpenSourceInitiative ->
            "osi"

        Page4 ->
            "page4"

        PageLines ->
            "pagelines"

        PalFed ->
            "palfed"

        Patreon ->
            "patreon"

        PayPal ->
            "paypal"

        Periscope ->
            "periscope"

        Phabricator ->
            "phabricator"

        PhoenixFramework ->
            "phoenix-framework"

        PiedPiper ->
            "pied-piper"

        PiedPiperAlt ->
            "pied-piper-alt"

        PiedPiperPp ->
            "pied-piper-pp"

        Pinterest ->
            "pinterest"

        PinterestP ->
            "pinterest-p"

        PinterestSquare ->
            "pinterest-square"

        Playstation ->
            "playstation"

        ProductHunt ->
            "product-hunt"

        Pushed ->
            "pushed"

        Python ->
            "python"

        QQ ->
            "qq"

        Quora ->
            "quora"

        Ravelry ->
            "ravelry"

        React ->
            "react"

        Rebel ->
            "rebel"

        RedRiver ->
            "red-river"

        Reddit ->
            "reddit"

        RedditAlien ->
            "reddit-alien"

        RedditSquare ->
            "reddit-square"

        Rendact ->
            "rendact"

        Renren ->
            "renren"

        Replyd ->
            "replyd"

        Resolving ->
            "resolving"

        RocketChat ->
            "rocketchat"

        RockRMS ->
            "rockrms"

        Safari ->
            "safari"

        Sass ->
            "sass"

        Schlix ->
            "schlix"

        Scribd ->
            "scribd"

        Searchengin ->
            "searchengin"

        SellCast ->
            "sellcast"

        Sellsy ->
            "sellsy"

        ServiceStack ->
            "servicestack"

        ShirtsInBulk ->
            "shirtsinbulk"

        SimplyBuilt ->
            "simplybuilt"

        Sistrix ->
            "sistrix"

        SkyAtlas ->
            "skyatlas"

        Skype ->
            "skype"

        Slack ->
            "slack"

        SlackHash ->
            "slack-hash"

        Slideshare ->
            "slideshare"

        Snapchat ->
            "snapchat"

        SnapchatGhost ->
            "snapchat-ghost"

        SnapchatSquare ->
            "snapchat-square"

        SoundCloud ->
            "soundcloud"

        Speakap ->
            "speakap"

        Spotify ->
            "spotify"

        StackExchange ->
            "stack-exchange"

        StackOverflow ->
            "stack-overflow"

        StayLinked ->
            "staylinked"

        Steam ->
            "steam"

        SteamSquare ->
            "steam-square"

        SteamSymbol ->
            "steam-symbol"

        StickerMule ->
            "sticker-mule"

        Strava ->
            "strava"

        Stripe ->
            "stripe"

        StripeS ->
            "stripe-s"

        StudioVinari ->
            "studiovinari"

        StumbleUpon ->
            "stumbleupon"

        StumbleUponCircle ->
            "stumbleupon-circle"

        Superpowers ->
            "superpowers"

        Supple ->
            "supple"

        Telegram ->
            "telegram"

        TelegramPlane ->
            "telegram-plane"

        TencentWeibo ->
            "tencent-weibo"

        ThemeIsle ->
            "themeisle"

        Trello ->
            "trello"

        TripAdvisor ->
            "tripadvisor"

        Tumblr ->
            "tumblr"

        TumblrSquare ->
            "tumblr-square"

        Twitch ->
            "twitch"

        Twitter ->
            "twitter"

        TwitterSquare ->
            "twitter-square"

        Typo3 ->
            "typo3"

        Uber ->
            "uber"

        UIkit ->
            "uikit"

        Uniregistry ->
            "uniregistry"

        Untappd ->
            "untappd"

        USB ->
            "usb"

        UsSunnah ->
            "ussunnah"

        Vaadin ->
            "vaadin"

        Viacoin ->
            "viacoin"

        Viadeo ->
            "viadeo"

        ViadeoSquare ->
            "viadeo-square"

        Viber ->
            "viber"

        Vimeo ->
            "vimeo"

        VimeoSquare ->
            "vimeo-square"

        VimeoV ->
            "vimeo-v"

        Vine ->
            "vine"

        VK ->
            "vk"

        Vnv ->
            "vnv"

        Vuejs ->
            "vuejs"

        Weibo ->
            "weibo"

        Weixin ->
            "weixin"

        WhatsApp ->
            "whatsapp"

        WhatsAppSquare ->
            "whatsapp-square"

        WHMCS ->
            "whmcs"

        Wikipedia ->
            "wikipedia-w"

        Windows ->
            "windows"

        WordPress ->
            "wordpress"

        WordPressSimple ->
            "wordpress-simple"

        WPBeginner ->
            "wpbeginner"

        WPExplorer ->
            "wpexplorer"

        WPForms ->
            "wpforms"

        Xbox ->
            "xbox"

        XING ->
            "xing"

        XINGSquare ->
            "xing-square"

        YCombinator ->
            "y-combinator"

        Yahoo ->
            "yahoo"

        Yandex ->
            "yandex"

        YandexInternational ->
            "yandex-international"

        Yelp ->
            "yelp"

        Yoast ->
            "yoast"

        YouTube ->
            "youtube"

        YouTubeSquare ->
            "youtube-square"
