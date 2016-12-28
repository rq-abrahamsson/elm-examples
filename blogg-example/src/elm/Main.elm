module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Http
import Json.Encode
import Json.Decode
import Json.Decode.Pipeline


-- component import example

import Components.Hello exposing (hello)


-- APP


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { number : Int
    , profile : Profile
    , users : List User
    }


model : Model
model =
    { number = 0
    , profile = { id = 1 }
    , users = []
    }


init : ( Model, Cmd Msg )
init =
    ( model, getData )


type alias Profile =
    { id : Int
    }


decodeProfile : Json.Decode.Decoder Profile
decodeProfile =
    Json.Decode.Pipeline.decode Profile
        |> Json.Decode.Pipeline.required "id" (Json.Decode.int)


encodeProfile : Profile -> Json.Encode.Value
encodeProfile record =
    Json.Encode.object
        [ ( "id", Json.Encode.int <| record.id )
        ]


type alias User =
    { id : Int
    , email : String
    , username : String
    , firstname : String
    , lastname : String
    , password : String
    }


decodeUser : Json.Decode.Decoder User
decodeUser =
    Json.Decode.Pipeline.decode User
        |> Json.Decode.Pipeline.required "id" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "email" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "username" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "firstname" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "lastname" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "password" (Json.Decode.string)


encodeUser : User -> Json.Encode.Value
encodeUser record =
    Json.Encode.object
        [ ( "id", Json.Encode.int <| record.id )
        , ( "email", Json.Encode.string <| record.email )
        , ( "username", Json.Encode.string <| record.username )
        , ( "firstname", Json.Encode.string <| record.firstname )
        , ( "lastname", Json.Encode.string <| record.lastname )
        , ( "password", Json.Encode.string <| record.password )
        ]



-- UPDATE


type Msg
    = NoOp
    | GetData
    | NewData (Result Http.Error Profile)
    | Increment


getData =
    let
        url =
            "http://localhost:3000/profile"

        request =
            Http.get url decodeProfile
    in
        Http.send NewData request


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GetData ->
            ( model, getData )

        NewData (Ok newData) ->
            ( { model | profile = newData }, Cmd.none )

        NewData (Err _) ->
            ( model, Cmd.none )

        Increment ->
            ( { model | number = model.number + 1 }, Cmd.none )



-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib


view : Model -> Html Msg
view model =
    div [ style [ ( "margin-top", "30px" ), ( "text-align", "center" ) ] ]
        [ div []
            [ hello model.number
            , img [ src "static/img/elm.jpg", style styles.img ] []
            , p [] [ text "Elm" ]
            , p [] [ text ("Logged in profile: " ++ toString model.profile.id) ]
            , button [ class "btn btn-primary btn-lg", onClick GetData ]
                [ span [] [ text "Button" ]
                ]
            ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- CSS STYLES


styles : { img : List ( String, String ) }
styles =
    { img =
        [ ( "width", "33%" )
        , ( "border", "4px solid #337AB7" )
        ]
    }
