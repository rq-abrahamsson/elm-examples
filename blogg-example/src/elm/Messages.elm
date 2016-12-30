module Messages exposing (..)

import Http
import Models exposing (Profile, User, Post)


type Msg
    = NoOp
    | GetData
    | NewData (Result Http.Error Profile)
    | GetUsers
    | NewUsers (Result Http.Error (List User))
    | GetPosts
    | NewPosts (Result Http.Error (List Post))
    | Increment
