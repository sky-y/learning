module Lib
    ( someFunc
    ) where

import MyModule

someFunc :: IO ()
someFunc = putStrLn $ myFunc "テスト"
