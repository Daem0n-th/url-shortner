{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}

module Handlers.Home where

import Data.Text
import DataStore
import Foundation
import System.FilePath
import Yesod.Core

getHomeR :: Handler Html
getHomeR = defaultLayout $(whamletFile $ "src" </> "Templates" </> "HomeGet.hamlet")

postHomeR :: Handler Html
postHomeR = defaultLayout $ do
  urlParam <- lookupPostParam "url"
  maybe badMethod processUrl urlParam

processUrl :: Text -> Widget
processUrl url = do
  slug <- liftIO $ createRecord $ unpack url
  $(whamletFile $ "src" </> "Templates" </> "HomePost.hamlet")