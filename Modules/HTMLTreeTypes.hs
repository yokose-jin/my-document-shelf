{-# LANGUAGE TemplateHaskell, OverloadedStrings, OverloadedLists #-}
module Modules.HTMLTreeTypes where
import Data.Aeson
import Data.Aeson.TH

-- liタグを型で表現
data Li = Li {
        itemTitle :: String,
        itemCaption :: Maybe String,
        itemPdfLink :: Maybe String
    } deriving Show
deriveJSON defaultOptions ''Li

-- ulタグを型で表現
data Ul = Ul {
        ulTitle :: Li,
        ulChildren :: [Ul]
    }
deriveJSON defaultOptions ''Ul