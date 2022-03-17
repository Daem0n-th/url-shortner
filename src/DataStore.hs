{-# LANGUAGE OverloadedStrings #-}

module DataStore (createRecord, fetchRecord) where

import Control.Monad
import System.Directory
import System.FilePath
import System.Random.Stateful

dStore :: FilePath
dStore = ".dstore"

randomString :: IO String
randomString = do
  rn <- replicateM 4 (randomRIO (0, 51))
  let alphabets = ['a' .. 'z'] ++ ['A' .. 'Z']
  return $ map (alphabets !!) rn

uniqueSlug :: IO String
uniqueSlug = do
  rs <- randomString
  exist <- doesFileExist $ dStore </> rs
  if exist then uniqueSlug else return rs

createRecord :: String -> IO String
createRecord link = do
  slug <- uniqueSlug
  let path = dStore </> slug
  writeFile path link
  return slug

fetchRecord :: String -> IO String
fetchRecord slug = readFile path
  where
    path = dStore </> slug
