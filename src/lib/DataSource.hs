module DataSource
    ( loadDocumentCategories
    ) where

import qualified Data.ByteString.Lazy as B
import           Data.List (sortBy, groupBy)
import           Data.Ord (comparing)
import           Data.Aeson (eitherDecode)

import Models (Document(..), DocumentCategory(..))

loadDocumentCategories :: FilePath -> IO [DocumentCategory]
loadDocumentCategories path = do
    content <- B.readFile path
    let docsResult = eitherDecode content :: Either String [Document]

    case docsResult of
        Left err   -> fail $ "JSONのパースに失敗: " ++ path ++ " (" ++ err ++ ")"
        Right docs -> do
            let sortedDocs = sortBy (comparing category) docs
            let groupedDocs = groupBy (\a b -> category a == category b) sortedDocs
            let categories = map (\ds -> DocumentCategory (category $ head ds) ds) groupedDocs
            return categories