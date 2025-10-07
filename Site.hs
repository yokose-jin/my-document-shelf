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
main = hakyll $ do
    match "pdf/*" $ do
        route idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route idRoute
        compile compressCssCompiler

    match "data/preface.txt" $ do
        compile $ getResourceBody
            >>= \item -> do
                let prefaceCtx = constField "prefaceContent" (itemBody item) <> defaultContext
                makeItem (itemBody item)
                    >>= loadAndApplyTemplate "templates/preface.html" prefaceCtx
                    >>= saveSnapshot "prefaceContent"
    
    create ["index.html"] $ do
        route idRoute
        compile $ do
            prefaceContentHtml <- loadSnapshotBody "data/preface.txt" "prefaceContent"
            let combineBody = prefaceContentHtml
            let ctx = (constField "body" combineBody) <> defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/default.html" ctx
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler