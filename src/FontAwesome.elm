module FontAwesome
    exposing
        ( Animation(..)
        , Attribute(..)
        , Icon(..)
        , Pull(..)
        , Size(..)
        , Style(..)
        , fa
        , icon
        )

import Html exposing (Html, span)
import Html.Attributes


icon : Icon -> Html msg
icon icon =
    let
        style =
            defaultStyle icon
    in
        fa icon style [] []


fa : Icon -> Style -> List Attribute -> List (Html.Attribute msg) -> Html msg
fa icon style attributes htmlAttributes =
    let
        attrs =
            filterAttrs attributes
    in
        span
            (classes icon style attrs
                :: transformAttr attrs
                ++ maskAttr attrs
                ++ htmlAttributes
            )
            []


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
    -- TODO: Deduplicate each type of attribute
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

        Brand ->
            "fab"


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


transform : Attribute -> List (Html.Attribute msg) -> List (Html.Attribute msg)
transform attr attrs =
    case attr of
        Transform str ->
            (Html.Attributes.attribute "data-fa-transform" str) :: attrs

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
                (Html.Attributes.attribute "data-fa-mask" val) :: attrs

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
    | Brand


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
    = FiveHundredPx
    | AccessibleIcon
    | Accusoft
    | AddressBook
    | AddressCard
    | Adjust
    | Adn
    | Adversal
    | AffiliateTheme
    | Algolia
    | AlignCenter
    | AlignJustify
    | AlignLeft
    | AlignRight
    | Amazon
    | AmazonPay
    | Ambulance
    | AmericanSignLanguageInterpreting
    | Amilia
    | Anchor
    | Android
    | AngelList
    | AngleDoubleDown
    | AngleDoubleLeft
    | AngleDoubleRight
    | AngleDoubleUp
    | AngleDown
    | AngleLeft
    | AngleRight
    | AngleUp
    | AngryCreative
    | Angular
    | AppStore
    | AppStoreIos
    | Apper
    | Apple
    | ApplePay
    | Archive
    | ArrowAltCircleDown
    | ArrowAltCircleLeft
    | ArrowAltCircleRight
    | ArrowAltCircleUp
    | ArrowCircleDown
    | ArrowCircleLeft
    | ArrowCircleRight
    | ArrowCircleUp
    | ArrowDown
    | ArrowLeft
    | ArrowRight
    | ArrowUp
    | ArrowsAlt
    | ArrowsAltHorizontal
    | ArrowsAltVertical
    | AssistiveListeningSystems
    | Asterisk
    | Asymmetrik
    | At
    | Audible
    | AudioDescription
    | AutoPrefixer
    | Avianex
    | Aviato
    | AWS
    | Backward
    | BalanceScale
    | Ban
    | Bandcamp
    | Barcode
    | Bars
    | Bath
    | BatteryEmpty
    | BatteryFull
    | BatteryHalf
    | BatteryQuarter
    | BatteryThreeQuarters
    | Bed
    | Beer
    | Behance
    | BehanceSquare
    | Bell
    | BellSlash
    | Bicycle
    | BIMobject
    | Binoculars
    | BirthdayCake
    | Bitbucket
    | Bitcoin
    | Bity
    | BlackTie
    | Blackberry
    | Blind
    | Blogger
    | BloggerB
    | Bluetooth
    | BluetoothB
    | Bold
    | Bolt
    | Bomb
    | Book
    | Bookmark
    | Braille
    | Briefcase
    | Btc
    | Bug
    | Building
    | Bullhorn
    | Bullseye
    | BuromobelExperte
    | Bus
    | BuySellAds
    | Calculator
    | Calendar
    | CalendarAlt
    | CalendarCheck
    | CalendarMinus
    | CalendarPlus
    | CalendarTimes
    | Camera
    | CameraRetro
    | Car
    | CaretDown
    | CaretLeft
    | CaretRight
    | CaretUp
    | CaretSquareDown
    | CaretSquareLeft
    | CaretSquareRight
    | CaretSquareUp
    | CartArrowDown
    | CartPlus
    | CCAmazonPay
    | CCAmex
    | CCApplePay
    | CCDinersClub
    | CCDiscover
    | CCJCB
    | CCMastercard
    | CCPayPal
    | CCStripe
    | CCVisa
    | Centercode
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
    | ChevronDown
    | ChevronLeft
    | ChevronRight
    | ChevronUp
    | Child
    | Chrome
    | Circle
    | CircleNotched
    | Clipboard
    | Clock
    | Clone
    | ClosedCaptioning
    | Cloud
    | CloudDownloadAlt
    | CloudUploadAlt
    | CloudScale
    | Cloudsmith
    | Cloudversify
    | Code
    | CodeBranch
    | CodePen
    | CodiePie
    | Coffee
    | Cog
    | Cogs
    | Columns
    | Comment
    | CommentAlt
    | Comments
    | Compass
    | Compress
    | ConnectDevelop
    | Contao
    | Copy
    | Copyright
    | CPanel
    | CreativeCommons
    | CreditCard
    | Crop
    | Crosshairs
    | CSS3
    | CSS3Alt
    | Cube
    | Cubes
    | Cut
    | Cuttlefish
    | DAndD
    | Dashcube
    | Database
    | Deaf
    | Delicious
    | DeployDog
    | Deskpro
    | Desktop
    | DeviantArt
    | Digg
    | DigitalOcean
    | Discord
    | Discourse
    | DocHub
    | Docker
    | DollarSign
    | DotCircle
    | Download
    | Draft2Digital
    | Dribbble
    | DribbbleSquare
    | Dropbox
    | Drupal
    | Dyalog
    | EarlyBirds
    | Edge
    | Edit
    | Eject
    | EllipsisHorizontal
    | EllipsisVertical
    | Ember
    | Empire
    | Envelope
    | EnvelopeOpen
    | EnvelopeSquare
    | Envira
    | Eraser
    | Erlang
    | Ethereum
    | Etsy
    | EuroSign
    | ExchangeAlt
    | Exclamation
    | ExclamationCircle
    | ExclamationTriangle
    | Expand
    | ExpandArrowsAlt
    | ExpeditedSSL
    | ExternalLinkAlt
    | ExternalLinkSquareAlt
    | Eye
    | EyeDropper
    | EyeSlash
    | Facebook
    | Facebook_f
    | FacebookMessenger
    | FacebookSquare
    | FastBackward
    | FastForward
    | Fax
    | Female
    | FighterJet
    | File
    | FileAlt
    | FileArchive
    | FileAudio
    | FileCode
    | FileExcel
    | FileImage
    | FilePdf
    | FilePowerPoint
    | FileVideo
    | FileWord
    | Film
    | Filter
    | Fire
    | FireExtinguisher
    | Firefox
    | FirstOrder
    | FirstDraft
    | Flag
    | FlagCheckered
    | Flask
    | Flickr
    | Fly
    | Folder
    | FolderOpen
    | Font
    | FontAwesome
    | FontAwesomeAlt
    | FontAwesomeFlag
    | FontIcons
    | FontIcons_fi
    | FortAwesome
    | FortAwesomeAlt
    | Forumbee
    | Forward
    | Foursquare
    | FreeCodeCamp
    | FreeBSD
    | Frown
    | Futbol


brandStyles : List Icon
brandStyles =
    [ FiveHundredPx
    , Accusoft
    , AccessibleIcon
    , Adn
    , Adversal
    , AffiliateTheme
    , Algolia
    , Amazon
    , AmazonPay
    , Amilia
    , Android
    , AngelList
    , AngryCreative
    , Angular
    , AppStore
    , AppStoreIos
    , Apper
    , Apple
    , ApplePay
    , Asymmetrik
    , Audible
    , AutoPrefixer
    , Avianex
    , Aviato
    , AWS
    , Bandcamp
    , Behance
    , BehanceSquare
    , BIMobject
    , Bitbucket
    , Bitcoin
    , Bity
    , BlackTie
    , Blackberry
    , Blogger
    , BloggerB
    , Bluetooth
    , BluetoothB
    , Btc
    , BuromobelExperte
    , BuySellAds
    , CCAmazonPay
    , CCAmex
    , CCApplePay
    , CCDinersClub
    , CCDiscover
    , CCJCB
    , CCMastercard
    , CCPayPal
    , CCStripe
    , CCVisa
    , Centercode
    , Chrome
    , CloudScale
    , Cloudsmith
    , Cloudversify
    , CodePen
    , CodiePie
    , ConnectDevelop
    , Contao
    , CPanel
    , CreativeCommons
    , CSS3
    , CSS3Alt
    , Cuttlefish
    , DAndD
    , Dashcube
    , Delicious
    , DeployDog
    , Deskpro
    , DeviantArt
    , Digg
    , DigitalOcean
    , Discord
    , Discourse
    , DocHub
    , Docker
    , Draft2Digital
    , Dribbble
    , DribbbleSquare
    , Dropbox
    , Drupal
    , Dyalog
    , EarlyBirds
    , Edge
    , Ember
    , Empire
    , Envira
    , Erlang
    , Ethereum
    , Etsy
    , ExpeditedSSL
    , Facebook
    , Facebook_f
    , FacebookMessenger
    , FacebookSquare
    , Firefox
    , FirstOrder
    , FirstDraft
    , Flickr
    , Fly
    , FontAwesome
    , FontAwesomeAlt
    , FontAwesomeFlag
    , FontIcons
    , FontIcons_fi
    , FortAwesome
    , FortAwesomeAlt
    , Forumbee
    , Foursquare
    , FreeCodeCamp
    , FreeBSD
    ]


defaultStyle : Icon -> Style
defaultStyle icon =
    if (List.member icon brandStyles) then
        Brand
    else
        Solid


name : Icon -> String
name icon =
    case icon of
        FiveHundredPx ->
            "500px"

        AccessibleIcon ->
            "accessible-icon"

        Accusoft ->
            "accusoft"

        AddressBook ->
            "address-book"

        AddressCard ->
            "address-card"

        Adjust ->
            "adjust"

        Adn ->
            "adn"

        Adversal ->
            "adversal"

        AffiliateTheme ->
            "affiliatetheme"

        Algolia ->
            "algolia"

        AlignCenter ->
            "align-center"

        AlignJustify ->
            "align-justify"

        AlignLeft ->
            "align-left"

        AlignRight ->
            "align-right"

        Amazon ->
            "amazon"

        AmazonPay ->
            "amazon-pay"

        Ambulance ->
            "ambulance"

        AmericanSignLanguageInterpreting ->
            "american-sign-language-interpreting"

        Amilia ->
            "amilia"

        Anchor ->
            "anchor"

        Android ->
            "android"

        AngelList ->
            "angellist"

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

        AngryCreative ->
            "angry-creative"

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

        ArrowCircleDown ->
            "arrow-circle-down"

        ArrowCircleLeft ->
            "arrow-circle-left"

        ArrowCircleRight ->
            "arrow-circle-right"

        ArrowCircleUp ->
            "arrow-circle-up"

        ArrowDown ->
            "arrow-up"

        ArrowLeft ->
            "arrow-left"

        ArrowRight ->
            "arrow-right"

        ArrowUp ->
            "arrow-up"

        ArrowsAlt ->
            "arrows-alt"

        ArrowsAltHorizontal ->
            "arrows-alt-h"

        ArrowsAltVertical ->
            "arrows-alt-v"

        AssistiveListeningSystems ->
            "assistive-listening-systems"

        Asterisk ->
            "asterisk"

        Asymmetrik ->
            "asymmetrik"

        At ->
            "at"

        Audible ->
            "audible"

        AudioDescription ->
            "audio-description"

        AutoPrefixer ->
            "autoprefixer"

        Avianex ->
            "avianex"

        Aviato ->
            "aviato"

        AWS ->
            "aws"

        Backward ->
            "backward"

        BalanceScale ->
            "balance-scale"

        Ban ->
            "ban"

        Bandcamp ->
            "bandcamp"

        Barcode ->
            "barcode"

        Bars ->
            "bars"

        Bath ->
            "bath"

        BatteryEmpty ->
            "battery-empty"

        BatteryFull ->
            "battery-full"

        BatteryHalf ->
            "battery-half"

        BatteryQuarter ->
            "battery-quarter"

        BatteryThreeQuarters ->
            "battery-three-quarters"

        Bed ->
            "bed"

        Beer ->
            "beer"

        Behance ->
            "behance"

        BehanceSquare ->
            "behance-square"

        Bell ->
            "bell"

        BellSlash ->
            "bell-slash"

        Bicycle ->
            "bicycle"

        BIMobject ->
            "bimobject"

        Binoculars ->
            "binoculars"

        BirthdayCake ->
            "birthday-cake"

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

        Blind ->
            "blind"

        Blogger ->
            "blogger"

        BloggerB ->
            "blogger-b"

        Bluetooth ->
            "bluetooth"

        BluetoothB ->
            "bluetooth-b"

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

        Btc ->
            "btc"

        Bug ->
            "bug"

        Building ->
            "building"

        Bullhorn ->
            "bullhorn"

        Bullseye ->
            "bullseye"

        BuromobelExperte ->
            "buromobelexperte"

        Bus ->
            "bus"

        BuySellAds ->
            "buysellads"

        Calculator ->
            "calculator"

        Calendar ->
            "calendar"

        CalendarAlt ->
            "calendar-alt"

        CalendarCheck ->
            "calendar-check"

        CalendarMinus ->
            "calendar-minus"

        CalendarPlus ->
            "calendar-plus"

        CalendarTimes ->
            "calendar-times"

        Camera ->
            "camera"

        CameraRetro ->
            "camera-retro"

        Car ->
            "car"

        CaretDown ->
            "caret-down"

        CaretLeft ->
            "caret-left"

        CaretRight ->
            "caret-right"

        CaretUp ->
            "caret-up"

        CaretSquareDown ->
            "caret-square-down"

        CaretSquareLeft ->
            "caret-square-left"

        CaretSquareRight ->
            "caret-square-right"

        CaretSquareUp ->
            "caret-square-up"

        CartArrowDown ->
            "cart-arrow-down"

        CartPlus ->
            "cart-plus"

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

        CCJCB ->
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

        ChevronDown ->
            "chevron-down"

        ChevronLeft ->
            "chevron-left"

        ChevronRight ->
            "chevron-right"

        ChevronUp ->
            "chevron-up"

        Child ->
            "child"

        Chrome ->
            "chrome"

        Circle ->
            "circle"

        CircleNotched ->
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

        CloudDownloadAlt ->
            "cloud-download-alt"

        CloudUploadAlt ->
            "cloud-upload-alt"

        CloudScale ->
            "cloudscale"

        Cloudsmith ->
            "cloudsmith"

        Cloudversify ->
            "cloudversify"

        Code ->
            "code"

        CodeBranch ->
            "code-branch"

        CodePen ->
            "codepen"

        CodiePie ->
            "codiepie"

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

        ConnectDevelop ->
            "connectdevelop"

        Contao ->
            "contao"

        Copy ->
            "copy"

        Copyright ->
            "copyright"

        CPanel ->
            "cpanel"

        CreativeCommons ->
            "creative-commons"

        CreditCard ->
            "credit-card"

        Crop ->
            "crop"

        Crosshairs ->
            "crosshairs"

        CSS3 ->
            "css3"

        CSS3Alt ->
            "css3-alt"

        Cube ->
            "cube"

        Cubes ->
            "cubes"

        Cut ->
            "cut"

        Cuttlefish ->
            "cuttlefish"

        DAndD ->
            "d-and-d"

        Dashcube ->
            "dashcube"

        Database ->
            "database"

        Deaf ->
            "deaf"

        Delicious ->
            "delicious"

        DeployDog ->
            "deploydog"

        Deskpro ->
            "deskpro"

        Desktop ->
            "desktop"

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

        DollarSign ->
            "dollar-sign"

        DotCircle ->
            "dot-circle"

        Download ->
            "download"

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

        Edit ->
            "edit"

        Edge ->
            "edge"

        Eject ->
            "eject"

        EllipsisHorizontal ->
            "ellipsis-h"

        EllipsisVertical ->
            "ellipsis-v"

        Ember ->
            "ember"

        Empire ->
            "empire"

        Envelope ->
            "envelope"

        EnvelopeOpen ->
            "envelope-open"

        EnvelopeSquare ->
            "envelope-square"

        Envira ->
            "envira"

        Eraser ->
            "eraser"

        Erlang ->
            "erlang"

        Ethereum ->
            "ethereum"

        Etsy ->
            "etsy"

        EuroSign ->
            "euro-sign"

        ExchangeAlt ->
            "exchange-alt"

        Exclamation ->
            "exclamation"

        ExclamationCircle ->
            "exclamation-circle"

        ExclamationTriangle ->
            "exclamation-triangle"

        Expand ->
            "expand"

        ExpandArrowsAlt ->
            "expand-arrows-alt"

        ExpeditedSSL ->
            "expeditedssl"

        ExternalLinkAlt ->
            "external-link-alt"

        ExternalLinkSquareAlt ->
            "external-link-square-alt"

        Eye ->
            "eye"

        EyeDropper ->
            "eye-dropper"

        EyeSlash ->
            "eye-slash"

        Facebook ->
            "facebook"

        Facebook_f ->
            "facebook-f"

        FacebookMessenger ->
            "facebook-messenger"

        FacebookSquare ->
            "facebook-square"

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

        FileCode ->
            "file-code"

        FileExcel ->
            "file-excel"

        FileImage ->
            "file-image"

        FilePdf ->
            "file-pdf"

        FilePowerPoint ->
            "file-powerpoint"

        FileVideo ->
            "file-video"

        FileWord ->
            "file-word"

        Film ->
            "film"

        Filter ->
            "filter"

        Fire ->
            "fire"

        FireExtinguisher ->
            "fire-extinguisher"

        Firefox ->
            "firefox"

        FirstOrder ->
            "first-order"

        FirstDraft ->
            "firstdraft"

        Flag ->
            "flag"

        FlagCheckered ->
            "flag-checkered"

        Flask ->
            "flask"

        Flickr ->
            "flickr"

        Fly ->
            "fly"

        Folder ->
            "folder"

        FolderOpen ->
            "folder-open"

        Font ->
            "font"

        FontAwesome ->
            "font-awesome"

        FontAwesomeAlt ->
            "font-awesome-alt"

        FontAwesomeFlag ->
            "font-awesome-flag"

        FontIcons ->
            "fonticons"

        FontIcons_fi ->
            "fonticons-fi"

        FortAwesome ->
            "fort-awesome"

        FortAwesomeAlt ->
            "fort-awesome-alt"

        Forumbee ->
            "forumbee"

        Forward ->
            "forward"

        Foursquare ->
            "foursquare"

        FreeCodeCamp ->
            "free-code-camp"

        FreeBSD ->
            "freebsd"

        Frown ->
            "frown"

        Futbol ->
            "futbol"
