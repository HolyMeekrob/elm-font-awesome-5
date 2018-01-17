# Elm Font Awesome
A strongly typed Elm package for using Font Awesome 5 icons
in your views. All Font Awesome 5 icons are included. Previous
versions of Font Awesome are not supported.

## Motivation
Unlike other Font Awesome packages for Elm, everything in this
package is strongly typed. That means that it is impossible to
write an invalid Font Awesome element. Any missing or improper
inputs result in a compile-time error.

## Examples
### Basic use case
```elm
import FontAwesome as Icon exposing (icon)
import Html exposing (div)

view : Html msg
view =
    div
        []
        [ icon Icon.copy ]

-- This would spit out the following HTML
-- <div>
--     <i class="fas fa-copy"></i>
-- </div>
```

### With options
```elm
import FontAwesome as Icon exposing (iconWithOptions)
import Html exposing (div)
import Html.Attributes exposing (title)

view : Html msg
view =
    div
        []
        [ iconWithOptions
            Icon.spinner
            Icon.Light
            [ Icon.Spin, Icon.Size Icon.Large ]
            [ title "Page is loading" ]

-- This would spit out the following HTML
-- <div>
--     <i class="fal fa-spinner fa-spin fa-lg" title="Page is loading"></i>
-- </div>
```