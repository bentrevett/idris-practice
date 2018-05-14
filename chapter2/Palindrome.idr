palindrome : String -> Bool
palindrome str = str == reverse str

palindrome2 : String -> Bool
palindrome2 str = (toLower str) ==  (reverse (toLower str))

palindrome3 : String -> Bool
palindrome3 str = length str > 10  && ((toLower str) ==  (reverse (toLower str)))

palindrome4 : Nat -> String -> Bool
palindrome4 min str = length str > min  && ((toLower str) ==  (reverse (toLower str)))