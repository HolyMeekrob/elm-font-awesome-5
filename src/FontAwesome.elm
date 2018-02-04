module FontAwesome
    exposing
        ( Animation(..)
        , Option(..)
        , HtmlTag(..)
        , Pull(..)
        , Size(..)
        , Transform(..)
        , icon
        , brandIcon
        , lightIcon
        , regularIcon
        , solidIcon
        , useCss
        , useSvg
        , accessibleIcon
        , accusoft
        , addressBook
        , addressCard
        , adjust
        , adn
        , adversal
        , affiliateTheme
        , alarmClock
        , algolia
        , alignCenter
        , alignJustify
        , alignLeft
        , alignRight
        , amazon
        , amazonPay
        , ambulance
        , americanSignLanguageInterpreting
        , amilia
        , anchor
        , android
        , angelList
        , angleDoubleDown
        , angleDoubleLeft
        , angleDoubleRight
        , angleDoubleUp
        , angleDown
        , angleLeft
        , angleRight
        , angleUp
        , angryCreative
        , angular
        , appStore
        , appStoreIos
        , apper
        , apple
        , applePay
        , archive
        , arrowAltCircleDown
        , arrowAltCircleLeft
        , arrowAltCircleRight
        , arrowAltCircleUp
        , arrowAltDown
        , arrowAltFromBottom
        , arrowAltFromLeft
        , arrowAltFromRight
        , arrowAltFromTop
        , arrowAltLeft
        , arrowAltRight
        , arrowAltSquareDown
        , arrowAltSquareLeft
        , arrowAltSquareRight
        , arrowAltSquareUp
        , arrowAltToBottom
        , arrowAltToLeft
        , arrowAltToRight
        , arrowAltToTop
        , arrowAltUp
        , arrowCircleDown
        , arrowCircleLeft
        , arrowCircleRight
        , arrowCircleUp
        , arrowDown
        , arrowFromBottom
        , arrowFromLeft
        , arrowFromRight
        , arrowFromTop
        , arrowLeft
        , arrowRight
        , arrowSquareDown
        , arrowSquareLeft
        , arrowSquareRight
        , arrowSquareUp
        , arrowToBottom
        , arrowToLeft
        , arrowToRight
        , arrowToTop
        , arrowUp
        , arrows
        , arrowsAlt
        , arrowsAltHorizontal
        , arrowsAltVertical
        , arrowsHorizontal
        , arrowsVertical
        , assistiveListeningSystems
        , asterisk
        , asymmetrik
        , at
        , audible
        , audioDescription
        , autoprefixer
        , avianex
        , aviato
        , aws
        , backward
        , badge
        , badgeCheck
        , balanceScale
        , ban
        , bandcamp
        , barcode
        , bars
        , baseball
        , baseballBall
        , basketballBall
        , basketballHoop
        , bath
        , batteryBolt
        , batteryEmpty
        , batteryFull
        , batteryHalf
        , batteryQuarter
        , batterySlash
        , batteryThreeQuarters
        , bed
        , beer
        , behance
        , behanceSquare
        , bell
        , bellSlash
        , bicycle
        , bimObject
        , binoculars
        , birthdayCake
        , bitbucket
        , bitcoin
        , bity
        , blackTie
        , blackberry
        , blind
        , blogger
        , bloggerB
        , bluetooth
        , bluetoothB
        , bold
        , bolt
        , bomb
        , book
        , bookmark
        , bowlingBall
        , bowlingPins
        , boxingGlove
        , braille
        , briefcase
        , browser
        , btc
        , bug
        , building
        , bullhorn
        , bullseye
        , buromobelExperte
        , bus
        , buySellAds
        , calculator
        , calendar
        , calendarAlt
        , calendarCheck
        , calendarEdit
        , calendarExclamation
        , calendarMinus
        , calendarPlus
        , calendarTimes
        , camera
        , cameraAlt
        , cameraRetro
        , car
        , caretCircleDown
        , caretCircleLeft
        , caretCircleRight
        , caretCircleUp
        , caretDown
        , caretLeft
        , caretRight
        , caretSquareDown
        , caretSquareLeft
        , caretSquareRight
        , caretSquareUp
        , caretUp
        , cartArrowDown
        , cartPlus
        , ccAmazonPay
        , ccAmex
        , ccApplePay
        , ccDinersClub
        , ccDiscover
        , ccJcb
        , ccMastercard
        , ccPayPal
        , ccStripe
        , ccVisa
        , centercode
        , certificate
        , chartArea
        , chartBar
        , chartLine
        , chartPie
        , check
        , checkCircle
        , checkSquare
        , chess
        , chessBishop
        , chessBishopAlt
        , chessBoard
        , chessClock
        , chessClockAlt
        , chessKing
        , chessKingAlt
        , chessKnight
        , chessKnightAlt
        , chessPawn
        , chessPawnAlt
        , chessQueen
        , chessQueenAlt
        , chessRook
        , chessRookAlt
        , chevronCircleDown
        , chevronCircleLeft
        , chevronCircleRight
        , chevronCircleUp
        , chevronDoubleDown
        , chevronDoubleLeft
        , chevronDoubleRight
        , chevronDoubleUp
        , chevronDown
        , chevronLeft
        , chevronRight
        , chevronSquareDown
        , chevronSquareLeft
        , chevronSquareRight
        , chevronSquareUp
        , chevronUp
        , child
        , chrome
        , circle
        , circleNotch
        , clipboard
        , clock
        , clone
        , closedCaptioning
        , cloud
        , cloudDownload
        , cloudDownloadAlt
        , cloudUpload
        , cloudUploadAlt
        , cloudScale
        , cloudsmith
        , cloudversify
        , club
        , code
        , codeBranch
        , codeCommit
        , codeMerge
        , codePen
        , codiePie
        , coffee
        , cog
        , cogs
        , columns
        , comment
        , commentAlt
        , comments
        , compass
        , compress
        , compressAlt
        , compressWide
        , connectDevelop
        , contao
        , copy
        , copyright
        , cpanel
        , creativeCommons
        , creditCard
        , creditCardBlank
        , creditCardFront
        , cricket
        , crop
        , crosshairs
        , css3
        , css3Alt
        , cube
        , cubes
        , curling
        , cut
        , cuttlefish
        , dAndD
        , dashcube
        , database
        , deaf
        , delicious
        , deployDog
        , deskpro
        , desktop
        , desktopAlt
        , deviantArt
        , diamond
        , digg
        , digitalOcean
        , discord
        , discourse
        , docHub
        , docker
        , dollarSign
        , dotCircle
        , download
        , draft2Digital
        , dribbble
        , dribbbleSquare
        , dropbox
        , drupal
        , dumbbell
        , dyalog
        , earlyBirds
        , edge
        , edit
        , eject
        , elementor
        , ellipsisHorizontal
        , ellipsisHorizontalAlt
        , ellipsisVertical
        , ellipsisVerticalAlt
        , ember
        , empire
        , envelope
        , envelopeOpen
        , envelopeSquare
        , envira
        , eraser
        , erlang
        , ethereum
        , etsy
        , euroSign
        , exchange
        , exchangeAlt
        , exclamation
        , exclamationCircle
        , exclamationSquare
        , exclamationTriangle
        , expand
        , expandAlt
        , expandArrows
        , expandArrowsAlt
        , expandWide
        , expeditedSSL
        , externalLink
        , externalLinkAlt
        , externalLinkSquare
        , externalLinkSquareAlt
        , eye
        , eyeDropper
        , eyeSlash
        , facebook
        , facebookF
        , facebookMessenger
        , facebookSquare
        , fastBackward
        , fastForward
        , fax
        , female
        , fieldHockey
        , fighterJet
        , file
        , fileAlt
        , fileArchive
        , fileAudio
        , fileCheck
        , fileCode
        , fileEdit
        , fileExcel
        , fileExclamation
        , fileImage
        , fileMinus
        , filePdf
        , filePlus
        , filePowerPoint
        , fileTimes
        , fileVideo
        , fileWord
        , film
        , filmAlt
        , filter
        , fire
        , fireExtinguisher
        , firefox
        , firstDraft
        , firstOrder
        , fiveHundredPx
        , flag
        , flagCheckered
        , flask
        , flickr
        , flipboard
        , fly
        , folder
        , folderOpen
        , font
        , fontAwesome
        , fontAwesomeAlt
        , fontAwesomeFlag
        , fontIcons
        , fontIconsFi
        , footballBall
        , footballHelmet
        , fortAwesome
        , fortAwesomeAlt
        , forumbee
        , forward
        , foursquare
        , freeBSD
        , freeCodeCamp
        , frown
        , futbol
        , gamepad
        , gavel
        , gem
        , genderless
        , getPocket
        , gg
        , ggCircle
        , gift
        , git
        , gitSquare
        , gitHub
        , gitHubAlt
        , gitHubSquare
        , gitKraken
        , gitLab
        , gitter
        , glassMartini
        , glide
        , glideG
        , globe
        , gofore
        , golfBall
        , golfClub
        , goodreads
        , goodreadsG
        , google
        , googleDrive
        , googlePlay
        , googlePlus
        , googlePlusG
        , googlePlusSquare
        , googleWallet
        , graduationCap
        , gratipay
        , grav
        , gripfire
        , grunt
        , gulp
        , hSquare
        , h1
        , h2
        , h3
        , hackerNews
        , hackerNewsSquare
        , handLizard
        , handPaper
        , handPeace
        , handPointDown
        , handPointLeft
        , handPointRight
        , handPointUp
        , handPointer
        , handRock
        , handScissors
        , handSpock
        , handshake
        , hashtag
        , hdd
        , heading
        , headphones
        , heart
        , heartbeat
        , hexagon
        , hips
        , hireAHelper
        , history
        , hockeyPuck
        , hockeySticks
        , home
        , hooli
        , hospital
        , hotjar
        , hourglass
        , hourglassEnd
        , hourglassHalf
        , hourglassStart
        , houzz
        , html5
        , hubSpot
        , iCursor
        , idBadge
        , idCard
        , image
        , images
        , imdb
        , inbox
        , inboxIn
        , inboxOut
        , indent
        , industry
        , industryAlt
        , info
        , infoCircle
        , infoSquare
        , instagram
        , internetExplorer
        , ioxHost
        , italic
        , iTunes
        , iTunesNote
        , jackOLantern
        , jenkins
        , joget
        , joomla
        , js
        , jsSquare
        , jsFiddle
        , key
        , keyboard
        , keyCDN
        , kickstarter
        , kickstarterK
        , korvue
        , language
        , laptop
        , laravel
        , lastfm
        , lastfmSquare
        , leaf
        , leanpub
        , lemon
        , less
        , levelDown
        , levelDownAlt
        , levelUp
        , levelUpAlt
        , lifeRing
        , lightbulb
        , line
        , link
        , linkedIn
        , linkedInInverted
        , linode
        , linux
        , liraSign
        , list
        , listAlt
        , listOl
        , listUl
        , locationArrow
        , lock
        , lockAlt
        , lockOpen
        , lockOpenAlt
        , longArrowAltDown
        , longArrowAltLeft
        , longArrowAltRight
        , longArrowAltUp
        , longArrowDown
        , longArrowLeft
        , longArrowRight
        , longArrowUp
        , lowVision
        , luchador
        , lyft
        , magento
        , magic
        , magnet
        , male
        , map
        , mapMarker
        , mapMarkerAlt
        , mapPin
        , mapSigns
        , mars
        , marsDouble
        , marsStroke
        , marsStrokeHorizontal
        , marsStrokeVertical
        , maxCDN
        , medApps
        , medium
        , mediumM
        , medkit
        , medRT
        , meetup
        , meh
        , mercury
        , microchip
        , microphone
        , microphoneAlt
        , microphoneSlash
        , microsoft
        , minus
        , minusCircle
        , minusHexagon
        , minusOctagon
        , minusSquare
        , mix
        , mixcloud
        , mizuni
        , mobile
        , mobileAlt
        , mobileAndroid
        , mobileAndroidAlt
        , modX
        , monero
        , moneyBill
        , moneyBillAlt
        , moon
        , motorcycle
        , mousePointer
        , music
        , napster
        , neuter
        , newspaper
        , nintendoSwitch
        , node
        , nodejs
        , npm
        , ns8
        , nutritionix
        , objectGroup
        , objectUngroup
        , octagon
        , odnoklassniki
        , odnoklassnikiSquare
        , openCart
        , openID
        , opera
        , optinMonster
        , openSourceInitiative
        , outdent
        , page4
        , pageLines
        , paintBrush
        , palFed
        , paperPlane
        , paperclip
        , paragraph
        , paste
        , patreon
        , pause
        , pauseCircle
        , paw
        , payPal
        , pen
        , penAlt
        , penSquare
        , pencil
        , pencilAlt
        , pennant
        , percent
        , periscope
        , phabricator
        , phoenixFramework
        , phone
        , phoneSlash
        , phoneSquare
        , phoneVolume
        , php
        , piedPiper
        , piedPiperAlt
        , piedPiperPP
        , pinterest
        , pinterestP
        , pinterestSquare
        , plane
        , planeAlt
        , play
        , playCircle
        , playstation
        , plug
        , plus
        , plusCircle
        , plusHexagon
        , plusOctagon
        , plusSquare
        , podcast
        , poo
        , portrait
        , poundSign
        , powerOff
        , print
        , productHunt
        , pushed
        , puzzlePiece
        , python
        , qq
        , qrCode
        , question
        , questionCircle
        , questionSquare
        , quidditch
        , quinScape
        , quora
        , quoteLeft
        , quoteRight
        , racquet
        , random
        , ravelry
        , react
        , rebel
        , rectangleLandscape
        , rectanglePortrait
        , rectangleWide
        , recycle
        , redRiver
        , reddit
        , redditAlien
        , redditSquare
        , redo
        , redoAlt
        , registered
        , rendact
        , renren
        , repeat
        , repeatAlt
        , repeat1
        , repeat1Alt
        , reply
        , replyAll
        , replyd
        , resolving
        , retweet
        , retweetAlt
        , road
        , rocket
        , rocketChat
        , rockRMS
        , rss
        , rssSquare
        , rubleSign
        , rupeeSign
        , safari
        , sass
        , save
        , schlix
        , scribd
        , scrubber
        , search
        , searchMinus
        , searchPlus
        , searchengin
        , sellCast
        , sellsy
        , server
        , serviceStack
        , share
        , shareAll
        , shareAlt
        , shareAltSquare
        , shareSquare
        , shekelSign
        , shield
        , shieldAlt
        , shieldCheck
        , ship
        , shirtsInBulk
        , shoppingBag
        , shoppingBasket
        , shoppingCart
        , shower
        , shuttlecock
        , signIn
        , signInAlt
        , signLanguage
        , signOut
        , signOutAlt
        , signal
        , simplyBuilt
        , sistrix
        , sitemap
        , skyAtlas
        , skype
        , slack
        , slackHash
        , slidersHorizontal
        , slidersHorizontalSquare
        , slidersVertical
        , slidersVerticalSquare
        , slideshare
        , smile
        , snapchat
        , snapchatGhost
        , snapchatSquare
        , snowflake
        , sort
        , sortAlphaDown
        , sortAlphaUp
        , sortAmountDown
        , sortAmountUp
        , sortDown
        , sortNumericDown
        , sortNumericUp
        , sortUp
        , soundCloud
        , spaceShuttle
        , spade
        , speakap
        , spinner
        , spinnerThird
        , spotify
        , square
        , squareFull
        , stackExchange
        , stackOverflow
        , star
        , starExclamation
        , starHalf
        , stayLinked
        , steam
        , steamSquare
        , steamSymbol
        , stepBackward
        , stepForward
        , stethoscope
        , stickerMule
        , stickyNote
        , stop
        , stopCircle
        , stopwatch
        , strava
        , streetView
        , strikethrough
        , stripe
        , stripeS
        , studioVinari
        , stumbleUpon
        , stumbleUponCircle
        , subscript
        , subway
        , suitcase
        , sun
        , superpowers
        , superscript
        , supple
        , sync
        , syncAlt
        , table
        , tableTennis
        , tablet
        , tabletAlt
        , tabletAndroid
        , tabletAndroidAlt
        , tachometer
        , tachometerAlt
        , tag
        , tags
        , tasks
        , taxi
        , telegram
        , telegramPlane
        , tencentWeibo
        , tennisBall
        , terminal
        , textHeight
        , textWidth
        , th
        , thLarge
        , thList
        , themeIsle
        , thermometerEmpty
        , thermometerFull
        , thermometerHalf
        , thermometerQuarter
        , thermometerThreeQuarters
        , thumbsDown
        , thumbsUp
        , thumbtack
        , ticket
        , ticketAlt
        , times
        , timesCircle
        , timesHexagon
        , timesOctagon
        , timesSquare
        , tint
        , toggleOff
        , toggleOn
        , trademark
        , train
        , transgender
        , transgenderAlt
        , trash
        , trashAlt
        , tree
        , treeAlt
        , trello
        , triangle
        , tripAdvisor
        , trophy
        , trophyAlt
        , truck
        , tty
        , tumblr
        , tumblrSquare
        , tv
        , tvRetro
        , twitch
        , twitter
        , twitterSquare
        , typo3
        , uber
        , uiKit
        , umbrella
        , underline
        , undo
        , undoAlt
        , uniregistry
        , universalAccess
        , university
        , unlink
        , unlock
        , unlockAlt
        , untappd
        , upload
        , usb
        , usdCircle
        , usdSquare
        , user
        , userAlt
        , userCircle
        , userMD
        , userPlus
        , userSecret
        , userTimes
        , users
        , usSunnah
        , utensilFork
        , utensilKnife
        , utensilSpoon
        , utensils
        , utensilsAlt
        , vaadin
        , venus
        , venusDouble
        , venusMars
        , viacoin
        , viadeo
        , viadeoSquare
        , viber
        , video
        , vimeo
        , vimeoSquare
        , vimeoV
        , vine
        , vk
        , vnv
        , volleyball
        , volumeDown
        , volumeMute
        , volumeOff
        , volumeUp
        , vuejs
        , watch
        , weibo
        , weixin
        , whatsApp
        , whatsAppSquare
        , wheelchair
        , whistle
        , whmcs
        , wifi
        , wikipedia
        , window
        , windowAlt
        , windowClose
        , windowMaximize
        , windowMinimize
        , windowRestore
        , windows
        , wonSign
        , wordPress
        , wordPressSimple
        , wpBeginner
        , wpExplorer
        , wpForms
        , wrench
        , xbox
        , xing
        , xingSquare
        , yCombinator
        , yahoo
        , yandex
        , yandexInternational
        , yelp
        , yenSign
        , yoast
        , youTube
        , youTubeSquare
        )

{-| A type-checked interface for using the Font Awesome icon library.


# CDN Helpers

@docs useSvg, useCss


# Elements

@docs icon, brandIcon, lightIcon, regularIcon, solidIcon


# Options

@docs Option, Animation, HtmlTag, Pull, Size, Transform


# Icons

@docs accessibleIcon
@docs accusoft
@docs addressBook
@docs addressCard
@docs adjust
@docs adn
@docs adversal
@docs affiliateTheme
@docs alarmClock
@docs algolia
@docs alignCenter
@docs alignJustify
@docs alignLeft
@docs alignRight
@docs amazon
@docs amazonPay
@docs ambulance
@docs americanSignLanguageInterpreting
@docs amilia
@docs anchor
@docs android
@docs angelList
@docs angleDoubleDown
@docs angleDoubleLeft
@docs angleDoubleRight
@docs angleDoubleUp
@docs angleDown
@docs angleLeft
@docs angleRight
@docs angleUp
@docs angryCreative
@docs angular
@docs appStore
@docs appStoreIos
@docs apper
@docs apple
@docs applePay
@docs archive
@docs arrowAltCircleDown
@docs arrowAltCircleLeft
@docs arrowAltCircleRight
@docs arrowAltCircleUp
@docs arrowAltDown
@docs arrowAltFromBottom
@docs arrowAltFromLeft
@docs arrowAltFromRight
@docs arrowAltFromTop
@docs arrowAltLeft
@docs arrowAltRight
@docs arrowAltSquareDown
@docs arrowAltSquareLeft
@docs arrowAltSquareRight
@docs arrowAltSquareUp
@docs arrowAltToBottom
@docs arrowAltToLeft
@docs arrowAltToRight
@docs arrowAltToTop
@docs arrowAltUp
@docs arrowCircleDown
@docs arrowCircleLeft
@docs arrowCircleRight
@docs arrowCircleUp
@docs arrowDown
@docs arrowFromBottom
@docs arrowFromLeft
@docs arrowFromRight
@docs arrowFromTop
@docs arrowLeft
@docs arrowRight
@docs arrowSquareDown
@docs arrowSquareLeft
@docs arrowSquareRight
@docs arrowSquareUp
@docs arrowToBottom
@docs arrowToLeft
@docs arrowToRight
@docs arrowToTop
@docs arrowUp
@docs arrows
@docs arrowsAlt
@docs arrowsAltHorizontal
@docs arrowsAltVertical
@docs arrowsHorizontal
@docs arrowsVertical
@docs assistiveListeningSystems
@docs asterisk
@docs asymmetrik
@docs at
@docs audible
@docs audioDescription
@docs autoprefixer
@docs avianex
@docs aviato
@docs aws
@docs backward
@docs badge
@docs badgeCheck
@docs balanceScale
@docs ban
@docs bandcamp
@docs barcode
@docs bars
@docs baseball
@docs baseballBall
@docs basketballBall
@docs basketballHoop
@docs bath
@docs batteryBolt
@docs batteryEmpty
@docs batteryFull
@docs batteryHalf
@docs batteryQuarter
@docs batterySlash
@docs batteryThreeQuarters
@docs bed
@docs beer
@docs behance
@docs behanceSquare
@docs bell
@docs bellSlash
@docs bicycle
@docs bimObject
@docs binoculars
@docs birthdayCake
@docs bitbucket
@docs bitcoin
@docs bity
@docs blackTie
@docs blackberry
@docs blind
@docs blogger
@docs bloggerB
@docs bluetooth
@docs bluetoothB
@docs bold
@docs bolt
@docs bomb
@docs book
@docs bookmark
@docs bowlingBall
@docs bowlingPins
@docs boxingGlove
@docs braille
@docs briefcase
@docs browser
@docs btc
@docs bug
@docs building
@docs bullhorn
@docs bullseye
@docs buromobelExperte
@docs bus
@docs buySellAds
@docs calculator
@docs calendar
@docs calendarAlt
@docs calendarCheck
@docs calendarEdit
@docs calendarExclamation
@docs calendarMinus
@docs calendarPlus
@docs calendarTimes
@docs camera
@docs cameraAlt
@docs cameraRetro
@docs car
@docs caretCircleDown
@docs caretCircleLeft
@docs caretCircleRight
@docs caretCircleUp
@docs caretDown
@docs caretLeft
@docs caretRight
@docs caretSquareDown
@docs caretSquareLeft
@docs caretSquareRight
@docs caretSquareUp
@docs caretUp
@docs cartArrowDown
@docs cartPlus
@docs ccAmazonPay
@docs ccAmex
@docs ccApplePay
@docs ccDinersClub
@docs ccDiscover
@docs ccJcb
@docs ccMastercard
@docs ccPayPal
@docs ccStripe
@docs ccVisa
@docs centercode
@docs certificate
@docs chartArea
@docs chartBar
@docs chartLine
@docs chartPie
@docs check
@docs checkCircle
@docs checkSquare
@docs chess
@docs chessBishop
@docs chessBishopAlt
@docs chessBoard
@docs chessClock
@docs chessClockAlt
@docs chessKing
@docs chessKingAlt
@docs chessKnight
@docs chessKnightAlt
@docs chessPawn
@docs chessPawnAlt
@docs chessQueen
@docs chessQueenAlt
@docs chessRook
@docs chessRookAlt
@docs chevronCircleDown
@docs chevronCircleLeft
@docs chevronCircleRight
@docs chevronCircleUp
@docs chevronDoubleDown
@docs chevronDoubleLeft
@docs chevronDoubleRight
@docs chevronDoubleUp
@docs chevronDown
@docs chevronLeft
@docs chevronRight
@docs chevronSquareDown
@docs chevronSquareLeft
@docs chevronSquareRight
@docs chevronSquareUp
@docs chevronUp
@docs child
@docs chrome
@docs circle
@docs circleNotch
@docs clipboard
@docs clock
@docs clone
@docs closedCaptioning
@docs cloud
@docs cloudDownload
@docs cloudDownloadAlt
@docs cloudUpload
@docs cloudUploadAlt
@docs cloudScale
@docs cloudsmith
@docs cloudversify
@docs club
@docs code
@docs codeBranch
@docs codeCommit
@docs codeMerge
@docs codePen
@docs codiePie
@docs coffee
@docs cog
@docs cogs
@docs columns
@docs comment
@docs commentAlt
@docs comments
@docs compass
@docs compress
@docs compressAlt
@docs compressWide
@docs connectDevelop
@docs contao
@docs copy
@docs copyright
@docs cpanel
@docs creativeCommons
@docs creditCard
@docs creditCardBlank
@docs creditCardFront
@docs cricket
@docs crop
@docs crosshairs
@docs css3
@docs css3Alt
@docs cube
@docs cubes
@docs curling
@docs cut
@docs cuttlefish
@docs dAndD
@docs dashcube
@docs database
@docs deaf
@docs delicious
@docs deployDog
@docs deskpro
@docs desktop
@docs desktopAlt
@docs deviantArt
@docs diamond
@docs digg
@docs digitalOcean
@docs discord
@docs discourse
@docs docHub
@docs docker
@docs dollarSign
@docs dotCircle
@docs download
@docs draft2Digital
@docs dribbble
@docs dribbbleSquare
@docs dropbox
@docs drupal
@docs dumbbell
@docs dyalog
@docs earlyBirds
@docs edge
@docs edit
@docs eject
@docs elementor
@docs ellipsisHorizontal
@docs ellipsisHorizontalAlt
@docs ellipsisVertical
@docs ellipsisVerticalAlt
@docs ember
@docs empire
@docs envelope
@docs envelopeOpen
@docs envelopeSquare
@docs envira
@docs eraser
@docs erlang
@docs ethereum
@docs etsy
@docs euroSign
@docs exchange
@docs exchangeAlt
@docs exclamation
@docs exclamationCircle
@docs exclamationSquare
@docs exclamationTriangle
@docs expand
@docs expandAlt
@docs expandArrows
@docs expandArrowsAlt
@docs expandWide
@docs expeditedSSL
@docs externalLink
@docs externalLinkAlt
@docs externalLinkSquare
@docs externalLinkSquareAlt
@docs eye
@docs eyeDropper
@docs eyeSlash
@docs facebook
@docs facebookF
@docs facebookMessenger
@docs facebookSquare
@docs fastBackward
@docs fastForward
@docs fax
@docs female
@docs fieldHockey
@docs fighterJet
@docs file
@docs fileAlt
@docs fileArchive
@docs fileAudio
@docs fileCheck
@docs fileCode
@docs fileEdit
@docs fileExcel
@docs fileExclamation
@docs fileImage
@docs fileMinus
@docs filePdf
@docs filePlus
@docs filePowerPoint
@docs fileTimes
@docs fileVideo
@docs fileWord
@docs film
@docs filmAlt
@docs filter
@docs fire
@docs fireExtinguisher
@docs firefox
@docs firstDraft
@docs firstOrder
@docs fiveHundredPx
@docs flag
@docs flagCheckered
@docs flask
@docs flickr
@docs flipboard
@docs fly
@docs folder
@docs folderOpen
@docs font
@docs fontAwesome
@docs fontAwesomeAlt
@docs fontAwesomeFlag
@docs fontIcons
@docs fontIconsFi
@docs footballBall
@docs footballHelmet
@docs fortAwesome
@docs fortAwesomeAlt
@docs forumbee
@docs forward
@docs foursquare
@docs freeBSD
@docs freeCodeCamp
@docs frown
@docs futbol
@docs gamepad
@docs gavel
@docs gem
@docs genderless
@docs getPocket
@docs gg
@docs ggCircle
@docs gift
@docs git
@docs gitSquare
@docs gitHub
@docs gitHubAlt
@docs gitHubSquare
@docs gitKraken
@docs gitLab
@docs gitter
@docs glassMartini
@docs glide
@docs glideG
@docs globe
@docs gofore
@docs golfBall
@docs golfClub
@docs goodreads
@docs goodreadsG
@docs google
@docs googleDrive
@docs googlePlay
@docs googlePlus
@docs googlePlusG
@docs googlePlusSquare
@docs googleWallet
@docs graduationCap
@docs gratipay
@docs grav
@docs gripfire
@docs grunt
@docs gulp
@docs hSquare
@docs h1
@docs h2
@docs h3
@docs hackerNews
@docs hackerNewsSquare
@docs handLizard
@docs handPaper
@docs handPeace
@docs handPointDown
@docs handPointLeft
@docs handPointRight
@docs handPointUp
@docs handPointer
@docs handRock
@docs handScissors
@docs handSpock
@docs handshake
@docs hashtag
@docs hdd
@docs heading
@docs headphones
@docs heart
@docs heartbeat
@docs hexagon
@docs hips
@docs hireAHelper
@docs history
@docs hockeyPuck
@docs hockeySticks
@docs home
@docs hooli
@docs hospital
@docs hotjar
@docs hourglass
@docs hourglassEnd
@docs hourglassHalf
@docs hourglassStart
@docs houzz
@docs html5
@docs hubSpot
@docs iCursor
@docs idBadge
@docs idCard
@docs image
@docs images
@docs imdb
@docs inbox
@docs inboxIn
@docs inboxOut
@docs indent
@docs industry
@docs industryAlt
@docs info
@docs infoCircle
@docs infoSquare
@docs instagram
@docs internetExplorer
@docs ioxHost
@docs italic
@docs iTunes
@docs iTunesNote
@docs jackOLantern
@docs jenkins
@docs joget
@docs joomla
@docs js
@docs jsSquare
@docs jsFiddle
@docs key
@docs keyboard
@docs keyCDN
@docs kickstarter
@docs kickstarterK
@docs korvue
@docs language
@docs laptop
@docs laravel
@docs lastfm
@docs lastfmSquare
@docs leaf
@docs leanpub
@docs lemon
@docs less
@docs levelDown
@docs levelDownAlt
@docs levelUp
@docs levelUpAlt
@docs lifeRing
@docs lightbulb
@docs line
@docs link
@docs linkedIn
@docs linkedInInverted
@docs linode
@docs linux
@docs liraSign
@docs list
@docs listAlt
@docs listOl
@docs listUl
@docs locationArrow
@docs lock
@docs lockAlt
@docs lockOpen
@docs lockOpenAlt
@docs longArrowAltDown
@docs longArrowAltLeft
@docs longArrowAltRight
@docs longArrowAltUp
@docs longArrowDown
@docs longArrowLeft
@docs longArrowRight
@docs longArrowUp
@docs lowVision
@docs luchador
@docs lyft
@docs magento
@docs magic
@docs magnet
@docs male
@docs map
@docs mapMarker
@docs mapMarkerAlt
@docs mapPin
@docs mapSigns
@docs mars
@docs marsDouble
@docs marsStroke
@docs marsStrokeHorizontal
@docs marsStrokeVertical
@docs maxCDN
@docs medApps
@docs medium
@docs mediumM
@docs medkit
@docs medRT
@docs meetup
@docs meh
@docs mercury
@docs microchip
@docs microphone
@docs microphoneAlt
@docs microphoneSlash
@docs microsoft
@docs minus
@docs minusCircle
@docs minusHexagon
@docs minusOctagon
@docs minusSquare
@docs mix
@docs mixcloud
@docs mizuni
@docs mobile
@docs mobileAlt
@docs mobileAndroid
@docs mobileAndroidAlt
@docs modX
@docs monero
@docs moneyBill
@docs moneyBillAlt
@docs moon
@docs motorcycle
@docs mousePointer
@docs music
@docs napster
@docs neuter
@docs newspaper
@docs nintendoSwitch
@docs node
@docs nodejs
@docs npm
@docs ns8
@docs nutritionix
@docs objectGroup
@docs objectUngroup
@docs octagon
@docs odnoklassniki
@docs odnoklassnikiSquare
@docs openCart
@docs openID
@docs opera
@docs optinMonster
@docs openSourceInitiative
@docs outdent
@docs page4
@docs pageLines
@docs paintBrush
@docs palFed
@docs paperPlane
@docs paperclip
@docs paragraph
@docs paste
@docs patreon
@docs pause
@docs pauseCircle
@docs paw
@docs payPal
@docs pen
@docs penAlt
@docs penSquare
@docs pencil
@docs pencilAlt
@docs pennant
@docs percent
@docs periscope
@docs phabricator
@docs phoenixFramework
@docs phone
@docs phoneSlash
@docs phoneSquare
@docs phoneVolume
@docs php
@docs piedPiper
@docs piedPiperAlt
@docs piedPiperPP
@docs pinterest
@docs pinterestP
@docs pinterestSquare
@docs plane
@docs planeAlt
@docs play
@docs playCircle
@docs playstation
@docs plug
@docs plus
@docs plusCircle
@docs plusHexagon
@docs plusOctagon
@docs plusSquare
@docs podcast
@docs poo
@docs portrait
@docs poundSign
@docs powerOff
@docs print
@docs productHunt
@docs pushed
@docs puzzlePiece
@docs python
@docs qq
@docs qrCode
@docs question
@docs questionCircle
@docs questionSquare
@docs quidditch
@docs quinScape
@docs quora
@docs quoteLeft
@docs quoteRight
@docs racquet
@docs random
@docs ravelry
@docs react
@docs rebel
@docs rectangleLandscape
@docs rectanglePortrait
@docs rectangleWide
@docs recycle
@docs redRiver
@docs reddit
@docs redditAlien
@docs redditSquare
@docs redo
@docs redoAlt
@docs registered
@docs rendact
@docs renren
@docs repeat
@docs repeatAlt
@docs repeat1
@docs repeat1Alt
@docs reply
@docs replyAll
@docs replyd
@docs resolving
@docs retweet
@docs retweetAlt
@docs road
@docs rocket
@docs rocketChat
@docs rockRMS
@docs rss
@docs rssSquare
@docs rubleSign
@docs rupeeSign
@docs safari
@docs sass
@docs save
@docs schlix
@docs scribd
@docs scrubber
@docs search
@docs searchMinus
@docs searchPlus
@docs searchengin
@docs sellCast
@docs sellsy
@docs server
@docs serviceStack
@docs share
@docs shareAll
@docs shareAlt
@docs shareAltSquare
@docs shareSquare
@docs shekelSign
@docs shield
@docs shieldAlt
@docs shieldCheck
@docs ship
@docs shirtsInBulk
@docs shoppingBag
@docs shoppingBasket
@docs shoppingCart
@docs shower
@docs shuttlecock
@docs signIn
@docs signInAlt
@docs signLanguage
@docs signOut
@docs signOutAlt
@docs signal
@docs simplyBuilt
@docs sistrix
@docs sitemap
@docs skyAtlas
@docs skype
@docs slack
@docs slackHash
@docs slidersHorizontal
@docs slidersHorizontalSquare
@docs slidersVertical
@docs slidersVerticalSquare
@docs slideshare
@docs smile
@docs snapchat
@docs snapchatGhost
@docs snapchatSquare
@docs snowflake
@docs sort
@docs sortAlphaDown
@docs sortAlphaUp
@docs sortAmountDown
@docs sortAmountUp
@docs sortDown
@docs sortNumericDown
@docs sortNumericUp
@docs sortUp
@docs soundCloud
@docs spaceShuttle
@docs spade
@docs speakap
@docs spinner
@docs spinnerThird
@docs spotify
@docs square
@docs squareFull
@docs stackExchange
@docs stackOverflow
@docs star
@docs starExclamation
@docs starHalf
@docs stayLinked
@docs steam
@docs steamSquare
@docs steamSymbol
@docs stepBackward
@docs stepForward
@docs stethoscope
@docs stickerMule
@docs stickyNote
@docs stop
@docs stopCircle
@docs stopwatch
@docs strava
@docs streetView
@docs strikethrough
@docs stripe
@docs stripeS
@docs studioVinari
@docs stumbleUpon
@docs stumbleUponCircle
@docs subscript
@docs subway
@docs suitcase
@docs sun
@docs superpowers
@docs superscript
@docs supple
@docs sync
@docs syncAlt
@docs table
@docs tableTennis
@docs tablet
@docs tabletAlt
@docs tabletAndroid
@docs tabletAndroidAlt
@docs tachometer
@docs tachometerAlt
@docs tag
@docs tags
@docs tasks
@docs taxi
@docs telegram
@docs telegramPlane
@docs tencentWeibo
@docs tennisBall
@docs terminal
@docs textHeight
@docs textWidth
@docs th
@docs thLarge
@docs thList
@docs themeIsle
@docs thermometerEmpty
@docs thermometerFull
@docs thermometerHalf
@docs thermometerQuarter
@docs thermometerThreeQuarters
@docs thumbsDown
@docs thumbsUp
@docs thumbtack
@docs ticket
@docs ticketAlt
@docs times
@docs timesCircle
@docs timesHexagon
@docs timesOctagon
@docs timesSquare
@docs tint
@docs toggleOff
@docs toggleOn
@docs trademark
@docs train
@docs transgender
@docs transgenderAlt
@docs trash
@docs trashAlt
@docs tree
@docs treeAlt
@docs trello
@docs triangle
@docs tripAdvisor
@docs trophy
@docs trophyAlt
@docs truck
@docs tty
@docs tumblr
@docs tumblrSquare
@docs tv
@docs tvRetro
@docs twitch
@docs twitter
@docs twitterSquare
@docs typo3
@docs uber
@docs uiKit
@docs umbrella
@docs underline
@docs undo
@docs undoAlt
@docs uniregistry
@docs universalAccess
@docs university
@docs unlink
@docs unlock
@docs unlockAlt
@docs untappd
@docs upload
@docs usb
@docs usdCircle
@docs usdSquare
@docs user
@docs userAlt
@docs userCircle
@docs userMD
@docs userPlus
@docs userSecret
@docs userTimes
@docs users
@docs usSunnah
@docs utensilFork
@docs utensilKnife
@docs utensilSpoon
@docs utensils
@docs utensilsAlt
@docs vaadin
@docs venus
@docs venusDouble
@docs venusMars
@docs viacoin
@docs viadeo
@docs viadeoSquare
@docs viber
@docs video
@docs vimeo
@docs vimeoSquare
@docs vimeoV
@docs vine
@docs vk
@docs vnv
@docs volleyball
@docs volumeDown
@docs volumeMute
@docs volumeOff
@docs volumeUp
@docs vuejs
@docs watch
@docs weibo
@docs weixin
@docs whatsApp
@docs whatsAppSquare
@docs wheelchair
@docs whistle
@docs whmcs
@docs wifi
@docs wikipedia
@docs window
@docs windowAlt
@docs windowClose
@docs windowMaximize
@docs windowMinimize
@docs windowRestore
@docs windows
@docs wonSign
@docs wordPress
@docs wordPressSimple
@docs wpBeginner
@docs wpExplorer
@docs wpForms
@docs wrench
@docs xbox
@docs xing
@docs xingSquare
@docs yCombinator
@docs yahoo
@docs yandex
@docs yandexInternational
@docs yelp
@docs yenSign
@docs yoast
@docs youTube
@docs youTubeSquare

-}

import FontAwesome.Types as Types exposing (Icon, Logo, Style)
import FontAwesome.Utils exposing (dedup, onlyOne)
import Html exposing (Attribute, Html)
import Html.Attributes


{-| A convenience helper for including Font Awesome SVGs on your page using their CDN.
Place this inside your &lt;head&gt; tag.
-}
useSvg : Html msg
useSvg =
    Html.node "script"
        [ Html.Attributes.defer True
        , Html.Attributes.src "https://use.fontawesome.com/releases/v5.0.3/js/all.js"
        ]
        []


{-| A convenience helper for including Font Awesome CSS on your page using their CDN.
Place this inside your &lt;head&gt; tag.

Note that some features will not work if you choose CSS rather than SVGs.
Please refer to Font Awesome's documentation for details.

-}
useCss : Html msg
useCss =
    Html.node "link"
        [ Html.Attributes.href
            "https://use.fontawesome.com/releases/v5.0.3/css/all.css"
        , Html.Attributes.rel "stylesheet"
        ]
        []


{-| Create an icon with the default style (Solid for icons),
default tag (&lt;i&gt;), and no additional options or attributes.

    icon file
    -- <i class="fas fa-file"></i>

-}
icon : Icon -> Html msg
icon icon =
    solidIcon icon [] []


{-| Create a solid-styled icon with the given options and attributes.

    solidIcon spinner [ Animation Spin ] []
    -- <i class="fas fa-spinner fa-spin"></i>

    solidIcon question [ HasBorder, Pull Right ] [ Html.Attributes.title "Question"]
    -- <i class="fas fa-question fa-border fa-pull-right" title="Question"></i>

    solidIcon info [ HasFixedWidth, Size Large, HtmlTag Span ] []
    -- <span class="fas fa-info fa-fw fa-lg"></span>

-}
solidIcon : Icon -> List Option -> List (Attribute msg) -> Html msg
solidIcon icon options htmlAttributes =
    iconWithOptions (iconClass icon) Types.Solid options htmlAttributes


{-| Create a regular-styled icon with the given options and attributes.

    regularIcon spinner [ Animation Spin ] []
    -- <i class="far fa-spinner fa-spin"></i>

    regularIcon question [ HasBorder, Pull Right ] [ Html.Attributes.title "Question"]
    -- <i class="far fa-question fa-border fa-pull-right" title="Question"></i>

    regularIcon info [ HasFixedWidth, Size Large, HtmlTag Span ] []
    -- <span class="far fa-info fa-fw fa-lg"></span>

-}
regularIcon : Icon -> List Option -> List (Attribute msg) -> Html msg
regularIcon icon options htmlAttributes =
    iconWithOptions (iconClass icon) Types.Regular options htmlAttributes


{-| Create a light-styled icon with the given options and attributes.

    lightIcon spinner [ Animation Spin ] []
    -- <i class="fas fa-spinner fa-spin"></i>

    lightIcon question [ HasBorder, Pull Right ] [ Html.Attributes.title "Question"]
    -- <i class="fas fa-question fa-border fa-pull-right" title="Question"></i>

    lightIcon info [ HasFixedWidth, Size Large, HtmlTag Span ] []
    -- <span class="fas fa-info fa-fw fa-lg"></span>

-}
lightIcon : Icon -> List Option -> List (Attribute msg) -> Html msg
lightIcon icon options htmlAttributes =
    iconWithOptions (iconClass icon) Types.Light options htmlAttributes


{-| Create a logo with the given options and attributes.

    brandIcon spinner [ Animation Spin ] []
    -- <i class="fas fa-spinner fa-spin"></i>

    brandIcon question [ HasBorder, Pull Right ] [ Html.Attributes.title "Question"]
    -- <i class="fas fa-question fa-border fa-pull-right" title="Question"></i>

    brandIcon info [ HasFixedWidth, Size Large, HtmlTag Span ] []
    -- <span class="fas fa-info fa-fw fa-lg"></span>

-}
brandIcon : Logo -> List Option -> List (Attribute msg) -> Html msg
brandIcon logo options htmlAttributes =
    iconWithOptions (logoClass logo) Types.Brand options htmlAttributes


iconWithOptions : String -> Style -> List Option -> List (Attribute msg) -> Html msg
iconWithOptions icon style options htmlAttributes =
    let
        opts =
            filterAttrs options
    in
        htmlTag opts
            (classes icon style opts
                :: htmlAttrs opts htmlAttributes
            )
            []


findTag : Option -> HtmlTag -> HtmlTag
findTag option previousTag =
    case option of
        HtmlTag tag ->
            tag

        _ ->
            previousTag


htmlTag : List Option -> (List (Attribute msg) -> List (Html msg) -> Html msg)
htmlTag opts =
    let
        tag =
            List.foldl findTag I opts
    in
        case tag of
            I ->
                Html.i

            Span ->
                Html.span


htmlAttrs : List Option -> List (Attribute msg) -> List (Attribute msg)
htmlAttrs options htmlAttributes =
    transformAttr options
        ++ maskAttr options
        ++ htmlAttributes


isAnimation : Option -> Bool
isAnimation option =
    case option of
        Animation _ ->
            True

        _ ->
            False


isBorder : Option -> Bool
isBorder option =
    case option of
        HasBorder ->
            True

        _ ->
            False


isHtmlTag : Option -> Bool
isHtmlTag option =
    case option of
        HtmlTag _ ->
            True

        _ ->
            False


isInvertColor : Option -> Bool
isInvertColor option =
    case option of
        InvertColor ->
            True

        _ ->
            False


isMask : Option -> Bool
isMask option =
    case option of
        SolidMask _ ->
            True

        RegularMask _ ->
            True

        LightMask _ ->
            True

        BrandMask _ ->
            True

        _ ->
            False


isPull : Option -> Bool
isPull option =
    case option of
        Pull _ ->
            True

        _ ->
            False


isSize : Option -> Bool
isSize option =
    case option of
        Size _ ->
            True

        _ ->
            False


isTransform : Option -> Bool
isTransform option =
    case option of
        Transform _ ->
            True

        _ ->
            False


isWidth : Option -> Bool
isWidth option =
    case option of
        HasFixedWidth ->
            True

        _ ->
            False


filterAttrs : List Option -> List Option
filterAttrs options =
    options
        |> dedup isAnimation
        |> dedup isBorder
        |> dedup isHtmlTag
        |> dedup isInvertColor
        |> dedup isMask
        |> dedup isPull
        |> dedup isSize
        |> dedup isTransform
        |> dedup isWidth


iconClass : Icon -> String
iconClass (Types.Icon root) =
    "fa-" ++ root


logoClass : Logo -> String
logoClass (Types.Logo root) =
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


invertClass : String
invertClass =
    "fa-inverse"


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
        Types.Solid ->
            "fas"

        Types.Regular ->
            "far"

        Types.Light ->
            "fal"

        Types.Brand ->
            "fab"


className : Option -> ( String, Bool )
className opt =
    case opt of
        Animation animation ->
            ( animationClass animation, True )

        HasBorder ->
            ( borderClass, True )

        HasFixedWidth ->
            ( widthClass, True )

        InvertColor ->
            ( invertClass, True )

        Pull direction ->
            ( pullClass direction, True )

        Size size ->
            ( sizeClass size, True )

        _ ->
            ( "", False )


classes : String -> Style -> List Option -> Attribute msg
classes icon style options =
    ( styleClass style, True )
        :: ( icon, True )
        :: List.map className options
        |> Html.Attributes.classList


transformVal : Transform -> String
transformVal transform =
    case transform of
        Grow n ->
            "grow-" ++ toString n

        Shrink n ->
            "shrink-" ++ toString n

        ShiftDown n ->
            "down-" ++ toString n

        ShiftLeft n ->
            "left-" ++ toString n

        ShiftRight n ->
            "right-" ++ toString n

        ShiftUp n ->
            "up-" ++ toString n

        Rotate n ->
            "rotate-" ++ toString n

        FlipHorizontal ->
            "flip-h"

        FlipVertical ->
            "flip-v"


transform : Option -> List (Attribute msg) -> List (Attribute msg)
transform opt opts =
    case opt of
        Transform transforms ->
            let
                val =
                    transforms
                        |> List.map transformVal
                        |> String.join " "
            in
                Html.Attributes.attribute "data-fa-transform" val :: opts

        _ ->
            opts


transformAttr : List Option -> List (Attribute msg)
transformAttr options =
    List.foldr transform [] options


maskClass : Option -> Maybe String
maskClass opt =
    case opt of
        SolidMask icon ->
            Just (styleClass Types.Solid ++ " " ++ iconClass icon)

        RegularMask icon ->
            Just (styleClass Types.Regular ++ " " ++ iconClass icon)

        LightMask icon ->
            Just (styleClass Types.Light ++ " " ++ iconClass icon)

        BrandMask icon ->
            Just (styleClass Types.Brand ++ " " ++ logoClass icon)

        _ ->
            Nothing


mask : Option -> List (Attribute msg) -> List (Attribute msg)
mask opt opts =
    case maskClass opt of
        Just classes ->
            Html.Attributes.attribute "data-fa-mask" classes :: opts

        Nothing ->
            opts


maskAttr : List Option -> List (Attribute msg)
maskAttr options =
    List.foldr mask [] options


{-| Font Awesome specific options. Any number of these can be passed in
when generating an icon or logo. If any option is repeated, then only one
will be selected. However, there is no guarantee as to which option will be
selected, so please only use each option once per icon or logo.

Including the HasBorder option will draw a border around the icon or logo.

Including the HasFixedWidth option will set a fixed width on the icon or logo.
All elements with this option will have the same width.

Including the InvertColor option will invert the color of the icon or logo.

The Mask option allows you to set an outer icon or logo which sits behind
the main Font Awesome element. It only works if you are using SVG elements.
<br /><b>Default: no mask</b>

Documentation for the other options appears with their type definitions below.

-}
type Option
    = Animation Animation
    | HasBorder
    | HasFixedWidth
    | HtmlTag HtmlTag
    | InvertColor
    | SolidMask Icon
    | RegularMask Icon
    | LightMask Icon
    | BrandMask Logo
    | Pull Pull
    | Size Size
    | Transform (List Transform)


{-| Font Awesome's alternative size options. Valid values for the Mult options
are integers 2 - 10 inclusive.
-}
type Size
    = ExtraSmall
    | Small
    | Large
    | Mult Int


{-| Options for pulling a logo or icon to the left or right.
-}
type Pull
    = Left
    | Right


{-| Font Awesome's built-in animations.
-}
type Animation
    = Spin
    | Pulse


{-| Surrounding tag for icon and logo elements.

<b>Default: &lt;i&gt;</b>

-}
type HtmlTag
    = I
    | Span


{-| The Transform options accepts transformation instructions for the element.
See Font Awesome's documentation for supported instructions.

<b>Default: no transformation</b>

-}
type Transform
    = Grow Float
    | Shrink Float
    | ShiftDown Float
    | ShiftLeft Float
    | ShiftRight Float
    | ShiftUp Float
    | Rotate Float
    | FlipHorizontal
    | FlipVertical



-- The following section will need to be updated whenever
-- new icons are added. They've been placed at the bottom
-- so that all other lines are unchanged


{-| Accessible Icon - Logo
-}
accessibleIcon : Logo
accessibleIcon =
    Types.Logo "accessible-icon"


{-| Accusoft - Logo
-}
accusoft : Logo
accusoft =
    Types.Logo "accusoft"


{-| Address Book - Icon
-}
addressBook : Icon
addressBook =
    Types.Icon "address-book"


{-| Address Card - Icon
-}
addressCard : Icon
addressCard =
    Types.Icon "address-card"


{-| Adjust - Icon
-}
adjust : Icon
adjust =
    Types.Icon "adjust"


{-| Adn = - Logo
-}
adn : Logo
adn =
    Types.Logo "adn"


{-| Adversal = - Logo
-}
adversal : Logo
adversal =
    Types.Logo "adversal"


{-| Affiliate Theme - Logo
-}
affiliateTheme : Logo
affiliateTheme =
    Types.Logo "affiliatetheme"


{-| Alarm Clock - Icon
-}
alarmClock : Icon
alarmClock =
    Types.Icon "alarm-clock"


{-| Algolia - Logo
-}
algolia : Logo
algolia =
    Types.Logo "algolia"


{-| Align Center - Icon
-}
alignCenter : Icon
alignCenter =
    Types.Icon "align-center"


{-| Align Justify - Icon
-}
alignJustify : Icon
alignJustify =
    Types.Icon "align-justify"


{-| Align Left - Icon
-}
alignLeft : Icon
alignLeft =
    Types.Icon "align-left"


{-| Align Right - Icon
-}
alignRight : Icon
alignRight =
    Types.Icon "align-right"


{-| Amazon - Logo
-}
amazon : Logo
amazon =
    Types.Logo "amazon"


{-| Amazon Pay - Logo
-}
amazonPay : Logo
amazonPay =
    Types.Logo "amazon-pay"


{-| Ambulance - Icon
-}
ambulance : Icon
ambulance =
    Types.Icon "ambulance"


{-| American Sign Language Interpreting - Icon
-}
americanSignLanguageInterpreting : Icon
americanSignLanguageInterpreting =
    Types.Icon "american-sign-language-interpreting"


{-| Amilia - Logo
-}
amilia : Logo
amilia =
    Types.Logo "amilia"


{-| Anchor - Icon
-}
anchor : Icon
anchor =
    Types.Icon "anchor"


{-| Android - Logo
-}
android : Logo
android =
    Types.Logo "android"


{-| Angel List - Logo
-}
angelList : Logo
angelList =
    Types.Logo "angellist"


{-| Angle Double Down - Icon
-}
angleDoubleDown : Icon
angleDoubleDown =
    Types.Icon "angle-double-down"


{-| Angle Double Left - Icon
-}
angleDoubleLeft : Icon
angleDoubleLeft =
    Types.Icon "angle-double-left"


{-| Angle Double Right - Icon
-}
angleDoubleRight : Icon
angleDoubleRight =
    Types.Icon "angle-double-right"


{-| Angle Double Up - Icon
-}
angleDoubleUp : Icon
angleDoubleUp =
    Types.Icon "angle-double-up"


{-| Angle Down - Icon
-}
angleDown : Icon
angleDown =
    Types.Icon "angle-down"


{-| Angle Left - Icon
-}
angleLeft : Icon
angleLeft =
    Types.Icon "angle-left"


{-| Angle Right - Icon
-}
angleRight : Icon
angleRight =
    Types.Icon "angle-right"


{-| Angle Up - Icon
-}
angleUp : Icon
angleUp =
    Types.Icon "angle-up"


{-| Angry Creative - Logo
-}
angryCreative : Logo
angryCreative =
    Types.Logo "angrycreative"


{-| Angular - Logo
-}
angular : Logo
angular =
    Types.Logo "angular"


{-| App Store - Logo
-}
appStore : Logo
appStore =
    Types.Logo "app-store"


{-| App Store iOS - Logo
-}
appStoreIos : Logo
appStoreIos =
    Types.Logo "app-store-ios"


{-| Apper - Logo
-}
apper : Logo
apper =
    Types.Logo "apper"


{-| Apple - Logo
-}
apple : Logo
apple =
    Types.Logo "apple"


{-| Apple Pay - Logo
-}
applePay : Logo
applePay =
    Types.Logo "apple-pay"


{-| Archive - Icon
-}
archive : Icon
archive =
    Types.Icon "archive"


{-| Arrow Alternate Circle Down - Icon
-}
arrowAltCircleDown : Icon
arrowAltCircleDown =
    Types.Icon "arrow-alt-circle-down"


{-| Arrow Alternate Circle Left - Icon
-}
arrowAltCircleLeft : Icon
arrowAltCircleLeft =
    Types.Icon "arrow-alt-circle-left"


{-| Arrow Alternate Circle Right - Icon
-}
arrowAltCircleRight : Icon
arrowAltCircleRight =
    Types.Icon "arrow-alt-circle-right"


{-| Arrow Alternate Circle Up - Icon
-}
arrowAltCircleUp : Icon
arrowAltCircleUp =
    Types.Icon "arrow-alt-circle-up"


{-| Arrow Alternate Down - Icon
-}
arrowAltDown : Icon
arrowAltDown =
    Types.Icon "arrow-alt-down"


{-| Arrow Alternate From Bottom - Icon
-}
arrowAltFromBottom : Icon
arrowAltFromBottom =
    Types.Icon "arrow-alt-from-bottom"


{-| Arrow Alternate From Left - Icon
-}
arrowAltFromLeft : Icon
arrowAltFromLeft =
    Types.Icon "arrow-alt-from-left"


{-| Arrow Alternate From Right - Icon
-}
arrowAltFromRight : Icon
arrowAltFromRight =
    Types.Icon "arrow-alt-from-right"


{-| Arrow Alternate From Top - Icon
-}
arrowAltFromTop : Icon
arrowAltFromTop =
    Types.Icon "arrow-alt-from-top"


{-| Arrow Alternate Left - Icon
-}
arrowAltLeft : Icon
arrowAltLeft =
    Types.Icon "arrow-alt-left"


{-| Arrow Alternate Right - Icon
-}
arrowAltRight : Icon
arrowAltRight =
    Types.Icon "arrow-alt-right"


{-| Arrow Alternate Square Down - Icon
-}
arrowAltSquareDown : Icon
arrowAltSquareDown =
    Types.Icon "arrow-alt-square-down"


{-| Arrow Alternate Square Left - Icon
-}
arrowAltSquareLeft : Icon
arrowAltSquareLeft =
    Types.Icon "arrow-alt-square-left"


{-| Arrow Alternate Square Right - Icon
-}
arrowAltSquareRight : Icon
arrowAltSquareRight =
    Types.Icon "arrow-alt-square-right"


{-| Arrow Alternate Square Up - Icon
-}
arrowAltSquareUp : Icon
arrowAltSquareUp =
    Types.Icon "arrow-alt-square-up"


{-| Arrow Alternate To Bottom - Icon
-}
arrowAltToBottom : Icon
arrowAltToBottom =
    Types.Icon "arrow-alt-to-bottom"


{-| Arrow Alternate To Left - Icon
-}
arrowAltToLeft : Icon
arrowAltToLeft =
    Types.Icon "arrow-alt-to-left"


{-| Arrow Alternate To Right - Icon
-}
arrowAltToRight : Icon
arrowAltToRight =
    Types.Icon "arrow-alt-to-right"


{-| Arrow Alternate To Top - Icon
-}
arrowAltToTop : Icon
arrowAltToTop =
    Types.Icon "arrow-alt-to-top"


{-| Arrow Alternate Up - Icon
-}
arrowAltUp : Icon
arrowAltUp =
    Types.Icon "arrow-alt-up"


{-| Arrow Circle Down - Icon
-}
arrowCircleDown : Icon
arrowCircleDown =
    Types.Icon "arrow-circle-down"


{-| Arrow Circle Left - Icon
-}
arrowCircleLeft : Icon
arrowCircleLeft =
    Types.Icon "arrow-circle-left"


{-| Arrow Circle Right - Icon
-}
arrowCircleRight : Icon
arrowCircleRight =
    Types.Icon "arrow-circle-right"


{-| Arrow Circle Up - Icon
-}
arrowCircleUp : Icon
arrowCircleUp =
    Types.Icon "arrow-circle-up"


{-| Arrow Down - Icon
-}
arrowDown : Icon
arrowDown =
    Types.Icon "arrow-down"


{-| Arrow From Bottom - Icon
-}
arrowFromBottom : Icon
arrowFromBottom =
    Types.Icon "arrow-from-bottom"


{-| Arrow From Left - Icon
-}
arrowFromLeft : Icon
arrowFromLeft =
    Types.Icon "arrow-from-left"


{-| Arrow From Right - Icon
-}
arrowFromRight : Icon
arrowFromRight =
    Types.Icon "arrow-from-right"


{-| Arrow From Top - Icon
-}
arrowFromTop : Icon
arrowFromTop =
    Types.Icon "arrow-from-top"


{-| Arrow Left - Icon
-}
arrowLeft : Icon
arrowLeft =
    Types.Icon "arrow-left"


{-| Arrow Right - Icon
-}
arrowRight : Icon
arrowRight =
    Types.Icon "arrow-right"


{-| Arrow Square Down - Icon
-}
arrowSquareDown : Icon
arrowSquareDown =
    Types.Icon "arrow-square-down"


{-| Arrow Square Left - Icon
-}
arrowSquareLeft : Icon
arrowSquareLeft =
    Types.Icon "arrow-square-left"


{-| Arrow Square Right - Icon
-}
arrowSquareRight : Icon
arrowSquareRight =
    Types.Icon "arrow-square-right"


{-| Arrow Square Up - Icon
-}
arrowSquareUp : Icon
arrowSquareUp =
    Types.Icon "arrow-square-up"


{-| Arrow To Bottom - Icon
-}
arrowToBottom : Icon
arrowToBottom =
    Types.Icon "arrow-to-bottom"


{-| Arrow To Left - Icon
-}
arrowToLeft : Icon
arrowToLeft =
    Types.Icon "arrow-to-left"


{-| Arrow To Right - Icon
-}
arrowToRight : Icon
arrowToRight =
    Types.Icon "arrow-to-right"


{-| Arrow To Top - Icon
-}
arrowToTop : Icon
arrowToTop =
    Types.Icon "arrow-to-top"


{-| Arrow Up - Icon
-}
arrowUp : Icon
arrowUp =
    Types.Icon "arrow-up"


{-| Arrows - Icon
-}
arrows : Icon
arrows =
    Types.Icon "arrows"


{-| Arrows Alternate - Icon
-}
arrowsAlt : Icon
arrowsAlt =
    Types.Icon "arrows-alt"


{-| Arrows Alternate Horizontal - Icon
-}
arrowsAltHorizontal : Icon
arrowsAltHorizontal =
    Types.Icon "arrows-alt-h"


{-| Arrows Alternate Vertical - Icon
-}
arrowsAltVertical : Icon
arrowsAltVertical =
    Types.Icon "arrows-alt-v"


{-| Arrows Horizontal - Icon
-}
arrowsHorizontal : Icon
arrowsHorizontal =
    Types.Icon "arrows-h"


{-| Arrows Vertical - Icon
-}
arrowsVertical : Icon
arrowsVertical =
    Types.Icon "arrows-v"


{-| Assistive Listening Systems - Icon
-}
assistiveListeningSystems : Icon
assistiveListeningSystems =
    Types.Icon "assistive-listening-systems"


{-| Asterisk - Icon
-}
asterisk : Icon
asterisk =
    Types.Icon "asterisk"


{-| Asymmetrik - Logo
-}
asymmetrik : Logo
asymmetrik =
    Types.Logo "asymmetrik"


{-| At - Icon
-}
at : Icon
at =
    Types.Icon "at"


{-| Audible - Logo
-}
audible : Logo
audible =
    Types.Logo "audible"


{-| Audio Description - Icon
-}
audioDescription : Icon
audioDescription =
    Types.Icon "audio-description"


{-| Autoprefixer - Logo
-}
autoprefixer : Logo
autoprefixer =
    Types.Logo "autoprefixer"


{-| Avianex - Logo
-}
avianex : Logo
avianex =
    Types.Logo "avianex"


{-| Aviato - Logo
-}
aviato : Logo
aviato =
    Types.Logo "aviato"


{-| AWS - Logo
-}
aws : Logo
aws =
    Types.Logo "aws"


{-| Backward - Icon
-}
backward : Icon
backward =
    Types.Icon "backward"


{-| Badge - Icon
-}
badge : Icon
badge =
    Types.Icon "badge"


{-| Badge Check - Icon
-}
badgeCheck : Icon
badgeCheck =
    Types.Icon "badge-check"


{-| Balance Scale - Icon
-}
balanceScale : Icon
balanceScale =
    Types.Icon "balance-scale"


{-| Ban - Icon
-}
ban : Icon
ban =
    Types.Icon "ban"


{-| Bandcamp - Logo
-}
bandcamp : Logo
bandcamp =
    Types.Logo "bandcamp"


{-| Barcode - Icon
-}
barcode : Icon
barcode =
    Types.Icon "barcode"


{-| Bars - Icon
-}
bars : Icon
bars =
    Types.Icon "bars"


{-| Baseball - Icon
-}
baseball : Icon
baseball =
    Types.Icon "baseball"


{-| Baseball Ball - Icon
-}
baseballBall : Icon
baseballBall =
    Types.Icon "baseball-ball"


{-| Basketball Ball - Icon
-}
basketballBall : Icon
basketballBall =
    Types.Icon "basketball-ball"


{-| Basketball Hoop - Icon
-}
basketballHoop : Icon
basketballHoop =
    Types.Icon "basketball-hoop"


{-| Bath - Icon
-}
bath : Icon
bath =
    Types.Icon "bath"


{-| Battery Bolt - Icon
-}
batteryBolt : Icon
batteryBolt =
    Types.Icon "battery-bolt"


{-| Battery Empty - Icon
-}
batteryEmpty : Icon
batteryEmpty =
    Types.Icon "battery-empty"


{-| Battery Full - Icon
-}
batteryFull : Icon
batteryFull =
    Types.Icon "battery-full"


{-| Battery Half - Icon
-}
batteryHalf : Icon
batteryHalf =
    Types.Icon "battery-half"


{-| Battery Quarter - Icon
-}
batteryQuarter : Icon
batteryQuarter =
    Types.Icon "battery-quarter"


{-| Battery Slash - Icon
-}
batterySlash : Icon
batterySlash =
    Types.Icon "battery-slash"


{-| Battery Three Quarters - Icon
-}
batteryThreeQuarters : Icon
batteryThreeQuarters =
    Types.Icon "battery-three-quarters"


{-| Bed - Icon
-}
bed : Icon
bed =
    Types.Icon "bed"


{-| Beer - Icon
-}
beer : Icon
beer =
    Types.Icon "beer"


{-| Behance - Logo
-}
behance : Logo
behance =
    Types.Logo "behance"


{-| Behance Square - Logo
-}
behanceSquare : Logo
behanceSquare =
    Types.Logo "behance-square"


{-| Bell - Icon
-}
bell : Icon
bell =
    Types.Icon "bell"


{-| Bell Slash - Icon
-}
bellSlash : Icon
bellSlash =
    Types.Icon "bell-slash"


{-| Bicycle - Icon
-}
bicycle : Icon
bicycle =
    Types.Icon "bicycle"


{-| BIMobject - Logo
-}
bimObject : Logo
bimObject =
    Types.Logo "bimobject"


{-| Binoculars - Icon
-}
binoculars : Icon
binoculars =
    Types.Icon "binoculars"


{-| Birthday Cake - Icon
-}
birthdayCake : Icon
birthdayCake =
    Types.Icon "birthday-cake"


{-| Bitbucket - Logo
-}
bitbucket : Logo
bitbucket =
    Types.Logo "bitbucket"


{-| Bitcoin - Logo
-}
bitcoin : Logo
bitcoin =
    Types.Logo "bitcoin"


{-| Bity - Logo
-}
bity : Logo
bity =
    Types.Logo "bity"


{-| Black Tie - Logo
-}
blackTie : Logo
blackTie =
    Types.Logo "black-tie"


{-| Blackberry - Logo
-}
blackberry : Logo
blackberry =
    Types.Logo "blackberry"


{-| Blind - Icon
-}
blind : Icon
blind =
    Types.Icon "blind"


{-| Blogger - Logo
-}
blogger : Logo
blogger =
    Types.Logo "blogger"


{-| Blogger B - Logo
-}
bloggerB : Logo
bloggerB =
    Types.Logo "blogger-b"


{-| Bluetooth - Logo
-}
bluetooth : Logo
bluetooth =
    Types.Logo "bluetooth"


{-| Bluetooth B - Logo
-}
bluetoothB : Logo
bluetoothB =
    Types.Logo "bluetooth-b"


{-| Bold - Icon
-}
bold : Icon
bold =
    Types.Icon "bold"


{-| Bolt - Icon
-}
bolt : Icon
bolt =
    Types.Icon "bolt"


{-| Bomb - Icon
-}
bomb : Icon
bomb =
    Types.Icon "bomb"


{-| Book - Icon
-}
book : Icon
book =
    Types.Icon "book"


{-| Bookmark - Icon
-}
bookmark : Icon
bookmark =
    Types.Icon "bookmark"


{-| Bowling Ball - Icon
-}
bowlingBall : Icon
bowlingBall =
    Types.Icon "bowling-ball"


{-| Bowling Pins - Icon
-}
bowlingPins : Icon
bowlingPins =
    Types.Icon "bowling-pins"


{-| Boxing Glove - Icon
-}
boxingGlove : Icon
boxingGlove =
    Types.Icon "boxing-glove"


{-| Braille - Icon
-}
braille : Icon
braille =
    Types.Icon "braille"


{-| Briefcase - Icon
-}
briefcase : Icon
briefcase =
    Types.Icon "briefcase"


{-| Browser - Icon
-}
browser : Icon
browser =
    Types.Icon "browser"


{-| BTC - Logo
-}
btc : Logo
btc =
    Types.Logo "btc"


{-| Bug - Icon
-}
bug : Icon
bug =
    Types.Icon "bug"


{-| Building - Icon
-}
building : Icon
building =
    Types.Icon "building"


{-| Bullhorn - Icon
-}
bullhorn : Icon
bullhorn =
    Types.Icon "bullhorn"


{-| Bullseye - Icon
-}
bullseye : Icon
bullseye =
    Types.Icon "bullseye"


{-| Buromobel Experte - Logo
-}
buromobelExperte : Logo
buromobelExperte =
    Types.Logo "buromobelexperte"


{-| Bus - Icon
-}
bus : Icon
bus =
    Types.Icon "bus"


{-| BuySellAds - Logo
-}
buySellAds : Logo
buySellAds =
    Types.Logo "buysellads"


{-| Calculator - Icon
-}
calculator : Icon
calculator =
    Types.Icon "calculator"


{-| Calendar - Icon
-}
calendar : Icon
calendar =
    Types.Icon "calendar"


{-| Calendar Alternate - Icon
-}
calendarAlt : Icon
calendarAlt =
    Types.Icon "calendar-alt"


{-| Calendar Check - Icon
-}
calendarCheck : Icon
calendarCheck =
    Types.Icon "calendar-check"


{-| Calendar Edit - Icon
-}
calendarEdit : Icon
calendarEdit =
    Types.Icon "calendar-edit"


{-| Calendar Exclamation - Icon
-}
calendarExclamation : Icon
calendarExclamation =
    Types.Icon "calendar-exclamation"


{-| Calendar Minus - Icon
-}
calendarMinus : Icon
calendarMinus =
    Types.Icon "calendar-minus"


{-| Calendar Plus - Icon
-}
calendarPlus : Icon
calendarPlus =
    Types.Icon "calendar-plus"


{-| Calendar Times - Icon
-}
calendarTimes : Icon
calendarTimes =
    Types.Icon "calendar-times"


{-| Camera - Icon
-}
camera : Icon
camera =
    Types.Icon "camera"


{-| Camera Alternate - Icon
-}
cameraAlt : Icon
cameraAlt =
    Types.Icon "camera-alt"


{-| Camera Retro - Icon
-}
cameraRetro : Icon
cameraRetro =
    Types.Icon "camera-retro"


{-| Car - Icon
-}
car : Icon
car =
    Types.Icon "car"


{-| Caret Circle Down - Icon
-}
caretCircleDown : Icon
caretCircleDown =
    Types.Icon "caret-circle-down"


{-| Caret Circle Left - Icon
-}
caretCircleLeft : Icon
caretCircleLeft =
    Types.Icon "caret-circle-left"


{-| Caret Circle Right - Icon
-}
caretCircleRight : Icon
caretCircleRight =
    Types.Icon "caret-circle-right"


{-| Caret Circle Up - Icon
-}
caretCircleUp : Icon
caretCircleUp =
    Types.Icon "caret-circle-up"


{-| Caret Down - Icon
-}
caretDown : Icon
caretDown =
    Types.Icon "caret-down"


{-| Caret Left - Icon
-}
caretLeft : Icon
caretLeft =
    Types.Icon "caret-left"


{-| Caret Right - Icon
-}
caretRight : Icon
caretRight =
    Types.Icon "caret-right"


{-| Caret Square Down - Icon
-}
caretSquareDown : Icon
caretSquareDown =
    Types.Icon "caret-square-down"


{-| Caret Square Left - Icon
-}
caretSquareLeft : Icon
caretSquareLeft =
    Types.Icon "caret-square-left"


{-| Caret Square Right - Icon
-}
caretSquareRight : Icon
caretSquareRight =
    Types.Icon "caret-square-right"


{-| Caret Square Up - Icon
-}
caretSquareUp : Icon
caretSquareUp =
    Types.Icon "caret-square-up"


{-| Caret Up - Icon
-}
caretUp : Icon
caretUp =
    Types.Icon "caret-up"


{-| Cart Arrow Down - Icon
-}
cartArrowDown : Icon
cartArrowDown =
    Types.Icon "cart-arrow-down"


{-| Cart Plus - Icon
-}
cartPlus : Icon
cartPlus =
    Types.Icon "cart-plus"


{-| CC Amazon Pay - Logo
-}
ccAmazonPay : Logo
ccAmazonPay =
    Types.Logo "cc-amazon-pay"


{-| CC Amex - Logo
-}
ccAmex : Logo
ccAmex =
    Types.Logo "cc-amex"


{-| CC Apple Pay - Logo
-}
ccApplePay : Logo
ccApplePay =
    Types.Logo "cc-apple-pay"


{-| CC Diners Club - Logo
-}
ccDinersClub : Logo
ccDinersClub =
    Types.Logo "cc-diners-club"


{-| CC Discover - Logo
-}
ccDiscover : Logo
ccDiscover =
    Types.Logo "cc-discover"


{-| CC Jcb - Logo
-}
ccJcb : Logo
ccJcb =
    Types.Logo "cc-jcb"


{-| CC Mastercard - Logo
-}
ccMastercard : Logo
ccMastercard =
    Types.Logo "cc-mastercard"


{-| CC PayPal - Logo
-}
ccPayPal : Logo
ccPayPal =
    Types.Logo "cc-paypal"


{-| CC Stripe - Logo
-}
ccStripe : Logo
ccStripe =
    Types.Logo "cc-stripe"


{-| CC Visa - Logo
-}
ccVisa : Logo
ccVisa =
    Types.Logo "cc-visa"


{-| Centercode - Logo
-}
centercode : Logo
centercode =
    Types.Logo "centercode"


{-| Certificate - Icon
-}
certificate : Icon
certificate =
    Types.Icon "certificate"


{-| Chart Area - Icon
-}
chartArea : Icon
chartArea =
    Types.Icon "chart-area"


{-| Chart Bar - Icon
-}
chartBar : Icon
chartBar =
    Types.Icon "chart-bar"


{-| Chart Line - Icon
-}
chartLine : Icon
chartLine =
    Types.Icon "chart-line"


{-| Chart Pie - Icon
-}
chartPie : Icon
chartPie =
    Types.Icon "chart-pie"


{-| Check - Icon
-}
check : Icon
check =
    Types.Icon "check"


{-| Check Circle - Icon
-}
checkCircle : Icon
checkCircle =
    Types.Icon "check-circle"


{-| Check Square - Icon
-}
checkSquare : Icon
checkSquare =
    Types.Icon "check-square"


{-| Chess - Icon
-}
chess : Icon
chess =
    Types.Icon "chess"


{-| Chess Bishop - Icon
-}
chessBishop : Icon
chessBishop =
    Types.Icon "chess-bishop"


{-| Chess Bishop Alternate - Icon
-}
chessBishopAlt : Icon
chessBishopAlt =
    Types.Icon "chess-bishop-alt"


{-| Chess Board - Icon
-}
chessBoard : Icon
chessBoard =
    Types.Icon "chess-board"


{-| Chess Clock - Icon
-}
chessClock : Icon
chessClock =
    Types.Icon "chess-clock"


{-| Chess Clock Alternate - Icon
-}
chessClockAlt : Icon
chessClockAlt =
    Types.Icon "chess-clock-alt"


{-| Chess King - Icon
-}
chessKing : Icon
chessKing =
    Types.Icon "chess-king"


{-| Chess King Alternate - Icon
-}
chessKingAlt : Icon
chessKingAlt =
    Types.Icon "chess-king-alt"


{-| Chess Knight - Icon
-}
chessKnight : Icon
chessKnight =
    Types.Icon "chess-knight"


{-| Chess Knight Alternate - Icon
-}
chessKnightAlt : Icon
chessKnightAlt =
    Types.Icon "chess-knight-alt"


{-| Chess Pawn - Icon
-}
chessPawn : Icon
chessPawn =
    Types.Icon "chess-pawn"


{-| Chess Pawn Alternate - Icon
-}
chessPawnAlt : Icon
chessPawnAlt =
    Types.Icon "chess-pawn-alt"


{-| Chess Queen - Icon
-}
chessQueen : Icon
chessQueen =
    Types.Icon "chess-queen"


{-| Chess Queen Alternate - Icon
-}
chessQueenAlt : Icon
chessQueenAlt =
    Types.Icon "chess-queen-alt"


{-| Chess Rook - Icon
-}
chessRook : Icon
chessRook =
    Types.Icon "chess-rook"


{-| Chess Rook Alternate - Icon
-}
chessRookAlt : Icon
chessRookAlt =
    Types.Icon "chess-rook-alt"


{-| Chevron Circle Down - Icon
-}
chevronCircleDown : Icon
chevronCircleDown =
    Types.Icon "chevron-circle-down"


{-| Chevron Circle Left - Icon
-}
chevronCircleLeft : Icon
chevronCircleLeft =
    Types.Icon "chevron-circle-left"


{-| Chevron Circle Right - Icon
-}
chevronCircleRight : Icon
chevronCircleRight =
    Types.Icon "chevron-circle-right"


{-| Chevron Circle Up - Icon
-}
chevronCircleUp : Icon
chevronCircleUp =
    Types.Icon "chevron-circle-up"


{-| Chevron Double Down - Icon
-}
chevronDoubleDown : Icon
chevronDoubleDown =
    Types.Icon "chevron-double-down"


{-| Chevron Double Left - Icon
-}
chevronDoubleLeft : Icon
chevronDoubleLeft =
    Types.Icon "chevron-double-left"


{-| Chevron Double Right - Icon
-}
chevronDoubleRight : Icon
chevronDoubleRight =
    Types.Icon "chevron-double-right"


{-| Chevron Double Up - Icon
-}
chevronDoubleUp : Icon
chevronDoubleUp =
    Types.Icon "chevron-double-up"


{-| Chevron Down - Icon
-}
chevronDown : Icon
chevronDown =
    Types.Icon "chevron-down"


{-| Chevron Left - Icon
-}
chevronLeft : Icon
chevronLeft =
    Types.Icon "chevron-left"


{-| Chevron Right - Icon
-}
chevronRight : Icon
chevronRight =
    Types.Icon "chevron-right"


{-| Chevron Square Down - Icon
-}
chevronSquareDown : Icon
chevronSquareDown =
    Types.Icon "chevron-square-down"


{-| Chevron Square Left - Icon
-}
chevronSquareLeft : Icon
chevronSquareLeft =
    Types.Icon "chevron-square-left"


{-| Chevron Square Right - Icon
-}
chevronSquareRight : Icon
chevronSquareRight =
    Types.Icon "chevron-square-right"


{-| Chevron Square Up - Icon
-}
chevronSquareUp : Icon
chevronSquareUp =
    Types.Icon "chevron-square-up"


{-| Chevron Up - Icon
-}
chevronUp : Icon
chevronUp =
    Types.Icon "chevron-up"


{-| Child - Icon
-}
child : Icon
child =
    Types.Icon "child"


{-| Chrome - Logo
-}
chrome : Logo
chrome =
    Types.Logo "chrome"


{-| Circle - Icon
-}
circle : Icon
circle =
    Types.Icon "circle"


{-| Circle Notch - Icon
-}
circleNotch : Icon
circleNotch =
    Types.Icon "circle-notch"


{-| Clipboard - Icon
-}
clipboard : Icon
clipboard =
    Types.Icon "clipboard"


{-| Clock - Icon
-}
clock : Icon
clock =
    Types.Icon "clock"


{-| Clone - Icon
-}
clone : Icon
clone =
    Types.Icon "clone"


{-| Closed Captioning - Icon
-}
closedCaptioning : Icon
closedCaptioning =
    Types.Icon "closed-captioning"


{-| Cloud - Icon
-}
cloud : Icon
cloud =
    Types.Icon "cloud"


{-| Cloud Download - Icon
-}
cloudDownload : Icon
cloudDownload =
    Types.Icon "cloud-download"


{-| Cloud Download Alternate - Icon
-}
cloudDownloadAlt : Icon
cloudDownloadAlt =
    Types.Icon "cloud-download-alt"


{-| Cloud Upload - Icon
-}
cloudUpload : Icon
cloudUpload =
    Types.Icon "cloud-upload"


{-| Cloud Upload Alternate - Icon
-}
cloudUploadAlt : Icon
cloudUploadAlt =
    Types.Icon "cloud-upload-alt"


{-| CloudScale - Logo
-}
cloudScale : Logo
cloudScale =
    Types.Logo "cloudscale"


{-| Cloudsmith - Logo
-}
cloudsmith : Logo
cloudsmith =
    Types.Logo "cloudsmith"


{-| Cloudversify - Logo
-}
cloudversify : Logo
cloudversify =
    Types.Logo "cloudversify"


{-| Club - Icon
-}
club : Icon
club =
    Types.Icon "club"


{-| Code - Icon
-}
code : Icon
code =
    Types.Icon "code"


{-| Code Branch - Icon
-}
codeBranch : Icon
codeBranch =
    Types.Icon "code-branch"


{-| Code Commit - Icon
-}
codeCommit : Icon
codeCommit =
    Types.Icon "code-commit"


{-| Code Merge - Icon
-}
codeMerge : Icon
codeMerge =
    Types.Icon "code-merge"


{-| CodePen - Logo
-}
codePen : Logo
codePen =
    Types.Logo "codepen"


{-| Codiepie - Logo
-}
codiePie : Logo
codiePie =
    Types.Logo "codiepie"


{-| Coffee - Icon
-}
coffee : Icon
coffee =
    Types.Icon "coffee"


{-| Cog - Icon
-}
cog : Icon
cog =
    Types.Icon "cog"


{-| Cogs - Icon
-}
cogs : Icon
cogs =
    Types.Icon "cogs"


{-| Columns - Icon
-}
columns : Icon
columns =
    Types.Icon "columns"


{-| Comment - Icon
-}
comment : Icon
comment =
    Types.Icon "comment"


{-| Comment Alternate - Icon
-}
commentAlt : Icon
commentAlt =
    Types.Icon "comment-alt"


{-| Comments - Icon
-}
comments : Icon
comments =
    Types.Icon "comments"


{-| Compass - Icon
-}
compass : Icon
compass =
    Types.Icon "compass"


{-| Compress - Icon
-}
compress : Icon
compress =
    Types.Icon "compress"


{-| Compress Alternate - Icon
-}
compressAlt : Icon
compressAlt =
    Types.Icon "compress-alt"


{-| Compress Wide - Icon
-}
compressWide : Icon
compressWide =
    Types.Icon "compress-wide"


{-| Connect Develop - Logo
-}
connectDevelop : Logo
connectDevelop =
    Types.Logo "connectdevelop"


{-| Contao - Logo
-}
contao : Logo
contao =
    Types.Logo "contao"


{-| Copy - Icon
-}
copy : Icon
copy =
    Types.Icon "copy"


{-| Copyright - Icon
-}
copyright : Icon
copyright =
    Types.Icon "copyright"


{-| cPanel - Logo
-}
cpanel : Logo
cpanel =
    Types.Logo "cpanel"


{-| Creative Commons - Logo
-}
creativeCommons : Logo
creativeCommons =
    Types.Logo "creative-commons"


{-| Credit Card - Icon
-}
creditCard : Icon
creditCard =
    Types.Icon "credit-card"


{-| Credit Card Blank - Icon
-}
creditCardBlank : Icon
creditCardBlank =
    Types.Icon "credit-card-blank"


{-| Credit Card Front - Icon
-}
creditCardFront : Icon
creditCardFront =
    Types.Icon "credit-card-front"


{-| Cricket - Icon
-}
cricket : Icon
cricket =
    Types.Icon "cricket"


{-| Crop - Icon
-}
crop : Icon
crop =
    Types.Icon "crop"


{-| Crosshairs - Icon
-}
crosshairs : Icon
crosshairs =
    Types.Icon "crosshairs"


{-| CSS3 - Logo
-}
css3 : Logo
css3 =
    Types.Logo "css3"


{-| Css3Alternate - Logo
-}
css3Alt : Logo
css3Alt =
    Types.Logo "css3-alt"


{-| Cube - Icon
-}
cube : Icon
cube =
    Types.Icon "cube"


{-| Cubes - Icon
-}
cubes : Icon
cubes =
    Types.Icon "cubes"


{-| Curling - Icon
-}
curling : Icon
curling =
    Types.Icon "curling"


{-| Cut - Icon
-}
cut : Icon
cut =
    Types.Icon "cut"


{-| Cuttlefish - Logo
-}
cuttlefish : Logo
cuttlefish =
    Types.Logo "cuttlefish"


{-| Dungeons & Dragons - Logo
-}
dAndD : Logo
dAndD =
    Types.Logo "d-and-d"


{-| Dashcube - Logo
-}
dashcube : Logo
dashcube =
    Types.Logo "dashcube"


{-| Database - Icon
-}
database : Icon
database =
    Types.Icon "database"


{-| Deaf - Icon
-}
deaf : Icon
deaf =
    Types.Icon "deaf"


{-| Delicious - Logo
-}
delicious : Logo
delicious =
    Types.Logo "delicious"


{-| Deploy Dog - Logo
-}
deployDog : Logo
deployDog =
    Types.Logo "deploydog"


{-| Deskpro - Logo
-}
deskpro : Logo
deskpro =
    Types.Logo "deskpro"


{-| Desktop - Icon
-}
desktop : Icon
desktop =
    Types.Icon "desktop"


{-| Desktop Alternate - Icon
-}
desktopAlt : Icon
desktopAlt =
    Types.Icon "desktop-alt"


{-| Deviant Art - Logo
-}
deviantArt : Logo
deviantArt =
    Types.Logo "deviantart"


{-| Diamond - Icon
-}
diamond : Icon
diamond =
    Types.Icon "diamond"


{-| Digg - Logo
-}
digg : Logo
digg =
    Types.Logo "digg"


{-| Digital Ocean - Logo
-}
digitalOcean : Logo
digitalOcean =
    Types.Logo "digital-ocean"


{-| Discord - Logo
-}
discord : Logo
discord =
    Types.Logo "discord"


{-| Discourse - Logo
-}
discourse : Logo
discourse =
    Types.Logo "discourse"


{-| DocHub - Logo
-}
docHub : Logo
docHub =
    Types.Logo "dochub"


{-| Docker - Logo
-}
docker : Logo
docker =
    Types.Logo "docker"


{-| Dollar Sign - Icon
-}
dollarSign : Icon
dollarSign =
    Types.Icon "dollar-sign"


{-| Dot Circle - Icon
-}
dotCircle : Icon
dotCircle =
    Types.Icon "dot-circle"


{-| Download - Icon
-}
download : Icon
download =
    Types.Icon "download"


{-| Draft2digital - Logo
-}
draft2Digital : Logo
draft2Digital =
    Types.Logo "draft2digital"


{-| Dribbble - Logo
-}
dribbble : Logo
dribbble =
    Types.Logo "dribbble"


{-| Dribbble Square - Logo
-}
dribbbleSquare : Logo
dribbbleSquare =
    Types.Logo "dribbble-square"


{-| Dropbox - Logo
-}
dropbox : Logo
dropbox =
    Types.Logo "dropbox"


{-| Drupal - Logo
-}
drupal : Logo
drupal =
    Types.Logo "drupal"


{-| Dumbbell - Icon
-}
dumbbell : Icon
dumbbell =
    Types.Icon "dumbbell"


{-| Dyalog - Logo
-}
dyalog : Logo
dyalog =
    Types.Logo "dyalog"


{-| Early Birds - Logo
-}
earlyBirds : Logo
earlyBirds =
    Types.Logo "earlybirds"


{-| Edge - Logo
-}
edge : Logo
edge =
    Types.Logo "edge"


{-| Edit - Icon
-}
edit : Icon
edit =
    Types.Icon "edit"


{-| Eject - Icon
-}
eject : Icon
eject =
    Types.Icon "eject"


{-| Elementor - Logo
-}
elementor : Logo
elementor =
    Types.Logo "elementor"


{-| Ellipsis Horizontal - Icon
-}
ellipsisHorizontal : Icon
ellipsisHorizontal =
    Types.Icon "ellipsis-h"


{-| Ellipsis Horizontal Alternate - Icon
-}
ellipsisHorizontalAlt : Icon
ellipsisHorizontalAlt =
    Types.Icon "ellipsis-h-alt"


{-| Ellipsis Vertical - Icon
-}
ellipsisVertical : Icon
ellipsisVertical =
    Types.Icon "ellipsis-v"


{-| Ellipsis Vertical Alternate - Icon
-}
ellipsisVerticalAlt : Icon
ellipsisVerticalAlt =
    Types.Icon "ellipsis-v-alt"


{-| Ember - Logo
-}
ember : Logo
ember =
    Types.Logo "ember"


{-| Empire - Logo
-}
empire : Logo
empire =
    Types.Logo "empire"


{-| Envelope - Icon
-}
envelope : Icon
envelope =
    Types.Icon "envelope"


{-| Envelope Open - Icon
-}
envelopeOpen : Icon
envelopeOpen =
    Types.Icon "envelope-open"


{-| Envelope Square - Icon
-}
envelopeSquare : Icon
envelopeSquare =
    Types.Icon "envelope-square"


{-| Envira - Logo
-}
envira : Logo
envira =
    Types.Logo "envira"


{-| Eraser - Icon
-}
eraser : Icon
eraser =
    Types.Icon "eraser"


{-| Erlang - Logo
-}
erlang : Logo
erlang =
    Types.Logo "erlang"


{-| Ethereum - Logo
-}
ethereum : Logo
ethereum =
    Types.Logo "ethereum"


{-| Etsy - Logo
-}
etsy : Logo
etsy =
    Types.Logo "etsy"


{-| Euro Sign - Icon
-}
euroSign : Icon
euroSign =
    Types.Icon "euro-sign"


{-| Exchange - Icon
-}
exchange : Icon
exchange =
    Types.Icon "exchange"


{-| Exchange Alternate - Icon
-}
exchangeAlt : Icon
exchangeAlt =
    Types.Icon "exchange-alt"


{-| Exclamation - Icon
-}
exclamation : Icon
exclamation =
    Types.Icon "exclamation"


{-| Exclamation Circle - Icon
-}
exclamationCircle : Icon
exclamationCircle =
    Types.Icon "exclamation-circle"


{-| Exclamation Square - Icon
-}
exclamationSquare : Icon
exclamationSquare =
    Types.Icon "exclamation-square"


{-| Exclamation Triangle - Icon
-}
exclamationTriangle : Icon
exclamationTriangle =
    Types.Icon "exclamation-triangle"


{-| Expand - Icon
-}
expand : Icon
expand =
    Types.Icon "expand"


{-| Expand Alternate - Icon
-}
expandAlt : Icon
expandAlt =
    Types.Icon "expand-alt"


{-| Expand Arrows - Icon
-}
expandArrows : Icon
expandArrows =
    Types.Icon "expand-arrows"


{-| Expand Arrows Alternate - Icon
-}
expandArrowsAlt : Icon
expandArrowsAlt =
    Types.Icon "expand-arrows-alt"


{-| Expand Wide - Icon
-}
expandWide : Icon
expandWide =
    Types.Icon "expand-wide"


{-| Expedited SSL - Logo
-}
expeditedSSL : Logo
expeditedSSL =
    Types.Logo "expeditedssl"


{-| External Link - Icon
-}
externalLink : Icon
externalLink =
    Types.Icon "external-link"


{-| External Link Alternate - Icon
-}
externalLinkAlt : Icon
externalLinkAlt =
    Types.Icon "external-link-alt"


{-| External Link Square - Icon
-}
externalLinkSquare : Icon
externalLinkSquare =
    Types.Icon "external-link-square"


{-| External Link Square Alternate - Icon
-}
externalLinkSquareAlt : Icon
externalLinkSquareAlt =
    Types.Icon "external-link-square-alt"


{-| Eye - Icon
-}
eye : Icon
eye =
    Types.Icon "eye"


{-| Eye Dropper - Icon
-}
eyeDropper : Icon
eyeDropper =
    Types.Icon "eye-dropper"


{-| Eye Slash - Icon
-}
eyeSlash : Icon
eyeSlash =
    Types.Icon "eye-slash"


{-| Facebook - Logo
-}
facebook : Logo
facebook =
    Types.Logo "facebook"


{-| Facebook F - Logo
-}
facebookF : Logo
facebookF =
    Types.Logo "facebook-f"


{-| Facebook Messenger - Logo
-}
facebookMessenger : Logo
facebookMessenger =
    Types.Logo "facebook-messenger"


{-| Facebook Square - Logo
-}
facebookSquare : Logo
facebookSquare =
    Types.Logo "facebook-square"


{-| Fast Backward - Icon
-}
fastBackward : Icon
fastBackward =
    Types.Icon "fast-backward"


{-| Fast Forward - Icon
-}
fastForward : Icon
fastForward =
    Types.Icon "fast-forward"


{-| Fax - Icon
-}
fax : Icon
fax =
    Types.Icon "fax"


{-| Female - Icon
-}
female : Icon
female =
    Types.Icon "female"


{-| Field Hockey - Icon
-}
fieldHockey : Icon
fieldHockey =
    Types.Icon "field-hockey"


{-| Fighter Jet - Icon
-}
fighterJet : Icon
fighterJet =
    Types.Icon "fighter-jet"


{-| File - Icon
-}
file : Icon
file =
    Types.Icon "file"


{-| File Alternate - Icon
-}
fileAlt : Icon
fileAlt =
    Types.Icon "file-alt"


{-| File Archive - Icon
-}
fileArchive : Icon
fileArchive =
    Types.Icon "file-archive"


{-| File Audio - Icon
-}
fileAudio : Icon
fileAudio =
    Types.Icon "file-audio"


{-| File Check - Icon
-}
fileCheck : Icon
fileCheck =
    Types.Icon "file-check"


{-| File Code - Icon
-}
fileCode : Icon
fileCode =
    Types.Icon "file-code"


{-| File Edit - Icon
-}
fileEdit : Icon
fileEdit =
    Types.Icon "file-edit"


{-| File Excel - Icon
-}
fileExcel : Icon
fileExcel =
    Types.Icon "file-excel"


{-| File Exclamation - Icon
-}
fileExclamation : Icon
fileExclamation =
    Types.Icon "file-exclamation"


{-| File Image - Icon
-}
fileImage : Icon
fileImage =
    Types.Icon "file-image"


{-| File Minus - Icon
-}
fileMinus : Icon
fileMinus =
    Types.Icon "file-minus"


{-| File Pdf - Icon
-}
filePdf : Icon
filePdf =
    Types.Icon "file-pdf"


{-| File Plus - Icon
-}
filePlus : Icon
filePlus =
    Types.Icon "file-plus"


{-| File PowerPoint - Icon
-}
filePowerPoint : Icon
filePowerPoint =
    Types.Icon "file-powerpoint"


{-| File Times - Icon
-}
fileTimes : Icon
fileTimes =
    Types.Icon "file-times"


{-| File Video - Icon
-}
fileVideo : Icon
fileVideo =
    Types.Icon "file-video"


{-| File Word - Icon
-}
fileWord : Icon
fileWord =
    Types.Icon "file-word"


{-| Film - Icon
-}
film : Icon
film =
    Types.Icon "film"


{-| Film Alternate - Icon
-}
filmAlt : Icon
filmAlt =
    Types.Icon "film-alt"


{-| Filter - Icon
-}
filter : Icon
filter =
    Types.Icon "filter"


{-| Fire - Icon
-}
fire : Icon
fire =
    Types.Icon "fire"


{-| Fire Extinguisher - Icon
-}
fireExtinguisher : Icon
fireExtinguisher =
    Types.Icon "fire-extinguisher"


{-| Firefox - Logo
-}
firefox : Logo
firefox =
    Types.Logo "firefox"


{-| First Draft - Logo
-}
firstDraft : Logo
firstDraft =
    Types.Logo "firstdraft"


{-| First Order - Logo
-}
firstOrder : Logo
firstOrder =
    Types.Logo "first-order"


{-| 500px - Logo
-}
fiveHundredPx : Logo
fiveHundredPx =
    Types.Logo "500px"


{-| Flag - Icon
-}
flag : Icon
flag =
    Types.Icon "flag"


{-| Flag Checkered - Icon
-}
flagCheckered : Icon
flagCheckered =
    Types.Icon "flag-checkered"


{-| Flask - Icon
-}
flask : Icon
flask =
    Types.Icon "flask"


{-| Flickr - Logo
-}
flickr : Logo
flickr =
    Types.Logo "flickr"


{-| Flipboard - Logo
-}
flipboard : Logo
flipboard =
    Types.Logo "flipboard"


{-| Fly - Logo
-}
fly : Logo
fly =
    Types.Logo "fly"


{-| Folder - Icon
-}
folder : Icon
folder =
    Types.Icon "folder"


{-| Folder Open - Icon
-}
folderOpen : Icon
folderOpen =
    Types.Icon "folder-open"


{-| Font - Icon
-}
font : Icon
font =
    Types.Icon "font"


{-| Font Awesome - Logo
-}
fontAwesome : Logo
fontAwesome =
    Types.Logo "font-awesome"


{-| Font Awesome Alternate - Logo
-}
fontAwesomeAlt : Logo
fontAwesomeAlt =
    Types.Logo "font-awesome-alt"


{-| Font Awesome Flag - Logo
-}
fontAwesomeFlag : Logo
fontAwesomeFlag =
    Types.Logo "font-awesome-flag"


{-| Font Icons - Logo
-}
fontIcons : Logo
fontIcons =
    Types.Logo "fonticons"


{-| Font Icons Fi - Logo
-}
fontIconsFi : Logo
fontIconsFi =
    Types.Logo "fonticons-fi"


{-| Football Ball - Icon
-}
footballBall : Icon
footballBall =
    Types.Icon "football-ball"


{-| Football Helmet - Icon
-}
footballHelmet : Icon
footballHelmet =
    Types.Icon "football-helmet"


{-| Fort Awesome - Logo
-}
fortAwesome : Logo
fortAwesome =
    Types.Logo "fort-awesome"


{-| Fort Awesome Alternate - Logo
-}
fortAwesomeAlt : Logo
fortAwesomeAlt =
    Types.Logo "fort-awesome-alt"


{-| Forumbee - Logo
-}
forumbee : Logo
forumbee =
    Types.Logo "forumbee"


{-| Forward - Icon
-}
forward : Icon
forward =
    Types.Icon "forward"


{-| Foursquare - Logo
-}
foursquare : Logo
foursquare =
    Types.Logo "foursquare"


{-| Free BSD - Logo
-}
freeBSD : Logo
freeBSD =
    Types.Logo "freebsd"


{-| Free Code Camp - Logo
-}
freeCodeCamp : Logo
freeCodeCamp =
    Types.Logo "free-code-camp"


{-| Frown - Icon
-}
frown : Icon
frown =
    Types.Icon "frown"


{-| Futbol - Icon
-}
futbol : Icon
futbol =
    Types.Icon "futbol"


{-| Gamepad - Icon
-}
gamepad : Icon
gamepad =
    Types.Icon "gamepad"


{-| Gavel - Icon
-}
gavel : Icon
gavel =
    Types.Icon "gavel"


{-| Gem - Icon
-}
gem : Icon
gem =
    Types.Icon "gem"


{-| Genderless - Icon
-}
genderless : Icon
genderless =
    Types.Icon "genderless"


{-| Get Pocket - Logo
-}
getPocket : Logo
getPocket =
    Types.Logo "get-pocket"


{-| GG - Logo
-}
gg : Logo
gg =
    Types.Logo "gg"


{-| Gg Circle - Logo
-}
ggCircle : Logo
ggCircle =
    Types.Logo "gg-circle"


{-| Gift - Icon
-}
gift : Icon
gift =
    Types.Icon "gift"


{-| Git - Logo
-}
git : Logo
git =
    Types.Logo "git"


{-| Git Square - Logo
-}
gitSquare : Logo
gitSquare =
    Types.Logo "git-square"


{-| GitHub - Logo
-}
gitHub : Logo
gitHub =
    Types.Logo "github"


{-| GitHub Alternate - Logo
-}
gitHubAlt : Logo
gitHubAlt =
    Types.Logo "github-alt"


{-| GitHub Square - Logo
-}
gitHubSquare : Logo
gitHubSquare =
    Types.Logo "github-square"


{-| GitKraken - Logo
-}
gitKraken : Logo
gitKraken =
    Types.Logo "gitkraken"


{-| GitLab - Logo
-}
gitLab : Logo
gitLab =
    Types.Logo "gitlab"


{-| Gitter - Logo
-}
gitter : Logo
gitter =
    Types.Logo "gitter"


{-| Glass Martini - Icon
-}
glassMartini : Icon
glassMartini =
    Types.Icon "glass-martini"


{-| Glide - Logo
-}
glide : Logo
glide =
    Types.Logo "glide"


{-| Glide G - Logo
-}
glideG : Logo
glideG =
    Types.Logo "glide-g"


{-| Globe - Icon
-}
globe : Icon
globe =
    Types.Icon "globe"


{-| Gofore - Logo
-}
gofore : Logo
gofore =
    Types.Logo "gofore"


{-| Golf Ball - Icon
-}
golfBall : Icon
golfBall =
    Types.Icon "golf-ball"


{-| Golf Club - Icon
-}
golfClub : Icon
golfClub =
    Types.Icon "golf-club"


{-| Goodreads - Logo
-}
goodreads : Logo
goodreads =
    Types.Logo "goodreads"


{-| Goodreads G - Logo
-}
goodreadsG : Logo
goodreadsG =
    Types.Logo "goodreads-g"


{-| Google - Logo
-}
google : Logo
google =
    Types.Logo "google"


{-| Google Drive - Logo
-}
googleDrive : Logo
googleDrive =
    Types.Logo "google-drive"


{-| Google Play - Logo
-}
googlePlay : Logo
googlePlay =
    Types.Logo "google-play"


{-| Google Plus - Logo
-}
googlePlus : Logo
googlePlus =
    Types.Logo "google-plus"


{-| Google Plus G - Logo
-}
googlePlusG : Logo
googlePlusG =
    Types.Logo "google-plus-g"


{-| Google Plus Square - Logo
-}
googlePlusSquare : Logo
googlePlusSquare =
    Types.Logo "google-plus-square"


{-| Google Wallet - Logo
-}
googleWallet : Logo
googleWallet =
    Types.Logo "google-wallet"


{-| Graduation Cap - Icon
-}
graduationCap : Icon
graduationCap =
    Types.Icon "graduation-cap"


{-| Gratipay - Logo
-}
gratipay : Logo
gratipay =
    Types.Logo "gratipay"


{-| Grav - Logo
-}
grav : Logo
grav =
    Types.Logo "grav"


{-| Gripfire - Logo
-}
gripfire : Logo
gripfire =
    Types.Logo "gripfire"


{-| Grunt - Logo
-}
grunt : Logo
grunt =
    Types.Logo "grunt"


{-| Gulp - Logo
-}
gulp : Logo
gulp =
    Types.Logo "gulp"


{-| H Square - Icon
-}
hSquare : Icon
hSquare =
    Types.Icon "h-square"


{-| H1 - Icon
-}
h1 : Icon
h1 =
    Types.Icon "h1"


{-| H2 - Icon
-}
h2 : Icon
h2 =
    Types.Icon "h2"


{-| H3 - Icon
-}
h3 : Icon
h3 =
    Types.Icon "h3"


{-| Hacker News - Logo
-}
hackerNews : Logo
hackerNews =
    Types.Logo "hacker-news"


{-| Hacker News Square - Logo
-}
hackerNewsSquare : Logo
hackerNewsSquare =
    Types.Logo "hacker-news-square"


{-| Hand Lizard - Icon
-}
handLizard : Icon
handLizard =
    Types.Icon "hand-lizard"


{-| Hand Paper - Icon
-}
handPaper : Icon
handPaper =
    Types.Icon "hand-paper"


{-| Hand Peace - Icon
-}
handPeace : Icon
handPeace =
    Types.Icon "hand-peace"


{-| Hand Point Down - Icon
-}
handPointDown : Icon
handPointDown =
    Types.Icon "hand-point-down"


{-| Hand Point Left - Icon
-}
handPointLeft : Icon
handPointLeft =
    Types.Icon "hand-point-left"


{-| Hand Point Right - Icon
-}
handPointRight : Icon
handPointRight =
    Types.Icon "hand-point-right"


{-| Hand Point Up - Icon
-}
handPointUp : Icon
handPointUp =
    Types.Icon "hand-point-up"


{-| Hand Pointer - Icon
-}
handPointer : Icon
handPointer =
    Types.Icon "hand-pointer"


{-| Hand Rock - Icon
-}
handRock : Icon
handRock =
    Types.Icon "hand-rock"


{-| Hand Scissors - Icon
-}
handScissors : Icon
handScissors =
    Types.Icon "hand-scissors"


{-| Hand Spock - Icon
-}
handSpock : Icon
handSpock =
    Types.Icon "hand-spock"


{-| Handshake - Icon
-}
handshake : Icon
handshake =
    Types.Icon "handshake"


{-| Hashtag - Icon
-}
hashtag : Icon
hashtag =
    Types.Icon "hashtag"


{-| HDD - Icon
-}
hdd : Icon
hdd =
    Types.Icon "hdd"


{-| Heading - Icon
-}
heading : Icon
heading =
    Types.Icon "heading"


{-| Headphones - Icon
-}
headphones : Icon
headphones =
    Types.Icon "headphones"


{-| Heart - Icon
-}
heart : Icon
heart =
    Types.Icon "heart"


{-| Heartbeat - Icon
-}
heartbeat : Icon
heartbeat =
    Types.Icon "heartbeat"


{-| Hexagon - Icon
-}
hexagon : Icon
hexagon =
    Types.Icon "hexagon"


{-| Hips - Logo
-}
hips : Logo
hips =
    Types.Logo "hips"


{-| HireAHelper - Logo
-}
hireAHelper : Logo
hireAHelper =
    Types.Logo "hire-a-helper"


{-| History - Icon
-}
history : Icon
history =
    Types.Icon "history"


{-| Hockey Puck - Icon
-}
hockeyPuck : Icon
hockeyPuck =
    Types.Icon "hockey-puck"


{-| Hockey Sticks - Icon
-}
hockeySticks : Icon
hockeySticks =
    Types.Icon "hockey-sticks"


{-| Home - Icon
-}
home : Icon
home =
    Types.Icon "home"


{-| Hooli - Logo
-}
hooli : Logo
hooli =
    Types.Logo "hooli"


{-| Hospital - Icon
-}
hospital : Icon
hospital =
    Types.Icon "hospital"


{-| Hotjar - Logo
-}
hotjar : Logo
hotjar =
    Types.Logo "hotjar"


{-| Hourglass - Icon
-}
hourglass : Icon
hourglass =
    Types.Icon "hourglass"


{-| Hourglass End - Icon
-}
hourglassEnd : Icon
hourglassEnd =
    Types.Icon "hourglass-end"


{-| Hourglass Half - Icon
-}
hourglassHalf : Icon
hourglassHalf =
    Types.Icon "hourglass-half"


{-| Hourglass Start - Icon
-}
hourglassStart : Icon
hourglassStart =
    Types.Icon "hourglass-start"


{-| Houzz - Logo
-}
houzz : Logo
houzz =
    Types.Logo "houzz"


{-| Html5 - Logo
-}
html5 : Logo
html5 =
    Types.Logo "html5"


{-| HubSpot - Logo
-}
hubSpot : Logo
hubSpot =
    Types.Logo "hubspot"


{-| I Cursor - Icon
-}
iCursor : Icon
iCursor =
    Types.Icon "i-cursor"


{-| Id Badge - Icon
-}
idBadge : Icon
idBadge =
    Types.Icon "id-badge"


{-| Id Card - Icon
-}
idCard : Icon
idCard =
    Types.Icon "id-card"


{-| Image - Icon
-}
image : Icon
image =
    Types.Icon "image"


{-| Images - Icon
-}
images : Icon
images =
    Types.Icon "images"


{-| IMDb - Logo
-}
imdb : Logo
imdb =
    Types.Logo "imdb"


{-| Inbox - Icon
-}
inbox : Icon
inbox =
    Types.Icon "inbox"


{-| Inbox In - Icon
-}
inboxIn : Icon
inboxIn =
    Types.Icon "inbox-in"


{-| Inbox Out - Icon
-}
inboxOut : Icon
inboxOut =
    Types.Icon "inbox-out"


{-| Indent - Icon
-}
indent : Icon
indent =
    Types.Icon "indent"


{-| Industry - Icon
-}
industry : Icon
industry =
    Types.Icon "industry"


{-| Industry Alternate - Icon
-}
industryAlt : Icon
industryAlt =
    Types.Icon "industry-alt"


{-| Info - Icon
-}
info : Icon
info =
    Types.Icon "info"


{-| Info Circle - Icon
-}
infoCircle : Icon
infoCircle =
    Types.Icon "info-circle"


{-| Info Square - Icon
-}
infoSquare : Icon
infoSquare =
    Types.Icon "info-square"


{-| Instagram - Logo
-}
instagram : Logo
instagram =
    Types.Logo "instagram"


{-| Internet Explorer - Logo
-}
internetExplorer : Logo
internetExplorer =
    Types.Logo "internet-explorer"


{-| IoxHost - Logo
-}
ioxHost : Logo
ioxHost =
    Types.Logo "ioxhost"


{-| Italic - Icon
-}
italic : Icon
italic =
    Types.Icon "italic"


{-| iTunes - Logo
-}
iTunes : Logo
iTunes =
    Types.Logo "itunes"


{-| iTunes Note - Logo
-}
iTunesNote : Logo
iTunesNote =
    Types.Logo "itunes-note"


{-| Jack o' Lantern - Icon
-}
jackOLantern : Icon
jackOLantern =
    Types.Icon "jack-o-lantern"


{-| Jenkins - Logo
-}
jenkins : Logo
jenkins =
    Types.Logo "jenkins"


{-| Joget - Logo
-}
joget : Logo
joget =
    Types.Logo "joget"


{-| Joomla - Logo
-}
joomla : Logo
joomla =
    Types.Logo "joomla"


{-| JavaScript - Logo
-}
js : Logo
js =
    Types.Logo "js"


{-| JavaScript Square - Logo
-}
jsSquare : Logo
jsSquare =
    Types.Logo "js-square"


{-| JSFiddle - Logo
-}
jsFiddle : Logo
jsFiddle =
    Types.Logo "jsfiddle"


{-| Key - Icon
-}
key : Icon
key =
    Types.Icon "key"


{-| Keyboard - Icon
-}
keyboard : Icon
keyboard =
    Types.Icon "keyboard"


{-| Key CDN - Logo
-}
keyCDN : Logo
keyCDN =
    Types.Logo "keycdn"


{-| Kickstarter - Logo
-}
kickstarter : Logo
kickstarter =
    Types.Logo "kickstarter"


{-| Kickstarter K - Logo
-}
kickstarterK : Logo
kickstarterK =
    Types.Logo "kickstarter-k"


{-| KORVUE - Logo
-}
korvue : Logo
korvue =
    Types.Logo "korvue"


{-| Language - Icon
-}
language : Icon
language =
    Types.Icon "language"


{-| Laptop - Icon
-}
laptop : Icon
laptop =
    Types.Icon "laptop"


{-| Laravel - Logo
-}
laravel : Logo
laravel =
    Types.Logo "laravel"


{-| Last.fm - Logo
-}
lastfm : Logo
lastfm =
    Types.Logo "lastfm"


{-| Last.fm Square - Logo
-}
lastfmSquare : Logo
lastfmSquare =
    Types.Logo "lastfm-square"


{-| Leaf - Icon
-}
leaf : Icon
leaf =
    Types.Icon "leaf"


{-| Leanpub - Logo
-}
leanpub : Logo
leanpub =
    Types.Logo "leanpub"


{-| Lemon - Icon
-}
lemon : Icon
lemon =
    Types.Icon "lemon"


{-| Less - Logo
-}
less : Logo
less =
    Types.Logo "less"


{-| Level Down - Icon
-}
levelDown : Icon
levelDown =
    Types.Icon "level-down"


{-| Level Down Alternate - Icon
-}
levelDownAlt : Icon
levelDownAlt =
    Types.Icon "level-down-alt"


{-| Level Up - Icon
-}
levelUp : Icon
levelUp =
    Types.Icon "level-up"


{-| Level Up Alternate - Icon
-}
levelUpAlt : Icon
levelUpAlt =
    Types.Icon "level-up-alt"


{-| Life Ring - Icon
-}
lifeRing : Icon
lifeRing =
    Types.Icon "life-ring"


{-| Lightbulb - Icon
-}
lightbulb : Icon
lightbulb =
    Types.Icon "lightbulb"


{-| Line - Logo
-}
line : Logo
line =
    Types.Logo "line"


{-| Link - Icon
-}
link : Icon
link =
    Types.Icon "link"


{-| LinkedIn - Logo
-}
linkedIn : Logo
linkedIn =
    Types.Logo "linkedin"


{-| LinkedIn Inverted - Logo
-}
linkedInInverted : Logo
linkedInInverted =
    Types.Logo "linkedin-in"


{-| Linode - Logo
-}
linode : Logo
linode =
    Types.Logo "linode"


{-| Linux - Logo
-}
linux : Logo
linux =
    Types.Logo "linux"


{-| Lira Sign - Icon
-}
liraSign : Icon
liraSign =
    Types.Icon "lira-sign"


{-| List - Icon
-}
list : Icon
list =
    Types.Icon "list"


{-| List Alternate - Icon
-}
listAlt : Icon
listAlt =
    Types.Icon "list-alt"


{-| List Ol - Icon
-}
listOl : Icon
listOl =
    Types.Icon "list-ol"


{-| List Ul - Icon
-}
listUl : Icon
listUl =
    Types.Icon "list-ul"


{-| Location Arrow - Icon
-}
locationArrow : Icon
locationArrow =
    Types.Icon "location-arrow"


{-| Lock - Icon
-}
lock : Icon
lock =
    Types.Icon "lock"


{-| Lock Alternate - Icon
-}
lockAlt : Icon
lockAlt =
    Types.Icon "lock-alt"


{-| Lock Open - Icon
-}
lockOpen : Icon
lockOpen =
    Types.Icon "lock-open"


{-| Lock Open Alternate - Icon
-}
lockOpenAlt : Icon
lockOpenAlt =
    Types.Icon "lock-open-alt"


{-| Long Arrow Alternate Down - Icon
-}
longArrowAltDown : Icon
longArrowAltDown =
    Types.Icon "long-arrow-alt-down"


{-| Long Arrow Alternate Left - Icon
-}
longArrowAltLeft : Icon
longArrowAltLeft =
    Types.Icon "long-arrow-alt-left"


{-| Long Arrow Alternate Right - Icon
-}
longArrowAltRight : Icon
longArrowAltRight =
    Types.Icon "long-arrow-alt-right"


{-| Long Arrow Alternate Up - Icon
-}
longArrowAltUp : Icon
longArrowAltUp =
    Types.Icon "long-arrow-alt-up"


{-| Long Arrow Down - Icon
-}
longArrowDown : Icon
longArrowDown =
    Types.Icon "long-arrow-down"


{-| Long Arrow Left - Icon
-}
longArrowLeft : Icon
longArrowLeft =
    Types.Icon "long-arrow-left"


{-| Long Arrow Right - Icon
-}
longArrowRight : Icon
longArrowRight =
    Types.Icon "long-arrow-right"


{-| Long Arrow Up - Icon
-}
longArrowUp : Icon
longArrowUp =
    Types.Icon "long-arrow-up"


{-| Low Vision - Icon
-}
lowVision : Icon
lowVision =
    Types.Icon "low-vision"


{-| Luchador - Icon
-}
luchador : Icon
luchador =
    Types.Icon "luchador"


{-| Lyft - Logo
-}
lyft : Logo
lyft =
    Types.Logo "lyft"


{-| Magento - Logo
-}
magento : Logo
magento =
    Types.Logo "magento"


{-| Magic - Icon
-}
magic : Icon
magic =
    Types.Icon "magic"


{-| Magnet - Icon
-}
magnet : Icon
magnet =
    Types.Icon "magnet"


{-| Male - Icon
-}
male : Icon
male =
    Types.Icon "male"


{-| Map - Icon
-}
map : Icon
map =
    Types.Icon "map"


{-| Map Marker - Icon
-}
mapMarker : Icon
mapMarker =
    Types.Icon "map-marker"


{-| Map Marker Alternate - Icon
-}
mapMarkerAlt : Icon
mapMarkerAlt =
    Types.Icon "map-marker-alt"


{-| Map Pin - Icon
-}
mapPin : Icon
mapPin =
    Types.Icon "map-pin"


{-| Map Signs - Icon
-}
mapSigns : Icon
mapSigns =
    Types.Icon "map-signs"


{-| Mars - Icon
-}
mars : Icon
mars =
    Types.Icon "mars"


{-| Mars Double - Icon
-}
marsDouble : Icon
marsDouble =
    Types.Icon "mars-double"


{-| Mars Stroke - Icon
-}
marsStroke : Icon
marsStroke =
    Types.Icon "mars-stroke"


{-| Mars Stroke Horizontal - Icon
-}
marsStrokeHorizontal : Icon
marsStrokeHorizontal =
    Types.Icon "mars-stroke-h"


{-| Mars Stroke Vertical - Icon
-}
marsStrokeVertical : Icon
marsStrokeVertical =
    Types.Icon "mars-stroke-v"


{-| MaxCDN - Logo
-}
maxCDN : Logo
maxCDN =
    Types.Logo "maxcdn"


{-| MedApps - Logo
-}
medApps : Logo
medApps =
    Types.Logo "medapps"


{-| Medium - Logo
-}
medium : Logo
medium =
    Types.Logo "medium"


{-| Medium M - Logo
-}
mediumM : Logo
mediumM =
    Types.Logo "medium-m"


{-| Medkit - Icon
-}
medkit : Icon
medkit =
    Types.Icon "medkit"


{-| MedRT - Logo
-}
medRT : Logo
medRT =
    Types.Logo "medrt"


{-| Meetup - Logo
-}
meetup : Logo
meetup =
    Types.Logo "meetup"


{-| Meh - Icon
-}
meh : Icon
meh =
    Types.Icon "meh"


{-| Mercury - Icon
-}
mercury : Icon
mercury =
    Types.Icon "mercury"


{-| Microchip - Icon
-}
microchip : Icon
microchip =
    Types.Icon "microchip"


{-| Microphone - Icon
-}
microphone : Icon
microphone =
    Types.Icon "microphone"


{-| Microphone Alternate - Icon
-}
microphoneAlt : Icon
microphoneAlt =
    Types.Icon "microphone-alt"


{-| Microphone Slash - Icon
-}
microphoneSlash : Icon
microphoneSlash =
    Types.Icon "microphone-slash"


{-| Microsoft - Logo
-}
microsoft : Logo
microsoft =
    Types.Logo "microsoft"


{-| Minus - Icon
-}
minus : Icon
minus =
    Types.Icon "minus"


{-| Minus Circle - Icon
-}
minusCircle : Icon
minusCircle =
    Types.Icon "minus-circle"


{-| Minus Hexagon - Icon
-}
minusHexagon : Icon
minusHexagon =
    Types.Icon "minus-hexagon"


{-| Minus Octagon - Icon
-}
minusOctagon : Icon
minusOctagon =
    Types.Icon "minus-octagon"


{-| Minus Square - Icon
-}
minusSquare : Icon
minusSquare =
    Types.Icon "minus-square"


{-| Mix - Logo
-}
mix : Logo
mix =
    Types.Logo "mix"


{-| Mixcloud - Logo
-}
mixcloud : Logo
mixcloud =
    Types.Logo "mixcloud"


{-| Mizuni - Logo
-}
mizuni : Logo
mizuni =
    Types.Logo "mizuni"


{-| Mobile - Icon
-}
mobile : Icon
mobile =
    Types.Icon "mobile"


{-| Mobile Alternate - Icon
-}
mobileAlt : Icon
mobileAlt =
    Types.Icon "mobile-alt"


{-| Mobile Android - Icon
-}
mobileAndroid : Icon
mobileAndroid =
    Types.Icon "mobile-android"


{-| Mobile Android Alternate - Icon
-}
mobileAndroidAlt : Icon
mobileAndroidAlt =
    Types.Icon "mobile-android-alt"


{-| MODX - Logo
-}
modX : Logo
modX =
    Types.Logo "modx"


{-| Monero - Logo
-}
monero : Logo
monero =
    Types.Logo "monero"


{-| Money Bill - Icon
-}
moneyBill : Icon
moneyBill =
    Types.Icon "money-bill"


{-| Money Bill Alternate - Icon
-}
moneyBillAlt : Icon
moneyBillAlt =
    Types.Icon "money-bill-alt"


{-| Moon - Icon
-}
moon : Icon
moon =
    Types.Icon "moon"


{-| Motorcycle - Icon
-}
motorcycle : Icon
motorcycle =
    Types.Icon "motorcycle"


{-| Mouse Pointer - Icon
-}
mousePointer : Icon
mousePointer =
    Types.Icon "mouse-pointer"


{-| Music - Icon
-}
music : Icon
music =
    Types.Icon "music"


{-| Napster - Logo
-}
napster : Logo
napster =
    Types.Logo "napster"


{-| Neuter - Icon
-}
neuter : Icon
neuter =
    Types.Icon "neuter"


{-| Newspaper - Icon
-}
newspaper : Icon
newspaper =
    Types.Icon "newspaper"


{-| Nintendo Switch - Logo
-}
nintendoSwitch : Logo
nintendoSwitch =
    Types.Logo "nintendo-switch"


{-| Node - Logo
-}
node : Logo
node =
    Types.Logo "node"


{-| Node.js - Logo
-}
nodejs : Logo
nodejs =
    Types.Logo "node-js"


{-| npm - Logo
-}
npm : Logo
npm =
    Types.Logo "npm"


{-| Ns8 - Logo
-}
ns8 : Logo
ns8 =
    Types.Logo "ns8"


{-| Nutritionix - Logo
-}
nutritionix : Logo
nutritionix =
    Types.Logo "nutritionix"


{-| Object Group - Icon
-}
objectGroup : Icon
objectGroup =
    Types.Icon "object-group"


{-| Object Ungroup - Icon
-}
objectUngroup : Icon
objectUngroup =
    Types.Icon "object-ungroup"


{-| Octagon - Icon
-}
octagon : Icon
octagon =
    Types.Icon "octagon"


{-| Odnoklassniki - Logo
-}
odnoklassniki : Logo
odnoklassniki =
    Types.Logo "odnoklassniki"


{-| Odnoklassniki Square - Logo
-}
odnoklassnikiSquare : Logo
odnoklassnikiSquare =
    Types.Logo "odnoklassniki-square"


{-| Open Cart - Logo
-}
openCart : Logo
openCart =
    Types.Logo "opencart"


{-| Open ID - Logo
-}
openID : Logo
openID =
    Types.Logo "openid"


{-| Opera - Logo
-}
opera : Logo
opera =
    Types.Logo "opera"


{-| Optin Monster - Logo
-}
optinMonster : Logo
optinMonster =
    Types.Logo "optin-monster"


{-| Open Source Initiative - Logo
-}
openSourceInitiative : Logo
openSourceInitiative =
    Types.Logo "osi"


{-| Outdent - Icon
-}
outdent : Icon
outdent =
    Types.Icon "outdent"


{-| page4 - Logo
-}
page4 : Logo
page4 =
    Types.Logo "page4"


{-| Page Lines - Logo
-}
pageLines : Logo
pageLines =
    Types.Logo "pagelines"


{-| Paint Brush - Icon
-}
paintBrush : Icon
paintBrush =
    Types.Icon "paint-brush"


{-| PalFed - Logo
-}
palFed : Logo
palFed =
    Types.Logo "palfed"


{-| Paper Plane - Icon
-}
paperPlane : Icon
paperPlane =
    Types.Icon "paper-plane"


{-| Paperclip - Icon
-}
paperclip : Icon
paperclip =
    Types.Icon "paperclip"


{-| Paragraph - Icon
-}
paragraph : Icon
paragraph =
    Types.Icon "paragraph"


{-| Paste - Icon
-}
paste : Icon
paste =
    Types.Icon "paste"


{-| Patreon - Logo
-}
patreon : Logo
patreon =
    Types.Logo "patreon"


{-| Pause - Icon
-}
pause : Icon
pause =
    Types.Icon "pause"


{-| Pause Circle - Icon
-}
pauseCircle : Icon
pauseCircle =
    Types.Icon "pause-circle"


{-| Paw - Icon
-}
paw : Icon
paw =
    Types.Icon "paw"


{-| PayPal - Logo
-}
payPal : Logo
payPal =
    Types.Logo "paypal"


{-| Pen - Icon
-}
pen : Icon
pen =
    Types.Icon "pen"


{-| Pen Alternate - Icon
-}
penAlt : Icon
penAlt =
    Types.Icon "pen-alt"


{-| Pen Square - Icon
-}
penSquare : Icon
penSquare =
    Types.Icon "pen-square"


{-| Pencil - Icon
-}
pencil : Icon
pencil =
    Types.Icon "pencil"


{-| Pencil Alternate - Icon
-}
pencilAlt : Icon
pencilAlt =
    Types.Icon "pencil-alt"


{-| Pennant - Icon
-}
pennant : Icon
pennant =
    Types.Icon "pennant"


{-| Percent - Icon
-}
percent : Icon
percent =
    Types.Icon "percent"


{-| Periscope - Logo
-}
periscope : Logo
periscope =
    Types.Logo "periscope"


{-| Phabricator - Logo
-}
phabricator : Logo
phabricator =
    Types.Logo "phabricator"


{-| Phoenix Framework - Logo
-}
phoenixFramework : Logo
phoenixFramework =
    Types.Logo "phoenix-framework"


{-| Phone - Icon
-}
phone : Icon
phone =
    Types.Icon "phone"


{-| Phone Slash - Icon
-}
phoneSlash : Icon
phoneSlash =
    Types.Icon "phone-slash"


{-| Phone Square - Icon
-}
phoneSquare : Icon
phoneSquare =
    Types.Icon "phone-square"


{-| Phone Volume - Icon
-}
phoneVolume : Icon
phoneVolume =
    Types.Icon "phone-volume"


{-| PHP - Logo
-}
php : Logo
php =
    Types.Logo "php"


{-| Pied Piper - Logo
-}
piedPiper : Logo
piedPiper =
    Types.Logo "pied-piper"


{-| Pied Piper Alternate - Logo
-}
piedPiperAlt : Logo
piedPiperAlt =
    Types.Logo "pied-piper-alt"


{-| Pied Piper PP - Logo
-}
piedPiperPP : Logo
piedPiperPP =
    Types.Logo "pied-piper-pp"


{-| Pinterest - Logo
-}
pinterest : Logo
pinterest =
    Types.Logo "pinterest"


{-| Pinterest P - Logo
-}
pinterestP : Logo
pinterestP =
    Types.Logo "pinterest-p"


{-| Pinterest Square - Logo
-}
pinterestSquare : Logo
pinterestSquare =
    Types.Logo "pinterest-square"


{-| Plane - Icon
-}
plane : Icon
plane =
    Types.Icon "plane"


{-| Plane Alternate - Icon
-}
planeAlt : Icon
planeAlt =
    Types.Icon "plane-alt"


{-| Play - Icon
-}
play : Icon
play =
    Types.Icon "play"


{-| Play Circle - Icon
-}
playCircle : Icon
playCircle =
    Types.Icon "play-circle"


{-| Playstation - Logo
-}
playstation : Logo
playstation =
    Types.Logo "playstation"


{-| Plug - Icon
-}
plug : Icon
plug =
    Types.Icon "plug"


{-| Plus - Icon
-}
plus : Icon
plus =
    Types.Icon "plus"


{-| Plus Circle - Icon
-}
plusCircle : Icon
plusCircle =
    Types.Icon "plus-circle"


{-| Plus Hexagon - Icon
-}
plusHexagon : Icon
plusHexagon =
    Types.Icon "plus-hexagon"


{-| Plus Octagon - Icon
-}
plusOctagon : Icon
plusOctagon =
    Types.Icon "plus-octagon"


{-| Plus Square - Icon
-}
plusSquare : Icon
plusSquare =
    Types.Icon "plus-square"


{-| Podcast - Icon
-}
podcast : Icon
podcast =
    Types.Icon "podcast"


{-| Poo - Icon
-}
poo : Icon
poo =
    Types.Icon "poo"


{-| Portrait - Icon
-}
portrait : Icon
portrait =
    Types.Icon "portrait"


{-| Pound Sign - Icon
-}
poundSign : Icon
poundSign =
    Types.Icon "pound-sign"


{-| Power Off - Icon
-}
powerOff : Icon
powerOff =
    Types.Icon "power-off"


{-| Print - Icon
-}
print : Icon
print =
    Types.Icon "print"


{-| Product Hunt - Logo
-}
productHunt : Logo
productHunt =
    Types.Logo "product-hunt"


{-| Pushed - Logo
-}
pushed : Logo
pushed =
    Types.Logo "pushed"


{-| Puzzle Piece - Icon
-}
puzzlePiece : Icon
puzzlePiece =
    Types.Icon "puzzle-piece"


{-| Python - Logo
-}
python : Logo
python =
    Types.Logo "python"


{-| QQ - Logo
-}
qq : Logo
qq =
    Types.Logo "qq"


{-| QR Code - Icon
-}
qrCode : Icon
qrCode =
    Types.Icon "qrcode"


{-| Question - Icon
-}
question : Icon
question =
    Types.Icon "question"


{-| Question Circle - Icon
-}
questionCircle : Icon
questionCircle =
    Types.Icon "question-circle"


{-| Question Square - Icon
-}
questionSquare : Icon
questionSquare =
    Types.Icon "question-square"


{-| Quidditch - Icon
-}
quidditch : Icon
quidditch =
    Types.Icon "quidditch"


{-| QuinScape - Logo
-}
quinScape : Logo
quinScape =
    Types.Logo "quinscape"


{-| Quora - Logo
-}
quora : Logo
quora =
    Types.Logo "quora"


{-| Quote Left - Icon
-}
quoteLeft : Icon
quoteLeft =
    Types.Icon "quote-left"


{-| Quote Right - Icon
-}
quoteRight : Icon
quoteRight =
    Types.Icon "quote-right"


{-| Racquet - Icon
-}
racquet : Icon
racquet =
    Types.Icon "racquet"


{-| Random - Icon
-}
random : Icon
random =
    Types.Icon "random"


{-| Ravelry - Logo
-}
ravelry : Logo
ravelry =
    Types.Logo "ravelry"


{-| React - Logo
-}
react : Logo
react =
    Types.Logo "react"


{-| Rebel - Logo
-}
rebel : Logo
rebel =
    Types.Logo "rebel"


{-| Rectangle Landscape - Icon
-}
rectangleLandscape : Icon
rectangleLandscape =
    Types.Icon "rectangle-landscape"


{-| Rectangle Portrait - Icon
-}
rectanglePortrait : Icon
rectanglePortrait =
    Types.Icon "rectangle-portrait"


{-| Rectangle Wide - Icon
-}
rectangleWide : Icon
rectangleWide =
    Types.Icon "rectangle-wide"


{-| Recycle - Icon
-}
recycle : Icon
recycle =
    Types.Icon "recycle"


{-| Red River - Logo
-}
redRiver : Logo
redRiver =
    Types.Logo "red-river"


{-| Reddit - Logo
-}
reddit : Logo
reddit =
    Types.Logo "reddit"


{-| Reddit Alien - Logo
-}
redditAlien : Logo
redditAlien =
    Types.Logo "reddit-alien"


{-| Reddit Square - Logo
-}
redditSquare : Logo
redditSquare =
    Types.Logo "reddit-square"


{-| Redo - Icon
-}
redo : Icon
redo =
    Types.Icon "redo"


{-| Redo Alternate - Icon
-}
redoAlt : Icon
redoAlt =
    Types.Icon "redo-alt"


{-| Registered - Icon
-}
registered : Icon
registered =
    Types.Icon "registered"


{-| Rendact - Logo
-}
rendact : Logo
rendact =
    Types.Logo "rendact"


{-| Renren - Logo
-}
renren : Logo
renren =
    Types.Logo "renren"


{-| Repeat - Icon
-}
repeat : Icon
repeat =
    Types.Icon "repeat"


{-| Repeat Alternate - Icon
-}
repeatAlt : Icon
repeatAlt =
    Types.Icon "repeat-alt"


{-| Repeat1 - Icon
-}
repeat1 : Icon
repeat1 =
    Types.Icon "repeat-1"


{-| Repeat1 Alternate - Icon
-}
repeat1Alt : Icon
repeat1Alt =
    Types.Icon "repeat-1-alt"


{-| Reply - Icon
-}
reply : Icon
reply =
    Types.Icon "reply"


{-| Reply All - Icon
-}
replyAll : Icon
replyAll =
    Types.Icon "reply-all"


{-| Replyd - Logo
-}
replyd : Logo
replyd =
    Types.Logo "replyd"


{-| Resolving - Logo
-}
resolving : Logo
resolving =
    Types.Logo "resolving"


{-| Retweet - Icon
-}
retweet : Icon
retweet =
    Types.Icon "retweet"


{-| Retweet Alternate - Icon
-}
retweetAlt : Icon
retweetAlt =
    Types.Icon "retweet-alt"


{-| Road - Icon
-}
road : Icon
road =
    Types.Icon "road"


{-| Rocket - Icon
-}
rocket : Icon
rocket =
    Types.Icon "rocket"


{-| RocketChat - Logo
-}
rocketChat : Logo
rocketChat =
    Types.Logo "rocketchat"


{-| Rock RMS - Logo
-}
rockRMS : Logo
rockRMS =
    Types.Logo "rockrms"


{-| RSS - Icon
-}
rss : Icon
rss =
    Types.Icon "rss"


{-| RSS Square - Icon
-}
rssSquare : Icon
rssSquare =
    Types.Icon "rss-square"


{-| Ruble Sign - Icon
-}
rubleSign : Icon
rubleSign =
    Types.Icon "ruble-sign"


{-| Rupee Sign - Icon
-}
rupeeSign : Icon
rupeeSign =
    Types.Icon "rupee-sign"


{-| Safari - Logo
-}
safari : Logo
safari =
    Types.Logo "safari"


{-| Sass - Logo
-}
sass : Logo
sass =
    Types.Logo "sass"


{-| Save - Icon
-}
save : Icon
save =
    Types.Icon "save"


{-| Schlix - Logo
-}
schlix : Logo
schlix =
    Types.Logo "schlix"


{-| Scribd - Logo
-}
scribd : Logo
scribd =
    Types.Logo "scribd"


{-| Scrubber - Icon
-}
scrubber : Icon
scrubber =
    Types.Icon "scrubber"


{-| Search - Icon
-}
search : Icon
search =
    Types.Icon "search"


{-| Search Minus - Icon
-}
searchMinus : Icon
searchMinus =
    Types.Icon "search-minus"


{-| Search Plus - Icon
-}
searchPlus : Icon
searchPlus =
    Types.Icon "search-plus"


{-| Searchengin - Logo
-}
searchengin : Logo
searchengin =
    Types.Logo "searchengin"


{-| SellCast - Logo
-}
sellCast : Logo
sellCast =
    Types.Logo "sellcast"


{-| Sellsy - Logo
-}
sellsy : Logo
sellsy =
    Types.Logo "sellsy"


{-| Server - Icon
-}
server : Icon
server =
    Types.Icon "server"


{-| Service Stack - Logo
-}
serviceStack : Logo
serviceStack =
    Types.Logo "servicestack"


{-| Share - Icon
-}
share : Icon
share =
    Types.Icon "share"


{-| Share All - Icon
-}
shareAll : Icon
shareAll =
    Types.Icon "share-all"


{-| Share Alternate - Icon
-}
shareAlt : Icon
shareAlt =
    Types.Icon "share-alt"


{-| Share Alternate Square - Icon
-}
shareAltSquare : Icon
shareAltSquare =
    Types.Icon "share-alt-square"


{-| Share Square - Icon
-}
shareSquare : Icon
shareSquare =
    Types.Icon "share-square"


{-| Shekel Sign - Icon
-}
shekelSign : Icon
shekelSign =
    Types.Icon "shekel-sign"


{-| Shield - Icon
-}
shield : Icon
shield =
    Types.Icon "shield"


{-| Shield Alternate - Icon
-}
shieldAlt : Icon
shieldAlt =
    Types.Icon "shield-alt"


{-| Shield Check - Icon
-}
shieldCheck : Icon
shieldCheck =
    Types.Icon "shield-check"


{-| Ship - Icon
-}
ship : Icon
ship =
    Types.Icon "ship"


{-| Shirts In Bulk - Logo
-}
shirtsInBulk : Logo
shirtsInBulk =
    Types.Logo "shirtsinbulk"


{-| Shopping Bag - Icon
-}
shoppingBag : Icon
shoppingBag =
    Types.Icon "shopping-bag"


{-| Shopping Basket - Icon
-}
shoppingBasket : Icon
shoppingBasket =
    Types.Icon "shopping-basket"


{-| Shopping Cart - Icon
-}
shoppingCart : Icon
shoppingCart =
    Types.Icon "shopping-cart"


{-| Shower - Icon
-}
shower : Icon
shower =
    Types.Icon "shower"


{-| Shuttlecock - Icon
-}
shuttlecock : Icon
shuttlecock =
    Types.Icon "shuttlecock"


{-| Sign In - Icon
-}
signIn : Icon
signIn =
    Types.Icon "sign-in"


{-| Sign In Alternate - Icon
-}
signInAlt : Icon
signInAlt =
    Types.Icon "sign-in-alt"


{-| Sign Language - Icon
-}
signLanguage : Icon
signLanguage =
    Types.Icon "sign-language"


{-| Sign Out - Icon
-}
signOut : Icon
signOut =
    Types.Icon "sign-out"


{-| Sign Out Alternate - Icon
-}
signOutAlt : Icon
signOutAlt =
    Types.Icon "sign-out-alt"


{-| Signal - Icon
-}
signal : Icon
signal =
    Types.Icon "signal"


{-| Simply Built - Logo
-}
simplyBuilt : Logo
simplyBuilt =
    Types.Logo "simplybuilt"


{-| Sistrix - Logo
-}
sistrix : Logo
sistrix =
    Types.Logo "sistrix"


{-| Sitemap - Icon
-}
sitemap : Icon
sitemap =
    Types.Icon "sitemap"


{-| Sky Atlas - Logo
-}
skyAtlas : Logo
skyAtlas =
    Types.Logo "skyatlas"


{-| Skype - Logo
-}
skype : Logo
skype =
    Types.Logo "skype"


{-| Slack - Logo
-}
slack : Logo
slack =
    Types.Logo "slack"


{-| Slack Hash - Logo
-}
slackHash : Logo
slackHash =
    Types.Logo "slack-hash"


{-| Sliders Horizontal - Icon
-}
slidersHorizontal : Icon
slidersHorizontal =
    Types.Icon "sliders-h"


{-| Sliders Horizontal Square - Icon
-}
slidersHorizontalSquare : Icon
slidersHorizontalSquare =
    Types.Icon "sliders-h-square"


{-| Sliders Vertical - Icon
-}
slidersVertical : Icon
slidersVertical =
    Types.Icon "sliders-v"


{-| Sliders Vertical Square - Icon
-}
slidersVerticalSquare : Icon
slidersVerticalSquare =
    Types.Icon "sliders-v-square"


{-| Slideshare - Logo
-}
slideshare : Logo
slideshare =
    Types.Logo "slideshare"


{-| Smile - Icon
-}
smile : Icon
smile =
    Types.Icon "smile"


{-| Snapchat - Logo
-}
snapchat : Logo
snapchat =
    Types.Logo "snapchat"


{-| Snapchat Ghost - Logo
-}
snapchatGhost : Logo
snapchatGhost =
    Types.Logo "snapchat-ghost"


{-| Snapchat Square - Logo
-}
snapchatSquare : Logo
snapchatSquare =
    Types.Logo "snapchat-square"


{-| Snowflake - Icon
-}
snowflake : Icon
snowflake =
    Types.Icon "snowflake"


{-| Sort - Icon
-}
sort : Icon
sort =
    Types.Icon "sort"


{-| Sort Alpha Down - Icon
-}
sortAlphaDown : Icon
sortAlphaDown =
    Types.Icon "sort-alpha-down"


{-| Sort Alpha Up - Icon
-}
sortAlphaUp : Icon
sortAlphaUp =
    Types.Icon "sort-alpha-up"


{-| Sort Amount Down - Icon
-}
sortAmountDown : Icon
sortAmountDown =
    Types.Icon "sort-amount-down"


{-| Sort Amount Up - Icon
-}
sortAmountUp : Icon
sortAmountUp =
    Types.Icon "sort-amount-up"


{-| Sort Down - Icon
-}
sortDown : Icon
sortDown =
    Types.Icon "sort-down"


{-| Sort Numeric Down - Icon
-}
sortNumericDown : Icon
sortNumericDown =
    Types.Icon "sort-numeric-down"


{-| Sort Numeric Up - Icon
-}
sortNumericUp : Icon
sortNumericUp =
    Types.Icon "sort-numeric-up"


{-| Sort Up - Icon
-}
sortUp : Icon
sortUp =
    Types.Icon "sort-up"


{-| Sound Cloud - Logo
-}
soundCloud : Logo
soundCloud =
    Types.Logo "soundcloud"


{-| Space Shuttle - Icon
-}
spaceShuttle : Icon
spaceShuttle =
    Types.Icon "space-shuttle"


{-| Spade - Icon
-}
spade : Icon
spade =
    Types.Icon "spade"


{-| Speakap - Logo
-}
speakap : Logo
speakap =
    Types.Logo "speakap"


{-| Spinner - Icon
-}
spinner : Icon
spinner =
    Types.Icon "spinner"


{-| Spinner Third - Icon
-}
spinnerThird : Icon
spinnerThird =
    Types.Icon "spinner-third"


{-| Spotify - Logo
-}
spotify : Logo
spotify =
    Types.Logo "spotify"


{-| Square - Icon
-}
square : Icon
square =
    Types.Icon "square"


{-| Square Full - Icon
-}
squareFull : Icon
squareFull =
    Types.Icon "square-full"


{-| Stack Exchange - Logo
-}
stackExchange : Logo
stackExchange =
    Types.Logo "stack-exchange"


{-| Stack Overflow - Logo
-}
stackOverflow : Logo
stackOverflow =
    Types.Logo "stack-overflow"


{-| Star - Icon
-}
star : Icon
star =
    Types.Icon "star"


{-| Star Exclamation - Icon
-}
starExclamation : Icon
starExclamation =
    Types.Icon "star-exclamation"


{-| Star Half - Icon
-}
starHalf : Icon
starHalf =
    Types.Icon "star-half"


{-| StayLinked - Logo
-}
stayLinked : Logo
stayLinked =
    Types.Logo "staylinked"


{-| Steam - Logo
-}
steam : Logo
steam =
    Types.Logo "steam"


{-| Steam Square - Logo
-}
steamSquare : Logo
steamSquare =
    Types.Logo "steam-square"


{-| Steam Symbol - Logo
-}
steamSymbol : Logo
steamSymbol =
    Types.Logo "steam-symbol"


{-| Step Backward - Icon
-}
stepBackward : Icon
stepBackward =
    Types.Icon "step-backward"


{-| Step Forward - Icon
-}
stepForward : Icon
stepForward =
    Types.Icon "step-forward"


{-| Stethoscope - Icon
-}
stethoscope : Icon
stethoscope =
    Types.Icon "stethoscope"


{-| Sticker Mule - Logo
-}
stickerMule : Logo
stickerMule =
    Types.Logo "sticker-mule"


{-| Sticky Note - Icon
-}
stickyNote : Icon
stickyNote =
    Types.Icon "sticky-note"


{-| Stop - Icon
-}
stop : Icon
stop =
    Types.Icon "stop"


{-| Stop Circle - Icon
-}
stopCircle : Icon
stopCircle =
    Types.Icon "stop-circle"


{-| Stopwatch - Icon
-}
stopwatch : Icon
stopwatch =
    Types.Icon "stopwatch"


{-| Strava - Logo
-}
strava : Logo
strava =
    Types.Logo "strava"


{-| Street View - Icon
-}
streetView : Icon
streetView =
    Types.Icon "street-view"


{-| Strikethrough - Icon
-}
strikethrough : Icon
strikethrough =
    Types.Icon "strikethrough"


{-| Stripe - Logo
-}
stripe : Logo
stripe =
    Types.Logo "stripe"


{-| Stripe S - Logo
-}
stripeS : Logo
stripeS =
    Types.Logo "stripe-s"


{-| Studio Vinari - Logo
-}
studioVinari : Logo
studioVinari =
    Types.Logo "studiovinari"


{-| StumbleUpon - Logo
-}
stumbleUpon : Logo
stumbleUpon =
    Types.Logo "stumbleupon"


{-| StumbleUpon Circle - Logo
-}
stumbleUponCircle : Logo
stumbleUponCircle =
    Types.Logo "stumbleupon-circle"


{-| Subscript - Icon
-}
subscript : Icon
subscript =
    Types.Icon "subscript"


{-| Subway - Icon
-}
subway : Icon
subway =
    Types.Icon "subway"


{-| Suitcase - Icon
-}
suitcase : Icon
suitcase =
    Types.Icon "suitcase"


{-| Sun - Icon
-}
sun : Icon
sun =
    Types.Icon "sun"


{-| Superpowers - Logo
-}
superpowers : Logo
superpowers =
    Types.Logo "superpowers"


{-| Superscript - Icon
-}
superscript : Icon
superscript =
    Types.Icon "superscript"


{-| Supple - Logo
-}
supple : Logo
supple =
    Types.Logo "supple"


{-| Sync - Icon
-}
sync : Icon
sync =
    Types.Icon "sync"


{-| Sync Alternate - Icon
-}
syncAlt : Icon
syncAlt =
    Types.Icon "sync-alt"


{-| Table - Icon
-}
table : Icon
table =
    Types.Icon "table"


{-| Table Tennis - Icon
-}
tableTennis : Icon
tableTennis =
    Types.Icon "table-tennis"


{-| Tablet - Icon
-}
tablet : Icon
tablet =
    Types.Icon "tablet"


{-| Tablet Alternate - Icon
-}
tabletAlt : Icon
tabletAlt =
    Types.Icon "tablet-alt"


{-| Tablet Android - Icon
-}
tabletAndroid : Icon
tabletAndroid =
    Types.Icon "tablet-android"


{-| Tablet Android Alternate - Icon
-}
tabletAndroidAlt : Icon
tabletAndroidAlt =
    Types.Icon "tablet-android-alt"


{-| Tachometer - Icon
-}
tachometer : Icon
tachometer =
    Types.Icon "tachometer"


{-| Tachometer Alternate - Icon
-}
tachometerAlt : Icon
tachometerAlt =
    Types.Icon "tachometer-alt"


{-| Tag - Icon
-}
tag : Icon
tag =
    Types.Icon "tag"


{-| Tags - Icon
-}
tags : Icon
tags =
    Types.Icon "tags"


{-| Tasks - Icon
-}
tasks : Icon
tasks =
    Types.Icon "tasks"


{-| Taxi - Icon
-}
taxi : Icon
taxi =
    Types.Icon "taxi"


{-| Telegram - Logo
-}
telegram : Logo
telegram =
    Types.Logo "telegram"


{-| Telegram Plane - Logo
-}
telegramPlane : Logo
telegramPlane =
    Types.Logo "telegram-plane"


{-| Tencent Weibo - Logo
-}
tencentWeibo : Logo
tencentWeibo =
    Types.Logo "tencent-weibo"


{-| Tennis Ball - Icon
-}
tennisBall : Icon
tennisBall =
    Types.Icon "tennis-ball"


{-| Terminal - Icon
-}
terminal : Icon
terminal =
    Types.Icon "terminal"


{-| Text Height - Icon
-}
textHeight : Icon
textHeight =
    Types.Icon "text-height"


{-| Text Width - Icon
-}
textWidth : Icon
textWidth =
    Types.Icon "text-width"


{-| Th - Icon
-}
th : Icon
th =
    Types.Icon "th"


{-| Th Large - Icon
-}
thLarge : Icon
thLarge =
    Types.Icon "th-large"


{-| Th List - Icon
-}
thList : Icon
thList =
    Types.Icon "th-list"


{-| Theme Isle - Logo
-}
themeIsle : Logo
themeIsle =
    Types.Logo "themeisle"


{-| Thermometer Empty - Icon
-}
thermometerEmpty : Icon
thermometerEmpty =
    Types.Icon "thermometer-empty"


{-| Thermometer Full - Icon
-}
thermometerFull : Icon
thermometerFull =
    Types.Icon "thermometer-full"


{-| Thermometer Half - Icon
-}
thermometerHalf : Icon
thermometerHalf =
    Types.Icon "thermometer-half"


{-| Thermometer Quarter - Icon
-}
thermometerQuarter : Icon
thermometerQuarter =
    Types.Icon "thermometer-quarter"


{-| Thermometer Three Quarters - Icon
-}
thermometerThreeQuarters : Icon
thermometerThreeQuarters =
    Types.Icon "thermometer-three-quarters"


{-| Thumbs Down - Icon
-}
thumbsDown : Icon
thumbsDown =
    Types.Icon "thumbs-down"


{-| Thumbs Up - Icon
-}
thumbsUp : Icon
thumbsUp =
    Types.Icon "thumbs-up"


{-| Thumbtack - Icon
-}
thumbtack : Icon
thumbtack =
    Types.Icon "thumbtack"


{-| Ticket - Icon
-}
ticket : Icon
ticket =
    Types.Icon "ticket"


{-| Ticket Alternate - Icon
-}
ticketAlt : Icon
ticketAlt =
    Types.Icon "ticket-alt"


{-| Times - Icon
-}
times : Icon
times =
    Types.Icon "times"


{-| Times Circle - Icon
-}
timesCircle : Icon
timesCircle =
    Types.Icon "times-circle"


{-| Times Hexagon - Icon
-}
timesHexagon : Icon
timesHexagon =
    Types.Icon "times-hexagon"


{-| Times Octagon - Icon
-}
timesOctagon : Icon
timesOctagon =
    Types.Icon "times-octagon"


{-| Times Square - Icon
-}
timesSquare : Icon
timesSquare =
    Types.Icon "times-square"


{-| Tint - Icon
-}
tint : Icon
tint =
    Types.Icon "tint"


{-| Toggle Off - Icon
-}
toggleOff : Icon
toggleOff =
    Types.Icon "toggle-off"


{-| Toggle On - Icon
-}
toggleOn : Icon
toggleOn =
    Types.Icon "toggle-on"


{-| Trademark - Icon
-}
trademark : Icon
trademark =
    Types.Icon "trademark"


{-| Train - Icon
-}
train : Icon
train =
    Types.Icon "train"


{-| Transgender - Icon
-}
transgender : Icon
transgender =
    Types.Icon "transgender"


{-| Transgender Alternate - Icon
-}
transgenderAlt : Icon
transgenderAlt =
    Types.Icon "transgender-alt"


{-| Trash - Icon
-}
trash : Icon
trash =
    Types.Icon "trash"


{-| Trash Alternate - Icon
-}
trashAlt : Icon
trashAlt =
    Types.Icon "trash-alt"


{-| Tree - Icon
-}
tree : Icon
tree =
    Types.Icon "tree"


{-| Tree Alternate - Icon
-}
treeAlt : Icon
treeAlt =
    Types.Icon "tree-alt"


{-| Trello - Logo
-}
trello : Logo
trello =
    Types.Logo "trello"


{-| Triangle - Icon
-}
triangle : Icon
triangle =
    Types.Icon "triangle"


{-| Trip Advisor - Logo
-}
tripAdvisor : Logo
tripAdvisor =
    Types.Logo "tripadvisor"


{-| Trophy - Icon
-}
trophy : Icon
trophy =
    Types.Icon "trophy"


{-| Trophy Alternate - Icon
-}
trophyAlt : Icon
trophyAlt =
    Types.Icon "trophy-alt"


{-| Truck - Icon
-}
truck : Icon
truck =
    Types.Icon "truck"


{-| TTY - Icon
-}
tty : Icon
tty =
    Types.Icon "tty"


{-| Tumblr - Logo
-}
tumblr : Logo
tumblr =
    Types.Logo "tumblr"


{-| Tumblr Square - Logo
-}
tumblrSquare : Logo
tumblrSquare =
    Types.Logo "tumblr-square"


{-| TV - Icon
-}
tv : Icon
tv =
    Types.Icon "tv"


{-| TV Retro - Icon
-}
tvRetro : Icon
tvRetro =
    Types.Icon "tv-retro"


{-| Twitch - Logo
-}
twitch : Logo
twitch =
    Types.Logo "twitch"


{-| Twitter - Logo
-}
twitter : Logo
twitter =
    Types.Logo "twitter"


{-| Twitter Square - Logo
-}
twitterSquare : Logo
twitterSquare =
    Types.Logo "twitter-square"


{-| Typo3 - Logo
-}
typo3 : Logo
typo3 =
    Types.Logo "typo3"


{-| Uber - Logo
-}
uber : Logo
uber =
    Types.Logo "uber"


{-| UIkit - Logo
-}
uiKit : Logo
uiKit =
    Types.Logo "uikit"


{-| Umbrella - Icon
-}
umbrella : Icon
umbrella =
    Types.Icon "umbrella"


{-| Underline - Icon
-}
underline : Icon
underline =
    Types.Icon "underline"


{-| Undo - Icon
-}
undo : Icon
undo =
    Types.Icon "undo"


{-| Undo Alternate - Icon
-}
undoAlt : Icon
undoAlt =
    Types.Icon "undo-alt"


{-| Uniregistry - Logo
-}
uniregistry : Logo
uniregistry =
    Types.Logo "uniregistry"


{-| Universal Access - Icon
-}
universalAccess : Icon
universalAccess =
    Types.Icon "universal-access"


{-| University - Icon
-}
university : Icon
university =
    Types.Icon "university"


{-| Unlink - Icon
-}
unlink : Icon
unlink =
    Types.Icon "unlink"


{-| Unlock - Icon
-}
unlock : Icon
unlock =
    Types.Icon "unlock"


{-| Unlock Alternate - Icon
-}
unlockAlt : Icon
unlockAlt =
    Types.Icon "unlock-alt"


{-| Untappd - Logo
-}
untappd : Logo
untappd =
    Types.Logo "untappd"


{-| Upload - Icon
-}
upload : Icon
upload =
    Types.Icon "upload"


{-| USB - Logo
-}
usb : Logo
usb =
    Types.Logo "usb"


{-| USD Circle - Icon
-}
usdCircle : Icon
usdCircle =
    Types.Icon "usd-circle"


{-| USD Square - Icon
-}
usdSquare : Icon
usdSquare =
    Types.Icon "usd-square"


{-| User - Icon
-}
user : Icon
user =
    Types.Icon "user"


{-| User Alternate - Icon
-}
userAlt : Icon
userAlt =
    Types.Icon "user-alt"


{-| User Circle - Icon
-}
userCircle : Icon
userCircle =
    Types.Icon "user-circle"


{-| User MD - Icon
-}
userMD : Icon
userMD =
    Types.Icon "user-md"


{-| User Plus - Icon
-}
userPlus : Icon
userPlus =
    Types.Icon "user-plus"


{-| User Secret - Icon
-}
userSecret : Icon
userSecret =
    Types.Icon "user-secret"


{-| User Times - Icon
-}
userTimes : Icon
userTimes =
    Types.Icon "user-times"


{-| Users - Icon
-}
users : Icon
users =
    Types.Icon "users"


{-| us Sunnah - Logo
-}
usSunnah : Logo
usSunnah =
    Types.Logo "ussunnah"


{-| Utensil Fork - Icon
-}
utensilFork : Icon
utensilFork =
    Types.Icon "utensil-fork"


{-| Utensil Knife - Icon
-}
utensilKnife : Icon
utensilKnife =
    Types.Icon "utensil-knife"


{-| Utensil Spoon - Icon
-}
utensilSpoon : Icon
utensilSpoon =
    Types.Icon "utensil-spoon"


{-| Utensils - Icon
-}
utensils : Icon
utensils =
    Types.Icon "utensils"


{-| Utensils Alternate - Icon
-}
utensilsAlt : Icon
utensilsAlt =
    Types.Icon "utensils-alt"


{-| Vaadin - Logo
-}
vaadin : Logo
vaadin =
    Types.Logo "vaadin"


{-| Venus - Icon
-}
venus : Icon
venus =
    Types.Icon "venus"


{-| Venus Double - Icon
-}
venusDouble : Icon
venusDouble =
    Types.Icon "venus-double"


{-| Venus Mars - Icon
-}
venusMars : Icon
venusMars =
    Types.Icon "venus-mars"


{-| Viacoin - Logo
-}
viacoin : Logo
viacoin =
    Types.Logo "viacoin"


{-| Viadeo - Logo
-}
viadeo : Logo
viadeo =
    Types.Logo "viadeo"


{-| Viadeo Square - Logo
-}
viadeoSquare : Logo
viadeoSquare =
    Types.Logo "viadeo-square"


{-| Viber - Logo
-}
viber : Logo
viber =
    Types.Logo "viber"


{-| Video - Icon
-}
video : Icon
video =
    Types.Icon "video"


{-| Vimeo - Logo
-}
vimeo : Logo
vimeo =
    Types.Logo "vimeo"


{-| Vimeo Square - Logo
-}
vimeoSquare : Logo
vimeoSquare =
    Types.Logo "vimeo-square"


{-| Vimeo V - Logo
-}
vimeoV : Logo
vimeoV =
    Types.Logo "vimeo-v"


{-| Vine - Logo
-}
vine : Logo
vine =
    Types.Logo "vine"


{-| VK - Logo
-}
vk : Logo
vk =
    Types.Logo "vk"


{-| Vnv - Logo
-}
vnv : Logo
vnv =
    Types.Logo "vnv"


{-| Volleyball - Icon
-}
volleyball : Icon
volleyball =
    Types.Icon "volleyball-ball"


{-| Volume Down - Icon
-}
volumeDown : Icon
volumeDown =
    Types.Icon "volume-down"


{-| Volume Mute - Icon
-}
volumeMute : Icon
volumeMute =
    Types.Icon "volume-mute"


{-| Volume Off - Icon
-}
volumeOff : Icon
volumeOff =
    Types.Icon "volume-off"


{-| Volume Up - Icon
-}
volumeUp : Icon
volumeUp =
    Types.Icon "volume-up"


{-| Vue.js - Logo
-}
vuejs : Logo
vuejs =
    Types.Logo "vuejs"


{-| Watch - Icon
-}
watch : Icon
watch =
    Types.Icon "watch"


{-| Weibo - Logo
-}
weibo : Logo
weibo =
    Types.Logo "weibo"


{-| Weixin - Logo
-}
weixin : Logo
weixin =
    Types.Logo "weixin"


{-| WhatsApp - Logo
-}
whatsApp : Logo
whatsApp =
    Types.Logo "whatsapp"


{-| WhatsApp Square - Logo
-}
whatsAppSquare : Logo
whatsAppSquare =
    Types.Logo "whatsapp-square"


{-| Wheelchair - Icon
-}
wheelchair : Icon
wheelchair =
    Types.Icon "wheelchair"


{-| Whistle - Icon
-}
whistle : Icon
whistle =
    Types.Icon "whistle"


{-| WHMCS - Logo
-}
whmcs : Logo
whmcs =
    Types.Logo "whmcs"


{-| Wifi - Icon
-}
wifi : Icon
wifi =
    Types.Icon "wifi"


{-| Wikipedia - Logo
-}
wikipedia : Logo
wikipedia =
    Types.Logo "wikipedia-w"


{-| Window - Icon
-}
window : Icon
window =
    Types.Icon "window"


{-| Window Alternate - Icon
-}
windowAlt : Icon
windowAlt =
    Types.Icon "window-alt"


{-| Window Close - Icon
-}
windowClose : Icon
windowClose =
    Types.Icon "window-close"


{-| Window Maximize - Icon
-}
windowMaximize : Icon
windowMaximize =
    Types.Icon "window-maximize"


{-| Window Minimize - Icon
-}
windowMinimize : Icon
windowMinimize =
    Types.Icon "window-minimize"


{-| Window Restore - Icon
-}
windowRestore : Icon
windowRestore =
    Types.Icon "window-restore"


{-| Windows - Logo
-}
windows : Logo
windows =
    Types.Logo "windows"


{-| Won Sign - Icon
-}
wonSign : Icon
wonSign =
    Types.Icon "won-sign"


{-| WordPress - Logo
-}
wordPress : Logo
wordPress =
    Types.Logo "wordpress"


{-| WordPress Simple - Logo
-}
wordPressSimple : Logo
wordPressSimple =
    Types.Logo "wordpress-simple"


{-| WPBeginner - Logo
-}
wpBeginner : Logo
wpBeginner =
    Types.Logo "wpbeginner"


{-| WPExplorer - Logo
-}
wpExplorer : Logo
wpExplorer =
    Types.Logo "wpexplorer"


{-| WPForms - Logo
-}
wpForms : Logo
wpForms =
    Types.Logo "wpforms"


{-| Wrench - Icon
-}
wrench : Icon
wrench =
    Types.Icon "wrench"


{-| Xbox - Logo
-}
xbox : Logo
xbox =
    Types.Logo "xbox"


{-| XING - Logo
-}
xing : Logo
xing =
    Types.Logo "xing"


{-| XING Square - Logo
-}
xingSquare : Logo
xingSquare =
    Types.Logo "xing-square"


{-| YCombinator - Logo
-}
yCombinator : Logo
yCombinator =
    Types.Logo "y-combinator"


{-| Yahoo - Logo
-}
yahoo : Logo
yahoo =
    Types.Logo "yahoo"


{-| Yandex - Logo
-}
yandex : Logo
yandex =
    Types.Logo "yandex"


{-| Yandex International - Logo
-}
yandexInternational : Logo
yandexInternational =
    Types.Logo "yandex-international"


{-| Yelp - Logo
-}
yelp : Logo
yelp =
    Types.Logo "yelp"


{-| Yen Sign - Icon
-}
yenSign : Icon
yenSign =
    Types.Icon "yen-sign"


{-| Yoast - Logo
-}
yoast : Logo
yoast =
    Types.Logo "yoast"


{-| YouTube - Logo
-}
youTube : Logo
youTube =
    Types.Logo "youtube"


{-| YouTube Square - Logo
-}
youTubeSquare : Logo
youTubeSquare =
    Types.Logo "youtube-square"
