{-# LANGUAGE OverloadedStrings #-} 
module Data.Hjq.Parser where 

-- import qualified Data.Text as T
import Control.Applicative
import Data.Text as Text
import Data.Attoparsec.Text hiding (take)

-- ユーザが入力する文字列用の構文木
data JqFilter
    = JqField Text JqFilter  -- フィールド名
    | JqIndex Int JqFilter   -- インデックス
    | JqNil                  -- フィールド名とインデックスが存在しない場合
    deriving (Show, Read, Eq)

-- ユーザの入力をパースする
parseJqFilter :: Text -> Either Text JqFilter
parseJqFilter s = showParseResult $ parse (jqFilterParser <* endOfInput) s `feed` ""

jqFilterParser :: Parser JqFilter
jqFilterParser = char '.' >> (jqField <|> jqIndex <|> pure JqNil)
    where
        jqFilter :: Parser JqFilter
        jqFilter = (char '.' >> jqField) <|> jqIndex <|> pure JqNil

        jqField :: Parser JqFilter
        jqField = JqField <$> word <*> jqFilter

        jqIndex :: Parser JqFilter
        jqIndex = JqIndex <$> (char '[' *> decimal <* char ']') <*> jqFilter

showParseResult :: Show a => Result a -> Either Text a
showParseResult (Done _ r) = Right r
showParseResult r = Left . pack $ show r

word :: Parser Text
word = fmap pack $ many1 (letter <|> char '-' <|> char '_' <|> digit)
