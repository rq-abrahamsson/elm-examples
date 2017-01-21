module Messages exposing (..)

import Http
import Models exposing (Profile, Post)
import Components.Users.Models exposing (..)
import Navigation exposing (Location)


type Msg
    = NoOp
    | GetData
    | NewData (Result Http.Error Profile)
    | GetUsers
    | NewUsers (Result Http.Error (List User))
    | GetPosts
    | NewPosts (Result Http.Error (List Post))
    | Increment
    | ShowUsers
    | ShowPosts
    | OnLocationChange Location
