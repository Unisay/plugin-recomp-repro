Example GHC Plugin
===

This repository contains an example project to demonstrate that changes in a GHC Plugin 
**do not** cause recompilation of modules using the plugin **if** its added using the `[addCorePlugin](https://hackage.haskell.org/package/template-haskell-2.21.0.0/docs/Language-Haskell-TH-Syntax.html#v:addCorePlugin)`

If a plugin is added using the `{-# OPTIONS_GHC -fplugin Plugin #-}` pragma then recompilation happens as expected.

[GHC recompilation avoidance doc.](https://gitlab.haskell.org/ghc/ghc/-/wikis/commentary/compiler/recompilation-avoidance#template-haskell-and-plugins)
