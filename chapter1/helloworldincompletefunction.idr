module Main

main : IO() 
main = putStrLn (?convert 'x') --an incomplete function

--putStrLn expects a string, but 'x' is a Char, so will get a type error
--however, can put a hole for a function
--in the REPL, can do `:t convert` which tells us convert is a function
--that takes in a Char and returns a String