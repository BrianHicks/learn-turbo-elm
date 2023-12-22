module MainTest exposing (..)

import Main
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


main_ : Test
main_ =
    describe "main"
        [ test "contains a greeting" <|
            \_ ->
                Main.main
                    |> Query.fromHtml
                    |> Query.has [ Selector.text "Hello" ]
        ]
