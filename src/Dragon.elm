module Dragon exposing (..)

import Html.Styled exposing (Html)
import Styling exposing (..)
import Svg.Styled exposing (..)
import Svg.Styled.Attributes exposing (..)


type Motion
    = F
    | G
    | Right
    | Left


expand : List Motion -> List Motion
expand curve =
    case List.head curve of
        Just F ->
            [ F, Left, G ] ++ expand (List.drop 1 curve)

        Just G ->
            [ F, Right, G ] ++ expand (List.drop 1 curve)

        Just Right ->
            Right :: expand (List.drop 1 curve)

        Just Left ->
            Left :: expand (List.drop 1 curve)

        Nothing ->
            []


expandOut : Int -> List Motion -> List Motion
expandOut n curve =
    if n <= 0 then
        curve

    else
        expandOut (n - 1) (expand curve)


renderDragon : String -> List Motion -> Float -> Float -> Float -> Float -> List (Svg msg)
renderDragon c curve x y theta l =
    let
        iterLine =
            canvasLine c x y (cos (degrees theta) * l) (sin (degrees theta) * l)
    in
    case List.head curve of
        Just F ->
            iterLine :: renderDragon c (List.drop 1 curve) (x + cos (degrees theta) * l) (y + sin (degrees theta) * l) theta l

        Just G ->
            iterLine :: renderDragon c (List.drop 1 curve) (x + cos (degrees theta) * l) (y + sin (degrees theta) * l) theta l

        Just Right ->
            renderDragon c (List.drop 1 curve) x y (theta - 90.0) l

        Just Left ->
            renderDragon c (List.drop 1 curve) x y (theta + 90.0) l

        Nothing ->
            []


dragonCanvas : String -> List Motion -> Int -> Int -> Int -> Html msg
dragonCanvas c curve n w h =
    if n == 0 then
        initCanvas "dragonCurve" w h (renderDragon c [] 0.0 0.0 0.0 0.0)

    else
        renderDragon c (expandOut n curve) (toFloat w / 2) (toFloat h / 4) 0.0 (toFloat h / 50)
            |> initCanvas "dragonCurve" w h
