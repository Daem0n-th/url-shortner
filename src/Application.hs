{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE ViewPatterns #-}

module Application where

import Foundation
import Handlers.Home
import Handlers.Link
import Yesod.Core

mkYesodDispatch "App" resourcesApp
