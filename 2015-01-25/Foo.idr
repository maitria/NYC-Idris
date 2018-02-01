module Foo

%default total

data Monadish : Type -> Type where
  Inject : a -> Monadish a
  (>>=)  : Monadish a -> (a -> Monadish b) -> Monadish b
