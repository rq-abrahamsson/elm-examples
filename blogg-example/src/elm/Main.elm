module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Http


-- component import example

import Components.Hello exposing (hello)
import Models exposing (..)


-- APP


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( model
    , Cmd.batch [ getData, getPosts, getUsers ]
    )



-- UPDATE


type Msg
    = NoOp
    | GetData
    | NewData (Result Http.Error Profile)
    | GetUsers
    | NewUsers (Result Http.Error (List User))
    | GetPosts
    | NewPosts (Result Http.Error (List Post))
    | Increment


getData : Cmd Msg
getData =
    let
        url =
            "http://localhost:3000/profile"

        request =
            Http.get url decodeProfile
    in
        Http.send NewData request


getUsers : Cmd Msg
getUsers =
    let
        url =
            "http://localhost:3000/users"

        request =
            Http.get url decodeUsers
    in
        Http.send NewUsers request


getPosts : Cmd Msg
getPosts =
    let
        url =
            "http://localhost:3000/posts"

        request =
            Http.get url decodePosts
    in
        Http.send NewPosts request


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GetData ->
            ( model, getData )

        GetUsers ->
            ( model, getUsers )

        GetPosts ->
            ( model, getPosts )

        NewUsers (Ok users) ->
            ( { model | users = users }, Cmd.none )

        NewUsers (Err _) ->
            ( model, Cmd.none )

        NewData (Ok newData) ->
            ( { model | profile = newData }, Cmd.none )

        NewData (Err _) ->
            ( model, Cmd.none )

        NewPosts (Ok newData) ->
            ( { model | posts = newData }, Cmd.none )

        NewPosts (Err _) ->
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
                [ span [] [ text "Profile" ] ]
            , button [ class "btn btn-primary btn-lg", onClick GetUsers ]
                [ span [] [ text "Users" ] ]
            , button [ class "btn btn-primary btn-lg", onClick GetPosts ]
                [ span [] [ text "Posts" ] ]
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
