{-# LANGUAGE TemplateHaskell, OverloadedStrings, OverloadedLists #-}
module Modules.HTMLTreeTypes where
import Data.Aeson
import Data.Aeson.TH

-- liタグを型で表現
data NodeItem = NodeItem {
        itemTitle :: String,
        itemCaption :: Maybe String,
        itemLink :: Maybe String
    } deriving Show
deriveJSON defaultOptions ''NodeItem

-- ulタグを型で表現
data NodeTree = NodeTree {
        treeNode :: NodeItem,
        treeChildren :: [NodeTree]
    }
deriveJSON defaultOptions ''NodeTree