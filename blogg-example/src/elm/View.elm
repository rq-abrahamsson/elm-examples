module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Routing exposing (Route(..))


--Custom imports

import Components.Hello exposing (hello)
import Models exposing (..)
import Messages exposing (Msg(..))
import Components.Users.List as Users


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        FunRoute ->
            funPage model

        UsersRoute ->
            Users.view model.users

        PostsRoute ->
            div [] [ p [] [ text "Posts" ] ]

        NotFoundRoute ->
            notFoundView


funPage : Model -> Html Msg
funPage model =
    div [ style [ ( "margin-top", "30px" ), ( "text-align", "center" ) ] ]
        [ div []
            [ hello model.number
            , img [ src "static/img/elm.jpg", style styles.img ] []
            , p [] [ text "Elm" ]
            , p [] [ text ("Logged in profile: " ++ toString model.profile.id) ]
            , button [ class "btn btn-primary btn-lg", onClick GetData ]
                [ span [] [ text "Profile" ] ]
            , button [ class "btn btn-primary btn-lg", onClick ShowUsers ]
                [ span [] [ text "Users" ] ]
            , button [ class "btn btn-primary btn-lg", onClick ShowPosts ]
                [ span [] [ text "Posts" ] ]
            ]
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]


styles : { img : List ( String, String ) }
styles =
    { img =
        [ ( "width", "33%" )
        , ( "border", "4px solid #337AB7" )
        ]
    }
