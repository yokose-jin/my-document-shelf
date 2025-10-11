-- {-# LANGUAGE OverloadedStrings #-}

-- module Site (app) where

-- import Data.Monoid ((<>))
-- import Hakyll

-- import DataSource (loadDocumentCategories)
-- import Contexts (categoryCtx)

-- app :: Rules ()
-- app = do
--     match "css/*" $ do
--         route   idRoute
--         compile compressCssCompiler

--     match "templates/*" $ compile templateBodyCompiler

--     match "documents/**" $ do
--         route   idRoute
--         compile copyFileCompiler

--     create ["documents.html"] $ do
--         route idRoute
--         compile $ do
--             categories <- unsafeCompiler $ loadDocumentCategories "src/data/documents.json"

--             let pageCtx =
--                     listField "categories" categoryCtx (return categories) <>
--                     constField "title" "文書一覧 (カテゴリ別)" <>
--                     defaultContext

--             makeItem ""
--                 >>= loadAndApplyTemplate "templates/document-list.html" pageCtx
--                 >>= loadAndApplyTemplate "templates/default.html"       pageCtx
--                 >>= relativizeUrls