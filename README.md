# Elm Font Awesome 5
A strongly typed Elm package for using Font Awesome 5 icons
in your views.

All Font Awesome 5 icons are included. Previous
versions of Font Awesome are not supported.

## Motivation
Unlike other Font Awesome packages for Elm, this package exposes
all of Font Awesome's features, allowing full customization of icons.

This package also prevents the possibility of writing an invalid Font Awesome
element. Any missing or improper inputs result in a compile-time error.

## Examples
### Basic use case
```elm
import FontAwesome exposing (icon, copy)
import Html exposing (div)

view : Html msg
view =
    div
        []
        [ icon copy ]

-- This would spit out the following HTML
-- <div>
--     <i class="fas fa-copy"></i>
-- </div>
```

### With options
```elm
import FontAwesome exposing (iconWithOptions, spinner, Large, Light, Spin, Size)
import Html exposing (div)
import Html.Attributes exposing (title)

view : Html msg
view =
    div
        []
        [ iconWithOptions
            spinner
            Light
            [ Spin, Size Large ]
            [ title "Page is loading" ]

-- This would spit out the following HTML
-- <div>
--     <i class="fal fa-spinner fa-spin fa-lg" title="Page is loading"></i>
-- </div>
```