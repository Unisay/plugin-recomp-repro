Example GHC Plugin
===

This repository contains an example project to demonstrate that changes in a GHC Plugin 
**do not** cause recompilation of modules using the plugin **if** its added using the `[addCorePlugin](https://hackage.haskell.org/package/template-haskell-2.21.0.0/docs/Language-Haskell-TH-Syntax.html#v:addCorePlugin)`

If a plugin is added using the `{-# OPTIONS_GHC -fplugin Plugin #-}` pragma then recompilation happens as expected.

### Steps to reproduce
1. Building first time triggers plugin when compiling the `exe/Main.hs`:
  ```
  cabal build all | grep Hello
  --------------- Hello from plugin!
  ```
2. Building second time does not (Nothing has changed so no recompilation needed).
3. Changing `exe/Main.hs` does trigger plugin:
  ```
  cabal build all | grep Hello
  --------------- Hello from plugin!
  ```
4. Changing the Plugin (e.g. by modifying a message in the https://github.com/Unisay/plugin-recomp-repro/blob/main/src/Plugin.hs) doesn't trigger recompilation of `exe/Main.hs` that uses the plugin, so its not triggered:
  ```
  cabal build all | grep Hello
  ```

[GHC recompilation avoidance doc.](https://gitlab.haskell.org/ghc/ghc/-/wikis/commentary/compiler/recompilation-avoidance#template-haskell-and-plugins)
