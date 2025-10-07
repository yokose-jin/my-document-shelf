{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_my_document_shelf (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/jin/Desktop/dev/my-document-shelf/.stack-work/install/x86_64-osx/89234563114bd53fa11155eb4a69d65f8d067e115f61e9ebb7b27a10cee6baca/9.10.3/bin"
libdir     = "/Users/jin/Desktop/dev/my-document-shelf/.stack-work/install/x86_64-osx/89234563114bd53fa11155eb4a69d65f8d067e115f61e9ebb7b27a10cee6baca/9.10.3/lib/x86_64-osx-ghc-9.10.3-5528/my-document-shelf-0.1.0.0-HtCZTZb897DHZxVw3hWvR5-my-document-shelf"
dynlibdir  = "/Users/jin/Desktop/dev/my-document-shelf/.stack-work/install/x86_64-osx/89234563114bd53fa11155eb4a69d65f8d067e115f61e9ebb7b27a10cee6baca/9.10.3/lib/x86_64-osx-ghc-9.10.3-5528"
datadir    = "/Users/jin/Desktop/dev/my-document-shelf/.stack-work/install/x86_64-osx/89234563114bd53fa11155eb4a69d65f8d067e115f61e9ebb7b27a10cee6baca/9.10.3/share/x86_64-osx-ghc-9.10.3-5528/my-document-shelf-0.1.0.0"
libexecdir = "/Users/jin/Desktop/dev/my-document-shelf/.stack-work/install/x86_64-osx/89234563114bd53fa11155eb4a69d65f8d067e115f61e9ebb7b27a10cee6baca/9.10.3/libexec/x86_64-osx-ghc-9.10.3-5528/my-document-shelf-0.1.0.0"
sysconfdir = "/Users/jin/Desktop/dev/my-document-shelf/.stack-work/install/x86_64-osx/89234563114bd53fa11155eb4a69d65f8d067e115f61e9ebb7b27a10cee6baca/9.10.3/etc"

getBinDir     = catchIO (getEnv "my_document_shelf_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "my_document_shelf_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "my_document_shelf_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "my_document_shelf_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "my_document_shelf_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "my_document_shelf_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
