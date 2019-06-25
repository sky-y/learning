module Main where

import Control.Monad (unless)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.State (evalStateT, get, modify)
import Control.Monad.Trans.Except (runExceptT, throwE)
import Control.Monad.IO.Class (liftIO)

main :: IO ()
main = do
    result <- (`evalStateT` 0) $ runExceptT $ loop
    case result of
        Right _ -> return ()
        Left  e -> putStrLn e

    where
        loop = do
            i <- lift $ get
            unless (i < (3 :: Int)) $ throwE "Too much failure"

            op <- liftIO $ getLine
            if op == "end" then
                return ()
            else do
                lift $ modify (+ 1)
                loop

