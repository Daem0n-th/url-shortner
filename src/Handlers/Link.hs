module Handlers.Link where

import DataStore
import Foundation
import Yesod.Core

getLinkR :: String -> Handler ()
getLinkR slug = do
  link <- liftIO $ fetchRecord slug
  redirect link
