port module Worker exposing (main)

import Platform


type Msg
    = Increment Int
    | Decrement Int


init : () -> ( (), Cmd msg )
init _ =
    ( (), Cmd.none )


update : Msg -> () -> ( (), Cmd msg )
update msg _ =
    case msg of
        Increment int ->
            ( (), sendCount (int + 1) )

        Decrement int ->
            ( (), sendCount (int - 1) )


subscriptions : () -> Sub Msg
subscriptions _ =
    Sub.batch
        [ increment Increment
        , decrement Decrement
        ]


main : Program () () Msg
main =
    Platform.worker { init = init, update = update, subscriptions = subscriptions }


port increment : (Int -> msg) -> Sub msg


port decrement : (Int -> msg) -> Sub msg


port sendCount : Int -> Cmd msg
