module Lib
    ( sayHello
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

sayHello :: String -> IO ()
sayHello name = putStrLn $ "Hi " ++ name ++ "!"
