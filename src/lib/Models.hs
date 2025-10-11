{-# LANGUAGE TemplateHaskell, OverloadedStrings, OverloadedLists #-}
module Models where
import Data.Aeson
import Data.Aeson.TH

data Document = Document {
    title       :: String,
    link        :: String,
    description :: String,
    category    :: String
    } deriving (Show, Eq, Ord)
deriveJSON defaultOptions ''Document

data DocumentCategory = DocumentCategory {
    categoryName :: String,
    documents    :: [Document]
    } deriving (Show)