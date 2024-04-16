module Plugin where

import GHC.Plugins qualified as GHC
import Data.Functor (($>))

plugin :: GHC.Plugin
plugin = GHC.defaultPlugin
  { GHC.pluginRecompile = GHC.flagRecompile
  , GHC.installCoreToDos = install
  }
    where
      install
        :: [GHC.CommandLineOption]
        -> [GHC.CoreToDo]
        -> GHC.CoreM [GHC.CoreToDo]
      install _args todo =
        GHC.putMsgS "--------------- Hello from plugin!" $> todo
