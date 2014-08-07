import Control.Applicative
import Data.List (intercalate)
import Options.Applicative

import DataUri (fromPath)

data Options = Options {
  files :: [String]
, raw :: Bool
} deriving (Show)

cmdParser :: Parser Options
cmdParser = Options
  <$> some (argument str (metavar "FILES..."))
  <*> switch (long "raw" <> help "Don't wrap base64 encoding in HTML tags.")

parserInfo :: ParserInfo Options
parserInfo = info (helper <*> cmdParser)
      (fullDesc
      <> (progDesc $ unwords [ "Create data-uris from binary files."
                             , "If the file is an image, CSS, or Javascript file, it will be"
                             , "wrapped in an approprate HTML tag.  If you want just the raw base64 encoded string"
                             , "use the --raw option."]))

main :: IO ()
main = do
    options  <- execParser parserInfo
    dataUris <- mapM (fromPath $ raw options) (files options)
    putStrLn $ intercalate "\n\n" dataUris
