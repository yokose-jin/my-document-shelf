-- {-# LANGUAGE OverloadedStrings #-}

-- module Contexts
--     ( categoryCtx
--     ) where

-- import Data.Monoid ((<>))
-- import Hakyll
-- import Models (Document(..), DocumentCategory(..))

-- categoryCtx :: Context DocumentCategory
-- categoryCtx =
--     field "category" (return . categoryName . itemBody) <>
--     listField "documents" documentCtx (return . (documents >>= (map itemBody)))

-- documentCtx :: Context Document
-- documentCtx =
--     field "title"       (return . title . itemBody) <>
--     field "link"        (return . link . itemBody) <>
--     field "description" (return . description . itemBody) <>
--     field "category"    (return . category . itemBody)