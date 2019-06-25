module Main where

main :: IO ()
main = do
  putStrLn "hello world"

notThe :: String -> Maybe String
notThe s
  | s == "the" = Nothing
  | otherwise  = Just s

breakIntoWord :: String -> [String]
breakIntoWord s =
  snd $ span (== " ") s -- error

replaceThe :: String -> String
replaceThe = undefined
