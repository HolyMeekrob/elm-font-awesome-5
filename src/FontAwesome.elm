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
    = AccessibleIcon
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
    | Edit
    | FiveHundredPx


defaultStyle : Icon -> Style
defaultStyle icon =
    case icon of
        Accusoft ->
            Brand

        AccessibleIcon ->
            Brand

        AddressBook ->
            Regular

        AddressCard ->
            Regular

        ArrowAltCircleDown ->
            Regular

        ArrowAltCircleLeft ->
            Regular

        ArrowAltCircleRight ->
            Regular

        ArrowAltCircleUp ->
            Regular

        Adn ->
            Brand

        Adversal ->
            Brand

        AffiliateTheme ->
            Brand

        Algolia ->
            Brand

        Amazon ->
            Brand

        AmazonPay ->
            Brand

        Amilia ->
            Brand

        Android ->
            Brand

        AngelList ->
            Brand

        AngryCreative ->
            Brand

        Angular ->
            Brand

        AppStore ->
            Brand

        AppStoreIos ->
            Brand

        Apper ->
            Brand

        Apple ->
            Brand

        ApplePay ->
            Brand

        Asymmetrik ->
            Brand

        Audible ->
            Brand

        AutoPrefixer ->
            Brand

        Avianex ->
            Brand

        Aviato ->
            Brand

        AWS ->
            Brand

        Bandcamp ->
            Brand

        Behance ->
            Brand

        BehanceSquare ->
            Brand

        Bell ->
            Regular

        BellSlash ->
            Regular

        BIMobject ->
            Brand

        Bitbucket ->
            Brand

        Bitcoin ->
            Brand

        Bity ->
            Brand

        BlackTie ->
            Brand

        Blackberry ->
            Brand

        Blogger ->
            Brand

        BloggerB ->
            Brand

        Bluetooth ->
            Brand

        BluetoothB ->
            Brand

        Bookmark ->
            Regular

        Btc ->
            Brand

        Building ->
            Regular

        BuromobelExperte ->
            Brand

        BuySellAds ->
            Brand

        FiveHundredPx ->
            Brand

        _ ->
            Solid


name : Icon -> String
name icon =
    case icon of
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

        Edit ->
            "edit"

        FiveHundredPx ->
            "500px"
