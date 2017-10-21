module Questions exposing (Option, Question, directions, new, options)


type Question
    = Question
        { question : String
        , options : List Option
        }


type alias Option =
    ( String, Maybe Question )


new : String -> List Option -> Question
new question options =
    Question
        { question = question
        , options = options
        }


directions : Question -> String
directions (Question { question }) =
    question


options : Question -> List Option
options (Question { options }) =
    options
