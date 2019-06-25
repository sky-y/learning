module Game (runGame) where

import Control.Monad.Trans.State
import Data.List
import System.Random.Shuffle (shuffleM)

type Card = Int
type Score = Int
type Hand = [Card]
type Stock = [Card]
type Player = String

-- 山札から指定した枚数のカードを引く
-- 状態は山札、返り値は手札
drawCards :: Int -> State Stock Hand
drawCards n = do
    deck <- get
    put $ drop n deck
    return $ take n deck

-- 状態は山札、返り値は (得点, 手札, プレイヤー名) のリスト
gameWithState :: State Stock [(Score, Hand, Player)]
gameWithState = do
    taroHand <- drawCards 5
    hanakoHand <- drawCards 5
    takashiHand <- drawCards 5
    yumiHand <- drawCards 5

    return . reverse . sort $
        [ (sum taroHand, taroHand, "Taro")
        , (sum hanakoHand, hanakoHand, "Hanako")
        , (sum takashiHand, takashiHand, "Takashi")
        , (sum yumiHand, yumiHand, "Yumi")]

runGame :: IO ()
runGame = do
    deck <- shuffleM [1..50]
    print $ runState gameWithState deck