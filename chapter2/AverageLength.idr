module Main

--str is an optional name as part of the type declaration
average : (str : String) -> Double 
average str = let numWords = wordCount str
                  totalLength = sum (allLengths (words str)) in
                  --`words` is a built-in function which splits on spaces
                  cast totalLength / cast numWords 
                  --`cast` is a built in function that converts between types
                  --here, converts both Nats to Doubles for the division
    where
        --wordCount takes in a string and returns the number of words 
        wordCount : String -> Nat
        wordCount str = length (words str)

        --allLengths takes in a list of words and returns the length of each
        allLengths : List String -> List Nat
        allLengths strs = map length strs

--calculates the average word length and returns it
showAverage : String -> String
showAverage str = "The average word length is: " ++
                    show (average str) ++ "\n"

--repl is a function that repeatedly shows a prompt
main : IO ()
main = repl "Enter a string: " showAverage