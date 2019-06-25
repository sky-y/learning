module Main where

import Lib
import DogsRule
import System.IO

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Please input your name: "
  sayHello =<< getLine
  dogs
