import System.Environment

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import Data.ByteString.Base64 as Base64

encode64 :: B.ByteString -> String
encode64 = BC.unpack . Base64.encode 

main = do
 filePaths <- getArgs 
 files <- mapM B.readFile filePaths
 let encodedFiles = map encode64 files
 mapM putStrLn encodedFiles
