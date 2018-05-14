topTen : Ord a => List a -> List a
topTen xs = take 10 (reverse (sort xs))