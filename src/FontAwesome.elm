module FontAwesome
    exposing
        ( Animation(..)
        , Option(..)
        , HtmlTag(..)
        , Pull(..)
        , Size(..)
        , Style(..)
        , Transform(..)
        , icon
        , iconWithOptions
        , useCSS
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
        , bIMobject
        , backward
        , badge
        , badgeCheck
        , balanceScale
        , ban
        , bandcamp
        , barcode
        , bars
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
        , cCAmazonPay
        , cCAmex
        , cCApplePay
        , cCDinersClub
        , cCDiscover
        , cCJcb
        , cCMastercard
        , cCPayPal
        , cCStripe
        , cCVisa
        , cSS3
        , cSS3Alt
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
        , centercode
        , certificate
        , chartArea
        , chartBar
        , chartLine
        , chartPie
        , check
        , checkCircle
        , checkSquare
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
        , cloudScale
        , cloudUpload
        , cloudUploadAlt
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
        , crop
        , crosshairs
        , cube
        , cubes
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
        , filePowerpoint
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
        , fly
        , folder
        , folderOpen
        , font
        , fontAwesome
        , fontAwesomeAlt
        , fontAwesomeFlag
        , fontIcons
        , fontIconsFi
        , fortAwesome
        , fortAwesomeAlt
        , forumbee
        , forward
        , foursquare
        , freeBSD
        , freeCodeCamp
        , frown
        , futbol
        , gG
        , gGCircle
        , gamepad
        , gavel
        , gem
        , genderless
        , getPocket
        , gift
        , git
        , gitHub
        , gitHubAlt
        , gitHubSquare
        , gitKraken
        , gitLab
        , gitSquare
        , gitter
        , glassMartini
        , glide
        , glideG
        , globe
        , gofore
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
        , h1
        , h2
        , h3
        , hSquare
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
        , hireAHelper
        , history
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
        , itunes
        , itunesNote
        , jSFiddle
        , jackOLantern
        , jenkins
        , joget
        , joomla
        , js
        , jsSquare
        , key
        , keyCDN
        , keyboard
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
        , lyft
        , mODX
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
        , maxcdn
        , medApps
        , medium
        , mediumM
        , medkit
        , medrt
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
        , monero
        , moneyBill
        , moneyBillAlt
        , moon
        , motorcycle
        , mousePointer
        , music
        , nS8
        , napster
        , neuter
        , newspaper
        , nintendoSwitch
        , node
        , nodejs
        , npm
        , nutritionix
        , objectGroup
        , objectUngroup
        , octagon
        , odnoklassniki
        , odnoklassnikiSquare
        , openCart
        , openID
        , openSourceInitiative
        , opera
        , optinMonster
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
        , percent
        , periscope
        , phabricator
        , phoenixFramework
        , phone
        , phoneSlash
        , phoneSquare
        , phoneVolume
        , piedPiper
        , piedPiperAlt
        , piedPiperPp
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
        , qQ
        , qrcode
        , question
        , questionCircle
        , questionSquare
        , quora
        , quoteLeft
        , quoteRight
        , rSS
        , rSSSquare
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
        , repeat1
        , repeat1Alt
        , repeatAlt
        , reply
        , replyAll
        , replyd
        , resolving
        , retweet
        , retweetAlt
        , road
        , rockRMS
        , rocket
        , rocketChat
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
        , slidersV
        , slidersVSquare
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
        , tTY
        , tV
        , tVRetro
        , table
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
        , tumblr
        , tumblrSquare
        , twitch
        , twitter
        , twitterSquare
        , typo3
        , uIkit
        , uSB
        , uber
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
        , usSunnah
        , usdCircle
        , usdSquare
        , user
        , userAlt
        , userCircle
        , userMd
        , userPlus
        , userSecret
        , userTimes
        , users
        , utensilFork
        , utensilKnife
        , utensilSpoon
        , utensils
        , utensilsAlt
        , vK
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
        , vnv
        , volumeDown
        , volumeMute
        , volumeOff
        , volumeUp
        , vuejs
        , wHMCS
        , wPBeginner
        , wPExplorer
        , wPForms
        , watch
        , weibo
        , weixin
        , whatsApp
        , whatsAppSquare
        , wheelchair
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
        , wrench
        , xING
        , xINGSquare
        , xbox
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

@docs useSvg, useCSS


# Elements

@docs icon, iconWithOptions


# Options

@docs Option, Animation, HtmlTag, Pull, Size, Style, Transform


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
@docs bIMobject
@docs backward
@docs badge
@docs badgeCheck
@docs balanceScale
@docs ban
@docs bandcamp
@docs barcode
@docs bars
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
@docs cCAmazonPay
@docs cCAmex
@docs cCApplePay
@docs cCDinersClub
@docs cCDiscover
@docs cCJcb
@docs cCMastercard
@docs cCPayPal
@docs cCStripe
@docs cCVisa
@docs cSS3
@docs cSS3Alt
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
@docs centercode
@docs certificate
@docs chartArea
@docs chartBar
@docs chartLine
@docs chartPie
@docs check
@docs checkCircle
@docs checkSquare
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
@docs cloudScale
@docs cloudUpload
@docs cloudUploadAlt
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
@docs crop
@docs crosshairs
@docs cube
@docs cubes
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
@docs filePowerpoint
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
@docs fly
@docs folder
@docs folderOpen
@docs font
@docs fontAwesome
@docs fontAwesomeAlt
@docs fontAwesomeFlag
@docs fontIcons
@docs fontIconsFi
@docs fortAwesome
@docs fortAwesomeAlt
@docs forumbee
@docs forward
@docs foursquare
@docs freeBSD
@docs freeCodeCamp
@docs frown
@docs futbol
@docs gG
@docs gGCircle
@docs gamepad
@docs gavel
@docs gem
@docs genderless
@docs getPocket
@docs gift
@docs git
@docs gitHub
@docs gitHubAlt
@docs gitHubSquare
@docs gitKraken
@docs gitLab
@docs gitSquare
@docs gitter
@docs glassMartini
@docs glide
@docs glideG
@docs globe
@docs gofore
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
@docs h1
@docs h2
@docs h3
@docs hSquare
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
@docs hireAHelper
@docs history
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
@docs itunes
@docs itunesNote
@docs jSFiddle
@docs jackOLantern
@docs jenkins
@docs joget
@docs joomla
@docs js
@docs jsSquare
@docs key
@docs keyCDN
@docs keyboard
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
@docs lyft
@docs mODX
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
@docs maxcdn
@docs medApps
@docs medium
@docs mediumM
@docs medkit
@docs medrt
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
@docs monero
@docs moneyBill
@docs moneyBillAlt
@docs moon
@docs motorcycle
@docs mousePointer
@docs music
@docs nS8
@docs napster
@docs neuter
@docs newspaper
@docs nintendoSwitch
@docs node
@docs nodejs
@docs npm
@docs nutritionix
@docs objectGroup
@docs objectUngroup
@docs octagon
@docs odnoklassniki
@docs odnoklassnikiSquare
@docs openCart
@docs openID
@docs openSourceInitiative
@docs opera
@docs optinMonster
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
@docs percent
@docs periscope
@docs phabricator
@docs phoenixFramework
@docs phone
@docs phoneSlash
@docs phoneSquare
@docs phoneVolume
@docs piedPiper
@docs piedPiperAlt
@docs piedPiperPp
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
@docs qQ
@docs qrcode
@docs question
@docs questionCircle
@docs questionSquare
@docs quora
@docs quoteLeft
@docs quoteRight
@docs rSS
@docs rSSSquare
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
@docs repeat1
@docs repeat1Alt
@docs repeatAlt
@docs reply
@docs replyAll
@docs replyd
@docs resolving
@docs retweet
@docs retweetAlt
@docs road
@docs rockRMS
@docs rocket
@docs rocketChat
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
@docs slidersV
@docs slidersVSquare
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
@docs tTY
@docs tV
@docs tVRetro
@docs table
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
@docs tumblr
@docs tumblrSquare
@docs twitch
@docs twitter
@docs twitterSquare
@docs typo3
@docs uIkit
@docs uSB
@docs uber
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
@docs usSunnah
@docs usdCircle
@docs usdSquare
@docs user
@docs userAlt
@docs userCircle
@docs userMd
@docs userPlus
@docs userSecret
@docs userTimes
@docs users
@docs utensilFork
@docs utensilKnife
@docs utensilSpoon
@docs utensils
@docs utensilsAlt
@docs vK
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
@docs vnv
@docs volumeDown
@docs volumeMute
@docs volumeOff
@docs volumeUp
@docs vuejs
@docs wHMCS
@docs wPBeginner
@docs wPExplorer
@docs wPForms
@docs watch
@docs weibo
@docs weixin
@docs whatsApp
@docs whatsAppSquare
@docs wheelchair
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
@docs wrench
@docs xING
@docs xINGSquare
@docs xbox
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

import FontAwesome.Icon as Icon exposing (Icon)
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
useCSS : Html msg
useCSS =
    Html.node "link"
        [ Html.Attributes.href "https://use.fontawesome.com/releases/v5.0.3/css/all.css"
        , Html.Attributes.rel "stylesheet"
        ]
        []


{-| Create an icon with the default style (Solid), default tag (&lt;i&gt;)
and no additional options or attributes.

    icon File == <i class="fas fa-file"></i>

-}
icon : Icon -> Html msg
icon icon =
    iconWithOptions icon Solid [] []


{-| Create an icon with the given options and attributes.

    iconWithOptions Spinner Solid [ Animation Spin ] [] == <i class="fas fa-spinner fa-spin"></i>
    iconWithOptions Question Light [ HasBorder (Pull Right) ] [ Html.title "Question"] == <i class="fal fa-question fa-border fa-pull-right" title="Question"></i>
    iconWithOptions Info Regular [ HasFixedWidth (Size Large) (HtmlTag Span) ] [] == <span class="far fa-info fa-fw fa-lg"></span>

-}
iconWithOptions : Icon -> Style -> List Option -> List (Attribute msg) -> Html msg
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
        Mask _ _ ->
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
iconClass icon =
    let
        root =
            case icon of
                Icon.Icon name ->
                    name

                Icon.Logo name ->
                    name
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


styleClass : Icon -> Style -> String
styleClass icon style =
    case icon of
        Icon.Logo _ ->
            "fab"

        Icon.Icon _ ->
            case style of
                Solid ->
                    "fas"

                Regular ->
                    "far"

                Light ->
                    "fal"


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


classes : Icon -> Style -> List Option -> Attribute msg
classes icon style options =
    ( styleClass icon style, True )
        :: ( iconClass icon, True )
        :: List.map className options
        |> Html.Attributes.classList


transformText : Transform -> String
transformText transform =
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
                str =
                    transforms
                        |> List.map transformText
                        |> String.join " "
            in
                Html.Attributes.attribute "data-fa-transform" str :: opts

        _ ->
            opts


transformAttr : List Option -> List (Attribute msg)
transformAttr options =
    List.foldr transform [] options


mask : Option -> List (Attribute msg) -> List (Attribute msg)
mask opt opts =
    case opt of
        Mask icon style ->
            let
                val =
                    styleClass icon style ++ " " ++ iconClass icon
            in
                Html.Attributes.attribute "data-fa-mask" val :: opts

        _ ->
            opts


maskAttr : List Option -> List (Attribute msg)
maskAttr options =
    List.foldr mask [] options


{-| Font Awesome specific options. Any number of these can be passed in
when generating an icon or logo. If any option is repeated, then only one
will be selected. However, there is no guarantee as to which option will be
selected is undefined, so please only use each option once per icon or logo.

Including the HasBorder option will draw a border around the icon or logo.

Including the HasFixedWidth option will set a fixed width on the icon or logo.
All elements with this option will have the same width.

Including the InvertColor option will invert the color of the logo.

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
    | Mask Icon Style
    | Pull Pull
    | Size Size
    | Transform (List Transform)


{-| Every icon has one variation per style. Some of the Solid, most of the
Regular, and all of the Light variations require Font Awesome Pro, so if you
are using the free version then please refer to Font Awesome's icon library
to determine which styles are available to you.
-}
type Style
    = Solid
    | Regular
    | Light


{-| Font Awesome's size options. Valid values for the Mult options are
integers 2 - 10 inclusive.

<b>Default: Normal</b>

-}
type Size
    = Normal
    | ExtraSmall
    | Small
    | Large
    | Mult Int


{-| Options for pulling a logo or icon to the left or right.

<b>Default: none</b>

-}
type Pull
    = Left
    | Right


{-| Font Awesome's built-in animations.

<b>Default: none</b>

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


accessibleIcon : Icon
accessibleIcon =
    Icon.Logo "accessible-icon"


accusoft : Icon
accusoft =
    Icon.Logo "accusoft"


addressBook : Icon
addressBook =
    Icon.Icon "address-book"


addressCard : Icon
addressCard =
    Icon.Icon "address-card"


adjust : Icon
adjust =
    Icon.Icon "adjust"


adn : Icon
adn =
    Icon.Logo "adn"


adversal : Icon
adversal =
    Icon.Logo "adversal"


affiliateTheme : Icon
affiliateTheme =
    Icon.Logo "affiliatetheme"


alarmClock : Icon
alarmClock =
    Icon.Icon "alarm-clock"


algolia : Icon
algolia =
    Icon.Logo "algolia"


alignCenter : Icon
alignCenter =
    Icon.Icon "align-center"


alignJustify : Icon
alignJustify =
    Icon.Icon "align-justify"


alignLeft : Icon
alignLeft =
    Icon.Icon "align-left"


alignRight : Icon
alignRight =
    Icon.Icon "align-right"


amazon : Icon
amazon =
    Icon.Logo "amazon"


amazonPay : Icon
amazonPay =
    Icon.Logo "amazon-pay"


ambulance : Icon
ambulance =
    Icon.Icon "ambulance"


americanSignLanguageInterpreting : Icon
americanSignLanguageInterpreting =
    Icon.Icon "american-sign-language-interpreting"


amilia : Icon
amilia =
    Icon.Logo "amilia"


anchor : Icon
anchor =
    Icon.Icon "anchor"


android : Icon
android =
    Icon.Logo "android"


angelList : Icon
angelList =
    Icon.Logo "angellist"


angleDoubleDown : Icon
angleDoubleDown =
    Icon.Icon "angle-double-down"


angleDoubleLeft : Icon
angleDoubleLeft =
    Icon.Icon "angle-double-left"


angleDoubleRight : Icon
angleDoubleRight =
    Icon.Icon "angle-double-right"


angleDoubleUp : Icon
angleDoubleUp =
    Icon.Icon "angle-double-up"


angleDown : Icon
angleDown =
    Icon.Icon "angle-down"


angleLeft : Icon
angleLeft =
    Icon.Icon "angle-left"


angleRight : Icon
angleRight =
    Icon.Icon "angle-right"


angleUp : Icon
angleUp =
    Icon.Icon "angle-up"


angryCreative : Icon
angryCreative =
    Icon.Logo "angrycreative"


angular : Icon
angular =
    Icon.Logo "angular"


appStore : Icon
appStore =
    Icon.Logo "app-store"


appStoreIos : Icon
appStoreIos =
    Icon.Logo "app-store-ios"


apper : Icon
apper =
    Icon.Logo "apper"


apple : Icon
apple =
    Icon.Logo "apple"


applePay : Icon
applePay =
    Icon.Logo "apple-pay"


archive : Icon
archive =
    Icon.Icon "archive"


arrowAltCircleDown : Icon
arrowAltCircleDown =
    Icon.Icon "arrow-alt-circle-down"


arrowAltCircleLeft : Icon
arrowAltCircleLeft =
    Icon.Icon "arrow-alt-circle-left"


arrowAltCircleRight : Icon
arrowAltCircleRight =
    Icon.Icon "arrow-alt-circle-right"


arrowAltCircleUp : Icon
arrowAltCircleUp =
    Icon.Icon "arrow-alt-circle-up"


arrowAltDown : Icon
arrowAltDown =
    Icon.Icon "arrow-alt-down"


arrowAltFromBottom : Icon
arrowAltFromBottom =
    Icon.Icon "arrow-alt-from-bottom"


arrowAltFromLeft : Icon
arrowAltFromLeft =
    Icon.Icon "arrow-alt-from-left"


arrowAltFromRight : Icon
arrowAltFromRight =
    Icon.Icon "arrow-alt-from-right"


arrowAltFromTop : Icon
arrowAltFromTop =
    Icon.Icon "arrow-alt-from-top"


arrowAltLeft : Icon
arrowAltLeft =
    Icon.Icon "arrow-alt-left"


arrowAltRight : Icon
arrowAltRight =
    Icon.Icon "arrow-alt-right"


arrowAltSquareDown : Icon
arrowAltSquareDown =
    Icon.Icon "arrow-alt-square-down"


arrowAltSquareLeft : Icon
arrowAltSquareLeft =
    Icon.Icon "arrow-alt-square-left"


arrowAltSquareRight : Icon
arrowAltSquareRight =
    Icon.Icon "arrow-alt-square-right"


arrowAltSquareUp : Icon
arrowAltSquareUp =
    Icon.Icon "arrow-alt-square-up"


arrowAltToBottom : Icon
arrowAltToBottom =
    Icon.Icon "arrow-alt-to-bottom"


arrowAltToLeft : Icon
arrowAltToLeft =
    Icon.Icon "arrow-alt-to-left"


arrowAltToRight : Icon
arrowAltToRight =
    Icon.Icon "arrow-alt-to-right"


arrowAltToTop : Icon
arrowAltToTop =
    Icon.Icon "arrow-alt-to-top"


arrowAltUp : Icon
arrowAltUp =
    Icon.Icon "arrow-alt-up"


arrowCircleDown : Icon
arrowCircleDown =
    Icon.Icon "arrow-circle-down"


arrowCircleLeft : Icon
arrowCircleLeft =
    Icon.Icon "arrow-circle-left"


arrowCircleRight : Icon
arrowCircleRight =
    Icon.Icon "arrow-circle-right"


arrowCircleUp : Icon
arrowCircleUp =
    Icon.Icon "arrow-circle-up"


arrowDown : Icon
arrowDown =
    Icon.Icon "arrow-down"


arrowFromBottom : Icon
arrowFromBottom =
    Icon.Icon "arrow-from-bottom"


arrowFromLeft : Icon
arrowFromLeft =
    Icon.Icon "arrow-from-left"


arrowFromRight : Icon
arrowFromRight =
    Icon.Icon "arrow-from-right"


arrowFromTop : Icon
arrowFromTop =
    Icon.Icon "arrow-from-top"


arrowLeft : Icon
arrowLeft =
    Icon.Icon "arrow-left"


arrowRight : Icon
arrowRight =
    Icon.Icon "arrow-right"


arrowSquareDown : Icon
arrowSquareDown =
    Icon.Icon "arrow-square-down"


arrowSquareLeft : Icon
arrowSquareLeft =
    Icon.Icon "arrow-square-left"


arrowSquareRight : Icon
arrowSquareRight =
    Icon.Icon "arrow-square-right"


arrowSquareUp : Icon
arrowSquareUp =
    Icon.Icon "arrow-square-up"


arrowToBottom : Icon
arrowToBottom =
    Icon.Icon "arrow-to-bottom"


arrowToLeft : Icon
arrowToLeft =
    Icon.Icon "arrow-to-left"


arrowToRight : Icon
arrowToRight =
    Icon.Icon "arrow-to-right"


arrowToTop : Icon
arrowToTop =
    Icon.Icon "arrow-to-top"


arrowUp : Icon
arrowUp =
    Icon.Icon "arrow-up"


arrows : Icon
arrows =
    Icon.Icon "arrows"


arrowsAlt : Icon
arrowsAlt =
    Icon.Icon "arrows-alt"


arrowsAltHorizontal : Icon
arrowsAltHorizontal =
    Icon.Icon "arrows-alt-h"


arrowsAltVertical : Icon
arrowsAltVertical =
    Icon.Icon "arrows-alt-v"


arrowsHorizontal : Icon
arrowsHorizontal =
    Icon.Icon "arrows-h"


arrowsVertical : Icon
arrowsVertical =
    Icon.Icon "arrows-v"


assistiveListeningSystems : Icon
assistiveListeningSystems =
    Icon.Icon "assistive-listening-systems"


asterisk : Icon
asterisk =
    Icon.Icon "asterisk"


asymmetrik : Icon
asymmetrik =
    Icon.Logo "asymmetrik"


at : Icon
at =
    Icon.Icon "at"


audible : Icon
audible =
    Icon.Logo "audible"


audioDescription : Icon
audioDescription =
    Icon.Icon "audio-description"


autoprefixer : Icon
autoprefixer =
    Icon.Logo "autoprefixer"


avianex : Icon
avianex =
    Icon.Logo "avianex"


aviato : Icon
aviato =
    Icon.Logo "aviato"


aws : Icon
aws =
    Icon.Logo "aws"


bIMobject : Icon
bIMobject =
    Icon.Logo "bimobject"


backward : Icon
backward =
    Icon.Icon "backward"


badge : Icon
badge =
    Icon.Icon "badge"


badgeCheck : Icon
badgeCheck =
    Icon.Icon "badge-check"


balanceScale : Icon
balanceScale =
    Icon.Icon "balance-scale"


ban : Icon
ban =
    Icon.Icon "ban"


bandcamp : Icon
bandcamp =
    Icon.Logo "bandcamp"


barcode : Icon
barcode =
    Icon.Icon "barcode"


bars : Icon
bars =
    Icon.Icon "bars"


bath : Icon
bath =
    Icon.Icon "bath"


batteryBolt : Icon
batteryBolt =
    Icon.Icon "battery-bolt"


batteryEmpty : Icon
batteryEmpty =
    Icon.Icon "battery-empty"


batteryFull : Icon
batteryFull =
    Icon.Icon "battery-full"


batteryHalf : Icon
batteryHalf =
    Icon.Icon "battery-half"


batteryQuarter : Icon
batteryQuarter =
    Icon.Icon "battery-quarter"


batterySlash : Icon
batterySlash =
    Icon.Icon "battery-slash"


batteryThreeQuarters : Icon
batteryThreeQuarters =
    Icon.Icon "battery-three-quarters"


bed : Icon
bed =
    Icon.Icon "bed"


beer : Icon
beer =
    Icon.Icon "beer"


behance : Icon
behance =
    Icon.Logo "behance"


behanceSquare : Icon
behanceSquare =
    Icon.Logo "behance-square"


bell : Icon
bell =
    Icon.Icon "bell"


bellSlash : Icon
bellSlash =
    Icon.Icon "bell-slash"


bicycle : Icon
bicycle =
    Icon.Icon "bicycle"


binoculars : Icon
binoculars =
    Icon.Icon "binoculars"


birthdayCake : Icon
birthdayCake =
    Icon.Icon "birthday-cake"


bitbucket : Icon
bitbucket =
    Icon.Logo "bitbucket"


bitcoin : Icon
bitcoin =
    Icon.Logo "bitcoin"


bity : Icon
bity =
    Icon.Logo "bity"


blackTie : Icon
blackTie =
    Icon.Logo "black-tie"


blackberry : Icon
blackberry =
    Icon.Logo "blackberry"


blind : Icon
blind =
    Icon.Icon "blind"


blogger : Icon
blogger =
    Icon.Logo "blogger"


bloggerB : Icon
bloggerB =
    Icon.Logo "blogger-b"


bluetooth : Icon
bluetooth =
    Icon.Logo "bluetooth"


bluetoothB : Icon
bluetoothB =
    Icon.Logo "bluetooth-b"


bold : Icon
bold =
    Icon.Icon "bold"


bolt : Icon
bolt =
    Icon.Icon "bolt"


bomb : Icon
bomb =
    Icon.Icon "bomb"


book : Icon
book =
    Icon.Icon "book"


bookmark : Icon
bookmark =
    Icon.Icon "bookmark"


braille : Icon
braille =
    Icon.Icon "braille"


briefcase : Icon
briefcase =
    Icon.Icon "briefcase"


browser : Icon
browser =
    Icon.Icon "browser"


btc : Icon
btc =
    Icon.Logo "btc"


bug : Icon
bug =
    Icon.Icon "bug"


building : Icon
building =
    Icon.Icon "building"


bullhorn : Icon
bullhorn =
    Icon.Icon "bullhorn"


bullseye : Icon
bullseye =
    Icon.Icon "bullseye"


buromobelExperte : Icon
buromobelExperte =
    Icon.Logo "buromobelexperte"


bus : Icon
bus =
    Icon.Icon "bus"


buySellAds : Icon
buySellAds =
    Icon.Logo "buysellads"


cCAmazonPay : Icon
cCAmazonPay =
    Icon.Logo "cc-amazon-pay"


cCAmex : Icon
cCAmex =
    Icon.Logo "cc-amex"


cCApplePay : Icon
cCApplePay =
    Icon.Logo "cc-apple-pay"


cCDinersClub : Icon
cCDinersClub =
    Icon.Logo "cc-diners-club"


cCDiscover : Icon
cCDiscover =
    Icon.Logo "cc-discover"


cCJcb : Icon
cCJcb =
    Icon.Logo "cc-jcb"


cCMastercard : Icon
cCMastercard =
    Icon.Logo "cc-mastercard"


cCPayPal : Icon
cCPayPal =
    Icon.Logo "cc-paypal"


cCStripe : Icon
cCStripe =
    Icon.Logo "cc-stripe"


cCVisa : Icon
cCVisa =
    Icon.Logo "cc-visa"


cSS3 : Icon
cSS3 =
    Icon.Logo "css3"


cSS3Alt : Icon
cSS3Alt =
    Icon.Logo "css3-alt"


calculator : Icon
calculator =
    Icon.Icon "calculator"


calendar : Icon
calendar =
    Icon.Icon "calendar"


calendarAlt : Icon
calendarAlt =
    Icon.Icon "calendar-alt"


calendarCheck : Icon
calendarCheck =
    Icon.Icon "calendar-check"


calendarEdit : Icon
calendarEdit =
    Icon.Icon "calendar-edit"


calendarExclamation : Icon
calendarExclamation =
    Icon.Icon "calendar-exclamation"


calendarMinus : Icon
calendarMinus =
    Icon.Icon "calendar-minus"


calendarPlus : Icon
calendarPlus =
    Icon.Icon "calendar-plus"


calendarTimes : Icon
calendarTimes =
    Icon.Icon "calendar-times"


camera : Icon
camera =
    Icon.Icon "camera"


cameraAlt : Icon
cameraAlt =
    Icon.Icon "camera-alt"


cameraRetro : Icon
cameraRetro =
    Icon.Icon "camera-retro"


car : Icon
car =
    Icon.Icon "car"


caretCircleDown : Icon
caretCircleDown =
    Icon.Icon "caret-circle-down"


caretCircleLeft : Icon
caretCircleLeft =
    Icon.Icon "caret-circle-left"


caretCircleRight : Icon
caretCircleRight =
    Icon.Icon "caret-circle-right"


caretCircleUp : Icon
caretCircleUp =
    Icon.Icon "caret-circle-up"


caretDown : Icon
caretDown =
    Icon.Icon "caret-down"


caretLeft : Icon
caretLeft =
    Icon.Icon "caret-left"


caretRight : Icon
caretRight =
    Icon.Icon "caret-right"


caretSquareDown : Icon
caretSquareDown =
    Icon.Icon "caret-square-down"


caretSquareLeft : Icon
caretSquareLeft =
    Icon.Icon "caret-square-left"


caretSquareRight : Icon
caretSquareRight =
    Icon.Icon "caret-square-right"


caretSquareUp : Icon
caretSquareUp =
    Icon.Icon "caret-square-up"


caretUp : Icon
caretUp =
    Icon.Icon "caret-up"


cartArrowDown : Icon
cartArrowDown =
    Icon.Icon "cart-arrow-down"


cartPlus : Icon
cartPlus =
    Icon.Icon "cart-plus"


centercode : Icon
centercode =
    Icon.Logo "centercode"


certificate : Icon
certificate =
    Icon.Icon "certificate"


chartArea : Icon
chartArea =
    Icon.Icon "chart-area"


chartBar : Icon
chartBar =
    Icon.Icon "chart-bar"


chartLine : Icon
chartLine =
    Icon.Icon "chart-line"


chartPie : Icon
chartPie =
    Icon.Icon "chart-pie"


check : Icon
check =
    Icon.Icon "check"


checkCircle : Icon
checkCircle =
    Icon.Icon "check-circle"


checkSquare : Icon
checkSquare =
    Icon.Icon "check-square"


chevronCircleDown : Icon
chevronCircleDown =
    Icon.Icon "chevron-circle-down"


chevronCircleLeft : Icon
chevronCircleLeft =
    Icon.Icon "chevron-circle-left"


chevronCircleRight : Icon
chevronCircleRight =
    Icon.Icon "chevron-circle-right"


chevronCircleUp : Icon
chevronCircleUp =
    Icon.Icon "chevron-circle-up"


chevronDoubleDown : Icon
chevronDoubleDown =
    Icon.Icon "chevron-double-down"


chevronDoubleLeft : Icon
chevronDoubleLeft =
    Icon.Icon "chevron-double-left"


chevronDoubleRight : Icon
chevronDoubleRight =
    Icon.Icon "chevron-double-right"


chevronDoubleUp : Icon
chevronDoubleUp =
    Icon.Icon "chevron-double-up"


chevronDown : Icon
chevronDown =
    Icon.Icon "chevron-down"


chevronLeft : Icon
chevronLeft =
    Icon.Icon "chevron-left"


chevronRight : Icon
chevronRight =
    Icon.Icon "chevron-right"


chevronSquareDown : Icon
chevronSquareDown =
    Icon.Icon "chevron-square-down"


chevronSquareLeft : Icon
chevronSquareLeft =
    Icon.Icon "chevron-square-left"


chevronSquareRight : Icon
chevronSquareRight =
    Icon.Icon "chevron-square-right"


chevronSquareUp : Icon
chevronSquareUp =
    Icon.Icon "chevron-square-up"


chevronUp : Icon
chevronUp =
    Icon.Icon "chevron-up"


child : Icon
child =
    Icon.Icon "child"


chrome : Icon
chrome =
    Icon.Logo "chrome"


circle : Icon
circle =
    Icon.Icon "circle"


circleNotch : Icon
circleNotch =
    Icon.Icon "circle-notch"


clipboard : Icon
clipboard =
    Icon.Icon "clipboard"


clock : Icon
clock =
    Icon.Icon "clock"


clone : Icon
clone =
    Icon.Icon "clone"


closedCaptioning : Icon
closedCaptioning =
    Icon.Icon "closed-captioning"


cloud : Icon
cloud =
    Icon.Icon "cloud"


cloudDownload : Icon
cloudDownload =
    Icon.Icon "cloud-download"


cloudDownloadAlt : Icon
cloudDownloadAlt =
    Icon.Icon "cloud-download-alt"


cloudScale : Icon
cloudScale =
    Icon.Logo "cloudscale"


cloudUpload : Icon
cloudUpload =
    Icon.Icon "cloud-upload"


cloudUploadAlt : Icon
cloudUploadAlt =
    Icon.Icon "cloud-upload-alt"


cloudsmith : Icon
cloudsmith =
    Icon.Logo "cloudsmith"


cloudversify : Icon
cloudversify =
    Icon.Logo "cloudversify"


club : Icon
club =
    Icon.Icon "club"


code : Icon
code =
    Icon.Icon "code"


codeBranch : Icon
codeBranch =
    Icon.Icon "code-branch"


codeCommit : Icon
codeCommit =
    Icon.Icon "code-commit"


codeMerge : Icon
codeMerge =
    Icon.Icon "code-merge"


codePen : Icon
codePen =
    Icon.Logo "codepen"


codiePie : Icon
codiePie =
    Icon.Logo "codiepie"


coffee : Icon
coffee =
    Icon.Icon "coffee"


cog : Icon
cog =
    Icon.Icon "cog"


cogs : Icon
cogs =
    Icon.Icon "cogs"


columns : Icon
columns =
    Icon.Icon "columns"


comment : Icon
comment =
    Icon.Icon "comment"


commentAlt : Icon
commentAlt =
    Icon.Icon "comment-alt"


comments : Icon
comments =
    Icon.Icon "comments"


compass : Icon
compass =
    Icon.Icon "compass"


compress : Icon
compress =
    Icon.Icon "compress"


compressAlt : Icon
compressAlt =
    Icon.Icon "compress-alt"


compressWide : Icon
compressWide =
    Icon.Icon "compress-wide"


connectDevelop : Icon
connectDevelop =
    Icon.Logo "connectdevelop"


contao : Icon
contao =
    Icon.Logo "contao"


copy : Icon
copy =
    Icon.Icon "copy"


copyright : Icon
copyright =
    Icon.Icon "copyright"


cpanel : Icon
cpanel =
    Icon.Logo "cpanel"


creativeCommons : Icon
creativeCommons =
    Icon.Logo "creative-commons"


creditCard : Icon
creditCard =
    Icon.Icon "credit-card"


creditCardBlank : Icon
creditCardBlank =
    Icon.Icon "credit-card-blank"


creditCardFront : Icon
creditCardFront =
    Icon.Icon "credit-card-front"


crop : Icon
crop =
    Icon.Icon "crop"


crosshairs : Icon
crosshairs =
    Icon.Icon "crosshairs"


cube : Icon
cube =
    Icon.Icon "cube"


cubes : Icon
cubes =
    Icon.Icon "cubes"


cut : Icon
cut =
    Icon.Icon "cut"


cuttlefish : Icon
cuttlefish =
    Icon.Logo "cuttlefish"


dAndD : Icon
dAndD =
    Icon.Logo "d-and-d"


dashcube : Icon
dashcube =
    Icon.Logo "dashcube"


database : Icon
database =
    Icon.Icon "database"


deaf : Icon
deaf =
    Icon.Icon "deaf"


delicious : Icon
delicious =
    Icon.Logo "delicious"


deployDog : Icon
deployDog =
    Icon.Logo "deploydog"


deskpro : Icon
deskpro =
    Icon.Logo "deskpro"


desktop : Icon
desktop =
    Icon.Icon "desktop"


desktopAlt : Icon
desktopAlt =
    Icon.Icon "desktop-alt"


deviantArt : Icon
deviantArt =
    Icon.Logo "deviantart"


diamond : Icon
diamond =
    Icon.Icon "diamond"


digg : Icon
digg =
    Icon.Logo "digg"


digitalOcean : Icon
digitalOcean =
    Icon.Logo "digital-ocean"


discord : Icon
discord =
    Icon.Logo "discord"


discourse : Icon
discourse =
    Icon.Logo "discourse"


docHub : Icon
docHub =
    Icon.Logo "dochub"


docker : Icon
docker =
    Icon.Logo "docker"


dollarSign : Icon
dollarSign =
    Icon.Icon "dollar-sign"


dotCircle : Icon
dotCircle =
    Icon.Icon "dot-circle"


download : Icon
download =
    Icon.Icon "download"


draft2Digital : Icon
draft2Digital =
    Icon.Logo "draft2digital"


dribbble : Icon
dribbble =
    Icon.Logo "dribbble"


dribbbleSquare : Icon
dribbbleSquare =
    Icon.Logo "dribbble-square"


dropbox : Icon
dropbox =
    Icon.Logo "dropbox"


drupal : Icon
drupal =
    Icon.Logo "drupal"


dyalog : Icon
dyalog =
    Icon.Logo "dyalog"


earlyBirds : Icon
earlyBirds =
    Icon.Logo "earlybirds"


edge : Icon
edge =
    Icon.Logo "edge"


edit : Icon
edit =
    Icon.Icon "edit"


eject : Icon
eject =
    Icon.Icon "eject"


elementor : Icon
elementor =
    Icon.Logo "elementor"


ellipsisHorizontal : Icon
ellipsisHorizontal =
    Icon.Icon "ellipsis-h"


ellipsisHorizontalAlt : Icon
ellipsisHorizontalAlt =
    Icon.Icon "ellipsis-h-alt"


ellipsisVertical : Icon
ellipsisVertical =
    Icon.Icon "ellipsis-v"


ellipsisVerticalAlt : Icon
ellipsisVerticalAlt =
    Icon.Icon "ellipsis-v-alt"


ember : Icon
ember =
    Icon.Logo "ember"


empire : Icon
empire =
    Icon.Logo "empire"


envelope : Icon
envelope =
    Icon.Icon "envelope"


envelopeOpen : Icon
envelopeOpen =
    Icon.Icon "envelope-open"


envelopeSquare : Icon
envelopeSquare =
    Icon.Icon "envelope-square"


envira : Icon
envira =
    Icon.Logo "envira"


eraser : Icon
eraser =
    Icon.Icon "eraser"


erlang : Icon
erlang =
    Icon.Logo "erlang"


ethereum : Icon
ethereum =
    Icon.Logo "ethereum"


etsy : Icon
etsy =
    Icon.Logo "etsy"


euroSign : Icon
euroSign =
    Icon.Icon "euro-sign"


exchange : Icon
exchange =
    Icon.Icon "exchange"


exchangeAlt : Icon
exchangeAlt =
    Icon.Icon "exchange-alt"


exclamation : Icon
exclamation =
    Icon.Icon "exclamation"


exclamationCircle : Icon
exclamationCircle =
    Icon.Icon "exclamation-circle"


exclamationSquare : Icon
exclamationSquare =
    Icon.Icon "exclamation-square"


exclamationTriangle : Icon
exclamationTriangle =
    Icon.Icon "exclamation-triangle"


expand : Icon
expand =
    Icon.Icon "expand"


expandAlt : Icon
expandAlt =
    Icon.Icon "expand-alt"


expandArrows : Icon
expandArrows =
    Icon.Icon "expand-arrows"


expandArrowsAlt : Icon
expandArrowsAlt =
    Icon.Icon "expand-arrows-alt"


expandWide : Icon
expandWide =
    Icon.Icon "expand-wide"


expeditedSSL : Icon
expeditedSSL =
    Icon.Logo "expeditedssl"


externalLink : Icon
externalLink =
    Icon.Icon "external-link"


externalLinkAlt : Icon
externalLinkAlt =
    Icon.Icon "external-link-alt"


externalLinkSquare : Icon
externalLinkSquare =
    Icon.Icon "external-link-square"


externalLinkSquareAlt : Icon
externalLinkSquareAlt =
    Icon.Icon "external-link-square-alt"


eye : Icon
eye =
    Icon.Icon "eye"


eyeDropper : Icon
eyeDropper =
    Icon.Icon "eye-dropper"


eyeSlash : Icon
eyeSlash =
    Icon.Icon "eye-slash"


facebook : Icon
facebook =
    Icon.Logo "facebook"


facebookF : Icon
facebookF =
    Icon.Logo "facebook-f"


facebookMessenger : Icon
facebookMessenger =
    Icon.Logo "facebook-messenger"


facebookSquare : Icon
facebookSquare =
    Icon.Logo "facebook-square"


fastBackward : Icon
fastBackward =
    Icon.Icon "fast-backward"


fastForward : Icon
fastForward =
    Icon.Icon "fast-forward"


fax : Icon
fax =
    Icon.Icon "fax"


female : Icon
female =
    Icon.Icon "female"


fighterJet : Icon
fighterJet =
    Icon.Icon "fighter-jet"


file : Icon
file =
    Icon.Icon "file"


fileAlt : Icon
fileAlt =
    Icon.Icon "file-alt"


fileArchive : Icon
fileArchive =
    Icon.Icon "file-archive"


fileAudio : Icon
fileAudio =
    Icon.Icon "file-audio"


fileCheck : Icon
fileCheck =
    Icon.Icon "file-check"


fileCode : Icon
fileCode =
    Icon.Icon "file-code"


fileEdit : Icon
fileEdit =
    Icon.Icon "file-edit"


fileExcel : Icon
fileExcel =
    Icon.Icon "file-excel"


fileExclamation : Icon
fileExclamation =
    Icon.Icon "file-exclamation"


fileImage : Icon
fileImage =
    Icon.Icon "file-image"


fileMinus : Icon
fileMinus =
    Icon.Icon "file-minus"


filePdf : Icon
filePdf =
    Icon.Icon "file-pdf"


filePlus : Icon
filePlus =
    Icon.Icon "file-plus"


filePowerpoint : Icon
filePowerpoint =
    Icon.Icon "file-powerpoint"


fileTimes : Icon
fileTimes =
    Icon.Icon "file-times"


fileVideo : Icon
fileVideo =
    Icon.Icon "file-video"


fileWord : Icon
fileWord =
    Icon.Icon "file-word"


film : Icon
film =
    Icon.Icon "film"


filmAlt : Icon
filmAlt =
    Icon.Icon "film-alt"


filter : Icon
filter =
    Icon.Icon "filter"


fire : Icon
fire =
    Icon.Icon "fire"


fireExtinguisher : Icon
fireExtinguisher =
    Icon.Icon "fire-extinguisher"


firefox : Icon
firefox =
    Icon.Logo "firefox"


firstDraft : Icon
firstDraft =
    Icon.Logo "firstdraft"


firstOrder : Icon
firstOrder =
    Icon.Logo "first-order"


fiveHundredPx : Icon
fiveHundredPx =
    Icon.Logo "500px"


flag : Icon
flag =
    Icon.Icon "flag"


flagCheckered : Icon
flagCheckered =
    Icon.Icon "flag-checkered"


flask : Icon
flask =
    Icon.Icon "flask"


flickr : Icon
flickr =
    Icon.Logo "flickr"


fly : Icon
fly =
    Icon.Logo "fly"


folder : Icon
folder =
    Icon.Icon "folder"


folderOpen : Icon
folderOpen =
    Icon.Icon "folder-open"


font : Icon
font =
    Icon.Icon "font"


fontAwesome : Icon
fontAwesome =
    Icon.Logo "font-awesome"


fontAwesomeAlt : Icon
fontAwesomeAlt =
    Icon.Logo "font-awesome-alt"


fontAwesomeFlag : Icon
fontAwesomeFlag =
    Icon.Logo "font-awesome-flag"


fontIcons : Icon
fontIcons =
    Icon.Logo "fonticons"


fontIconsFi : Icon
fontIconsFi =
    Icon.Logo "fonticons-fi"


fortAwesome : Icon
fortAwesome =
    Icon.Logo "fort-awesome"


fortAwesomeAlt : Icon
fortAwesomeAlt =
    Icon.Logo "fort-awesome-alt"


forumbee : Icon
forumbee =
    Icon.Logo "forumbee"


forward : Icon
forward =
    Icon.Icon "forward"


foursquare : Icon
foursquare =
    Icon.Logo "foursquare"


freeBSD : Icon
freeBSD =
    Icon.Logo "freebsd"


freeCodeCamp : Icon
freeCodeCamp =
    Icon.Logo "free-code-camp"


frown : Icon
frown =
    Icon.Icon "frown"


futbol : Icon
futbol =
    Icon.Icon "futbol"


gG : Icon
gG =
    Icon.Logo "gg"


gGCircle : Icon
gGCircle =
    Icon.Logo "gg-circle"


gamepad : Icon
gamepad =
    Icon.Icon "gamepad"


gavel : Icon
gavel =
    Icon.Icon "gavel"


gem : Icon
gem =
    Icon.Icon "gem"


genderless : Icon
genderless =
    Icon.Icon "genderless"


getPocket : Icon
getPocket =
    Icon.Logo "get-pocket"


gift : Icon
gift =
    Icon.Icon "gift"


git : Icon
git =
    Icon.Logo "git"


gitHub : Icon
gitHub =
    Icon.Logo "github"


gitHubAlt : Icon
gitHubAlt =
    Icon.Logo "github-alt"


gitHubSquare : Icon
gitHubSquare =
    Icon.Logo "github-square"


gitKraken : Icon
gitKraken =
    Icon.Logo "gitkraken"


gitLab : Icon
gitLab =
    Icon.Logo "gitlab"


gitSquare : Icon
gitSquare =
    Icon.Logo "git-square"


gitter : Icon
gitter =
    Icon.Logo "gitter"


glassMartini : Icon
glassMartini =
    Icon.Icon "glass-martini"


glide : Icon
glide =
    Icon.Logo "glide"


glideG : Icon
glideG =
    Icon.Logo "glide-g"


globe : Icon
globe =
    Icon.Icon "globe"


gofore : Icon
gofore =
    Icon.Logo "gofore"


goodreads : Icon
goodreads =
    Icon.Logo "goodreads"


goodreadsG : Icon
goodreadsG =
    Icon.Logo "goodreads-g"


google : Icon
google =
    Icon.Logo "google"


googleDrive : Icon
googleDrive =
    Icon.Logo "google-drive"


googlePlay : Icon
googlePlay =
    Icon.Logo "google-play"


googlePlus : Icon
googlePlus =
    Icon.Logo "google-plus"


googlePlusG : Icon
googlePlusG =
    Icon.Logo "google-plus-g"


googlePlusSquare : Icon
googlePlusSquare =
    Icon.Logo "google-plus-square"


googleWallet : Icon
googleWallet =
    Icon.Logo "google-wallet"


graduationCap : Icon
graduationCap =
    Icon.Icon "graduation-cap"


gratipay : Icon
gratipay =
    Icon.Logo "gratipay"


grav : Icon
grav =
    Icon.Logo "grav"


gripfire : Icon
gripfire =
    Icon.Logo "gripfire"


grunt : Icon
grunt =
    Icon.Logo "grunt"


gulp : Icon
gulp =
    Icon.Logo "gulp"


h1 : Icon
h1 =
    Icon.Icon "h1"


h2 : Icon
h2 =
    Icon.Icon "h2"


h3 : Icon
h3 =
    Icon.Icon "h3"


hSquare : Icon
hSquare =
    Icon.Icon "h-square"


hackerNews : Icon
hackerNews =
    Icon.Logo "hacker-news"


hackerNewsSquare : Icon
hackerNewsSquare =
    Icon.Logo "hacker-news-square"


handLizard : Icon
handLizard =
    Icon.Icon "hand-lizard"


handPaper : Icon
handPaper =
    Icon.Icon "hand-paper"


handPeace : Icon
handPeace =
    Icon.Icon "hand-peace"


handPointDown : Icon
handPointDown =
    Icon.Icon "hand-point-down"


handPointLeft : Icon
handPointLeft =
    Icon.Icon "hand-point-left"


handPointRight : Icon
handPointRight =
    Icon.Icon "hand-point-right"


handPointUp : Icon
handPointUp =
    Icon.Icon "hand-point-up"


handPointer : Icon
handPointer =
    Icon.Icon "hand-pointer"


handRock : Icon
handRock =
    Icon.Icon "hand-rock"


handScissors : Icon
handScissors =
    Icon.Icon "hand-scissors"


handSpock : Icon
handSpock =
    Icon.Icon "hand-spock"


handshake : Icon
handshake =
    Icon.Icon "handshake"


hashtag : Icon
hashtag =
    Icon.Icon "hashtag"


hdd : Icon
hdd =
    Icon.Icon "hdd"


heading : Icon
heading =
    Icon.Icon "heading"


headphones : Icon
headphones =
    Icon.Icon "headphones"


heart : Icon
heart =
    Icon.Icon "heart"


heartbeat : Icon
heartbeat =
    Icon.Icon "heartbeat"


hexagon : Icon
hexagon =
    Icon.Icon "hexagon"


hireAHelper : Icon
hireAHelper =
    Icon.Logo "hire-a-helper"


history : Icon
history =
    Icon.Icon "history"


home : Icon
home =
    Icon.Icon "home"


hooli : Icon
hooli =
    Icon.Logo "hooli"


hospital : Icon
hospital =
    Icon.Icon "hospital"


hotjar : Icon
hotjar =
    Icon.Logo "hotjar"


hourglass : Icon
hourglass =
    Icon.Icon "hourglass"


hourglassEnd : Icon
hourglassEnd =
    Icon.Icon "hourglass-end"


hourglassHalf : Icon
hourglassHalf =
    Icon.Icon "hourglass-half"


hourglassStart : Icon
hourglassStart =
    Icon.Icon "hourglass-start"


houzz : Icon
houzz =
    Icon.Logo "houzz"


html5 : Icon
html5 =
    Icon.Logo "html5"


hubSpot : Icon
hubSpot =
    Icon.Logo "hubspot"


iCursor : Icon
iCursor =
    Icon.Icon "i-cursor"


idBadge : Icon
idBadge =
    Icon.Icon "id-badge"


idCard : Icon
idCard =
    Icon.Icon "id-card"


image : Icon
image =
    Icon.Icon "image"


images : Icon
images =
    Icon.Icon "images"


imdb : Icon
imdb =
    Icon.Logo "imdb"


inbox : Icon
inbox =
    Icon.Icon "inbox"


inboxIn : Icon
inboxIn =
    Icon.Icon "inbox-in"


inboxOut : Icon
inboxOut =
    Icon.Icon "inbox-out"


indent : Icon
indent =
    Icon.Icon "indent"


industry : Icon
industry =
    Icon.Icon "industry"


industryAlt : Icon
industryAlt =
    Icon.Icon "industry-alt"


info : Icon
info =
    Icon.Icon "info"


infoCircle : Icon
infoCircle =
    Icon.Icon "info-circle"


infoSquare : Icon
infoSquare =
    Icon.Icon "info-square"


instagram : Icon
instagram =
    Icon.Logo "instagram"


internetExplorer : Icon
internetExplorer =
    Icon.Logo "internet-explorer"


ioxHost : Icon
ioxHost =
    Icon.Logo "ioxhost"


italic : Icon
italic =
    Icon.Icon "italic"


itunes : Icon
itunes =
    Icon.Logo "itunes"


itunesNote : Icon
itunesNote =
    Icon.Logo "itunes-note"


jSFiddle : Icon
jSFiddle =
    Icon.Logo "jsfiddle"


jackOLantern : Icon
jackOLantern =
    Icon.Icon "jack-o-lantern"


jenkins : Icon
jenkins =
    Icon.Logo "jenkins"


joget : Icon
joget =
    Icon.Logo "joget"


joomla : Icon
joomla =
    Icon.Logo "joomla"


js : Icon
js =
    Icon.Logo "js"


jsSquare : Icon
jsSquare =
    Icon.Logo "js-square"


key : Icon
key =
    Icon.Icon "key"


keyCDN : Icon
keyCDN =
    Icon.Logo "keycdn"


keyboard : Icon
keyboard =
    Icon.Icon "keyboard"


kickstarter : Icon
kickstarter =
    Icon.Logo "kickstarter"


kickstarterK : Icon
kickstarterK =
    Icon.Logo "kickstarter-k"


korvue : Icon
korvue =
    Icon.Logo "korvue"


language : Icon
language =
    Icon.Icon "language"


laptop : Icon
laptop =
    Icon.Icon "laptop"


laravel : Icon
laravel =
    Icon.Logo "laravel"


lastfm : Icon
lastfm =
    Icon.Logo "lastfm"


lastfmSquare : Icon
lastfmSquare =
    Icon.Logo "lastfm-square"


leaf : Icon
leaf =
    Icon.Icon "leaf"


leanpub : Icon
leanpub =
    Icon.Logo "leanpub"


lemon : Icon
lemon =
    Icon.Icon "lemon"


less : Icon
less =
    Icon.Logo "less"


levelDown : Icon
levelDown =
    Icon.Icon "level-down"


levelDownAlt : Icon
levelDownAlt =
    Icon.Icon "level-down-alt"


levelUp : Icon
levelUp =
    Icon.Icon "level-up"


levelUpAlt : Icon
levelUpAlt =
    Icon.Icon "level-up-alt"


lifeRing : Icon
lifeRing =
    Icon.Icon "life-ring"


lightbulb : Icon
lightbulb =
    Icon.Icon "lightbulb"


line : Icon
line =
    Icon.Logo "line"


link : Icon
link =
    Icon.Icon "link"


linkedIn : Icon
linkedIn =
    Icon.Logo "linkedin"


linkedInInverted : Icon
linkedInInverted =
    Icon.Logo "linkedin-in"


linode : Icon
linode =
    Icon.Logo "linode"


linux : Icon
linux =
    Icon.Logo "linux"


liraSign : Icon
liraSign =
    Icon.Icon "lira-sign"


list : Icon
list =
    Icon.Icon "list"


listAlt : Icon
listAlt =
    Icon.Icon "list-alt"


listOl : Icon
listOl =
    Icon.Icon "list-ol"


listUl : Icon
listUl =
    Icon.Icon "list-ul"


locationArrow : Icon
locationArrow =
    Icon.Icon "location-arrow"


lock : Icon
lock =
    Icon.Icon "lock"


lockAlt : Icon
lockAlt =
    Icon.Icon "lock-alt"


lockOpen : Icon
lockOpen =
    Icon.Icon "lock-open"


lockOpenAlt : Icon
lockOpenAlt =
    Icon.Icon "lock-open-alt"


longArrowAltDown : Icon
longArrowAltDown =
    Icon.Icon "long-arrow-alt-down"


longArrowAltLeft : Icon
longArrowAltLeft =
    Icon.Icon "long-arrow-alt-left"


longArrowAltRight : Icon
longArrowAltRight =
    Icon.Icon "long-arrow-alt-right"


longArrowAltUp : Icon
longArrowAltUp =
    Icon.Icon "long-arrow-alt-up"


longArrowDown : Icon
longArrowDown =
    Icon.Icon "long-arrow-down"


longArrowLeft : Icon
longArrowLeft =
    Icon.Icon "long-arrow-left"


longArrowRight : Icon
longArrowRight =
    Icon.Icon "long-arrow-right"


longArrowUp : Icon
longArrowUp =
    Icon.Icon "long-arrow-up"


lowVision : Icon
lowVision =
    Icon.Icon "low-vision"


lyft : Icon
lyft =
    Icon.Logo "lyft"


mODX : Icon
mODX =
    Icon.Logo "modx"


magento : Icon
magento =
    Icon.Logo "magento"


magic : Icon
magic =
    Icon.Icon "magic"


magnet : Icon
magnet =
    Icon.Icon "magnet"


male : Icon
male =
    Icon.Icon "male"


map : Icon
map =
    Icon.Icon "map"


mapMarker : Icon
mapMarker =
    Icon.Icon "map-marker"


mapMarkerAlt : Icon
mapMarkerAlt =
    Icon.Icon "map-marker-alt"


mapPin : Icon
mapPin =
    Icon.Icon "map-pin"


mapSigns : Icon
mapSigns =
    Icon.Icon "map-signs"


mars : Icon
mars =
    Icon.Icon "mars"


marsDouble : Icon
marsDouble =
    Icon.Icon "mars-double"


marsStroke : Icon
marsStroke =
    Icon.Icon "mars-stroke"


marsStrokeHorizontal : Icon
marsStrokeHorizontal =
    Icon.Icon "mars-stroke-h"


marsStrokeVertical : Icon
marsStrokeVertical =
    Icon.Icon "mars-stroke-v"


maxcdn : Icon
maxcdn =
    Icon.Logo "maxcdn"


medApps : Icon
medApps =
    Icon.Logo "medapps"


medium : Icon
medium =
    Icon.Logo "medium"


mediumM : Icon
mediumM =
    Icon.Logo "medium-m"


medkit : Icon
medkit =
    Icon.Icon "medkit"


medrt : Icon
medrt =
    Icon.Logo "medrt"


meetup : Icon
meetup =
    Icon.Logo "meetup"


meh : Icon
meh =
    Icon.Icon "meh"


mercury : Icon
mercury =
    Icon.Icon "mercury"


microchip : Icon
microchip =
    Icon.Icon "microchip"


microphone : Icon
microphone =
    Icon.Icon "microphone"


microphoneAlt : Icon
microphoneAlt =
    Icon.Icon "microphone-alt"


microphoneSlash : Icon
microphoneSlash =
    Icon.Icon "microphone-slash"


microsoft : Icon
microsoft =
    Icon.Logo "microsoft"


minus : Icon
minus =
    Icon.Icon "minus"


minusCircle : Icon
minusCircle =
    Icon.Icon "minus-circle"


minusHexagon : Icon
minusHexagon =
    Icon.Icon "minus-hexagon"


minusOctagon : Icon
minusOctagon =
    Icon.Icon "minus-octagon"


minusSquare : Icon
minusSquare =
    Icon.Icon "minus-square"


mix : Icon
mix =
    Icon.Logo "mix"


mixcloud : Icon
mixcloud =
    Icon.Logo "mixcloud"


mizuni : Icon
mizuni =
    Icon.Logo "mizuni"


mobile : Icon
mobile =
    Icon.Icon "mobile"


mobileAlt : Icon
mobileAlt =
    Icon.Icon "mobile-alt"


mobileAndroid : Icon
mobileAndroid =
    Icon.Icon "mobile-android"


mobileAndroidAlt : Icon
mobileAndroidAlt =
    Icon.Icon "mobile-android-alt"


monero : Icon
monero =
    Icon.Logo "monero"


moneyBill : Icon
moneyBill =
    Icon.Icon "money-bill"


moneyBillAlt : Icon
moneyBillAlt =
    Icon.Icon "money-bill-alt"


moon : Icon
moon =
    Icon.Icon "moon"


motorcycle : Icon
motorcycle =
    Icon.Icon "motorcycle"


mousePointer : Icon
mousePointer =
    Icon.Icon "mouse-pointer"


music : Icon
music =
    Icon.Icon "music"


nS8 : Icon
nS8 =
    Icon.Logo "ns8"


napster : Icon
napster =
    Icon.Logo "napster"


neuter : Icon
neuter =
    Icon.Icon "neuter"


newspaper : Icon
newspaper =
    Icon.Icon "newspaper"


nintendoSwitch : Icon
nintendoSwitch =
    Icon.Logo "nintendo-switch"


node : Icon
node =
    Icon.Logo "node"


nodejs : Icon
nodejs =
    Icon.Logo "node-js"


npm : Icon
npm =
    Icon.Logo "npm"


nutritionix : Icon
nutritionix =
    Icon.Logo "nutritionix"


objectGroup : Icon
objectGroup =
    Icon.Icon "object-group"


objectUngroup : Icon
objectUngroup =
    Icon.Icon "object-ungroup"


octagon : Icon
octagon =
    Icon.Icon "octagon"


odnoklassniki : Icon
odnoklassniki =
    Icon.Logo "odnoklassniki"


odnoklassnikiSquare : Icon
odnoklassnikiSquare =
    Icon.Logo "odnoklassniki-square"


openCart : Icon
openCart =
    Icon.Logo "opencart"


openID : Icon
openID =
    Icon.Logo "openid"


openSourceInitiative : Icon
openSourceInitiative =
    Icon.Logo "osi"


opera : Icon
opera =
    Icon.Logo "opera"


optinMonster : Icon
optinMonster =
    Icon.Logo "optin-monster"


outdent : Icon
outdent =
    Icon.Icon "outdent"


page4 : Icon
page4 =
    Icon.Logo "page4"


pageLines : Icon
pageLines =
    Icon.Logo "pagelines"


paintBrush : Icon
paintBrush =
    Icon.Icon "paint-brush"


palFed : Icon
palFed =
    Icon.Logo "palfed"


paperPlane : Icon
paperPlane =
    Icon.Icon "paper-plane"


paperclip : Icon
paperclip =
    Icon.Icon "paperclip"


paragraph : Icon
paragraph =
    Icon.Icon "paragraph"


paste : Icon
paste =
    Icon.Icon "paste"


patreon : Icon
patreon =
    Icon.Logo "patreon"


pause : Icon
pause =
    Icon.Icon "pause"


pauseCircle : Icon
pauseCircle =
    Icon.Icon "pause-circle"


paw : Icon
paw =
    Icon.Icon "paw"


payPal : Icon
payPal =
    Icon.Logo "paypal"


pen : Icon
pen =
    Icon.Icon "pen"


penAlt : Icon
penAlt =
    Icon.Icon "pen-alt"


penSquare : Icon
penSquare =
    Icon.Icon "pen-square"


pencil : Icon
pencil =
    Icon.Icon "pencil"


pencilAlt : Icon
pencilAlt =
    Icon.Icon "pencil-alt"


percent : Icon
percent =
    Icon.Icon "percent"


periscope : Icon
periscope =
    Icon.Logo "periscope"


phabricator : Icon
phabricator =
    Icon.Logo "phabricator"


phoenixFramework : Icon
phoenixFramework =
    Icon.Logo "phoenix-framework"


phone : Icon
phone =
    Icon.Icon "phone"


phoneSlash : Icon
phoneSlash =
    Icon.Icon "phone-slash"


phoneSquare : Icon
phoneSquare =
    Icon.Icon "phone-square"


phoneVolume : Icon
phoneVolume =
    Icon.Icon "phone-volume"


piedPiper : Icon
piedPiper =
    Icon.Logo "pied-piper"


piedPiperAlt : Icon
piedPiperAlt =
    Icon.Logo "pied-piper-alt"


piedPiperPp : Icon
piedPiperPp =
    Icon.Logo "pied-piper-pp"


pinterest : Icon
pinterest =
    Icon.Logo "pinterest"


pinterestP : Icon
pinterestP =
    Icon.Logo "pinterest-p"


pinterestSquare : Icon
pinterestSquare =
    Icon.Logo "pinterest-square"


plane : Icon
plane =
    Icon.Icon "plane"


planeAlt : Icon
planeAlt =
    Icon.Icon "plane-alt"


play : Icon
play =
    Icon.Icon "play"


playCircle : Icon
playCircle =
    Icon.Icon "play-circle"


playstation : Icon
playstation =
    Icon.Logo "playstation"


plug : Icon
plug =
    Icon.Icon "plug"


plus : Icon
plus =
    Icon.Icon "plus"


plusCircle : Icon
plusCircle =
    Icon.Icon "plus-circle"


plusHexagon : Icon
plusHexagon =
    Icon.Icon "plus-hexagon"


plusOctagon : Icon
plusOctagon =
    Icon.Icon "plus-octagon"


plusSquare : Icon
plusSquare =
    Icon.Icon "plus-square"


podcast : Icon
podcast =
    Icon.Icon "podcast"


poo : Icon
poo =
    Icon.Icon "poo"


portrait : Icon
portrait =
    Icon.Icon "portrait"


poundSign : Icon
poundSign =
    Icon.Icon "pound-sign"


powerOff : Icon
powerOff =
    Icon.Icon "power-off"


print : Icon
print =
    Icon.Icon "print"


productHunt : Icon
productHunt =
    Icon.Logo "product-hunt"


pushed : Icon
pushed =
    Icon.Logo "pushed"


puzzlePiece : Icon
puzzlePiece =
    Icon.Icon "puzzle-piece"


python : Icon
python =
    Icon.Logo "python"


qQ : Icon
qQ =
    Icon.Logo "qq"


qrcode : Icon
qrcode =
    Icon.Icon "qrcode"


question : Icon
question =
    Icon.Icon "question"


questionCircle : Icon
questionCircle =
    Icon.Icon "question-circle"


questionSquare : Icon
questionSquare =
    Icon.Icon "question-square"


quora : Icon
quora =
    Icon.Logo "quora"


quoteLeft : Icon
quoteLeft =
    Icon.Icon "quote-left"


quoteRight : Icon
quoteRight =
    Icon.Icon "quote-right"


rSS : Icon
rSS =
    Icon.Icon "rss"


rSSSquare : Icon
rSSSquare =
    Icon.Icon "rss-square"


random : Icon
random =
    Icon.Icon "random"


ravelry : Icon
ravelry =
    Icon.Logo "ravelry"


react : Icon
react =
    Icon.Logo "react"


rebel : Icon
rebel =
    Icon.Logo "rebel"


rectangleLandscape : Icon
rectangleLandscape =
    Icon.Icon "rectangle-landscape"


rectanglePortrait : Icon
rectanglePortrait =
    Icon.Icon "rectangle-portrait"


rectangleWide : Icon
rectangleWide =
    Icon.Icon "rectangle-wide"


recycle : Icon
recycle =
    Icon.Icon "recycle"


redRiver : Icon
redRiver =
    Icon.Logo "red-river"


reddit : Icon
reddit =
    Icon.Logo "reddit"


redditAlien : Icon
redditAlien =
    Icon.Logo "reddit-alien"


redditSquare : Icon
redditSquare =
    Icon.Logo "reddit-square"


redo : Icon
redo =
    Icon.Icon "redo"


redoAlt : Icon
redoAlt =
    Icon.Icon "redo-alt"


registered : Icon
registered =
    Icon.Icon "registered"


rendact : Icon
rendact =
    Icon.Logo "rendact"


renren : Icon
renren =
    Icon.Logo "renren"


repeat : Icon
repeat =
    Icon.Icon "repeat"


repeat1 : Icon
repeat1 =
    Icon.Icon "repeat-1"


repeat1Alt : Icon
repeat1Alt =
    Icon.Icon "repeat-1-alt"


repeatAlt : Icon
repeatAlt =
    Icon.Icon "repeat-alt"


reply : Icon
reply =
    Icon.Icon "reply"


replyAll : Icon
replyAll =
    Icon.Icon "reply-all"


replyd : Icon
replyd =
    Icon.Logo "replyd"


resolving : Icon
resolving =
    Icon.Logo "resolving"


retweet : Icon
retweet =
    Icon.Icon "retweet"


retweetAlt : Icon
retweetAlt =
    Icon.Icon "retweet-alt"


road : Icon
road =
    Icon.Icon "road"


rockRMS : Icon
rockRMS =
    Icon.Logo "rockrms"


rocket : Icon
rocket =
    Icon.Icon "rocket"


rocketChat : Icon
rocketChat =
    Icon.Logo "rocketchat"


rubleSign : Icon
rubleSign =
    Icon.Icon "ruble-sign"


rupeeSign : Icon
rupeeSign =
    Icon.Icon "rupee-sign"


safari : Icon
safari =
    Icon.Logo "safari"


sass : Icon
sass =
    Icon.Logo "sass"


save : Icon
save =
    Icon.Icon "save"


schlix : Icon
schlix =
    Icon.Logo "schlix"


scribd : Icon
scribd =
    Icon.Logo "scribd"


scrubber : Icon
scrubber =
    Icon.Icon "scrubber"


search : Icon
search =
    Icon.Icon "search"


searchMinus : Icon
searchMinus =
    Icon.Icon "search-minus"


searchPlus : Icon
searchPlus =
    Icon.Icon "search-plus"


searchengin : Icon
searchengin =
    Icon.Logo "searchengin"


sellCast : Icon
sellCast =
    Icon.Logo "sellcast"


sellsy : Icon
sellsy =
    Icon.Logo "sellsy"


server : Icon
server =
    Icon.Icon "server"


serviceStack : Icon
serviceStack =
    Icon.Logo "servicestack"


share : Icon
share =
    Icon.Icon "share"


shareAll : Icon
shareAll =
    Icon.Icon "share-all"


shareAlt : Icon
shareAlt =
    Icon.Icon "share-alt"


shareAltSquare : Icon
shareAltSquare =
    Icon.Icon "share-alt-square"


shareSquare : Icon
shareSquare =
    Icon.Icon "share-square"


shekelSign : Icon
shekelSign =
    Icon.Icon "shekel-sign"


shield : Icon
shield =
    Icon.Icon "shield"


shieldAlt : Icon
shieldAlt =
    Icon.Icon "shield-alt"


shieldCheck : Icon
shieldCheck =
    Icon.Icon "shield-check"


ship : Icon
ship =
    Icon.Icon "ship"


shirtsInBulk : Icon
shirtsInBulk =
    Icon.Logo "shirtsinbulk"


shoppingBag : Icon
shoppingBag =
    Icon.Icon "shopping-bag"


shoppingBasket : Icon
shoppingBasket =
    Icon.Icon "shopping-basket"


shoppingCart : Icon
shoppingCart =
    Icon.Icon "shopping-cart"


shower : Icon
shower =
    Icon.Icon "shower"


signIn : Icon
signIn =
    Icon.Icon "sign-in"


signInAlt : Icon
signInAlt =
    Icon.Icon "sign-in-alt"


signLanguage : Icon
signLanguage =
    Icon.Icon "sign-language"


signOut : Icon
signOut =
    Icon.Icon "sign-out"


signOutAlt : Icon
signOutAlt =
    Icon.Icon "sign-out-alt"


signal : Icon
signal =
    Icon.Icon "signal"


simplyBuilt : Icon
simplyBuilt =
    Icon.Logo "simplybuilt"


sistrix : Icon
sistrix =
    Icon.Logo "sistrix"


sitemap : Icon
sitemap =
    Icon.Icon "sitemap"


skyAtlas : Icon
skyAtlas =
    Icon.Logo "skyatlas"


skype : Icon
skype =
    Icon.Logo "skype"


slack : Icon
slack =
    Icon.Logo "slack"


slackHash : Icon
slackHash =
    Icon.Logo "slack-hash"


slidersHorizontal : Icon
slidersHorizontal =
    Icon.Icon "sliders-h"


slidersHorizontalSquare : Icon
slidersHorizontalSquare =
    Icon.Icon "sliders-h-square"


slidersV : Icon
slidersV =
    Icon.Icon "sliders-v"


slidersVSquare : Icon
slidersVSquare =
    Icon.Icon "sliders-v-square"


slideshare : Icon
slideshare =
    Icon.Logo "slideshare"


smile : Icon
smile =
    Icon.Icon "smile"


snapchat : Icon
snapchat =
    Icon.Logo "snapchat"


snapchatGhost : Icon
snapchatGhost =
    Icon.Logo "snapchat-ghost"


snapchatSquare : Icon
snapchatSquare =
    Icon.Logo "snapchat-square"


snowflake : Icon
snowflake =
    Icon.Icon "snowflake"


sort : Icon
sort =
    Icon.Icon "sort"


sortAlphaDown : Icon
sortAlphaDown =
    Icon.Icon "sort-alpha-down"


sortAlphaUp : Icon
sortAlphaUp =
    Icon.Icon "sort-alpha-up"


sortAmountDown : Icon
sortAmountDown =
    Icon.Icon "sort-amount-down"


sortAmountUp : Icon
sortAmountUp =
    Icon.Icon "sort-amount-up"


sortDown : Icon
sortDown =
    Icon.Icon "sort-down"


sortNumericDown : Icon
sortNumericDown =
    Icon.Icon "sort-numeric-down"


sortNumericUp : Icon
sortNumericUp =
    Icon.Icon "sort-numeric-up"


sortUp : Icon
sortUp =
    Icon.Icon "sort-up"


soundCloud : Icon
soundCloud =
    Icon.Logo "soundcloud"


spaceShuttle : Icon
spaceShuttle =
    Icon.Icon "space-shuttle"


spade : Icon
spade =
    Icon.Icon "spade"


speakap : Icon
speakap =
    Icon.Logo "speakap"


spinner : Icon
spinner =
    Icon.Icon "spinner"


spinnerThird : Icon
spinnerThird =
    Icon.Icon "spinner-third"


spotify : Icon
spotify =
    Icon.Logo "spotify"


square : Icon
square =
    Icon.Icon "square"


stackExchange : Icon
stackExchange =
    Icon.Logo "stack-exchange"


stackOverflow : Icon
stackOverflow =
    Icon.Logo "stack-overflow"


star : Icon
star =
    Icon.Icon "star"


starExclamation : Icon
starExclamation =
    Icon.Icon "star-exclamation"


starHalf : Icon
starHalf =
    Icon.Icon "star-half"


stayLinked : Icon
stayLinked =
    Icon.Logo "staylinked"


steam : Icon
steam =
    Icon.Logo "steam"


steamSquare : Icon
steamSquare =
    Icon.Logo "steam-square"


steamSymbol : Icon
steamSymbol =
    Icon.Logo "steam-symbol"


stepBackward : Icon
stepBackward =
    Icon.Icon "step-backward"


stepForward : Icon
stepForward =
    Icon.Icon "step-forward"


stethoscope : Icon
stethoscope =
    Icon.Icon "stethoscope"


stickerMule : Icon
stickerMule =
    Icon.Logo "sticker-mule"


stickyNote : Icon
stickyNote =
    Icon.Icon "sticky-note"


stop : Icon
stop =
    Icon.Icon "stop"


stopCircle : Icon
stopCircle =
    Icon.Icon "stop-circle"


stopwatch : Icon
stopwatch =
    Icon.Icon "stopwatch"


strava : Icon
strava =
    Icon.Logo "strava"


streetView : Icon
streetView =
    Icon.Icon "street-view"


strikethrough : Icon
strikethrough =
    Icon.Icon "strikethrough"


stripe : Icon
stripe =
    Icon.Logo "stripe"


stripeS : Icon
stripeS =
    Icon.Logo "stripe-s"


studioVinari : Icon
studioVinari =
    Icon.Logo "studiovinari"


stumbleUpon : Icon
stumbleUpon =
    Icon.Logo "stumbleupon"


stumbleUponCircle : Icon
stumbleUponCircle =
    Icon.Logo "stumbleupon-circle"


subscript : Icon
subscript =
    Icon.Icon "subscript"


subway : Icon
subway =
    Icon.Icon "subway"


suitcase : Icon
suitcase =
    Icon.Icon "suitcase"


sun : Icon
sun =
    Icon.Icon "sun"


superpowers : Icon
superpowers =
    Icon.Logo "superpowers"


superscript : Icon
superscript =
    Icon.Icon "superscript"


supple : Icon
supple =
    Icon.Logo "supple"


sync : Icon
sync =
    Icon.Icon "sync"


syncAlt : Icon
syncAlt =
    Icon.Icon "sync-alt"


tTY : Icon
tTY =
    Icon.Icon "tty"


tV : Icon
tV =
    Icon.Icon "tv"


tVRetro : Icon
tVRetro =
    Icon.Icon "tv-retro"


table : Icon
table =
    Icon.Icon "table"


tablet : Icon
tablet =
    Icon.Icon "tablet"


tabletAlt : Icon
tabletAlt =
    Icon.Icon "tablet-alt"


tabletAndroid : Icon
tabletAndroid =
    Icon.Icon "tablet-android"


tabletAndroidAlt : Icon
tabletAndroidAlt =
    Icon.Icon "tablet-android-alt"


tachometer : Icon
tachometer =
    Icon.Icon "tachometer"


tachometerAlt : Icon
tachometerAlt =
    Icon.Icon "tachometer-alt"


tag : Icon
tag =
    Icon.Icon "tag"


tags : Icon
tags =
    Icon.Icon "tags"


tasks : Icon
tasks =
    Icon.Icon "tasks"


taxi : Icon
taxi =
    Icon.Icon "taxi"


telegram : Icon
telegram =
    Icon.Logo "telegram"


telegramPlane : Icon
telegramPlane =
    Icon.Logo "telegram-plane"


tencentWeibo : Icon
tencentWeibo =
    Icon.Logo "tencent-weibo"


terminal : Icon
terminal =
    Icon.Icon "terminal"


textHeight : Icon
textHeight =
    Icon.Icon "text-height"


textWidth : Icon
textWidth =
    Icon.Icon "text-width"


th : Icon
th =
    Icon.Icon "th"


thLarge : Icon
thLarge =
    Icon.Icon "th-large"


thList : Icon
thList =
    Icon.Icon "th-list"


themeIsle : Icon
themeIsle =
    Icon.Logo "themeisle"


thermometerEmpty : Icon
thermometerEmpty =
    Icon.Icon "thermometer-empty"


thermometerFull : Icon
thermometerFull =
    Icon.Icon "thermometer-full"


thermometerHalf : Icon
thermometerHalf =
    Icon.Icon "thermometer-half"


thermometerQuarter : Icon
thermometerQuarter =
    Icon.Icon "thermometer-quarter"


thermometerThreeQuarters : Icon
thermometerThreeQuarters =
    Icon.Icon "thermometer-three-quarters"


thumbsDown : Icon
thumbsDown =
    Icon.Icon "thumbs-down"


thumbsUp : Icon
thumbsUp =
    Icon.Icon "thumbs-up"


thumbtack : Icon
thumbtack =
    Icon.Icon "thumbtack"


ticket : Icon
ticket =
    Icon.Icon "ticket"


ticketAlt : Icon
ticketAlt =
    Icon.Icon "ticket-alt"


times : Icon
times =
    Icon.Icon "times"


timesCircle : Icon
timesCircle =
    Icon.Icon "times-circle"


timesHexagon : Icon
timesHexagon =
    Icon.Icon "times-hexagon"


timesOctagon : Icon
timesOctagon =
    Icon.Icon "times-octagon"


timesSquare : Icon
timesSquare =
    Icon.Icon "times-square"


tint : Icon
tint =
    Icon.Icon "tint"


toggleOff : Icon
toggleOff =
    Icon.Icon "toggle-off"


toggleOn : Icon
toggleOn =
    Icon.Icon "toggle-on"


trademark : Icon
trademark =
    Icon.Icon "trademark"


train : Icon
train =
    Icon.Icon "train"


transgender : Icon
transgender =
    Icon.Icon "transgender"


transgenderAlt : Icon
transgenderAlt =
    Icon.Icon "transgender-alt"


trash : Icon
trash =
    Icon.Icon "trash"


trashAlt : Icon
trashAlt =
    Icon.Icon "trash-alt"


tree : Icon
tree =
    Icon.Icon "tree"


treeAlt : Icon
treeAlt =
    Icon.Icon "tree-alt"


trello : Icon
trello =
    Icon.Logo "trello"


triangle : Icon
triangle =
    Icon.Icon "triangle"


tripAdvisor : Icon
tripAdvisor =
    Icon.Logo "tripadvisor"


trophy : Icon
trophy =
    Icon.Icon "trophy"


trophyAlt : Icon
trophyAlt =
    Icon.Icon "trophy-alt"


truck : Icon
truck =
    Icon.Icon "truck"


tumblr : Icon
tumblr =
    Icon.Logo "tumblr"


tumblrSquare : Icon
tumblrSquare =
    Icon.Logo "tumblr-square"


twitch : Icon
twitch =
    Icon.Logo "twitch"


twitter : Icon
twitter =
    Icon.Logo "twitter"


twitterSquare : Icon
twitterSquare =
    Icon.Logo "twitter-square"


typo3 : Icon
typo3 =
    Icon.Logo "typo3"


uIkit : Icon
uIkit =
    Icon.Logo "uikit"


uSB : Icon
uSB =
    Icon.Logo "usb"


uber : Icon
uber =
    Icon.Logo "uber"


umbrella : Icon
umbrella =
    Icon.Icon "umbrella"


underline : Icon
underline =
    Icon.Icon "underline"


undo : Icon
undo =
    Icon.Icon "undo"


undoAlt : Icon
undoAlt =
    Icon.Icon "undo-alt"


uniregistry : Icon
uniregistry =
    Icon.Logo "uniregistry"


universalAccess : Icon
universalAccess =
    Icon.Icon "universal-access"


university : Icon
university =
    Icon.Icon "university"


unlink : Icon
unlink =
    Icon.Icon "unlink"


unlock : Icon
unlock =
    Icon.Icon "unlock"


unlockAlt : Icon
unlockAlt =
    Icon.Icon "unlock-alt"


untappd : Icon
untappd =
    Icon.Logo "untappd"


upload : Icon
upload =
    Icon.Icon "upload"


usSunnah : Icon
usSunnah =
    Icon.Logo "ussunnah"


usdCircle : Icon
usdCircle =
    Icon.Icon "usd-circle"


usdSquare : Icon
usdSquare =
    Icon.Icon "usd-square"


user : Icon
user =
    Icon.Icon "user"


userAlt : Icon
userAlt =
    Icon.Icon "user-alt"


userCircle : Icon
userCircle =
    Icon.Icon "user-circle"


userMd : Icon
userMd =
    Icon.Icon "user-md"


userPlus : Icon
userPlus =
    Icon.Icon "user-plus"


userSecret : Icon
userSecret =
    Icon.Icon "user-secret"


userTimes : Icon
userTimes =
    Icon.Icon "user-times"


users : Icon
users =
    Icon.Icon "users"


utensilFork : Icon
utensilFork =
    Icon.Icon "utensil-fork"


utensilKnife : Icon
utensilKnife =
    Icon.Icon "utensil-knife"


utensilSpoon : Icon
utensilSpoon =
    Icon.Icon "utensil-spoon"


utensils : Icon
utensils =
    Icon.Icon "utensils"


utensilsAlt : Icon
utensilsAlt =
    Icon.Icon "utensils-alt"


vK : Icon
vK =
    Icon.Logo "vk"


vaadin : Icon
vaadin =
    Icon.Logo "vaadin"


venus : Icon
venus =
    Icon.Icon "venus"


venusDouble : Icon
venusDouble =
    Icon.Icon "venus-double"


venusMars : Icon
venusMars =
    Icon.Icon "venus-mars"


viacoin : Icon
viacoin =
    Icon.Logo "viacoin"


viadeo : Icon
viadeo =
    Icon.Logo "viadeo"


viadeoSquare : Icon
viadeoSquare =
    Icon.Logo "viadeo-square"


viber : Icon
viber =
    Icon.Logo "viber"


video : Icon
video =
    Icon.Icon "video"


vimeo : Icon
vimeo =
    Icon.Logo "vimeo"


vimeoSquare : Icon
vimeoSquare =
    Icon.Logo "vimeo-square"


vimeoV : Icon
vimeoV =
    Icon.Logo "vimeo-v"


vine : Icon
vine =
    Icon.Logo "vine"


vnv : Icon
vnv =
    Icon.Logo "vnv"


volumeDown : Icon
volumeDown =
    Icon.Icon "volume-down"


volumeMute : Icon
volumeMute =
    Icon.Icon "volume-mute"


volumeOff : Icon
volumeOff =
    Icon.Icon "volume-off"


volumeUp : Icon
volumeUp =
    Icon.Icon "volume-up"


vuejs : Icon
vuejs =
    Icon.Logo "vuejs"


wHMCS : Icon
wHMCS =
    Icon.Logo "whmcs"


wPBeginner : Icon
wPBeginner =
    Icon.Logo "wpbeginner"


wPExplorer : Icon
wPExplorer =
    Icon.Logo "wpexplorer"


wPForms : Icon
wPForms =
    Icon.Logo "wpforms"


watch : Icon
watch =
    Icon.Icon "watch"


weibo : Icon
weibo =
    Icon.Logo "weibo"


weixin : Icon
weixin =
    Icon.Logo "weixin"


whatsApp : Icon
whatsApp =
    Icon.Logo "whatsapp"


whatsAppSquare : Icon
whatsAppSquare =
    Icon.Logo "whatsapp-square"


wheelchair : Icon
wheelchair =
    Icon.Icon "wheelchair"


wifi : Icon
wifi =
    Icon.Icon "wifi"


wikipedia : Icon
wikipedia =
    Icon.Logo "wikipedia-w"


window : Icon
window =
    Icon.Icon "window"


windowAlt : Icon
windowAlt =
    Icon.Icon "window-alt"


windowClose : Icon
windowClose =
    Icon.Icon "window-close"


windowMaximize : Icon
windowMaximize =
    Icon.Icon "window-maximize"


windowMinimize : Icon
windowMinimize =
    Icon.Icon "window-minimize"


windowRestore : Icon
windowRestore =
    Icon.Icon "window-restore"


windows : Icon
windows =
    Icon.Logo "windows"


wonSign : Icon
wonSign =
    Icon.Icon "won-sign"


wordPress : Icon
wordPress =
    Icon.Logo "wordpress"


wordPressSimple : Icon
wordPressSimple =
    Icon.Logo "wordpress-simple"


wrench : Icon
wrench =
    Icon.Icon "wrench"


xING : Icon
xING =
    Icon.Logo "xing"


xINGSquare : Icon
xINGSquare =
    Icon.Logo "xing-square"


xbox : Icon
xbox =
    Icon.Logo "xbox"


yCombinator : Icon
yCombinator =
    Icon.Logo "y-combinator"


yahoo : Icon
yahoo =
    Icon.Logo "yahoo"


yandex : Icon
yandex =
    Icon.Logo "yandex"


yandexInternational : Icon
yandexInternational =
    Icon.Logo "yandex-international"


yelp : Icon
yelp =
    Icon.Logo "yelp"


yenSign : Icon
yenSign =
    Icon.Icon "yen-sign"


yoast : Icon
yoast =
    Icon.Logo "yoast"


youTube : Icon
youTube =
    Icon.Logo "youtube"


youTubeSquare : Icon
youTubeSquare =
    Icon.Logo "youtube-square"
