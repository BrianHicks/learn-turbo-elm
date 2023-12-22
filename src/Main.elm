module Main exposing (..)

import Browser
import Html exposing (Html)
import Html.Attributes as Attrs
import Time


type alias Model =
    Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( 0
    , Cmd.none
    )


type Msg
    = Increment


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Time.every 1000 (\_ -> Increment)


view : Model -> Html Msg
view model =
    Html.div
        [ Attrs.class "counter" ]
        [ Html.text (String.fromInt model) ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
