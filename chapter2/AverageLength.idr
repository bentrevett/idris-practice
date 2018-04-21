module Main

average : (str String) -> Double 
average str = let numWords = wordCount str
              totalLength = sum (allLengths (words str)) in
                cast totalLength / cast numWords

main : IO()
main = repl "Enter a string: " showAverage