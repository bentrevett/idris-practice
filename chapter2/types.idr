{-
NUMERIC TYPES

Int = fixed-width (at least 31 bits) signed integer type

Integer = unbounded signed integer type

Nat = unbounded UNSIGNED integer type (i.e. can't be negative)
as Nat can never be negative, a Nat can only be subtracted from a larger Nat

Double - floating point w/ double precision

Idris will treat a number in an equation as an Integer by default, unless one of the values is explicitly not an Integer, such as a Double, in which case it will cast all numbers to Doubles

Can explicitly cast the result of an expression to a certain type using `the`, i.e.

the Int (6 + 3 * 12) casts from Integer to Int

YOU CANNOT DO `the Int (6 * 0.2)`, it will type error

If you want to add an Integer to a Double, you will type error
the way to overcome this is to use `cast`, which will automatically 
convert the variables to the correct type

integerVal + doubleVal = type error
cast integerVal + doubleVal = gucci

can also specify the type of cast

the Integer (cast 9.9) == 9
-}

{-
WORDY TYPES

character literals (of type Char) are enclosed in 'single quotes'
string literals (of type String) are enclosed in "double quotes"

you can add special character using escape sequences, i.e. \n and \t

there are plenty of built in functions for operating on Strings

length "Hello!" == 6 : Nat

reverse "drawer" == "reward"

substr 6 5 "Hello world" == "world" 
(start at 6 and get 5 chars)

"Hello" ++ " " ++ "world" == "Hello world"
(concatenation)

functions are separated from their arguments via whitespace
can also use brackets for more complex statements
-}

{-
also have Booleans

True && False == False

True || False == True

Also have the standard comparison operators which
return Booleans

>, >=, ==, <, <=

not equals is /= in Idris
-}

{-
conditions

if statements in Idris must always be part of if ... then ... else

if length word > 10 then "LONG WORD!" else "SHORT WORD!"
}
