module Main

main : IO() 
main = putStrLn ?greeting --an incomplete function

--to execute
--idris helloworld.idr
--:exec

--or 
--idris helloworld.idr -o helloworld
--./helloworld