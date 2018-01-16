# Elm Font Awesome
A strongly typed Elm package for using Font Awesome 5 icons
in your views.

## Motivation
Unlike other Font Awesome packages for Elm, everything in this
package is strongly typed. That means that it is impossible to
write an invalid Font Awesome element. Any missing or improper
inputs result in a compile-time error.

## Examples
### Basic use case
```elm
import FontAwesome as Icon exposing (icon)

icon Icon.copy
```

### With options
```elm
import FontAwesome as Icon exposing (iconWithOptions)
import Html.Attributes exposing (title)

iconWithOptions Icon.spinner Icon.Light [ Icon.Spin, Icon.Size Icon.Large] [ title "Page is loading" ]

-- This resulting Html msg would translate to the following HTML:
-- <i class="fal fa-spinner fa-spin fa-lg" title="Page is loading"></i>
```