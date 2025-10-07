{-# LANGUAGE TemplateHaskell, OverloadedStrings, OverloadedLists #-}

import Hakyll
import Data.Aeson
import Data.Aeson.TH
import qualified Data.ByteString.Lazy as BL
import Data.List (sortBy, nub)
import Data.Ord (comparing)
import Data.Maybe (fromMaybe)
import Modules.HTMLTreeTypes

main :: IO ()
main = putStrLn "hello my-document-shelf"