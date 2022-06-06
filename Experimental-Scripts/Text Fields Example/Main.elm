{-

This script is used to learn about the structure of an Elm Web Application.
Starts off based on: https://guide.elm-lang.org/architecture/text_fields.html
Then diverges into its own thing to explore further topics.

Focuses:

- Records
- Monads
- If/Else
- Custom Functions

-}

module Main exposing (..)

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- Model Step

type alias Model = { content : String, modulation: Int }

init : Model
init = { content = "", modulation = 1 }

-- Update Step

type Msg = Change String | Modulate String

update: Msg -> Model -> Model
update msg model = 
    case msg of 
        Change newContent -> { model | content = newContent }
        Modulate newMod -> 
            let 
                x = case (String.toInt newMod) of
                    Just a -> a
                    Nothing -> 1
            in { model | modulation = x }

-- View Step

{-

A few interesting notes to take. The first is that this is very easy to update to the browser,
what would be an explicit function in js like this:

(e) => {
    let text = document.getElementById(...).value
    document.getElementById(...).value = text.reverse()
}

is aesthetically done almost implicitly.

Another thing I am noting is specifically that the onInput funtion knows that Change requires a
string parameter and defaults to giving the value in the input box. I wonder to what extent is this
automatic and how rigid of a system this is (e.g: can I get the placeholder value instead for some reason?).

-}

view: Model -> Html Msg
view model = div [] 
    [
        input [placeholder "Text To Replace...", value model.content, onInput Change] [],
        input [placeholder "Modulation To Set...",
            onInput Modulate] [],
        div [] [text (modReverse model.content model.modulation)]
    ]

-- Main Step

main = Browser.sandbox { init = init, update = update, view = view }

-- Extra Functions

divideString: String -> Int -> List String
divideString str n = 
    if n >= (String.length str) then 
        [str] 
    else
        [String.left n str] ++ (divideString (String.dropLeft n str) n)

reverseStrings: List String -> List String
reverseStrings strs = List.map String.reverse strs

compactStrings: List String -> String
compactStrings strs = List.foldr (++) "" strs

modReverse: String -> Int -> String
modReverse str n = compactStrings (reverseStrings (divideString str n))