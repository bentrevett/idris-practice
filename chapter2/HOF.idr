add : Num a => a -> a -> a
add x y = x + y

twice : (a -> a) -> a -> a
twice f x = f (f x)