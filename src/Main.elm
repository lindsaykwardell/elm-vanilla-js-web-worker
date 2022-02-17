port module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


init : (Int, Cmd msg)
init =
    ( 0, Cmd.none )


type Msg
    = Increment
    | Decrement
    | Set Int


update : Msg -> Int -> ( Int, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model, increment model )

        Decrement ->
            ( model, decrement model )

        Set value ->
            ( value, Cmd.none )


view : Int -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]


subscriptions : Int -> Sub Msg
subscriptions _ =
    receiveCount Set


main : Program () Int Msg
main =
    Browser.element { init = \_ -> init, update = update, view = view, subscriptions = subscriptions }


port increment : Int -> Cmd msg


port decrement : Int -> Cmd msg


port receiveCount : (Int -> msg) -> Sub msg
