module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


--Custom imports

import Components.Hello exposing (hello)
import Models exposing (..)
import Messages exposing (Msg(..))


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


styles : { img : List ( String, String ) }
styles =
    { img =
        [ ( "width", "33%" )
        , ( "border", "4px solid #337AB7" )
        ]
    }
