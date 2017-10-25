module Questions exposing (Option, Question, directions, new, options)


type Question a
    = Question
        { question : String
        , options : List (Option a)
        }


type alias Option a =
    ( a, Maybe (Question a) )


new : String -> List (Option a) -> Question a
new question options =
    Question
        { question = question
        , options = options
        }


directions : Question a -> String
directions (Question { question }) =
    question


options : Question a -> List (Option a)
options (Question { options }) =
    options
