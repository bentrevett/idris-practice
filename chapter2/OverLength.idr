overLength : Nat -> List String -> Nat
overLength len strs = length (filter (> len) (map (length) strs))