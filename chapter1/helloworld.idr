module Main --module header

main : IO() --function declaration
main = putStrLn "Hello, Idris World!" --function defintion

--to execute
--idris helloworld.idr
--:exec

--or
--idris helloworld.idr -o helloworld
--./helloworld