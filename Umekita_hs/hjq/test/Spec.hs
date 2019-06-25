{-# LANGUAGE OverloadedStrings #-} 

import Test.HUnit

import Data.Hjq.Parser

main :: IO ()
main = do
    _ <- runTestTT $ TestList
        [ jqFilterParserTest
        ]
    return ()

jqFilterParserTest :: Test
jqFilterParserTest = TestList
    [ "jqFilterParse . " ~: parseJqFilter "." ~?= Right JqNil
    , "jqFilterParse .[0]" ~: parseJqFilter ".[0]" ~?= Right (JqIndex 0 JqNil)
    , "jqFilterParse .fieldName" ~: parseJqFilter ".fieldName" ~?= Right (JqField "fieldName" JqNil)
    , "jqFilterParse .[0].fieldName" ~: parseJqFilter ".[0].fieldName" ~?= Right (JqIndex 0 (JqField "fieldName" JqNil))
    , "jqFilterParse .fieldName[0]" ~: parseJqFilter ".fieldName[0]" ~?= Right (JqField "fieldName" (JqIndex 0 JqNil))
    ]
