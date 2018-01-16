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


{-| AccessibleIcon - Logo
-}
accessibleIcon : Icon
accessibleIcon =
    Icon.Logo "accessible-icon"


{-| Accusoft - Logo
-}
accusoft : Icon
accusoft =
    Icon.Logo "accusoft"


{-| AddressBook - Icon
-}
addressBook : Icon
addressBook =
    Icon.Icon "address-book"


{-| AddressCard - Icon
-}
addressCard : Icon
addressCard =
    Icon.Icon "address-card"


{-| Adjust - Icon
-}
adjust : Icon
adjust =
    Icon.Icon "adjust"


{-| Adn - Logo
-}
adn : Icon
adn =
    Icon.Logo "adn"


{-| Adversal - Logo
-}
adversal : Icon
adversal =
    Icon.Logo "adversal"


{-| AffiliateTheme - Logo
-}
affiliateTheme : Icon
affiliateTheme =
    Icon.Logo "affiliatetheme"


{-| AlarmClock - Icon
-}
alarmClock : Icon
alarmClock =
    Icon.Icon "alarm-clock"


{-| Algolia - Logo
-}
algolia : Icon
algolia =
    Icon.Logo "algolia"


{-| AlignCenter - Icon
-}
alignCenter : Icon
alignCenter =
    Icon.Icon "align-center"


{-| AlignJustify - Icon
-}
alignJustify : Icon
alignJustify =
    Icon.Icon "align-justify"


{-| AlignLeft - Icon
-}
alignLeft : Icon
alignLeft =
    Icon.Icon "align-left"


{-| AlignRight - Icon
-}
alignRight : Icon
alignRight =
    Icon.Icon "align-right"


{-| Amazon - Logo
-}
amazon : Icon
amazon =
    Icon.Logo "amazon"


{-| AmazonPay - Logo
-}
amazonPay : Icon
amazonPay =
    Icon.Logo "amazon-pay"


{-| Ambulance - Icon
-}
ambulance : Icon
ambulance =
    Icon.Icon "ambulance"


{-| AmericanSignLanguageInterpreting - Icon
-}
americanSignLanguageInterpreting : Icon
americanSignLanguageInterpreting =
    Icon.Icon "american-sign-language-interpreting"


{-| Amilia - Logo
-}
amilia : Icon
amilia =
    Icon.Logo "amilia"


{-| Anchor - Icon
-}
anchor : Icon
anchor =
    Icon.Icon "anchor"


{-| Android - Logo
-}
android : Icon
android =
    Icon.Logo "android"


{-| AngelList - Logo
-}
angelList : Icon
angelList =
    Icon.Logo "angellist"


{-| AngleDoubleDown - Icon
-}
angleDoubleDown : Icon
angleDoubleDown =
    Icon.Icon "angle-double-down"


{-| AngleDoubleLeft - Icon
-}
angleDoubleLeft : Icon
angleDoubleLeft =
    Icon.Icon "angle-double-left"


{-| AngleDoubleRight - Icon
-}
angleDoubleRight : Icon
angleDoubleRight =
    Icon.Icon "angle-double-right"


{-| AngleDoubleUp - Icon
-}
angleDoubleUp : Icon
angleDoubleUp =
    Icon.Icon "angle-double-up"


{-| AngleDown - Icon
-}
angleDown : Icon
angleDown =
    Icon.Icon "angle-down"


{-| AngleLeft - Icon
-}
angleLeft : Icon
angleLeft =
    Icon.Icon "angle-left"


{-| AngleRight - Icon
-}
angleRight : Icon
angleRight =
    Icon.Icon "angle-right"


{-| AngleUp - Icon
-}
angleUp : Icon
angleUp =
    Icon.Icon "angle-up"


{-| AngryCreative - Logo
-}
angryCreative : Icon
angryCreative =
    Icon.Logo "angrycreative"


{-| Angular - Logo
-}
angular : Icon
angular =
    Icon.Logo "angular"


{-| AppStore - Logo
-}
appStore : Icon
appStore =
    Icon.Logo "app-store"


{-| AppStoreIos - Logo
-}
appStoreIos : Icon
appStoreIos =
    Icon.Logo "app-store-ios"


{-| Apper - Logo
-}
apper : Icon
apper =
    Icon.Logo "apper"


{-| Apple - Logo
-}
apple : Icon
apple =
    Icon.Logo "apple"


{-| ApplePay - Logo
-}
applePay : Icon
applePay =
    Icon.Logo "apple-pay"


{-| Archive - Icon
-}
archive : Icon
archive =
    Icon.Icon "archive"


{-| ArrowAltCircleDown - Icon
-}
arrowAltCircleDown : Icon
arrowAltCircleDown =
    Icon.Icon "arrow-alt-circle-down"


{-| ArrowAltCircleLeft - Icon
-}
arrowAltCircleLeft : Icon
arrowAltCircleLeft =
    Icon.Icon "arrow-alt-circle-left"


{-| ArrowAltCircleRight - Icon
-}
arrowAltCircleRight : Icon
arrowAltCircleRight =
    Icon.Icon "arrow-alt-circle-right"


{-| ArrowAltCircleUp - Icon
-}
arrowAltCircleUp : Icon
arrowAltCircleUp =
    Icon.Icon "arrow-alt-circle-up"


{-| ArrowAltDown - Icon
-}
arrowAltDown : Icon
arrowAltDown =
    Icon.Icon "arrow-alt-down"


{-| ArrowAltFromBottom - Icon
-}
arrowAltFromBottom : Icon
arrowAltFromBottom =
    Icon.Icon "arrow-alt-from-bottom"


{-| ArrowAltFromLeft - Icon
-}
arrowAltFromLeft : Icon
arrowAltFromLeft =
    Icon.Icon "arrow-alt-from-left"


{-| ArrowAltFromRight - Icon
-}
arrowAltFromRight : Icon
arrowAltFromRight =
    Icon.Icon "arrow-alt-from-right"


{-| ArrowAltFromTop - Icon
-}
arrowAltFromTop : Icon
arrowAltFromTop =
    Icon.Icon "arrow-alt-from-top"


{-| ArrowAltLeft - Icon
-}
arrowAltLeft : Icon
arrowAltLeft =
    Icon.Icon "arrow-alt-left"


{-| ArrowAltRight - Icon
-}
arrowAltRight : Icon
arrowAltRight =
    Icon.Icon "arrow-alt-right"


{-| ArrowAltSquareDown - Icon
-}
arrowAltSquareDown : Icon
arrowAltSquareDown =
    Icon.Icon "arrow-alt-square-down"


{-| ArrowAltSquareLeft - Icon
-}
arrowAltSquareLeft : Icon
arrowAltSquareLeft =
    Icon.Icon "arrow-alt-square-left"


{-| ArrowAltSquareRight - Icon
-}
arrowAltSquareRight : Icon
arrowAltSquareRight =
    Icon.Icon "arrow-alt-square-right"


{-| ArrowAltSquareUp - Icon
-}
arrowAltSquareUp : Icon
arrowAltSquareUp =
    Icon.Icon "arrow-alt-square-up"


{-| ArrowAltToBottom - Icon
-}
arrowAltToBottom : Icon
arrowAltToBottom =
    Icon.Icon "arrow-alt-to-bottom"


{-| ArrowAltToLeft - Icon
-}
arrowAltToLeft : Icon
arrowAltToLeft =
    Icon.Icon "arrow-alt-to-left"


{-| ArrowAltToRight - Icon
-}
arrowAltToRight : Icon
arrowAltToRight =
    Icon.Icon "arrow-alt-to-right"


{-| ArrowAltToTop - Icon
-}
arrowAltToTop : Icon
arrowAltToTop =
    Icon.Icon "arrow-alt-to-top"


{-| ArrowAltUp - Icon
-}
arrowAltUp : Icon
arrowAltUp =
    Icon.Icon "arrow-alt-up"


{-| ArrowCircleDown - Icon
-}
arrowCircleDown : Icon
arrowCircleDown =
    Icon.Icon "arrow-circle-down"


{-| ArrowCircleLeft - Icon
-}
arrowCircleLeft : Icon
arrowCircleLeft =
    Icon.Icon "arrow-circle-left"


{-| ArrowCircleRight - Icon
-}
arrowCircleRight : Icon
arrowCircleRight =
    Icon.Icon "arrow-circle-right"


{-| ArrowCircleUp - Icon
-}
arrowCircleUp : Icon
arrowCircleUp =
    Icon.Icon "arrow-circle-up"


{-| ArrowDown - Icon
-}
arrowDown : Icon
arrowDown =
    Icon.Icon "arrow-down"


{-| ArrowFromBottom - Icon
-}
arrowFromBottom : Icon
arrowFromBottom =
    Icon.Icon "arrow-from-bottom"


{-| ArrowFromLeft - Icon
-}
arrowFromLeft : Icon
arrowFromLeft =
    Icon.Icon "arrow-from-left"


{-| ArrowFromRight - Icon
-}
arrowFromRight : Icon
arrowFromRight =
    Icon.Icon "arrow-from-right"


{-| ArrowFromTop - Icon
-}
arrowFromTop : Icon
arrowFromTop =
    Icon.Icon "arrow-from-top"


{-| ArrowLeft - Icon
-}
arrowLeft : Icon
arrowLeft =
    Icon.Icon "arrow-left"


{-| ArrowRight - Icon
-}
arrowRight : Icon
arrowRight =
    Icon.Icon "arrow-right"


{-| ArrowSquareDown - Icon
-}
arrowSquareDown : Icon
arrowSquareDown =
    Icon.Icon "arrow-square-down"


{-| ArrowSquareLeft - Icon
-}
arrowSquareLeft : Icon
arrowSquareLeft =
    Icon.Icon "arrow-square-left"


{-| ArrowSquareRight - Icon
-}
arrowSquareRight : Icon
arrowSquareRight =
    Icon.Icon "arrow-square-right"


{-| ArrowSquareUp - Icon
-}
arrowSquareUp : Icon
arrowSquareUp =
    Icon.Icon "arrow-square-up"


{-| ArrowToBottom - Icon
-}
arrowToBottom : Icon
arrowToBottom =
    Icon.Icon "arrow-to-bottom"


{-| ArrowToLeft - Icon
-}
arrowToLeft : Icon
arrowToLeft =
    Icon.Icon "arrow-to-left"


{-| ArrowToRight - Icon
-}
arrowToRight : Icon
arrowToRight =
    Icon.Icon "arrow-to-right"


{-| ArrowToTop - Icon
-}
arrowToTop : Icon
arrowToTop =
    Icon.Icon "arrow-to-top"


{-| ArrowUp - Icon
-}
arrowUp : Icon
arrowUp =
    Icon.Icon "arrow-up"


{-| Arrows - Icon
-}
arrows : Icon
arrows =
    Icon.Icon "arrows"


{-| ArrowsAlt - Icon
-}
arrowsAlt : Icon
arrowsAlt =
    Icon.Icon "arrows-alt"


{-| ArrowsAltHorizontal - Icon
-}
arrowsAltHorizontal : Icon
arrowsAltHorizontal =
    Icon.Icon "arrows-alt-h"


{-| ArrowsAltVertical - Icon
-}
arrowsAltVertical : Icon
arrowsAltVertical =
    Icon.Icon "arrows-alt-v"


{-| ArrowsHorizontal - Icon
-}
arrowsHorizontal : Icon
arrowsHorizontal =
    Icon.Icon "arrows-h"


{-| ArrowsVertical - Icon
-}
arrowsVertical : Icon
arrowsVertical =
    Icon.Icon "arrows-v"


{-| AssistiveListeningSystems - Icon
-}
assistiveListeningSystems : Icon
assistiveListeningSystems =
    Icon.Icon "assistive-listening-systems"


{-| Asterisk - Icon
-}
asterisk : Icon
asterisk =
    Icon.Icon "asterisk"


{-| Asymmetrik - Logo
-}
asymmetrik : Icon
asymmetrik =
    Icon.Logo "asymmetrik"


{-| At - Icon
-}
at : Icon
at =
    Icon.Icon "at"


{-| Audible - Logo
-}
audible : Icon
audible =
    Icon.Logo "audible"


{-| AudioDescription - Icon
-}
audioDescription : Icon
audioDescription =
    Icon.Icon "audio-description"


{-| Autoprefixer - Logo
-}
autoprefixer : Icon
autoprefixer =
    Icon.Logo "autoprefixer"


{-| Avianex - Logo
-}
avianex : Icon
avianex =
    Icon.Logo "avianex"


{-| Aviato - Logo
-}
aviato : Icon
aviato =
    Icon.Logo "aviato"


{-| Aws - Logo
-}
aws : Icon
aws =
    Icon.Logo "aws"


{-| BIMobject - Logo
-}
bIMobject : Icon
bIMobject =
    Icon.Logo "bimobject"


{-| Backward - Icon
-}
backward : Icon
backward =
    Icon.Icon "backward"


{-| Badge - Icon
-}
badge : Icon
badge =
    Icon.Icon "badge"


{-| BadgeCheck - Icon
-}
badgeCheck : Icon
badgeCheck =
    Icon.Icon "badge-check"


{-| BalanceScale - Icon
-}
balanceScale : Icon
balanceScale =
    Icon.Icon "balance-scale"


{-| Ban - Icon
-}
ban : Icon
ban =
    Icon.Icon "ban"


{-| Bandcamp - Logo
-}
bandcamp : Icon
bandcamp =
    Icon.Logo "bandcamp"


{-| Barcode - Icon
-}
barcode : Icon
barcode =
    Icon.Icon "barcode"


{-| Bars - Icon
-}
bars : Icon
bars =
    Icon.Icon "bars"


{-| Bath - Icon
-}
bath : Icon
bath =
    Icon.Icon "bath"


{-| BatteryBolt - Icon
-}
batteryBolt : Icon
batteryBolt =
    Icon.Icon "battery-bolt"


{-| BatteryEmpty - Icon
-}
batteryEmpty : Icon
batteryEmpty =
    Icon.Icon "battery-empty"


{-| BatteryFull - Icon
-}
batteryFull : Icon
batteryFull =
    Icon.Icon "battery-full"


{-| BatteryHalf - Icon
-}
batteryHalf : Icon
batteryHalf =
    Icon.Icon "battery-half"


{-| BatteryQuarter - Icon
-}
batteryQuarter : Icon
batteryQuarter =
    Icon.Icon "battery-quarter"


{-| BatterySlash - Icon
-}
batterySlash : Icon
batterySlash =
    Icon.Icon "battery-slash"


{-| BatteryThreeQuarters - Icon
-}
batteryThreeQuarters : Icon
batteryThreeQuarters =
    Icon.Icon "battery-three-quarters"


{-| Bed - Icon
-}
bed : Icon
bed =
    Icon.Icon "bed"


{-| Beer - Icon
-}
beer : Icon
beer =
    Icon.Icon "beer"


{-| Behance - Logo
-}
behance : Icon
behance =
    Icon.Logo "behance"


{-| BehanceSquare - Logo
-}
behanceSquare : Icon
behanceSquare =
    Icon.Logo "behance-square"


{-| Bell - Icon
-}
bell : Icon
bell =
    Icon.Icon "bell"


{-| BellSlash - Icon
-}
bellSlash : Icon
bellSlash =
    Icon.Icon "bell-slash"


{-| Bicycle - Icon
-}
bicycle : Icon
bicycle =
    Icon.Icon "bicycle"


{-| Binoculars - Icon
-}
binoculars : Icon
binoculars =
    Icon.Icon "binoculars"


{-| BirthdayCake - Icon
-}
birthdayCake : Icon
birthdayCake =
    Icon.Icon "birthday-cake"


{-| Bitbucket - Logo
-}
bitbucket : Icon
bitbucket =
    Icon.Logo "bitbucket"


{-| Bitcoin - Logo
-}
bitcoin : Icon
bitcoin =
    Icon.Logo "bitcoin"


{-| Bity - Logo
-}
bity : Icon
bity =
    Icon.Logo "bity"


{-| BlackTie - Logo
-}
blackTie : Icon
blackTie =
    Icon.Logo "black-tie"


{-| Blackberry - Logo
-}
blackberry : Icon
blackberry =
    Icon.Logo "blackberry"


{-| Blind - Icon
-}
blind : Icon
blind =
    Icon.Icon "blind"


{-| Blogger - Logo
-}
blogger : Icon
blogger =
    Icon.Logo "blogger"


{-| BloggerB - Logo
-}
bloggerB : Icon
bloggerB =
    Icon.Logo "blogger-b"


{-| Bluetooth - Logo
-}
bluetooth : Icon
bluetooth =
    Icon.Logo "bluetooth"


{-| BluetoothB - Logo
-}
bluetoothB : Icon
bluetoothB =
    Icon.Logo "bluetooth-b"


{-| Bold - Icon
-}
bold : Icon
bold =
    Icon.Icon "bold"


{-| Bolt - Icon
-}
bolt : Icon
bolt =
    Icon.Icon "bolt"


{-| Bomb - Icon
-}
bomb : Icon
bomb =
    Icon.Icon "bomb"


{-| Book - Icon
-}
book : Icon
book =
    Icon.Icon "book"


{-| Bookmark - Icon
-}
bookmark : Icon
bookmark =
    Icon.Icon "bookmark"


{-| Braille - Icon
-}
braille : Icon
braille =
    Icon.Icon "braille"


{-| Briefcase - Icon
-}
briefcase : Icon
briefcase =
    Icon.Icon "briefcase"


{-| Browser - Icon
-}
browser : Icon
browser =
    Icon.Icon "browser"


{-| Btc - Logo
-}
btc : Icon
btc =
    Icon.Logo "btc"


{-| Bug - Icon
-}
bug : Icon
bug =
    Icon.Icon "bug"


{-| Building - Icon
-}
building : Icon
building =
    Icon.Icon "building"


{-| Bullhorn - Icon
-}
bullhorn : Icon
bullhorn =
    Icon.Icon "bullhorn"


{-| Bullseye - Icon
-}
bullseye : Icon
bullseye =
    Icon.Icon "bullseye"


{-| BuromobelExperte - Logo
-}
buromobelExperte : Icon
buromobelExperte =
    Icon.Logo "buromobelexperte"


{-| Bus - Icon
-}
bus : Icon
bus =
    Icon.Icon "bus"


{-| BuySellAds - Logo
-}
buySellAds : Icon
buySellAds =
    Icon.Logo "buysellads"


{-| CCAmazonPay - Logo
-}
cCAmazonPay : Icon
cCAmazonPay =
    Icon.Logo "cc-amazon-pay"


{-| CCAmex - Logo
-}
cCAmex : Icon
cCAmex =
    Icon.Logo "cc-amex"


{-| CCApplePay - Logo
-}
cCApplePay : Icon
cCApplePay =
    Icon.Logo "cc-apple-pay"


{-| CCDinersClub - Logo
-}
cCDinersClub : Icon
cCDinersClub =
    Icon.Logo "cc-diners-club"


{-| CCDiscover - Logo
-}
cCDiscover : Icon
cCDiscover =
    Icon.Logo "cc-discover"


{-| CCJcb - Logo
-}
cCJcb : Icon
cCJcb =
    Icon.Logo "cc-jcb"


{-| CCMastercard - Logo
-}
cCMastercard : Icon
cCMastercard =
    Icon.Logo "cc-mastercard"


{-| CCPayPal - Logo
-}
cCPayPal : Icon
cCPayPal =
    Icon.Logo "cc-paypal"


{-| CCStripe - Logo
-}
cCStripe : Icon
cCStripe =
    Icon.Logo "cc-stripe"


{-| CCVisa - Logo
-}
cCVisa : Icon
cCVisa =
    Icon.Logo "cc-visa"


{-| CSS3 - Logo
-}
cSS3 : Icon
cSS3 =
    Icon.Logo "css3"


{-| CSS3Alt - Logo
-}
cSS3Alt : Icon
cSS3Alt =
    Icon.Logo "css3-alt"


{-| Calculator - Icon
-}
calculator : Icon
calculator =
    Icon.Icon "calculator"


{-| Calendar - Icon
-}
calendar : Icon
calendar =
    Icon.Icon "calendar"


{-| CalendarAlt - Icon
-}
calendarAlt : Icon
calendarAlt =
    Icon.Icon "calendar-alt"


{-| CalendarCheck - Icon
-}
calendarCheck : Icon
calendarCheck =
    Icon.Icon "calendar-check"


{-| CalendarEdit - Icon
-}
calendarEdit : Icon
calendarEdit =
    Icon.Icon "calendar-edit"


{-| CalendarExclamation - Icon
-}
calendarExclamation : Icon
calendarExclamation =
    Icon.Icon "calendar-exclamation"


{-| CalendarMinus - Icon
-}
calendarMinus : Icon
calendarMinus =
    Icon.Icon "calendar-minus"


{-| CalendarPlus - Icon
-}
calendarPlus : Icon
calendarPlus =
    Icon.Icon "calendar-plus"


{-| CalendarTimes - Icon
-}
calendarTimes : Icon
calendarTimes =
    Icon.Icon "calendar-times"


{-| Camera - Icon
-}
camera : Icon
camera =
    Icon.Icon "camera"


{-| CameraAlt - Icon
-}
cameraAlt : Icon
cameraAlt =
    Icon.Icon "camera-alt"


{-| CameraRetro - Icon
-}
cameraRetro : Icon
cameraRetro =
    Icon.Icon "camera-retro"


{-| Car - Icon
-}
car : Icon
car =
    Icon.Icon "car"


{-| CaretCircleDown - Icon
-}
caretCircleDown : Icon
caretCircleDown =
    Icon.Icon "caret-circle-down"


{-| CaretCircleLeft - Icon
-}
caretCircleLeft : Icon
caretCircleLeft =
    Icon.Icon "caret-circle-left"


{-| CaretCircleRight - Icon
-}
caretCircleRight : Icon
caretCircleRight =
    Icon.Icon "caret-circle-right"


{-| CaretCircleUp - Icon
-}
caretCircleUp : Icon
caretCircleUp =
    Icon.Icon "caret-circle-up"


{-| CaretDown - Icon
-}
caretDown : Icon
caretDown =
    Icon.Icon "caret-down"


{-| CaretLeft - Icon
-}
caretLeft : Icon
caretLeft =
    Icon.Icon "caret-left"


{-| CaretRight - Icon
-}
caretRight : Icon
caretRight =
    Icon.Icon "caret-right"


{-| CaretSquareDown - Icon
-}
caretSquareDown : Icon
caretSquareDown =
    Icon.Icon "caret-square-down"


{-| CaretSquareLeft - Icon
-}
caretSquareLeft : Icon
caretSquareLeft =
    Icon.Icon "caret-square-left"


{-| CaretSquareRight - Icon
-}
caretSquareRight : Icon
caretSquareRight =
    Icon.Icon "caret-square-right"


{-| CaretSquareUp - Icon
-}
caretSquareUp : Icon
caretSquareUp =
    Icon.Icon "caret-square-up"


{-| CaretUp - Icon
-}
caretUp : Icon
caretUp =
    Icon.Icon "caret-up"


{-| CartArrowDown - Icon
-}
cartArrowDown : Icon
cartArrowDown =
    Icon.Icon "cart-arrow-down"


{-| CartPlus - Icon
-}
cartPlus : Icon
cartPlus =
    Icon.Icon "cart-plus"


{-| Centercode - Logo
-}
centercode : Icon
centercode =
    Icon.Logo "centercode"


{-| Certificate - Icon
-}
certificate : Icon
certificate =
    Icon.Icon "certificate"


{-| ChartArea - Icon
-}
chartArea : Icon
chartArea =
    Icon.Icon "chart-area"


{-| ChartBar - Icon
-}
chartBar : Icon
chartBar =
    Icon.Icon "chart-bar"


{-| ChartLine - Icon
-}
chartLine : Icon
chartLine =
    Icon.Icon "chart-line"


{-| ChartPie - Icon
-}
chartPie : Icon
chartPie =
    Icon.Icon "chart-pie"


{-| Check - Icon
-}
check : Icon
check =
    Icon.Icon "check"


{-| CheckCircle - Icon
-}
checkCircle : Icon
checkCircle =
    Icon.Icon "check-circle"


{-| CheckSquare - Icon
-}
checkSquare : Icon
checkSquare =
    Icon.Icon "check-square"


{-| ChevronCircleDown - Icon
-}
chevronCircleDown : Icon
chevronCircleDown =
    Icon.Icon "chevron-circle-down"


{-| ChevronCircleLeft - Icon
-}
chevronCircleLeft : Icon
chevronCircleLeft =
    Icon.Icon "chevron-circle-left"


{-| ChevronCircleRight - Icon
-}
chevronCircleRight : Icon
chevronCircleRight =
    Icon.Icon "chevron-circle-right"


{-| ChevronCircleUp - Icon
-}
chevronCircleUp : Icon
chevronCircleUp =
    Icon.Icon "chevron-circle-up"


{-| ChevronDoubleDown - Icon
-}
chevronDoubleDown : Icon
chevronDoubleDown =
    Icon.Icon "chevron-double-down"


{-| ChevronDoubleLeft - Icon
-}
chevronDoubleLeft : Icon
chevronDoubleLeft =
    Icon.Icon "chevron-double-left"


{-| ChevronDoubleRight - Icon
-}
chevronDoubleRight : Icon
chevronDoubleRight =
    Icon.Icon "chevron-double-right"


{-| ChevronDoubleUp - Icon
-}
chevronDoubleUp : Icon
chevronDoubleUp =
    Icon.Icon "chevron-double-up"


{-| ChevronDown - Icon
-}
chevronDown : Icon
chevronDown =
    Icon.Icon "chevron-down"


{-| ChevronLeft - Icon
-}
chevronLeft : Icon
chevronLeft =
    Icon.Icon "chevron-left"


{-| ChevronRight - Icon
-}
chevronRight : Icon
chevronRight =
    Icon.Icon "chevron-right"


{-| ChevronSquareDown - Icon
-}
chevronSquareDown : Icon
chevronSquareDown =
    Icon.Icon "chevron-square-down"


{-| ChevronSquareLeft - Icon
-}
chevronSquareLeft : Icon
chevronSquareLeft =
    Icon.Icon "chevron-square-left"


{-| ChevronSquareRight - Icon
-}
chevronSquareRight : Icon
chevronSquareRight =
    Icon.Icon "chevron-square-right"


{-| ChevronSquareUp - Icon
-}
chevronSquareUp : Icon
chevronSquareUp =
    Icon.Icon "chevron-square-up"


{-| ChevronUp - Icon
-}
chevronUp : Icon
chevronUp =
    Icon.Icon "chevron-up"


{-| Child - Icon
-}
child : Icon
child =
    Icon.Icon "child"


{-| Chrome - Logo
-}
chrome : Icon
chrome =
    Icon.Logo "chrome"


{-| Circle - Icon
-}
circle : Icon
circle =
    Icon.Icon "circle"


{-| CircleNotch - Icon
-}
circleNotch : Icon
circleNotch =
    Icon.Icon "circle-notch"


{-| Clipboard - Icon
-}
clipboard : Icon
clipboard =
    Icon.Icon "clipboard"


{-| Clock - Icon
-}
clock : Icon
clock =
    Icon.Icon "clock"


{-| Clone - Icon
-}
clone : Icon
clone =
    Icon.Icon "clone"


{-| ClosedCaptioning - Icon
-}
closedCaptioning : Icon
closedCaptioning =
    Icon.Icon "closed-captioning"


{-| Cloud - Icon
-}
cloud : Icon
cloud =
    Icon.Icon "cloud"


{-| CloudDownload - Icon
-}
cloudDownload : Icon
cloudDownload =
    Icon.Icon "cloud-download"


{-| CloudDownloadAlt - Icon
-}
cloudDownloadAlt : Icon
cloudDownloadAlt =
    Icon.Icon "cloud-download-alt"


{-| CloudScale - Logo
-}
cloudScale : Icon
cloudScale =
    Icon.Logo "cloudscale"


{-| CloudUpload - Icon
-}
cloudUpload : Icon
cloudUpload =
    Icon.Icon "cloud-upload"


{-| CloudUploadAlt - Icon
-}
cloudUploadAlt : Icon
cloudUploadAlt =
    Icon.Icon "cloud-upload-alt"


{-| Cloudsmith - Logo
-}
cloudsmith : Icon
cloudsmith =
    Icon.Logo "cloudsmith"


{-| Cloudversify - Logo
-}
cloudversify : Icon
cloudversify =
    Icon.Logo "cloudversify"


{-| Club - Icon
-}
club : Icon
club =
    Icon.Icon "club"


{-| Code - Icon
-}
code : Icon
code =
    Icon.Icon "code"


{-| CodeBranch - Icon
-}
codeBranch : Icon
codeBranch =
    Icon.Icon "code-branch"


{-| CodeCommit - Icon
-}
codeCommit : Icon
codeCommit =
    Icon.Icon "code-commit"


{-| CodeMerge - Icon
-}
codeMerge : Icon
codeMerge =
    Icon.Icon "code-merge"


{-| CodePen - Logo
-}
codePen : Icon
codePen =
    Icon.Logo "codepen"


{-| CodiePie - Logo
-}
codiePie : Icon
codiePie =
    Icon.Logo "codiepie"


{-| Coffee - Icon
-}
coffee : Icon
coffee =
    Icon.Icon "coffee"


{-| Cog - Icon
-}
cog : Icon
cog =
    Icon.Icon "cog"


{-| Cogs - Icon
-}
cogs : Icon
cogs =
    Icon.Icon "cogs"


{-| Columns - Icon
-}
columns : Icon
columns =
    Icon.Icon "columns"


{-| Comment - Icon
-}
comment : Icon
comment =
    Icon.Icon "comment"


{-| CommentAlt - Icon
-}
commentAlt : Icon
commentAlt =
    Icon.Icon "comment-alt"


{-| Comments - Icon
-}
comments : Icon
comments =
    Icon.Icon "comments"


{-| Compass - Icon
-}
compass : Icon
compass =
    Icon.Icon "compass"


{-| Compress - Icon
-}
compress : Icon
compress =
    Icon.Icon "compress"


{-| CompressAlt - Icon
-}
compressAlt : Icon
compressAlt =
    Icon.Icon "compress-alt"


{-| CompressWide - Icon
-}
compressWide : Icon
compressWide =
    Icon.Icon "compress-wide"


{-| ConnectDevelop - Logo
-}
connectDevelop : Icon
connectDevelop =
    Icon.Logo "connectdevelop"


{-| Contao - Logo
-}
contao : Icon
contao =
    Icon.Logo "contao"


{-| Copy - Icon
-}
copy : Icon
copy =
    Icon.Icon "copy"


{-| Copyright - Icon
-}
copyright : Icon
copyright =
    Icon.Icon "copyright"


{-| Cpanel - Logo
-}
cpanel : Icon
cpanel =
    Icon.Logo "cpanel"


{-| CreativeCommons - Logo
-}
creativeCommons : Icon
creativeCommons =
    Icon.Logo "creative-commons"


{-| CreditCard - Icon
-}
creditCard : Icon
creditCard =
    Icon.Icon "credit-card"


{-| CreditCardBlank - Icon
-}
creditCardBlank : Icon
creditCardBlank =
    Icon.Icon "credit-card-blank"


{-| CreditCardFront - Icon
-}
creditCardFront : Icon
creditCardFront =
    Icon.Icon "credit-card-front"


{-| Crop - Icon
-}
crop : Icon
crop =
    Icon.Icon "crop"


{-| Crosshairs - Icon
-}
crosshairs : Icon
crosshairs =
    Icon.Icon "crosshairs"


{-| Cube - Icon
-}
cube : Icon
cube =
    Icon.Icon "cube"


{-| Cubes - Icon
-}
cubes : Icon
cubes =
    Icon.Icon "cubes"


{-| Cut - Icon
-}
cut : Icon
cut =
    Icon.Icon "cut"


{-| Cuttlefish - Logo
-}
cuttlefish : Icon
cuttlefish =
    Icon.Logo "cuttlefish"


{-| DAndD - Logo
-}
dAndD : Icon
dAndD =
    Icon.Logo "d-and-d"


{-| Dashcube - Logo
-}
dashcube : Icon
dashcube =
    Icon.Logo "dashcube"


{-| Database - Icon
-}
database : Icon
database =
    Icon.Icon "database"


{-| Deaf - Icon
-}
deaf : Icon
deaf =
    Icon.Icon "deaf"


{-| Delicious - Logo
-}
delicious : Icon
delicious =
    Icon.Logo "delicious"


{-| DeployDog - Logo
-}
deployDog : Icon
deployDog =
    Icon.Logo "deploydog"


{-| Deskpro - Logo
-}
deskpro : Icon
deskpro =
    Icon.Logo "deskpro"


{-| Desktop - Icon
-}
desktop : Icon
desktop =
    Icon.Icon "desktop"


{-| DesktopAlt - Icon
-}
desktopAlt : Icon
desktopAlt =
    Icon.Icon "desktop-alt"


{-| DeviantArt - Logo
-}
deviantArt : Icon
deviantArt =
    Icon.Logo "deviantart"


{-| Diamond - Icon
-}
diamond : Icon
diamond =
    Icon.Icon "diamond"


{-| Digg - Logo
-}
digg : Icon
digg =
    Icon.Logo "digg"


{-| DigitalOcean - Logo
-}
digitalOcean : Icon
digitalOcean =
    Icon.Logo "digital-ocean"


{-| Discord - Logo
-}
discord : Icon
discord =
    Icon.Logo "discord"


{-| Discourse - Logo
-}
discourse : Icon
discourse =
    Icon.Logo "discourse"


{-| DocHub - Logo
-}
docHub : Icon
docHub =
    Icon.Logo "dochub"


{-| Docker - Logo
-}
docker : Icon
docker =
    Icon.Logo "docker"


{-| DollarSign - Icon
-}
dollarSign : Icon
dollarSign =
    Icon.Icon "dollar-sign"


{-| DotCircle - Icon
-}
dotCircle : Icon
dotCircle =
    Icon.Icon "dot-circle"


{-| Download - Icon
-}
download : Icon
download =
    Icon.Icon "download"


{-| Draft2Digital - Logo
-}
draft2Digital : Icon
draft2Digital =
    Icon.Logo "draft2digital"


{-| Dribbble - Logo
-}
dribbble : Icon
dribbble =
    Icon.Logo "dribbble"


{-| DribbbleSquare - Logo
-}
dribbbleSquare : Icon
dribbbleSquare =
    Icon.Logo "dribbble-square"


{-| Dropbox - Logo
-}
dropbox : Icon
dropbox =
    Icon.Logo "dropbox"


{-| Drupal - Logo
-}
drupal : Icon
drupal =
    Icon.Logo "drupal"


{-| Dyalog - Logo
-}
dyalog : Icon
dyalog =
    Icon.Logo "dyalog"


{-| EarlyBirds - Logo
-}
earlyBirds : Icon
earlyBirds =
    Icon.Logo "earlybirds"


{-| Edge - Logo
-}
edge : Icon
edge =
    Icon.Logo "edge"


{-| Edit - Icon
-}
edit : Icon
edit =
    Icon.Icon "edit"


{-| Eject - Icon
-}
eject : Icon
eject =
    Icon.Icon "eject"


{-| Elementor - Logo
-}
elementor : Icon
elementor =
    Icon.Logo "elementor"


{-| EllipsisHorizontal - Icon
-}
ellipsisHorizontal : Icon
ellipsisHorizontal =
    Icon.Icon "ellipsis-h"


{-| EllipsisHorizontalAlt - Icon
-}
ellipsisHorizontalAlt : Icon
ellipsisHorizontalAlt =
    Icon.Icon "ellipsis-h-alt"


{-| EllipsisVertical - Icon
-}
ellipsisVertical : Icon
ellipsisVertical =
    Icon.Icon "ellipsis-v"


{-| EllipsisVerticalAlt - Icon
-}
ellipsisVerticalAlt : Icon
ellipsisVerticalAlt =
    Icon.Icon "ellipsis-v-alt"


{-| Ember - Logo
-}
ember : Icon
ember =
    Icon.Logo "ember"


{-| Empire - Logo
-}
empire : Icon
empire =
    Icon.Logo "empire"


{-| Envelope - Icon
-}
envelope : Icon
envelope =
    Icon.Icon "envelope"


{-| EnvelopeOpen - Icon
-}
envelopeOpen : Icon
envelopeOpen =
    Icon.Icon "envelope-open"


{-| EnvelopeSquare - Icon
-}
envelopeSquare : Icon
envelopeSquare =
    Icon.Icon "envelope-square"


{-| Envira - Logo
-}
envira : Icon
envira =
    Icon.Logo "envira"


{-| Eraser - Icon
-}
eraser : Icon
eraser =
    Icon.Icon "eraser"


{-| Erlang - Logo
-}
erlang : Icon
erlang =
    Icon.Logo "erlang"


{-| Ethereum - Logo
-}
ethereum : Icon
ethereum =
    Icon.Logo "ethereum"


{-| Etsy - Logo
-}
etsy : Icon
etsy =
    Icon.Logo "etsy"


{-| EuroSign - Icon
-}
euroSign : Icon
euroSign =
    Icon.Icon "euro-sign"


{-| Exchange - Icon
-}
exchange : Icon
exchange =
    Icon.Icon "exchange"


{-| ExchangeAlt - Icon
-}
exchangeAlt : Icon
exchangeAlt =
    Icon.Icon "exchange-alt"


{-| Exclamation - Icon
-}
exclamation : Icon
exclamation =
    Icon.Icon "exclamation"


{-| ExclamationCircle - Icon
-}
exclamationCircle : Icon
exclamationCircle =
    Icon.Icon "exclamation-circle"


{-| ExclamationSquare - Icon
-}
exclamationSquare : Icon
exclamationSquare =
    Icon.Icon "exclamation-square"


{-| ExclamationTriangle - Icon
-}
exclamationTriangle : Icon
exclamationTriangle =
    Icon.Icon "exclamation-triangle"


{-| Expand - Icon
-}
expand : Icon
expand =
    Icon.Icon "expand"


{-| ExpandAlt - Icon
-}
expandAlt : Icon
expandAlt =
    Icon.Icon "expand-alt"


{-| ExpandArrows - Icon
-}
expandArrows : Icon
expandArrows =
    Icon.Icon "expand-arrows"


{-| ExpandArrowsAlt - Icon
-}
expandArrowsAlt : Icon
expandArrowsAlt =
    Icon.Icon "expand-arrows-alt"


{-| ExpandWide - Icon
-}
expandWide : Icon
expandWide =
    Icon.Icon "expand-wide"


{-| ExpeditedSSL - Logo
-}
expeditedSSL : Icon
expeditedSSL =
    Icon.Logo "expeditedssl"


{-| ExternalLink - Icon
-}
externalLink : Icon
externalLink =
    Icon.Icon "external-link"


{-| ExternalLinkAlt - Icon
-}
externalLinkAlt : Icon
externalLinkAlt =
    Icon.Icon "external-link-alt"


{-| ExternalLinkSquare - Icon
-}
externalLinkSquare : Icon
externalLinkSquare =
    Icon.Icon "external-link-square"


{-| ExternalLinkSquareAlt - Icon
-}
externalLinkSquareAlt : Icon
externalLinkSquareAlt =
    Icon.Icon "external-link-square-alt"


{-| Eye - Icon
-}
eye : Icon
eye =
    Icon.Icon "eye"


{-| EyeDropper - Icon
-}
eyeDropper : Icon
eyeDropper =
    Icon.Icon "eye-dropper"


{-| EyeSlash - Icon
-}
eyeSlash : Icon
eyeSlash =
    Icon.Icon "eye-slash"


{-| Facebook - Logo
-}
facebook : Icon
facebook =
    Icon.Logo "facebook"


{-| FacebookF - Logo
-}
facebookF : Icon
facebookF =
    Icon.Logo "facebook-f"


{-| FacebookMessenger - Logo
-}
facebookMessenger : Icon
facebookMessenger =
    Icon.Logo "facebook-messenger"


{-| FacebookSquare - Logo
-}
facebookSquare : Icon
facebookSquare =
    Icon.Logo "facebook-square"


{-| FastBackward - Icon
-}
fastBackward : Icon
fastBackward =
    Icon.Icon "fast-backward"


{-| FastForward - Icon
-}
fastForward : Icon
fastForward =
    Icon.Icon "fast-forward"


{-| Fax - Icon
-}
fax : Icon
fax =
    Icon.Icon "fax"


{-| Female - Icon
-}
female : Icon
female =
    Icon.Icon "female"


{-| FighterJet - Icon
-}
fighterJet : Icon
fighterJet =
    Icon.Icon "fighter-jet"


{-| File - Icon
-}
file : Icon
file =
    Icon.Icon "file"


{-| FileAlt - Icon
-}
fileAlt : Icon
fileAlt =
    Icon.Icon "file-alt"


{-| FileArchive - Icon
-}
fileArchive : Icon
fileArchive =
    Icon.Icon "file-archive"


{-| FileAudio - Icon
-}
fileAudio : Icon
fileAudio =
    Icon.Icon "file-audio"


{-| FileCheck - Icon
-}
fileCheck : Icon
fileCheck =
    Icon.Icon "file-check"


{-| FileCode - Icon
-}
fileCode : Icon
fileCode =
    Icon.Icon "file-code"


{-| FileEdit - Icon
-}
fileEdit : Icon
fileEdit =
    Icon.Icon "file-edit"


{-| FileExcel - Icon
-}
fileExcel : Icon
fileExcel =
    Icon.Icon "file-excel"


{-| FileExclamation - Icon
-}
fileExclamation : Icon
fileExclamation =
    Icon.Icon "file-exclamation"


{-| FileImage - Icon
-}
fileImage : Icon
fileImage =
    Icon.Icon "file-image"


{-| FileMinus - Icon
-}
fileMinus : Icon
fileMinus =
    Icon.Icon "file-minus"


{-| FilePdf - Icon
-}
filePdf : Icon
filePdf =
    Icon.Icon "file-pdf"


{-| FilePlus - Icon
-}
filePlus : Icon
filePlus =
    Icon.Icon "file-plus"


{-| FilePowerpoint - Icon
-}
filePowerpoint : Icon
filePowerpoint =
    Icon.Icon "file-powerpoint"


{-| FileTimes - Icon
-}
fileTimes : Icon
fileTimes =
    Icon.Icon "file-times"


{-| FileVideo - Icon
-}
fileVideo : Icon
fileVideo =
    Icon.Icon "file-video"


{-| FileWord - Icon
-}
fileWord : Icon
fileWord =
    Icon.Icon "file-word"


{-| Film - Icon
-}
film : Icon
film =
    Icon.Icon "film"


{-| FilmAlt - Icon
-}
filmAlt : Icon
filmAlt =
    Icon.Icon "film-alt"


{-| Filter - Icon
-}
filter : Icon
filter =
    Icon.Icon "filter"


{-| Fire - Icon
-}
fire : Icon
fire =
    Icon.Icon "fire"


{-| FireExtinguisher - Icon
-}
fireExtinguisher : Icon
fireExtinguisher =
    Icon.Icon "fire-extinguisher"


{-| Firefox - Logo
-}
firefox : Icon
firefox =
    Icon.Logo "firefox"


{-| FirstDraft - Logo
-}
firstDraft : Icon
firstDraft =
    Icon.Logo "firstdraft"


{-| FirstOrder - Logo
-}
firstOrder : Icon
firstOrder =
    Icon.Logo "first-order"


{-| FiveHundredPx - Logo
-}
fiveHundredPx : Icon
fiveHundredPx =
    Icon.Logo "500px"


{-| Flag - Icon
-}
flag : Icon
flag =
    Icon.Icon "flag"


{-| FlagCheckered - Icon
-}
flagCheckered : Icon
flagCheckered =
    Icon.Icon "flag-checkered"


{-| Flask - Icon
-}
flask : Icon
flask =
    Icon.Icon "flask"


{-| Flickr - Logo
-}
flickr : Icon
flickr =
    Icon.Logo "flickr"


{-| Fly - Logo
-}
fly : Icon
fly =
    Icon.Logo "fly"


{-| Folder - Icon
-}
folder : Icon
folder =
    Icon.Icon "folder"


{-| FolderOpen - Icon
-}
folderOpen : Icon
folderOpen =
    Icon.Icon "folder-open"


{-| Font - Icon
-}
font : Icon
font =
    Icon.Icon "font"


{-| FontAwesome - Logo
-}
fontAwesome : Icon
fontAwesome =
    Icon.Logo "font-awesome"


{-| FontAwesomeAlt - Logo
-}
fontAwesomeAlt : Icon
fontAwesomeAlt =
    Icon.Logo "font-awesome-alt"


{-| FontAwesomeFlag - Logo
-}
fontAwesomeFlag : Icon
fontAwesomeFlag =
    Icon.Logo "font-awesome-flag"


{-| FontIcons - Logo
-}
fontIcons : Icon
fontIcons =
    Icon.Logo "fonticons"


{-| FontIconsFi - Logo
-}
fontIconsFi : Icon
fontIconsFi =
    Icon.Logo "fonticons-fi"


{-| FortAwesome - Logo
-}
fortAwesome : Icon
fortAwesome =
    Icon.Logo "fort-awesome"


{-| FortAwesomeAlt - Logo
-}
fortAwesomeAlt : Icon
fortAwesomeAlt =
    Icon.Logo "fort-awesome-alt"


{-| Forumbee - Logo
-}
forumbee : Icon
forumbee =
    Icon.Logo "forumbee"


{-| Forward - Icon
-}
forward : Icon
forward =
    Icon.Icon "forward"


{-| Foursquare - Logo
-}
foursquare : Icon
foursquare =
    Icon.Logo "foursquare"


{-| FreeBSD - Logo
-}
freeBSD : Icon
freeBSD =
    Icon.Logo "freebsd"


{-| FreeCodeCamp - Logo
-}
freeCodeCamp : Icon
freeCodeCamp =
    Icon.Logo "free-code-camp"


{-| Frown - Icon
-}
frown : Icon
frown =
    Icon.Icon "frown"


{-| Futbol - Icon
-}
futbol : Icon
futbol =
    Icon.Icon "futbol"


{-| GG - Logo
-}
gG : Icon
gG =
    Icon.Logo "gg"


{-| GGCircle - Logo
-}
gGCircle : Icon
gGCircle =
    Icon.Logo "gg-circle"


{-| Gamepad - Icon
-}
gamepad : Icon
gamepad =
    Icon.Icon "gamepad"


{-| Gavel - Icon
-}
gavel : Icon
gavel =
    Icon.Icon "gavel"


{-| Gem - Icon
-}
gem : Icon
gem =
    Icon.Icon "gem"


{-| Genderless - Icon
-}
genderless : Icon
genderless =
    Icon.Icon "genderless"


{-| GetPocket - Logo
-}
getPocket : Icon
getPocket =
    Icon.Logo "get-pocket"


{-| Gift - Icon
-}
gift : Icon
gift =
    Icon.Icon "gift"


{-| Git - Logo
-}
git : Icon
git =
    Icon.Logo "git"


{-| GitHub - Logo
-}
gitHub : Icon
gitHub =
    Icon.Logo "github"


{-| GitHubAlt - Logo
-}
gitHubAlt : Icon
gitHubAlt =
    Icon.Logo "github-alt"


{-| GitHubSquare - Logo
-}
gitHubSquare : Icon
gitHubSquare =
    Icon.Logo "github-square"


{-| GitKraken - Logo
-}
gitKraken : Icon
gitKraken =
    Icon.Logo "gitkraken"


{-| GitLab - Logo
-}
gitLab : Icon
gitLab =
    Icon.Logo "gitlab"


{-| GitSquare - Logo
-}
gitSquare : Icon
gitSquare =
    Icon.Logo "git-square"


{-| Gitter - Logo
-}
gitter : Icon
gitter =
    Icon.Logo "gitter"


{-| GlassMartini - Icon
-}
glassMartini : Icon
glassMartini =
    Icon.Icon "glass-martini"


{-| Glide - Logo
-}
glide : Icon
glide =
    Icon.Logo "glide"


{-| GlideG - Logo
-}
glideG : Icon
glideG =
    Icon.Logo "glide-g"


{-| Globe - Icon
-}
globe : Icon
globe =
    Icon.Icon "globe"


{-| Gofore - Logo
-}
gofore : Icon
gofore =
    Icon.Logo "gofore"


{-| Goodreads - Logo
-}
goodreads : Icon
goodreads =
    Icon.Logo "goodreads"


{-| GoodreadsG - Logo
-}
goodreadsG : Icon
goodreadsG =
    Icon.Logo "goodreads-g"


{-| Google - Logo
-}
google : Icon
google =
    Icon.Logo "google"


{-| GoogleDrive - Logo
-}
googleDrive : Icon
googleDrive =
    Icon.Logo "google-drive"


{-| GooglePlay - Logo
-}
googlePlay : Icon
googlePlay =
    Icon.Logo "google-play"


{-| GooglePlus - Logo
-}
googlePlus : Icon
googlePlus =
    Icon.Logo "google-plus"


{-| GooglePlusG - Logo
-}
googlePlusG : Icon
googlePlusG =
    Icon.Logo "google-plus-g"


{-| GooglePlusSquare - Logo
-}
googlePlusSquare : Icon
googlePlusSquare =
    Icon.Logo "google-plus-square"


{-| GoogleWallet - Logo
-}
googleWallet : Icon
googleWallet =
    Icon.Logo "google-wallet"


{-| GraduationCap - Icon
-}
graduationCap : Icon
graduationCap =
    Icon.Icon "graduation-cap"


{-| Gratipay - Logo
-}
gratipay : Icon
gratipay =
    Icon.Logo "gratipay"


{-| Grav - Logo
-}
grav : Icon
grav =
    Icon.Logo "grav"


{-| Gripfire - Logo
-}
gripfire : Icon
gripfire =
    Icon.Logo "gripfire"


{-| Grunt - Logo
-}
grunt : Icon
grunt =
    Icon.Logo "grunt"


{-| Gulp - Logo
-}
gulp : Icon
gulp =
    Icon.Logo "gulp"


{-| H1 - Icon
-}
h1 : Icon
h1 =
    Icon.Icon "h1"


{-| H2 - Icon
-}
h2 : Icon
h2 =
    Icon.Icon "h2"


{-| H3 - Icon
-}
h3 : Icon
h3 =
    Icon.Icon "h3"


{-| HSquare - Icon
-}
hSquare : Icon
hSquare =
    Icon.Icon "h-square"


{-| HackerNews - Logo
-}
hackerNews : Icon
hackerNews =
    Icon.Logo "hacker-news"


{-| HackerNewsSquare - Logo
-}
hackerNewsSquare : Icon
hackerNewsSquare =
    Icon.Logo "hacker-news-square"


{-| HandLizard - Icon
-}
handLizard : Icon
handLizard =
    Icon.Icon "hand-lizard"


{-| HandPaper - Icon
-}
handPaper : Icon
handPaper =
    Icon.Icon "hand-paper"


{-| HandPeace - Icon
-}
handPeace : Icon
handPeace =
    Icon.Icon "hand-peace"


{-| HandPointDown - Icon
-}
handPointDown : Icon
handPointDown =
    Icon.Icon "hand-point-down"


{-| HandPointLeft - Icon
-}
handPointLeft : Icon
handPointLeft =
    Icon.Icon "hand-point-left"


{-| HandPointRight - Icon
-}
handPointRight : Icon
handPointRight =
    Icon.Icon "hand-point-right"


{-| HandPointUp - Icon
-}
handPointUp : Icon
handPointUp =
    Icon.Icon "hand-point-up"


{-| HandPointer - Icon
-}
handPointer : Icon
handPointer =
    Icon.Icon "hand-pointer"


{-| HandRock - Icon
-}
handRock : Icon
handRock =
    Icon.Icon "hand-rock"


{-| HandScissors - Icon
-}
handScissors : Icon
handScissors =
    Icon.Icon "hand-scissors"


{-| HandSpock - Icon
-}
handSpock : Icon
handSpock =
    Icon.Icon "hand-spock"


{-| Handshake - Icon
-}
handshake : Icon
handshake =
    Icon.Icon "handshake"


{-| Hashtag - Icon
-}
hashtag : Icon
hashtag =
    Icon.Icon "hashtag"


{-| Hdd - Icon
-}
hdd : Icon
hdd =
    Icon.Icon "hdd"


{-| Heading - Icon
-}
heading : Icon
heading =
    Icon.Icon "heading"


{-| Headphones - Icon
-}
headphones : Icon
headphones =
    Icon.Icon "headphones"


{-| Heart - Icon
-}
heart : Icon
heart =
    Icon.Icon "heart"


{-| Heartbeat - Icon
-}
heartbeat : Icon
heartbeat =
    Icon.Icon "heartbeat"


{-| Hexagon - Icon
-}
hexagon : Icon
hexagon =
    Icon.Icon "hexagon"


{-| HireAHelper - Logo
-}
hireAHelper : Icon
hireAHelper =
    Icon.Logo "hire-a-helper"


{-| History - Icon
-}
history : Icon
history =
    Icon.Icon "history"


{-| Home - Icon
-}
home : Icon
home =
    Icon.Icon "home"


{-| Hooli - Logo
-}
hooli : Icon
hooli =
    Icon.Logo "hooli"


{-| Hospital - Icon
-}
hospital : Icon
hospital =
    Icon.Icon "hospital"


{-| Hotjar - Logo
-}
hotjar : Icon
hotjar =
    Icon.Logo "hotjar"


{-| Hourglass - Icon
-}
hourglass : Icon
hourglass =
    Icon.Icon "hourglass"


{-| HourglassEnd - Icon
-}
hourglassEnd : Icon
hourglassEnd =
    Icon.Icon "hourglass-end"


{-| HourglassHalf - Icon
-}
hourglassHalf : Icon
hourglassHalf =
    Icon.Icon "hourglass-half"


{-| HourglassStart - Icon
-}
hourglassStart : Icon
hourglassStart =
    Icon.Icon "hourglass-start"


{-| Houzz - Logo
-}
houzz : Icon
houzz =
    Icon.Logo "houzz"


{-| Html5 - Logo
-}
html5 : Icon
html5 =
    Icon.Logo "html5"


{-| HubSpot - Logo
-}
hubSpot : Icon
hubSpot =
    Icon.Logo "hubspot"


{-| ICursor - Icon
-}
iCursor : Icon
iCursor =
    Icon.Icon "i-cursor"


{-| IdBadge - Icon
-}
idBadge : Icon
idBadge =
    Icon.Icon "id-badge"


{-| IdCard - Icon
-}
idCard : Icon
idCard =
    Icon.Icon "id-card"


{-| Image - Icon
-}
image : Icon
image =
    Icon.Icon "image"


{-| Images - Icon
-}
images : Icon
images =
    Icon.Icon "images"


{-| Imdb - Logo
-}
imdb : Icon
imdb =
    Icon.Logo "imdb"


{-| Inbox - Icon
-}
inbox : Icon
inbox =
    Icon.Icon "inbox"


{-| InboxIn - Icon
-}
inboxIn : Icon
inboxIn =
    Icon.Icon "inbox-in"


{-| InboxOut - Icon
-}
inboxOut : Icon
inboxOut =
    Icon.Icon "inbox-out"


{-| Indent - Icon
-}
indent : Icon
indent =
    Icon.Icon "indent"


{-| Industry - Icon
-}
industry : Icon
industry =
    Icon.Icon "industry"


{-| IndustryAlt - Icon
-}
industryAlt : Icon
industryAlt =
    Icon.Icon "industry-alt"


{-| Info - Icon
-}
info : Icon
info =
    Icon.Icon "info"


{-| InfoCircle - Icon
-}
infoCircle : Icon
infoCircle =
    Icon.Icon "info-circle"


{-| InfoSquare - Icon
-}
infoSquare : Icon
infoSquare =
    Icon.Icon "info-square"


{-| Instagram - Logo
-}
instagram : Icon
instagram =
    Icon.Logo "instagram"


{-| InternetExplorer - Logo
-}
internetExplorer : Icon
internetExplorer =
    Icon.Logo "internet-explorer"


{-| IoxHost - Logo
-}
ioxHost : Icon
ioxHost =
    Icon.Logo "ioxhost"


{-| Italic - Icon
-}
italic : Icon
italic =
    Icon.Icon "italic"


{-| Itunes - Logo
-}
itunes : Icon
itunes =
    Icon.Logo "itunes"


{-| ItunesNote - Logo
-}
itunesNote : Icon
itunesNote =
    Icon.Logo "itunes-note"


{-| JSFiddle - Logo
-}
jSFiddle : Icon
jSFiddle =
    Icon.Logo "jsfiddle"


{-| JackOLantern - Icon
-}
jackOLantern : Icon
jackOLantern =
    Icon.Icon "jack-o-lantern"


{-| Jenkins - Logo
-}
jenkins : Icon
jenkins =
    Icon.Logo "jenkins"


{-| Joget - Logo
-}
joget : Icon
joget =
    Icon.Logo "joget"


{-| Joomla - Logo
-}
joomla : Icon
joomla =
    Icon.Logo "joomla"


{-| Js - Logo
-}
js : Icon
js =
    Icon.Logo "js"


{-| JsSquare - Logo
-}
jsSquare : Icon
jsSquare =
    Icon.Logo "js-square"


{-| Key - Icon
-}
key : Icon
key =
    Icon.Icon "key"


{-| KeyCDN - Logo
-}
keyCDN : Icon
keyCDN =
    Icon.Logo "keycdn"


{-| Keyboard - Icon
-}
keyboard : Icon
keyboard =
    Icon.Icon "keyboard"


{-| Kickstarter - Logo
-}
kickstarter : Icon
kickstarter =
    Icon.Logo "kickstarter"


{-| KickstarterK - Logo
-}
kickstarterK : Icon
kickstarterK =
    Icon.Logo "kickstarter-k"


{-| Korvue - Logo
-}
korvue : Icon
korvue =
    Icon.Logo "korvue"


{-| Language - Icon
-}
language : Icon
language =
    Icon.Icon "language"


{-| Laptop - Icon
-}
laptop : Icon
laptop =
    Icon.Icon "laptop"


{-| Laravel - Logo
-}
laravel : Icon
laravel =
    Icon.Logo "laravel"


{-| Lastfm - Logo
-}
lastfm : Icon
lastfm =
    Icon.Logo "lastfm"


{-| LastfmSquare - Logo
-}
lastfmSquare : Icon
lastfmSquare =
    Icon.Logo "lastfm-square"


{-| Leaf - Icon
-}
leaf : Icon
leaf =
    Icon.Icon "leaf"


{-| Leanpub - Logo
-}
leanpub : Icon
leanpub =
    Icon.Logo "leanpub"


{-| Lemon - Icon
-}
lemon : Icon
lemon =
    Icon.Icon "lemon"


{-| Less - Logo
-}
less : Icon
less =
    Icon.Logo "less"


{-| LevelDown - Icon
-}
levelDown : Icon
levelDown =
    Icon.Icon "level-down"


{-| LevelDownAlt - Icon
-}
levelDownAlt : Icon
levelDownAlt =
    Icon.Icon "level-down-alt"


{-| LevelUp - Icon
-}
levelUp : Icon
levelUp =
    Icon.Icon "level-up"


{-| LevelUpAlt - Icon
-}
levelUpAlt : Icon
levelUpAlt =
    Icon.Icon "level-up-alt"


{-| LifeRing - Icon
-}
lifeRing : Icon
lifeRing =
    Icon.Icon "life-ring"


{-| Lightbulb - Icon
-}
lightbulb : Icon
lightbulb =
    Icon.Icon "lightbulb"


{-| Line - Logo
-}
line : Icon
line =
    Icon.Logo "line"


{-| Link - Icon
-}
link : Icon
link =
    Icon.Icon "link"


{-| LinkedIn - Logo
-}
linkedIn : Icon
linkedIn =
    Icon.Logo "linkedin"


{-| LinkedInInverted - Logo
-}
linkedInInverted : Icon
linkedInInverted =
    Icon.Logo "linkedin-in"


{-| Linode - Logo
-}
linode : Icon
linode =
    Icon.Logo "linode"


{-| Linux - Logo
-}
linux : Icon
linux =
    Icon.Logo "linux"


{-| LiraSign - Icon
-}
liraSign : Icon
liraSign =
    Icon.Icon "lira-sign"


{-| List - Icon
-}
list : Icon
list =
    Icon.Icon "list"


{-| ListAlt - Icon
-}
listAlt : Icon
listAlt =
    Icon.Icon "list-alt"


{-| ListOl - Icon
-}
listOl : Icon
listOl =
    Icon.Icon "list-ol"


{-| ListUl - Icon
-}
listUl : Icon
listUl =
    Icon.Icon "list-ul"


{-| LocationArrow - Icon
-}
locationArrow : Icon
locationArrow =
    Icon.Icon "location-arrow"


{-| Lock - Icon
-}
lock : Icon
lock =
    Icon.Icon "lock"


{-| LockAlt - Icon
-}
lockAlt : Icon
lockAlt =
    Icon.Icon "lock-alt"


{-| LockOpen - Icon
-}
lockOpen : Icon
lockOpen =
    Icon.Icon "lock-open"


{-| LockOpenAlt - Icon
-}
lockOpenAlt : Icon
lockOpenAlt =
    Icon.Icon "lock-open-alt"


{-| LongArrowAltDown - Icon
-}
longArrowAltDown : Icon
longArrowAltDown =
    Icon.Icon "long-arrow-alt-down"


{-| LongArrowAltLeft - Icon
-}
longArrowAltLeft : Icon
longArrowAltLeft =
    Icon.Icon "long-arrow-alt-left"


{-| LongArrowAltRight - Icon
-}
longArrowAltRight : Icon
longArrowAltRight =
    Icon.Icon "long-arrow-alt-right"


{-| LongArrowAltUp - Icon
-}
longArrowAltUp : Icon
longArrowAltUp =
    Icon.Icon "long-arrow-alt-up"


{-| LongArrowDown - Icon
-}
longArrowDown : Icon
longArrowDown =
    Icon.Icon "long-arrow-down"


{-| LongArrowLeft - Icon
-}
longArrowLeft : Icon
longArrowLeft =
    Icon.Icon "long-arrow-left"


{-| LongArrowRight - Icon
-}
longArrowRight : Icon
longArrowRight =
    Icon.Icon "long-arrow-right"


{-| LongArrowUp - Icon
-}
longArrowUp : Icon
longArrowUp =
    Icon.Icon "long-arrow-up"


{-| LowVision - Icon
-}
lowVision : Icon
lowVision =
    Icon.Icon "low-vision"


{-| Lyft - Logo
-}
lyft : Icon
lyft =
    Icon.Logo "lyft"


{-| MODX - Logo
-}
mODX : Icon
mODX =
    Icon.Logo "modx"


{-| Magento - Logo
-}
magento : Icon
magento =
    Icon.Logo "magento"


{-| Magic - Icon
-}
magic : Icon
magic =
    Icon.Icon "magic"


{-| Magnet - Icon
-}
magnet : Icon
magnet =
    Icon.Icon "magnet"


{-| Male - Icon
-}
male : Icon
male =
    Icon.Icon "male"


{-| Map - Icon
-}
map : Icon
map =
    Icon.Icon "map"


{-| MapMarker - Icon
-}
mapMarker : Icon
mapMarker =
    Icon.Icon "map-marker"


{-| MapMarkerAlt - Icon
-}
mapMarkerAlt : Icon
mapMarkerAlt =
    Icon.Icon "map-marker-alt"


{-| MapPin - Icon
-}
mapPin : Icon
mapPin =
    Icon.Icon "map-pin"


{-| MapSigns - Icon
-}
mapSigns : Icon
mapSigns =
    Icon.Icon "map-signs"


{-| Mars - Icon
-}
mars : Icon
mars =
    Icon.Icon "mars"


{-| MarsDouble - Icon
-}
marsDouble : Icon
marsDouble =
    Icon.Icon "mars-double"


{-| MarsStroke - Icon
-}
marsStroke : Icon
marsStroke =
    Icon.Icon "mars-stroke"


{-| MarsStrokeHorizontal - Icon
-}
marsStrokeHorizontal : Icon
marsStrokeHorizontal =
    Icon.Icon "mars-stroke-h"


{-| MarsStrokeVertical - Icon
-}
marsStrokeVertical : Icon
marsStrokeVertical =
    Icon.Icon "mars-stroke-v"


{-| Maxcdn - Logo
-}
maxcdn : Icon
maxcdn =
    Icon.Logo "maxcdn"


{-| MedApps - Logo
-}
medApps : Icon
medApps =
    Icon.Logo "medapps"


{-| Medium - Logo
-}
medium : Icon
medium =
    Icon.Logo "medium"


{-| MediumM - Logo
-}
mediumM : Icon
mediumM =
    Icon.Logo "medium-m"


{-| Medkit - Icon
-}
medkit : Icon
medkit =
    Icon.Icon "medkit"


{-| Medrt - Logo
-}
medrt : Icon
medrt =
    Icon.Logo "medrt"


{-| Meetup - Logo
-}
meetup : Icon
meetup =
    Icon.Logo "meetup"


{-| Meh - Icon
-}
meh : Icon
meh =
    Icon.Icon "meh"


{-| Mercury - Icon
-}
mercury : Icon
mercury =
    Icon.Icon "mercury"


{-| Microchip - Icon
-}
microchip : Icon
microchip =
    Icon.Icon "microchip"


{-| Microphone - Icon
-}
microphone : Icon
microphone =
    Icon.Icon "microphone"


{-| MicrophoneAlt - Icon
-}
microphoneAlt : Icon
microphoneAlt =
    Icon.Icon "microphone-alt"


{-| MicrophoneSlash - Icon
-}
microphoneSlash : Icon
microphoneSlash =
    Icon.Icon "microphone-slash"


{-| Microsoft - Logo
-}
microsoft : Icon
microsoft =
    Icon.Logo "microsoft"


{-| Minus - Icon
-}
minus : Icon
minus =
    Icon.Icon "minus"


{-| MinusCircle - Icon
-}
minusCircle : Icon
minusCircle =
    Icon.Icon "minus-circle"


{-| MinusHexagon - Icon
-}
minusHexagon : Icon
minusHexagon =
    Icon.Icon "minus-hexagon"


{-| MinusOctagon - Icon
-}
minusOctagon : Icon
minusOctagon =
    Icon.Icon "minus-octagon"


{-| MinusSquare - Icon
-}
minusSquare : Icon
minusSquare =
    Icon.Icon "minus-square"


{-| Mix - Logo
-}
mix : Icon
mix =
    Icon.Logo "mix"


{-| Mixcloud - Logo
-}
mixcloud : Icon
mixcloud =
    Icon.Logo "mixcloud"


{-| Mizuni - Logo
-}
mizuni : Icon
mizuni =
    Icon.Logo "mizuni"


{-| Mobile - Icon
-}
mobile : Icon
mobile =
    Icon.Icon "mobile"


{-| MobileAlt - Icon
-}
mobileAlt : Icon
mobileAlt =
    Icon.Icon "mobile-alt"


{-| MobileAndroid - Icon
-}
mobileAndroid : Icon
mobileAndroid =
    Icon.Icon "mobile-android"


{-| MobileAndroidAlt - Icon
-}
mobileAndroidAlt : Icon
mobileAndroidAlt =
    Icon.Icon "mobile-android-alt"


{-| Monero - Logo
-}
monero : Icon
monero =
    Icon.Logo "monero"


{-| MoneyBill - Icon
-}
moneyBill : Icon
moneyBill =
    Icon.Icon "money-bill"


{-| MoneyBillAlt - Icon
-}
moneyBillAlt : Icon
moneyBillAlt =
    Icon.Icon "money-bill-alt"


{-| Moon - Icon
-}
moon : Icon
moon =
    Icon.Icon "moon"


{-| Motorcycle - Icon
-}
motorcycle : Icon
motorcycle =
    Icon.Icon "motorcycle"


{-| MousePointer - Icon
-}
mousePointer : Icon
mousePointer =
    Icon.Icon "mouse-pointer"


{-| Music - Icon
-}
music : Icon
music =
    Icon.Icon "music"


{-| NS8 - Logo
-}
nS8 : Icon
nS8 =
    Icon.Logo "ns8"


{-| Napster - Logo
-}
napster : Icon
napster =
    Icon.Logo "napster"


{-| Neuter - Icon
-}
neuter : Icon
neuter =
    Icon.Icon "neuter"


{-| Newspaper - Icon
-}
newspaper : Icon
newspaper =
    Icon.Icon "newspaper"


{-| NintendoSwitch - Logo
-}
nintendoSwitch : Icon
nintendoSwitch =
    Icon.Logo "nintendo-switch"


{-| Node - Logo
-}
node : Icon
node =
    Icon.Logo "node"


{-| Nodejs - Logo
-}
nodejs : Icon
nodejs =
    Icon.Logo "node-js"


{-| Npm - Logo
-}
npm : Icon
npm =
    Icon.Logo "npm"


{-| Nutritionix - Logo
-}
nutritionix : Icon
nutritionix =
    Icon.Logo "nutritionix"


{-| ObjectGroup - Icon
-}
objectGroup : Icon
objectGroup =
    Icon.Icon "object-group"


{-| ObjectUngroup - Icon
-}
objectUngroup : Icon
objectUngroup =
    Icon.Icon "object-ungroup"


{-| Octagon - Icon
-}
octagon : Icon
octagon =
    Icon.Icon "octagon"


{-| Odnoklassniki - Logo
-}
odnoklassniki : Icon
odnoklassniki =
    Icon.Logo "odnoklassniki"


{-| OdnoklassnikiSquare - Logo
-}
odnoklassnikiSquare : Icon
odnoklassnikiSquare =
    Icon.Logo "odnoklassniki-square"


{-| OpenCart - Logo
-}
openCart : Icon
openCart =
    Icon.Logo "opencart"


{-| OpenID - Logo
-}
openID : Icon
openID =
    Icon.Logo "openid"


{-| OpenSourceInitiative - Logo
-}
openSourceInitiative : Icon
openSourceInitiative =
    Icon.Logo "osi"


{-| Opera - Logo
-}
opera : Icon
opera =
    Icon.Logo "opera"


{-| OptinMonster - Logo
-}
optinMonster : Icon
optinMonster =
    Icon.Logo "optin-monster"


{-| Outdent - Icon
-}
outdent : Icon
outdent =
    Icon.Icon "outdent"


{-| Page4 - Logo
-}
page4 : Icon
page4 =
    Icon.Logo "page4"


{-| PageLines - Logo
-}
pageLines : Icon
pageLines =
    Icon.Logo "pagelines"


{-| PaintBrush - Icon
-}
paintBrush : Icon
paintBrush =
    Icon.Icon "paint-brush"


{-| PalFed - Logo
-}
palFed : Icon
palFed =
    Icon.Logo "palfed"


{-| PaperPlane - Icon
-}
paperPlane : Icon
paperPlane =
    Icon.Icon "paper-plane"


{-| Paperclip - Icon
-}
paperclip : Icon
paperclip =
    Icon.Icon "paperclip"


{-| Paragraph - Icon
-}
paragraph : Icon
paragraph =
    Icon.Icon "paragraph"


{-| Paste - Icon
-}
paste : Icon
paste =
    Icon.Icon "paste"


{-| Patreon - Logo
-}
patreon : Icon
patreon =
    Icon.Logo "patreon"


{-| Pause - Icon
-}
pause : Icon
pause =
    Icon.Icon "pause"


{-| PauseCircle - Icon
-}
pauseCircle : Icon
pauseCircle =
    Icon.Icon "pause-circle"


{-| Paw - Icon
-}
paw : Icon
paw =
    Icon.Icon "paw"


{-| PayPal - Logo
-}
payPal : Icon
payPal =
    Icon.Logo "paypal"


{-| Pen - Icon
-}
pen : Icon
pen =
    Icon.Icon "pen"


{-| PenAlt - Icon
-}
penAlt : Icon
penAlt =
    Icon.Icon "pen-alt"


{-| PenSquare - Icon
-}
penSquare : Icon
penSquare =
    Icon.Icon "pen-square"


{-| Pencil - Icon
-}
pencil : Icon
pencil =
    Icon.Icon "pencil"


{-| PencilAlt - Icon
-}
pencilAlt : Icon
pencilAlt =
    Icon.Icon "pencil-alt"


{-| Percent - Icon
-}
percent : Icon
percent =
    Icon.Icon "percent"


{-| Periscope - Logo
-}
periscope : Icon
periscope =
    Icon.Logo "periscope"


{-| Phabricator - Logo
-}
phabricator : Icon
phabricator =
    Icon.Logo "phabricator"


{-| PhoenixFramework - Logo
-}
phoenixFramework : Icon
phoenixFramework =
    Icon.Logo "phoenix-framework"


{-| Phone - Icon
-}
phone : Icon
phone =
    Icon.Icon "phone"


{-| PhoneSlash - Icon
-}
phoneSlash : Icon
phoneSlash =
    Icon.Icon "phone-slash"


{-| PhoneSquare - Icon
-}
phoneSquare : Icon
phoneSquare =
    Icon.Icon "phone-square"


{-| PhoneVolume - Icon
-}
phoneVolume : Icon
phoneVolume =
    Icon.Icon "phone-volume"


{-| PiedPiper - Logo
-}
piedPiper : Icon
piedPiper =
    Icon.Logo "pied-piper"


{-| PiedPiperAlt - Logo
-}
piedPiperAlt : Icon
piedPiperAlt =
    Icon.Logo "pied-piper-alt"


{-| PiedPiperPp - Logo
-}
piedPiperPp : Icon
piedPiperPp =
    Icon.Logo "pied-piper-pp"


{-| Pinterest - Logo
-}
pinterest : Icon
pinterest =
    Icon.Logo "pinterest"


{-| PinterestP - Logo
-}
pinterestP : Icon
pinterestP =
    Icon.Logo "pinterest-p"


{-| PinterestSquare - Logo
-}
pinterestSquare : Icon
pinterestSquare =
    Icon.Logo "pinterest-square"


{-| Plane - Icon
-}
plane : Icon
plane =
    Icon.Icon "plane"


{-| PlaneAlt - Icon
-}
planeAlt : Icon
planeAlt =
    Icon.Icon "plane-alt"


{-| Play - Icon
-}
play : Icon
play =
    Icon.Icon "play"


{-| PlayCircle - Icon
-}
playCircle : Icon
playCircle =
    Icon.Icon "play-circle"


{-| Playstation - Logo
-}
playstation : Icon
playstation =
    Icon.Logo "playstation"


{-| Plug - Icon
-}
plug : Icon
plug =
    Icon.Icon "plug"


{-| Plus - Icon
-}
plus : Icon
plus =
    Icon.Icon "plus"


{-| PlusCircle - Icon
-}
plusCircle : Icon
plusCircle =
    Icon.Icon "plus-circle"


{-| PlusHexagon - Icon
-}
plusHexagon : Icon
plusHexagon =
    Icon.Icon "plus-hexagon"


{-| PlusOctagon - Icon
-}
plusOctagon : Icon
plusOctagon =
    Icon.Icon "plus-octagon"


{-| PlusSquare - Icon
-}
plusSquare : Icon
plusSquare =
    Icon.Icon "plus-square"


{-| Podcast - Icon
-}
podcast : Icon
podcast =
    Icon.Icon "podcast"


{-| Poo - Icon
-}
poo : Icon
poo =
    Icon.Icon "poo"


{-| Portrait - Icon
-}
portrait : Icon
portrait =
    Icon.Icon "portrait"


{-| PoundSign - Icon
-}
poundSign : Icon
poundSign =
    Icon.Icon "pound-sign"


{-| PowerOff - Icon
-}
powerOff : Icon
powerOff =
    Icon.Icon "power-off"


{-| Print - Icon
-}
print : Icon
print =
    Icon.Icon "print"


{-| ProductHunt - Logo
-}
productHunt : Icon
productHunt =
    Icon.Logo "product-hunt"


{-| Pushed - Logo
-}
pushed : Icon
pushed =
    Icon.Logo "pushed"


{-| PuzzlePiece - Icon
-}
puzzlePiece : Icon
puzzlePiece =
    Icon.Icon "puzzle-piece"


{-| Python - Logo
-}
python : Icon
python =
    Icon.Logo "python"


{-| QQ - Logo
-}
qQ : Icon
qQ =
    Icon.Logo "qq"


{-| Qrcode - Icon
-}
qrcode : Icon
qrcode =
    Icon.Icon "qrcode"


{-| Question - Icon
-}
question : Icon
question =
    Icon.Icon "question"


{-| QuestionCircle - Icon
-}
questionCircle : Icon
questionCircle =
    Icon.Icon "question-circle"


{-| QuestionSquare - Icon
-}
questionSquare : Icon
questionSquare =
    Icon.Icon "question-square"


{-| Quora - Logo
-}
quora : Icon
quora =
    Icon.Logo "quora"


{-| QuoteLeft - Icon
-}
quoteLeft : Icon
quoteLeft =
    Icon.Icon "quote-left"


{-| QuoteRight - Icon
-}
quoteRight : Icon
quoteRight =
    Icon.Icon "quote-right"


{-| RSS - Icon
-}
rSS : Icon
rSS =
    Icon.Icon "rss"


{-| RSSSquare - Icon
-}
rSSSquare : Icon
rSSSquare =
    Icon.Icon "rss-square"


{-| Random - Icon
-}
random : Icon
random =
    Icon.Icon "random"


{-| Ravelry - Logo
-}
ravelry : Icon
ravelry =
    Icon.Logo "ravelry"


{-| React - Logo
-}
react : Icon
react =
    Icon.Logo "react"


{-| Rebel - Logo
-}
rebel : Icon
rebel =
    Icon.Logo "rebel"


{-| RectangleLandscape - Icon
-}
rectangleLandscape : Icon
rectangleLandscape =
    Icon.Icon "rectangle-landscape"


{-| RectanglePortrait - Icon
-}
rectanglePortrait : Icon
rectanglePortrait =
    Icon.Icon "rectangle-portrait"


{-| RectangleWide - Icon
-}
rectangleWide : Icon
rectangleWide =
    Icon.Icon "rectangle-wide"


{-| Recycle - Icon
-}
recycle : Icon
recycle =
    Icon.Icon "recycle"


{-| RedRiver - Logo
-}
redRiver : Icon
redRiver =
    Icon.Logo "red-river"


{-| Reddit - Logo
-}
reddit : Icon
reddit =
    Icon.Logo "reddit"


{-| RedditAlien - Logo
-}
redditAlien : Icon
redditAlien =
    Icon.Logo "reddit-alien"


{-| RedditSquare - Logo
-}
redditSquare : Icon
redditSquare =
    Icon.Logo "reddit-square"


{-| Redo - Icon
-}
redo : Icon
redo =
    Icon.Icon "redo"


{-| RedoAlt - Icon
-}
redoAlt : Icon
redoAlt =
    Icon.Icon "redo-alt"


{-| Registered - Icon
-}
registered : Icon
registered =
    Icon.Icon "registered"


{-| Rendact - Logo
-}
rendact : Icon
rendact =
    Icon.Logo "rendact"


{-| Renren - Logo
-}
renren : Icon
renren =
    Icon.Logo "renren"


{-| Repeat - Icon
-}
repeat : Icon
repeat =
    Icon.Icon "repeat"


{-| Repeat1 - Icon
-}
repeat1 : Icon
repeat1 =
    Icon.Icon "repeat-1"


{-| Repeat1Alt - Icon
-}
repeat1Alt : Icon
repeat1Alt =
    Icon.Icon "repeat-1-alt"


{-| RepeatAlt - Icon
-}
repeatAlt : Icon
repeatAlt =
    Icon.Icon "repeat-alt"


{-| Reply - Icon
-}
reply : Icon
reply =
    Icon.Icon "reply"


{-| ReplyAll - Icon
-}
replyAll : Icon
replyAll =
    Icon.Icon "reply-all"


{-| Replyd - Logo
-}
replyd : Icon
replyd =
    Icon.Logo "replyd"


{-| Resolving - Logo
-}
resolving : Icon
resolving =
    Icon.Logo "resolving"


{-| Retweet - Icon
-}
retweet : Icon
retweet =
    Icon.Icon "retweet"


{-| RetweetAlt - Icon
-}
retweetAlt : Icon
retweetAlt =
    Icon.Icon "retweet-alt"


{-| Road - Icon
-}
road : Icon
road =
    Icon.Icon "road"


{-| RockRMS - Logo
-}
rockRMS : Icon
rockRMS =
    Icon.Logo "rockrms"


{-| Rocket - Icon
-}
rocket : Icon
rocket =
    Icon.Icon "rocket"


{-| RocketChat - Logo
-}
rocketChat : Icon
rocketChat =
    Icon.Logo "rocketchat"


{-| RubleSign - Icon
-}
rubleSign : Icon
rubleSign =
    Icon.Icon "ruble-sign"


{-| RupeeSign - Icon
-}
rupeeSign : Icon
rupeeSign =
    Icon.Icon "rupee-sign"


{-| Safari - Logo
-}
safari : Icon
safari =
    Icon.Logo "safari"


{-| Sass - Logo
-}
sass : Icon
sass =
    Icon.Logo "sass"


{-| Save - Icon
-}
save : Icon
save =
    Icon.Icon "save"


{-| Schlix - Logo
-}
schlix : Icon
schlix =
    Icon.Logo "schlix"


{-| Scribd - Logo
-}
scribd : Icon
scribd =
    Icon.Logo "scribd"


{-| Scrubber - Icon
-}
scrubber : Icon
scrubber =
    Icon.Icon "scrubber"


{-| Search - Icon
-}
search : Icon
search =
    Icon.Icon "search"


{-| SearchMinus - Icon
-}
searchMinus : Icon
searchMinus =
    Icon.Icon "search-minus"


{-| SearchPlus - Icon
-}
searchPlus : Icon
searchPlus =
    Icon.Icon "search-plus"


{-| Searchengin - Logo
-}
searchengin : Icon
searchengin =
    Icon.Logo "searchengin"


{-| SellCast - Logo
-}
sellCast : Icon
sellCast =
    Icon.Logo "sellcast"


{-| Sellsy - Logo
-}
sellsy : Icon
sellsy =
    Icon.Logo "sellsy"


{-| Server - Icon
-}
server : Icon
server =
    Icon.Icon "server"


{-| ServiceStack - Logo
-}
serviceStack : Icon
serviceStack =
    Icon.Logo "servicestack"


{-| Share - Icon
-}
share : Icon
share =
    Icon.Icon "share"


{-| ShareAll - Icon
-}
shareAll : Icon
shareAll =
    Icon.Icon "share-all"


{-| ShareAlt - Icon
-}
shareAlt : Icon
shareAlt =
    Icon.Icon "share-alt"


{-| ShareAltSquare - Icon
-}
shareAltSquare : Icon
shareAltSquare =
    Icon.Icon "share-alt-square"


{-| ShareSquare - Icon
-}
shareSquare : Icon
shareSquare =
    Icon.Icon "share-square"


{-| ShekelSign - Icon
-}
shekelSign : Icon
shekelSign =
    Icon.Icon "shekel-sign"


{-| Shield - Icon
-}
shield : Icon
shield =
    Icon.Icon "shield"


{-| ShieldAlt - Icon
-}
shieldAlt : Icon
shieldAlt =
    Icon.Icon "shield-alt"


{-| ShieldCheck - Icon
-}
shieldCheck : Icon
shieldCheck =
    Icon.Icon "shield-check"


{-| Ship - Icon
-}
ship : Icon
ship =
    Icon.Icon "ship"


{-| ShirtsInBulk - Logo
-}
shirtsInBulk : Icon
shirtsInBulk =
    Icon.Logo "shirtsinbulk"


{-| ShoppingBag - Icon
-}
shoppingBag : Icon
shoppingBag =
    Icon.Icon "shopping-bag"


{-| ShoppingBasket - Icon
-}
shoppingBasket : Icon
shoppingBasket =
    Icon.Icon "shopping-basket"


{-| ShoppingCart - Icon
-}
shoppingCart : Icon
shoppingCart =
    Icon.Icon "shopping-cart"


{-| Shower - Icon
-}
shower : Icon
shower =
    Icon.Icon "shower"


{-| SignIn - Icon
-}
signIn : Icon
signIn =
    Icon.Icon "sign-in"


{-| SignInAlt - Icon
-}
signInAlt : Icon
signInAlt =
    Icon.Icon "sign-in-alt"


{-| SignLanguage - Icon
-}
signLanguage : Icon
signLanguage =
    Icon.Icon "sign-language"


{-| SignOut - Icon
-}
signOut : Icon
signOut =
    Icon.Icon "sign-out"


{-| SignOutAlt - Icon
-}
signOutAlt : Icon
signOutAlt =
    Icon.Icon "sign-out-alt"


{-| Signal - Icon
-}
signal : Icon
signal =
    Icon.Icon "signal"


{-| SimplyBuilt - Logo
-}
simplyBuilt : Icon
simplyBuilt =
    Icon.Logo "simplybuilt"


{-| Sistrix - Logo
-}
sistrix : Icon
sistrix =
    Icon.Logo "sistrix"


{-| Sitemap - Icon
-}
sitemap : Icon
sitemap =
    Icon.Icon "sitemap"


{-| SkyAtlas - Logo
-}
skyAtlas : Icon
skyAtlas =
    Icon.Logo "skyatlas"


{-| Skype - Logo
-}
skype : Icon
skype =
    Icon.Logo "skype"


{-| Slack - Logo
-}
slack : Icon
slack =
    Icon.Logo "slack"


{-| SlackHash - Logo
-}
slackHash : Icon
slackHash =
    Icon.Logo "slack-hash"


{-| SlidersHorizontal - Icon
-}
slidersHorizontal : Icon
slidersHorizontal =
    Icon.Icon "sliders-h"


{-| SlidersHorizontalSquare - Icon
-}
slidersHorizontalSquare : Icon
slidersHorizontalSquare =
    Icon.Icon "sliders-h-square"


{-| SlidersV - Icon
-}
slidersV : Icon
slidersV =
    Icon.Icon "sliders-v"


{-| SlidersVSquare - Icon
-}
slidersVSquare : Icon
slidersVSquare =
    Icon.Icon "sliders-v-square"


{-| Slideshare - Logo
-}
slideshare : Icon
slideshare =
    Icon.Logo "slideshare"


{-| Smile - Icon
-}
smile : Icon
smile =
    Icon.Icon "smile"


{-| Snapchat - Logo
-}
snapchat : Icon
snapchat =
    Icon.Logo "snapchat"


{-| SnapchatGhost - Logo
-}
snapchatGhost : Icon
snapchatGhost =
    Icon.Logo "snapchat-ghost"


{-| SnapchatSquare - Logo
-}
snapchatSquare : Icon
snapchatSquare =
    Icon.Logo "snapchat-square"


{-| Snowflake - Icon
-}
snowflake : Icon
snowflake =
    Icon.Icon "snowflake"


{-| Sort - Icon
-}
sort : Icon
sort =
    Icon.Icon "sort"


{-| SortAlphaDown - Icon
-}
sortAlphaDown : Icon
sortAlphaDown =
    Icon.Icon "sort-alpha-down"


{-| SortAlphaUp - Icon
-}
sortAlphaUp : Icon
sortAlphaUp =
    Icon.Icon "sort-alpha-up"


{-| SortAmountDown - Icon
-}
sortAmountDown : Icon
sortAmountDown =
    Icon.Icon "sort-amount-down"


{-| SortAmountUp - Icon
-}
sortAmountUp : Icon
sortAmountUp =
    Icon.Icon "sort-amount-up"


{-| SortDown - Icon
-}
sortDown : Icon
sortDown =
    Icon.Icon "sort-down"


{-| SortNumericDown - Icon
-}
sortNumericDown : Icon
sortNumericDown =
    Icon.Icon "sort-numeric-down"


{-| SortNumericUp - Icon
-}
sortNumericUp : Icon
sortNumericUp =
    Icon.Icon "sort-numeric-up"


{-| SortUp - Icon
-}
sortUp : Icon
sortUp =
    Icon.Icon "sort-up"


{-| SoundCloud - Logo
-}
soundCloud : Icon
soundCloud =
    Icon.Logo "soundcloud"


{-| SpaceShuttle - Icon
-}
spaceShuttle : Icon
spaceShuttle =
    Icon.Icon "space-shuttle"


{-| Spade - Icon
-}
spade : Icon
spade =
    Icon.Icon "spade"


{-| Speakap - Logo
-}
speakap : Icon
speakap =
    Icon.Logo "speakap"


{-| Spinner - Icon
-}
spinner : Icon
spinner =
    Icon.Icon "spinner"


{-| SpinnerThird - Icon
-}
spinnerThird : Icon
spinnerThird =
    Icon.Icon "spinner-third"


{-| Spotify - Logo
-}
spotify : Icon
spotify =
    Icon.Logo "spotify"


{-| Square - Icon
-}
square : Icon
square =
    Icon.Icon "square"


{-| StackExchange - Logo
-}
stackExchange : Icon
stackExchange =
    Icon.Logo "stack-exchange"


{-| StackOverflow - Logo
-}
stackOverflow : Icon
stackOverflow =
    Icon.Logo "stack-overflow"


{-| Star - Icon
-}
star : Icon
star =
    Icon.Icon "star"


{-| StarExclamation - Icon
-}
starExclamation : Icon
starExclamation =
    Icon.Icon "star-exclamation"


{-| StarHalf - Icon
-}
starHalf : Icon
starHalf =
    Icon.Icon "star-half"


{-| StayLinked - Logo
-}
stayLinked : Icon
stayLinked =
    Icon.Logo "staylinked"


{-| Steam - Logo
-}
steam : Icon
steam =
    Icon.Logo "steam"


{-| SteamSquare - Logo
-}
steamSquare : Icon
steamSquare =
    Icon.Logo "steam-square"


{-| SteamSymbol - Logo
-}
steamSymbol : Icon
steamSymbol =
    Icon.Logo "steam-symbol"


{-| StepBackward - Icon
-}
stepBackward : Icon
stepBackward =
    Icon.Icon "step-backward"


{-| StepForward - Icon
-}
stepForward : Icon
stepForward =
    Icon.Icon "step-forward"


{-| Stethoscope - Icon
-}
stethoscope : Icon
stethoscope =
    Icon.Icon "stethoscope"


{-| StickerMule - Logo
-}
stickerMule : Icon
stickerMule =
    Icon.Logo "sticker-mule"


{-| StickyNote - Icon
-}
stickyNote : Icon
stickyNote =
    Icon.Icon "sticky-note"


{-| Stop - Icon
-}
stop : Icon
stop =
    Icon.Icon "stop"


{-| StopCircle - Icon
-}
stopCircle : Icon
stopCircle =
    Icon.Icon "stop-circle"


{-| Stopwatch - Icon
-}
stopwatch : Icon
stopwatch =
    Icon.Icon "stopwatch"


{-| Strava - Logo
-}
strava : Icon
strava =
    Icon.Logo "strava"


{-| StreetView - Icon
-}
streetView : Icon
streetView =
    Icon.Icon "street-view"


{-| Strikethrough - Icon
-}
strikethrough : Icon
strikethrough =
    Icon.Icon "strikethrough"


{-| Stripe - Logo
-}
stripe : Icon
stripe =
    Icon.Logo "stripe"


{-| StripeS - Logo
-}
stripeS : Icon
stripeS =
    Icon.Logo "stripe-s"


{-| StudioVinari - Logo
-}
studioVinari : Icon
studioVinari =
    Icon.Logo "studiovinari"


{-| StumbleUpon - Logo
-}
stumbleUpon : Icon
stumbleUpon =
    Icon.Logo "stumbleupon"


{-| StumbleUponCircle - Logo
-}
stumbleUponCircle : Icon
stumbleUponCircle =
    Icon.Logo "stumbleupon-circle"


{-| Subscript - Icon
-}
subscript : Icon
subscript =
    Icon.Icon "subscript"


{-| Subway - Icon
-}
subway : Icon
subway =
    Icon.Icon "subway"


{-| Suitcase - Icon
-}
suitcase : Icon
suitcase =
    Icon.Icon "suitcase"


{-| Sun - Icon
-}
sun : Icon
sun =
    Icon.Icon "sun"


{-| Superpowers - Logo
-}
superpowers : Icon
superpowers =
    Icon.Logo "superpowers"


{-| Superscript - Icon
-}
superscript : Icon
superscript =
    Icon.Icon "superscript"


{-| Supple - Logo
-}
supple : Icon
supple =
    Icon.Logo "supple"


{-| Sync - Icon
-}
sync : Icon
sync =
    Icon.Icon "sync"


{-| SyncAlt - Icon
-}
syncAlt : Icon
syncAlt =
    Icon.Icon "sync-alt"


{-| TTY - Icon
-}
tTY : Icon
tTY =
    Icon.Icon "tty"


{-| TV - Icon
-}
tV : Icon
tV =
    Icon.Icon "tv"


{-| TVRetro - Icon
-}
tVRetro : Icon
tVRetro =
    Icon.Icon "tv-retro"


{-| Table - Icon
-}
table : Icon
table =
    Icon.Icon "table"


{-| Tablet - Icon
-}
tablet : Icon
tablet =
    Icon.Icon "tablet"


{-| TabletAlt - Icon
-}
tabletAlt : Icon
tabletAlt =
    Icon.Icon "tablet-alt"


{-| TabletAndroid - Icon
-}
tabletAndroid : Icon
tabletAndroid =
    Icon.Icon "tablet-android"


{-| TabletAndroidAlt - Icon
-}
tabletAndroidAlt : Icon
tabletAndroidAlt =
    Icon.Icon "tablet-android-alt"


{-| Tachometer - Icon
-}
tachometer : Icon
tachometer =
    Icon.Icon "tachometer"


{-| TachometerAlt - Icon
-}
tachometerAlt : Icon
tachometerAlt =
    Icon.Icon "tachometer-alt"


{-| Tag - Icon
-}
tag : Icon
tag =
    Icon.Icon "tag"


{-| Tags - Icon
-}
tags : Icon
tags =
    Icon.Icon "tags"


{-| Tasks - Icon
-}
tasks : Icon
tasks =
    Icon.Icon "tasks"


{-| Taxi - Icon
-}
taxi : Icon
taxi =
    Icon.Icon "taxi"


{-| Telegram - Logo
-}
telegram : Icon
telegram =
    Icon.Logo "telegram"


{-| TelegramPlane - Logo
-}
telegramPlane : Icon
telegramPlane =
    Icon.Logo "telegram-plane"


{-| TencentWeibo - Logo
-}
tencentWeibo : Icon
tencentWeibo =
    Icon.Logo "tencent-weibo"


{-| Terminal - Icon
-}
terminal : Icon
terminal =
    Icon.Icon "terminal"


{-| TextHeight - Icon
-}
textHeight : Icon
textHeight =
    Icon.Icon "text-height"


{-| TextWidth - Icon
-}
textWidth : Icon
textWidth =
    Icon.Icon "text-width"


{-| Th - Icon
-}
th : Icon
th =
    Icon.Icon "th"


{-| ThLarge - Icon
-}
thLarge : Icon
thLarge =
    Icon.Icon "th-large"


{-| ThList - Icon
-}
thList : Icon
thList =
    Icon.Icon "th-list"


{-| ThemeIsle - Logo
-}
themeIsle : Icon
themeIsle =
    Icon.Logo "themeisle"


{-| ThermometerEmpty - Icon
-}
thermometerEmpty : Icon
thermometerEmpty =
    Icon.Icon "thermometer-empty"


{-| ThermometerFull - Icon
-}
thermometerFull : Icon
thermometerFull =
    Icon.Icon "thermometer-full"


{-| ThermometerHalf - Icon
-}
thermometerHalf : Icon
thermometerHalf =
    Icon.Icon "thermometer-half"


{-| ThermometerQuarter - Icon
-}
thermometerQuarter : Icon
thermometerQuarter =
    Icon.Icon "thermometer-quarter"


{-| ThermometerThreeQuarters - Icon
-}
thermometerThreeQuarters : Icon
thermometerThreeQuarters =
    Icon.Icon "thermometer-three-quarters"


{-| ThumbsDown - Icon
-}
thumbsDown : Icon
thumbsDown =
    Icon.Icon "thumbs-down"


{-| ThumbsUp - Icon
-}
thumbsUp : Icon
thumbsUp =
    Icon.Icon "thumbs-up"


{-| Thumbtack - Icon
-}
thumbtack : Icon
thumbtack =
    Icon.Icon "thumbtack"


{-| Ticket - Icon
-}
ticket : Icon
ticket =
    Icon.Icon "ticket"


{-| TicketAlt - Icon
-}
ticketAlt : Icon
ticketAlt =
    Icon.Icon "ticket-alt"


{-| Times - Icon
-}
times : Icon
times =
    Icon.Icon "times"


{-| TimesCircle - Icon
-}
timesCircle : Icon
timesCircle =
    Icon.Icon "times-circle"


{-| TimesHexagon - Icon
-}
timesHexagon : Icon
timesHexagon =
    Icon.Icon "times-hexagon"


{-| TimesOctagon - Icon
-}
timesOctagon : Icon
timesOctagon =
    Icon.Icon "times-octagon"


{-| TimesSquare - Icon
-}
timesSquare : Icon
timesSquare =
    Icon.Icon "times-square"


{-| Tint - Icon
-}
tint : Icon
tint =
    Icon.Icon "tint"


{-| ToggleOff - Icon
-}
toggleOff : Icon
toggleOff =
    Icon.Icon "toggle-off"


{-| ToggleOn - Icon
-}
toggleOn : Icon
toggleOn =
    Icon.Icon "toggle-on"


{-| Trademark - Icon
-}
trademark : Icon
trademark =
    Icon.Icon "trademark"


{-| Train - Icon
-}
train : Icon
train =
    Icon.Icon "train"


{-| Transgender - Icon
-}
transgender : Icon
transgender =
    Icon.Icon "transgender"


{-| TransgenderAlt - Icon
-}
transgenderAlt : Icon
transgenderAlt =
    Icon.Icon "transgender-alt"


{-| Trash - Icon
-}
trash : Icon
trash =
    Icon.Icon "trash"


{-| TrashAlt - Icon
-}
trashAlt : Icon
trashAlt =
    Icon.Icon "trash-alt"


{-| Tree - Icon
-}
tree : Icon
tree =
    Icon.Icon "tree"


{-| TreeAlt - Icon
-}
treeAlt : Icon
treeAlt =
    Icon.Icon "tree-alt"


{-| Trello - Logo
-}
trello : Icon
trello =
    Icon.Logo "trello"


{-| Triangle - Icon
-}
triangle : Icon
triangle =
    Icon.Icon "triangle"


{-| TripAdvisor - Logo
-}
tripAdvisor : Icon
tripAdvisor =
    Icon.Logo "tripadvisor"


{-| Trophy - Icon
-}
trophy : Icon
trophy =
    Icon.Icon "trophy"


{-| TrophyAlt - Icon
-}
trophyAlt : Icon
trophyAlt =
    Icon.Icon "trophy-alt"


{-| Truck - Icon
-}
truck : Icon
truck =
    Icon.Icon "truck"


{-| Tumblr - Logo
-}
tumblr : Icon
tumblr =
    Icon.Logo "tumblr"


{-| TumblrSquare - Logo
-}
tumblrSquare : Icon
tumblrSquare =
    Icon.Logo "tumblr-square"


{-| Twitch - Logo
-}
twitch : Icon
twitch =
    Icon.Logo "twitch"


{-| Twitter - Logo
-}
twitter : Icon
twitter =
    Icon.Logo "twitter"


{-| TwitterSquare - Logo
-}
twitterSquare : Icon
twitterSquare =
    Icon.Logo "twitter-square"


{-| Typo3 - Logo
-}
typo3 : Icon
typo3 =
    Icon.Logo "typo3"


{-| UIkit - Logo
-}
uIkit : Icon
uIkit =
    Icon.Logo "uikit"


{-| USB - Logo
-}
uSB : Icon
uSB =
    Icon.Logo "usb"


{-| Uber - Logo
-}
uber : Icon
uber =
    Icon.Logo "uber"


{-| Umbrella - Icon
-}
umbrella : Icon
umbrella =
    Icon.Icon "umbrella"


{-| Underline - Icon
-}
underline : Icon
underline =
    Icon.Icon "underline"


{-| Undo - Icon
-}
undo : Icon
undo =
    Icon.Icon "undo"


{-| UndoAlt - Icon
-}
undoAlt : Icon
undoAlt =
    Icon.Icon "undo-alt"


{-| Uniregistry - Logo
-}
uniregistry : Icon
uniregistry =
    Icon.Logo "uniregistry"


{-| UniversalAccess - Icon
-}
universalAccess : Icon
universalAccess =
    Icon.Icon "universal-access"


{-| University - Icon
-}
university : Icon
university =
    Icon.Icon "university"


{-| Unlink - Icon
-}
unlink : Icon
unlink =
    Icon.Icon "unlink"


{-| Unlock - Icon
-}
unlock : Icon
unlock =
    Icon.Icon "unlock"


{-| UnlockAlt - Icon
-}
unlockAlt : Icon
unlockAlt =
    Icon.Icon "unlock-alt"


{-| Untappd - Logo
-}
untappd : Icon
untappd =
    Icon.Logo "untappd"


{-| Upload - Icon
-}
upload : Icon
upload =
    Icon.Icon "upload"


{-| UsSunnah - Logo
-}
usSunnah : Icon
usSunnah =
    Icon.Logo "ussunnah"


{-| UsdCircle - Icon
-}
usdCircle : Icon
usdCircle =
    Icon.Icon "usd-circle"


{-| UsdSquare - Icon
-}
usdSquare : Icon
usdSquare =
    Icon.Icon "usd-square"


{-| User - Icon
-}
user : Icon
user =
    Icon.Icon "user"


{-| UserAlt - Icon
-}
userAlt : Icon
userAlt =
    Icon.Icon "user-alt"


{-| UserCircle - Icon
-}
userCircle : Icon
userCircle =
    Icon.Icon "user-circle"


{-| UserMd - Icon
-}
userMd : Icon
userMd =
    Icon.Icon "user-md"


{-| UserPlus - Icon
-}
userPlus : Icon
userPlus =
    Icon.Icon "user-plus"


{-| UserSecret - Icon
-}
userSecret : Icon
userSecret =
    Icon.Icon "user-secret"


{-| UserTimes - Icon
-}
userTimes : Icon
userTimes =
    Icon.Icon "user-times"


{-| Users - Icon
-}
users : Icon
users =
    Icon.Icon "users"


{-| UtensilFork - Icon
-}
utensilFork : Icon
utensilFork =
    Icon.Icon "utensil-fork"


{-| UtensilKnife - Icon
-}
utensilKnife : Icon
utensilKnife =
    Icon.Icon "utensil-knife"


{-| UtensilSpoon - Icon
-}
utensilSpoon : Icon
utensilSpoon =
    Icon.Icon "utensil-spoon"


{-| Utensils - Icon
-}
utensils : Icon
utensils =
    Icon.Icon "utensils"


{-| UtensilsAlt - Icon
-}
utensilsAlt : Icon
utensilsAlt =
    Icon.Icon "utensils-alt"


{-| VK - Logo
-}
vK : Icon
vK =
    Icon.Logo "vk"


{-| Vaadin - Logo
-}
vaadin : Icon
vaadin =
    Icon.Logo "vaadin"


{-| Venus - Icon
-}
venus : Icon
venus =
    Icon.Icon "venus"


{-| VenusDouble - Icon
-}
venusDouble : Icon
venusDouble =
    Icon.Icon "venus-double"


{-| VenusMars - Icon
-}
venusMars : Icon
venusMars =
    Icon.Icon "venus-mars"


{-| Viacoin - Logo
-}
viacoin : Icon
viacoin =
    Icon.Logo "viacoin"


{-| Viadeo - Logo
-}
viadeo : Icon
viadeo =
    Icon.Logo "viadeo"


{-| ViadeoSquare - Logo
-}
viadeoSquare : Icon
viadeoSquare =
    Icon.Logo "viadeo-square"


{-| Viber - Logo
-}
viber : Icon
viber =
    Icon.Logo "viber"


{-| Video - Icon
-}
video : Icon
video =
    Icon.Icon "video"


{-| Vimeo - Logo
-}
vimeo : Icon
vimeo =
    Icon.Logo "vimeo"


{-| VimeoSquare - Logo
-}
vimeoSquare : Icon
vimeoSquare =
    Icon.Logo "vimeo-square"


{-| VimeoV - Logo
-}
vimeoV : Icon
vimeoV =
    Icon.Logo "vimeo-v"


{-| Vine - Logo
-}
vine : Icon
vine =
    Icon.Logo "vine"


{-| Vnv - Logo
-}
vnv : Icon
vnv =
    Icon.Logo "vnv"


{-| VolumeDown - Icon
-}
volumeDown : Icon
volumeDown =
    Icon.Icon "volume-down"


{-| VolumeMute - Icon
-}
volumeMute : Icon
volumeMute =
    Icon.Icon "volume-mute"


{-| VolumeOff - Icon
-}
volumeOff : Icon
volumeOff =
    Icon.Icon "volume-off"


{-| VolumeUp - Icon
-}
volumeUp : Icon
volumeUp =
    Icon.Icon "volume-up"


{-| Vuejs - Logo
-}
vuejs : Icon
vuejs =
    Icon.Logo "vuejs"


{-| WHMCS - Logo
-}
wHMCS : Icon
wHMCS =
    Icon.Logo "whmcs"


{-| WPBeginner - Logo
-}
wPBeginner : Icon
wPBeginner =
    Icon.Logo "wpbeginner"


{-| WPExplorer - Logo
-}
wPExplorer : Icon
wPExplorer =
    Icon.Logo "wpexplorer"


{-| WPForms - Logo
-}
wPForms : Icon
wPForms =
    Icon.Logo "wpforms"


{-| Watch - Icon
-}
watch : Icon
watch =
    Icon.Icon "watch"


{-| Weibo - Logo
-}
weibo : Icon
weibo =
    Icon.Logo "weibo"


{-| Weixin - Logo
-}
weixin : Icon
weixin =
    Icon.Logo "weixin"


{-| WhatsApp - Logo
-}
whatsApp : Icon
whatsApp =
    Icon.Logo "whatsapp"


{-| WhatsAppSquare - Logo
-}
whatsAppSquare : Icon
whatsAppSquare =
    Icon.Logo "whatsapp-square"


{-| Wheelchair - Icon
-}
wheelchair : Icon
wheelchair =
    Icon.Icon "wheelchair"


{-| Wifi - Icon
-}
wifi : Icon
wifi =
    Icon.Icon "wifi"


{-| Wikipedia - Logo
-}
wikipedia : Icon
wikipedia =
    Icon.Logo "wikipedia-w"


{-| Window - Icon
-}
window : Icon
window =
    Icon.Icon "window"


{-| WindowAlt - Icon
-}
windowAlt : Icon
windowAlt =
    Icon.Icon "window-alt"


{-| WindowClose - Icon
-}
windowClose : Icon
windowClose =
    Icon.Icon "window-close"


{-| WindowMaximize - Icon
-}
windowMaximize : Icon
windowMaximize =
    Icon.Icon "window-maximize"


{-| WindowMinimize - Icon
-}
windowMinimize : Icon
windowMinimize =
    Icon.Icon "window-minimize"


{-| WindowRestore - Icon
-}
windowRestore : Icon
windowRestore =
    Icon.Icon "window-restore"


{-| Windows - Logo
-}
windows : Icon
windows =
    Icon.Logo "windows"


{-| WonSign - Icon
-}
wonSign : Icon
wonSign =
    Icon.Icon "won-sign"


{-| WordPress - Logo
-}
wordPress : Icon
wordPress =
    Icon.Logo "wordpress"


{-| WordPressSimple - Logo
-}
wordPressSimple : Icon
wordPressSimple =
    Icon.Logo "wordpress-simple"


{-| Wrench - Icon
-}
wrench : Icon
wrench =
    Icon.Icon "wrench"


{-| XING - Logo
-}
xING : Icon
xING =
    Icon.Logo "xing"


{-| XINGSquare - Logo
-}
xINGSquare : Icon
xINGSquare =
    Icon.Logo "xing-square"


{-| Xbox - Logo
-}
xbox : Icon
xbox =
    Icon.Logo "xbox"


{-| YCombinator - Logo
-}
yCombinator : Icon
yCombinator =
    Icon.Logo "y-combinator"


{-| Yahoo - Logo
-}
yahoo : Icon
yahoo =
    Icon.Logo "yahoo"


{-| Yandex - Logo
-}
yandex : Icon
yandex =
    Icon.Logo "yandex"


{-| YandexInternational - Logo
-}
yandexInternational : Icon
yandexInternational =
    Icon.Logo "yandex-international"


{-| Yelp - Logo
-}
yelp : Icon
yelp =
    Icon.Logo "yelp"


{-| YenSign - Icon
-}
yenSign : Icon
yenSign =
    Icon.Icon "yen-sign"


{-| Yoast - Logo
-}
yoast : Icon
yoast =
    Icon.Logo "yoast"


{-| YouTube - Logo
-}
youTube : Icon
youTube =
    Icon.Logo "youtube"


{-| YouTubeSquare - Logo
-}
youTubeSquare : Icon
youTubeSquare =
    Icon.Logo "youtube-square"
