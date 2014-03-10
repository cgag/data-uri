import System.Environment

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import Data.ByteString.Base64 as Base64

encodePath :: FilePath -> IO String
encodePath path = do
  file <- B.readFile path
  let encoded = Base64.encode file
  return $ BC.unpack encoded

main = do
  filePaths <- getArgs
  encodedFiles <- mapM encodePath filePaths
  mapM putStrLn encodedFiles
