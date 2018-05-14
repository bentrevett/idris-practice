{-
Functions can also take functions as arguments, these are called higher-order functions

quadruple: Num a => a -> a
quadruple x = double (double x)

Or say you have a Shape type that represents a geometric shape and a function rotate : Shape -> Shape that rotates the shape 90 degrees, you can define a function that rotates a shape 180 degrees

turn_around : Shape -> Shape
turn_around x = rotate (rotate x)

What's common about the first two functions? They apply another function twice

We can make a function that takes in a function and applies it twice

twice : (a -> a) -> a -> a
twice f x = f (f x)

twice takes a function as it's first argument, this function takes in a type and returns the same type, the second and third arguments are that same type 

quadrupe : Num a => a -> a
quadruple = twice double

-}

double : Num a => a -> a
double a = a + a

twice : (a -> a) -> a -> a
twice f x = f (f x)

quadruple : Num a => a -> a
quadruple = twice double

{-
quadruple instantiates twice with double
quadruple = twice double
quadruple = double (double a)
quadruple = double (a + a)
quadruple = (a + a) + (a + a)

BUT IT DOESN'T TAKE a AS AN ARGUMENT BECAUSE IT USES PARTIAL FUNCTIONS

the only requirement when checking a function definition is both sides of the definition have the same type

:t quadruple 
Num a => a -> a

:t twice double
Integer -> Integer

I don't know why it says Integer when it can be any type

Another use of partials is creating arguments for HOF

add : Num a => a -> a -> a
add x y = x + y

twice : (a -> a) -> a -> a
twice f x = f (f x)

twice (add 5) 10

This uses a partial application of add to add 5 to an Int, twice. Because twice requires a function of one argument and add takes two arguments, you can apply add to one argument so that it's usable in an application of twice

twice (add 5) 10
(add 5) ((add 5) 10)
(add 5) (15)
20

Can also do it as

twice (5 +) 10
(5 +) ((5 +) 10)
(5 +) (15)
20
-}

{-
Can also make anonymous functions, i.e. lambdas

twice (\x => x * x) 2
(\x => x * x) ((\x => x * x) 2)
(\x => x * x) 4
16
-}

{-
SCOPE

Can break down functions into smaller definitions of scope

Two operations, let and where

let x = 50 in x + x

let <variable definition> in <scope of definition>

longer : String -> String -> Nat
longer word1 word2
    = let len1 = length word1
          len2 = length word2 in
          if len1 > len2 then len1 else len2
-}

longer : String -> String -> Nat
longer word1 word2
    = let len1 = length word1
          len2 = length word2 in
          if len1 > len2 then len1 else len2

{-
The function takes in two Strings and returns a Nat

To define a scope, inside the 'in' block, it aliases the lengths of wordX to lenX
Basically the same thing as Python

def longer(word1, word2):
    len1 = len(word1)
    len2 = len(word2)
    if len1 > len2:
        return len1
    else:
        return len2

let blocks contain local variable definitions, where blocks contain local function defintions
-}

pythagoras : Double -> Double -> Double
pythagoras x y = sqrt (square x + square y)
    where
        square : Double -> Double
        square x = x * x

{-
NOTE, sqrt is already included in the prelude

let is useful for breaking complex expression into smaller expressions
where is useful for defining more complex functions wich are only relevant in local context
}

{-
COMPOSITE TYPES

composite types are made of other types, most common are the tuple and the list

tuple is a fixed-sized collection, where each value can be a different type, e.g. 

(94, "Pages") : (Integer, String)

they are written as bracketed, comma-sepated list of values

fst and snd are functions to get the first and second item of a tuple, respectively

:t fst == (a, b) -> a

you can read fst as "given a pair of an a and b, return the value that has type a"

Can also have a tuple with zero elements, ()
This is called a "unit"

Tuples can contain other tuples
Tuples containing more than one element are actually stored as nested tuples, but the REPL always displays them non-nested

(1, (2, (3, 4))) in the REPL will return (1, 2, 3, 4)

Lists are like tuples, they can be any size but every element must be the same type

they are written with square brackets

[1, 2, 3, 4] : List Integer

this implies it is a list of integers, Idris infers this from the elements of the list, because of this you get a type error with an empty list so you have to do:

the (List Int) []

lists can be concatenated with ++

[1, 2, 3] ++ [4, 5, 6] == [1,2,3,4,5,6]

can add an element to the front of the list using ::, pronounced "cons"

1 :: [2, 3] == [1, 2, 3]

CANNOT DO [2,3] :: 1

Can also do list comprehension type things

[1..5] == [1,2,3,4,5]

[1,3,..9] == [1,3,5,7,9]

[5,4..1] == [5,4,3,2,1]

words is a built-in function of type String -> List String, that is it takes a string and splits it on whitespace to give a list of strings

unwords has type List String -> String and does the opposite of words, concatenating a list of strings into one string separated by spaces

length gets the length of a string, but it also works for lists!

length [1, 2, 3, 4, 5] == 5

map is a function that applies a function to every element in a list, it has type (a -> b) -> List a -> List b

map length (words "How long are these words?")

words (x) turns the string into a list
map length gets the length of each element of the list

filter is a function that filters a list according to a Boolean function, type of (a -> Bool) -> List a -> List a

filter (> 10) [1,11,2,12,13,3,4,14]
== [11,12,13,14]

sum takes a list of Nums and calculates their sum

whitespace is important

definitions inside 'let' should be aligned

definitions after 'where' should be indented and aligned

}