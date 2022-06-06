{-

This script is used to learn about the structure of an Elm Web Application.
Starts off based on: https://guide.elm-lang.org/architecture/buttons.html
Then diverges into its own thing to explore further topics.

Focuses:

- Style Attributes:
-- inline Style
-- Styled HTML

- Learn MVU Model

-}

module Main exposing (..)

import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing(onClick)

{-

MVU Model

Terminology:
- "Program" is the smallest possible autonomous unit that can execute
- "Model" describes the state of a program
- "Command" something that can perform an action
- "Message" defines what performs during an update
- "Init" is the starting point (Obviously)
- "Update" is the only place that directly manipulates the model
- "View" describes the UI 

-}

-- Type Step

type alias Model = Int
type Msg = Increment | Decrement | Reset

-- Type Style

bigText = Css.batch [ -- Remember the uppercase C in the Css record
  fontSize (vh 6),
  fontFamilies ["Verdana", "Monaco", "Arial"]
  ]

buttonStyle = Css.batch [
  height (vh 8),
  width (vw 10),
  display block,
  marginLeft (vw 45)
  ]

-- Initialization Step
init : Model
init = 0

-- Update Step
update : Msg -> Model -> Model
update msg model = case msg of 
  Increment -> model + 1
  Decrement -> model - 1
  Reset -> 0

-- View Step
view : Model -> Html.Styled.Html Msg
view model = div [
  css [
    paddingBottom (vh 1),
    backgroundColor (hex "ffcccc"),
    marginTop (vh 10),
    textAlign center,
    bigText
    ]
  ] [
  h1 [] [text "WELCOME TO THE MOST EXCITING CLICKER SHOW!!!"],
  h3 [css [bigText], onClick Reset] [text "Reset?"],
  button [css [bigText, buttonStyle], onClick Decrement] [text "-"],
  text (String.fromInt model),
  button [css [bigText, buttonStyle], onClick Increment] [text "+"]
  ]

-- Main Step
main =  Browser.sandbox {init = init, update = update, view = view >> toUnstyled}