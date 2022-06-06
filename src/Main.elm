port module Main exposing (..)

import Browser
import Css exposing (..)
import Dragon exposing (Motion(..), dragonCanvas)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)
import ProfessionalPage exposing (professionalContent)
import Styling exposing (subtitlize, theme)


type alias Model =
    { page : String, content : Html Msg, scroll : Int, dim : { width : Int, height : Int, maxHeight : Int } }


type Msg
    = Professional
    | Personal
    | Scroll Int
    | Resize { width : Int, height : Int, maxHeight : Int }



-- Ports


port scroller : (Int -> msg) -> Sub msg


port resize : ({ width : Int, height : Int, maxHeight : Int } -> msg) -> Sub msg


backgroundColor : Model -> Bool -> Color
backgroundColor model invert =
    let
        alteredTheme =
            if invert then
                { theme | primary = theme.secondary, secondary = theme.primary }

            else
                theme
    in
    onPageDo model alteredTheme.primary alteredTheme.secondary


onPageDo : Model -> c -> c -> c
onPageDo model task1 task2 =
    if model.page == "professional" then
        task1

    else
        task2


init : () -> ( Model, Cmd Msg )
init _ =
    ( { page = "professional"
      , content = professionalContent
      , scroll = 0
      , dim = { width = 0, height = 0, maxHeight = 0 }
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Professional ->
            ( { model | page = "professional" }, Cmd.none )

        Personal ->
            ( { model | page = "personal" }, Cmd.none )

        Scroll y ->
            ( { model | scroll = y }, Cmd.none )

        Resize dim ->
            ( { model | dim = dim }, Cmd.none )


view : Model -> Html Msg
view model =
    div [ css [ Css.backgroundColor (backgroundColor model False) ] ]
        [ div [ id "title" ] [ text "Nathan Carlson's Portfolio" ]
        , div
            [ id "main" ]
            [ div [ id "sidebar" ] []
            , div [ id "content" ] [ quickBio, professionalContent ]
            , div [ id "pageInteractives" ]
                [ div
                    [ id "mode"
                    , css
                        [ Css.backgroundColor (backgroundColor model True) ]
                    , onPageDo model (onClick Personal) (onClick Professional)
                    ]
                    [ text "Professional" ]

                {- TODO: (onPageDo model "Professional" "Personal") -}
                ]
            , dragonCanvas (onPageDo model "#880088" "#008888")
                [ F ]
                (Basics.round (10 * toFloat model.scroll / toFloat (model.dim.maxHeight - model.dim.height)))
                model.dim.width
                model.dim.height
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch [ scroller Scroll, resize Resize ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view >> toUnstyled
        , update = update
        , subscriptions = subscriptions
        }


quickBio : Html msg
quickBio =
    div [ id "quickBio" ]
        [ subtitlize "Quick Bio:"
        , p [] [ text "My name is Nathan Carlson, I am a current student at Stony Brook University, studying both computer science and mathematics. My graduation is slated to be May 2024. Cape Cod, Massachusetts is my home, where I spend my time exploring my interests and hanging out with friends. From art to puzzles, I fill my time with the things that bring me joy and challenge me to be the best version of myself." ]
        ]
