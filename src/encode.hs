import System.Environment
import qualified Data.Text as T
import Text.Printf

import Network.Mime
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import Data.ByteString.Base64 as Base64

type Base64  = String
type DataUri = String

encode64 :: B.ByteString -> String
encode64 = BC.unpack . Base64.encode 

dataUri :: MimeType -> Base64 -> DataUri
dataUri mime s = 
  let m = filter (/='"') $ show mime 
  in printf "data:%s;base64,%s" m s

fromPath :: String -> IO DataUri
fromPath path = do
  let mime = defaultMimeLookup $ T.pack path
  file <- B.readFile path
  let encoded = encode64 file
  return $ dataUri mime encoded

toImgTag :: DataUri -> String
toImgTag d = printf "<img src=\"%s\" />" d

{-isImg :: MimeType -> Bool-}

main = do
  filePaths <- getArgs
  dataUris  <- mapM fromPath filePaths
  mapM putStrLn dataUris
