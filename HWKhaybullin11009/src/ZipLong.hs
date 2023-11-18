module ZipLong where

zipLong :: [a] -> [b] -> [(a,b)]
zipLong _ [] = []
zipLong [] _ = []
zipLong xs ys | length xs == length ys = zip xs ys
              | length xs > length ys = zip xs (take (length xs) $ cycle ys)
              | length xs < length ys = zip (take (length ys) $ cycle xs) ys