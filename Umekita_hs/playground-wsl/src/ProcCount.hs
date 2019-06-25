-- 5.6.1 ミュータブルな変数
module ProcCount where

import Control.Monad.ST (runST)
import Control.Monad (forM_)
import Data.STRef (newSTRef, modifySTRef, readSTRef)

procCount :: Integer
procCount = runST $ do
    n <- newSTRef 0

    forM_ [1 .. 10] $ \i -> do
        modifySTRef n (+ i)
    
    readSTRef n
