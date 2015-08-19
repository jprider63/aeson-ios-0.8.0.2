module Paths_aeson (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,8,0,2] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/james/.cabal/bin"
libdir     = "/Users/james/.cabal/lib/i386-ios-ghc-7.8.3/aeson-0.8.0.2"
datadir    = "/Users/james/.cabal/share/i386-ios-ghc-7.8.3/aeson-0.8.0.2"
libexecdir = "/Users/james/.cabal/libexec"
sysconfdir = "/Users/james/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "aeson_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "aeson_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "aeson_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "aeson_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "aeson_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
