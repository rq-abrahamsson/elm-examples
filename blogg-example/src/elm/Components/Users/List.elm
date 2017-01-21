module Components.Users.List exposing (..)

import Html exposing (..)


--Custom imports

import Components.Users.Models exposing (User)
import Messages exposing (Msg(..))


view : List User -> Html Msg
view users =
    div []
        [ list users ]


list : List User -> Html Msg
list users =
    table []
        [ thead [] []
        , tbody []
            (List.map userRow users)
        ]


userRow : User -> Html Msg
userRow user =
    tr []
        [ td [] [ text user.username ]
        , td [] [ text user.firstname ]
        , td [] [ text user.lastname ]
        , td [] [ text (toString user.id) ]
        ]
