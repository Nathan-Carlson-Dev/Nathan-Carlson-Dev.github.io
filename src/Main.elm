module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

main : Html msg
main =
  div [
      id "MainBody",
      style "background-color" "purple",
      style "width" "100vw",
      style "height" "100vh"
  ][text "Hello World"]