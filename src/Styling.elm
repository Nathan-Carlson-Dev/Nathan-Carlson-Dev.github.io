module Styling exposing (..)

import Css exposing (..)
import Html.Styled exposing (Html, li, p, text)
import Html.Styled.Attributes exposing (class)
import Svg.Styled exposing (..)
import Svg.Styled.Attributes exposing (..)



-- Color Palette


theme :
    { primary : Color
    , secondary : Color
    , tertiary : Color
    , primeFont : Color
    , secondFont : Color
    }
theme =
    { primary = hex "6006DA"
    , secondary = hex "00E1B0"
    , tertiary = hex "000000"
    , primeFont = hex "4EF5C9"
    , secondFont = hex "000000"
    }


subtitlize : String -> Html msg
subtitlize x =
    p [ Html.Styled.Attributes.class "subtitle" ] [ Html.Styled.text x ]


listify : (List (Html msg) -> Html msg) -> List String -> Html msg
listify listType content =
    content
        |> List.map (\x -> li [] [ Html.Styled.text x ])
        |> listType


initCanvas : String -> Int -> Int -> (List (Svg msg) -> Html msg)
initCanvas canvasId w h =
    svg [ Svg.Styled.Attributes.width (String.fromInt w), Svg.Styled.Attributes.height (String.fromInt h), id canvasId ]


canvasLine : String -> Float -> Float -> Float -> Float -> Svg msg
canvasLine c x y dx dy =
    line [ x1 (String.fromFloat x), x2 (String.fromFloat (x + dx)), y1 (String.fromFloat y), y2 (String.fromFloat (y + dy)), Svg.Styled.Attributes.stroke c ] []
