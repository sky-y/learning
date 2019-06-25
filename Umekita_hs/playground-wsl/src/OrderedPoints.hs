module OrderedPoints where

import Control.Monad (guard)

orderedPoints :: [(Integer, Integer)]
orderedPoints = do
    x <- [1..3]
    y <- [1..3]
    guard (x < y)
    return (x,y)
