module DataUri (fromPath) where

import qualified Data.Text as T
import Data.Monoid

import Network.Mime
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import Data.ByteString.Base64 as Base64

type Base64  = String
type DataUri = String

encode64 :: B.ByteString -> String
encode64 = BC.unpack . Base64.encode

fromPath :: Bool -> String -> IO DataUri
fromPath raw path = do
  let mime = defaultMimeLookup $ T.pack path
  encoded <- fmap encode64 $ B.readFile path
  return $ if raw then encoded else tagify mime encoded

isImg :: MimeType -> Bool
isImg mime =
  let mimeSuperType = head $ BC.split '/' mime
  in  mimeSuperType == BC.pack "image"

tagify :: MimeType -> Base64 -> String
tagify mime e
    | isImg mime = "<img src=\"" <> src <> "\" />"
    | m == "text/css" = "<link rel=\"stylesheet\" type=\"text/css\" "
                          <> "href=\"" <> src <> "\" />"
    | m == "application/javascript" = "<script type=\"text/javascript\" "
                                        <> "src=\"" <> src <> "\" /></script>"
    | otherwise = e
  where
      m = BC.unpack mime
      src = "data:" <> m <> ";base64," <> e
