{-# LANGUAGE TemplateHaskell #-}

module Main where

import Prelude
import Language.Haskell.TH.Syntax qualified as TH

$( TH.addCorePlugin "Plugin" >> pure [] )

main :: IO ()
main = putStrLn "--------------- Hello from Haskell!"

