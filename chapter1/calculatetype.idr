StringOrInt : Bool -> Type --function calculates a Type given a Bool
StringorInt x = case x of
                    True => Int --if true, return Int
                    False => String --else, return String

getStringOrInt : (x : Bool) -> StringOrInt x --return type calculated by StringOrInt function
getStringOrInt x = case x of 
                    True => 94 --if x is true, returns int
                    False => "Ninety four" --else, return string

valToString : (x : Bool) -> StringOrInt x -> String --return type calculated by StringOrInt
valToString x val = case x of  
                        True => cast val --if true, convert value to string
                        False => val --else, it's already a string, so just return it

--function syntax is:
--declaration is <name> : <input type> -> <return type>
--definition is <name> <input> = <equation>
--<input type> can be multiple values, all separated by a -> (as in getStringOrInt)
--<input> can be multiple values, separated by a space
--second two functions need to have names annotated because they use them in the return type
--return type must be a type, can be the rest of a function
--StringOrInt returns a Type given a Bool
--getStringOrInt takes in a Bool 

valToStringHoles : (x : Bool) -> StringOrInt x -> String
valToStringHoles x val = case x of 
                            True => ?xTrueType
                            False => ?xFalseType

--:t xTrueType will tell you that x will be a Bool, val will be an Int and xTrueType will be a String
--it knew val will be an Int, because it calculated it from StringOrInt