{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE ViewPatterns #-}

module Foundation where

import System.FilePath
import Yesod.Core

data App = App

mkYesodData "App" $(parseRoutesFile $ "src" </> "routes.yesodroutes")

instance Yesod App
