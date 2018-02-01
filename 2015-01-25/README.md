## Overloading in Idris

Jason gave a short presentation on
Topics covered:

- Interfaces, which are like typeclasses in Haskell
- Idris selecting the first name which typechecks when there are multiple
  entities in different modules
- The ability to introduce a namespace for this purpose within a module via
  the `namespace` keyword.
- The fact that `do` notation doesn't require an implementation of `Monad`,
  since it is just translated to `>>=` calls, so it can be used on indexed
  monads or other similar things.

`Foo.idr` and `Bar.idr` were created during the talk.  They are in a kind of
weird state, but ah well.

## Proofsweeper

We played proofsweeper!

https://github.com/A1kmm/proofsweeper

The remaining files are from working through some a move.
