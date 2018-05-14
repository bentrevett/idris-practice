{-
functions are made of 1 or more input types and an output type

a function that takes in an Int and returns an Int would be Int -> Int

consider a function that doubles a number

double : Int -> Int
double x = x + x

First line is the function type, states it takes in an Int and returns an Int

Second line is the definition, that defines what the function actually does

Expressions are evaluated by re-writing the expression according to the equation until no more re-writing can be done

Using the double function as an example, say we write: double (double 15)

the inner double is re-written as 15 + 15
15+15 is re-written as 30
double 30 is re-written as 30+30
30+30 is re-written as 60

Idris always evaluates the innermost expressions first, i.e. function arguments before function definitions

You can also explicitly name the input types of a function

double : (value : Int) -> Int

Why would you do this?
- Naming the argument gives the reader some idea about the purpose of the argument
- You can refer to it later by its name

getStringOrInt : (x : Bool) -> StringOrInt x

The first argument, the Bool, was given the name x, which appears in the return type
-}

{-
PARTIALS

If you have a function that only takes in one argument, you can create a special version of it by omitting the later arguments

This is called partial application

Consider:

add : Int -> Int -> Int
add x y = x + y

add is a function that takes two ints and adds them together

add 2 3 == 5

However, if you do

add 2

This will return a function of type Int -> Int, that is a function that takes an Int and returns an Int. That function will continue the partial function, i.e. add 2 to whatever you pass to the new function

You can also store this new partial function in a variable

let addTwo = add 2

addTwo 3 == 5
-}

{-
Variables in types

Consider the identity function

identityInt : Int -> Int
identityInt x = x

Similarly for String and Bools

identityString : String -> String
identityString x = x

identityBool : Bool -> Bool
identityBool x = x

In all three, the function definition is the same, you don't care what the type is. So instead of writing a function for each type, you can write one identity function using a variable, ty.

identity: ty -> ty
identity x = x

The 'ty' in the type of identity is a 'variable', which means any type

'the' is written as:

the : (ty : Type) -> ty -> ty
the ty x = x

The first argument is the type, explicitly named ty. The type of the second and third arguments are given by the input value of the first argument. 

You can partially apply 'the' in the REPL to see that it returns a function which corresponds to the type provided, i.e. :t the Int returns Int : Int -> Int

Going back to our first double function, currently it only works with integers, we can expand it to work with all types

double : ty -> ty
double x = x + x

HOWEVER this will give you an error, this is because double needs to know something about the input x, specifically that it is numeric, i.e. not a String or Char or something

you need to constrain ty so that it is only a numeric type, this can be done with:

double : Num ty => ty -> ty
double x = x + x

Infix operators in Idris are actually functions that take in two inputs, and can be checked in the REPL with :t (+), :t (==), etc.

:t (+) gives
Num ty => ty -> ty -> ty

That is, a function that takes in two inputs and outputs the same type, under the constraint that the type is a numeric

Other constraints are: 

Eq which means the types must support equality and inequality operations, == and /=

Ord which means the types must support comparison operators <, <=, >
-}