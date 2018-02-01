-- Generated source - do not edit!
-- This contains the axioms for the current state of the game.
module ProofSweeperKnown

import ProofSweeperBase

%access public export
%default total

gridSize : Nat
gridSize = 10

mineNeighboursForSize : Coord -> List Coord
mineNeighboursForSize = mineNeighbours gridSize

data MineFact : Coord -> MineProp -> Type where
  KnownNotMineIsNotMine : MineFact c (KnownNotMine _) -> MineFact c IsNotMine
  AllMinesAccountedFor :
       (c : Coord)
    -> (cNonMine : Coord)
    -> (prfCIsNotMine : MineFact c (KnownNotMine cnt))
    -> (knownMines : List Coord)
    -> (prfEnoughKnownMines : distinctCount knownMines = cnt)
    -> (prfKnownMinesAreMines : (cNeigh : Coord)
           -> elem cNeigh knownMines = True
           -> MineFact cNeigh IsMine)
    -> (prfKnownMinesAreNeighbours : (cNeigh : Coord)
           -> elem cNeigh knownMines = True
           -> elem cNeigh (mineNeighboursForSize c) = True)
    -> (prfNonMineIsNeighbour : elem cNonMine (mineNeighboursForSize c) = True)
    -> (prfNonMineNotInKnownMines : elem cNonMine knownMines = False)
    -> MineFact cNonMine IsNotMine
  AllNonMinesAccountedFor :
       (c : Coord)
    -> (cMine : Coord)
    -> (prfCIsNotMine : MineFact c (KnownNotMine cnt))
    -> (knownNonMines : List Coord)
    -> (prfEnoughKnownNonMines : distinctCount knownNonMines + cnt = length (mineNeighboursForSize c))
    -> (prfKnownNonMinesAreNotMines : (cNeigh : Coord)
           -> elem cNeigh knownNonMines = True
           -> MineFact cNeigh IsNotMine)
    -> (prfKnownNonMinesAreNeighbours : (cNeigh : Coord)
           -> elem cNeigh knownNonMines = True
           -> elem cNeigh (mineNeighboursForSize c) = True)
    -> (prfNonMineIsNeighbour : elem cMine (mineNeighboursForSize c) = True)
    -> (prfMineNotInKnownNonMines : elem cMine knownNonMines = False)
    -> MineFact cMine IsMine
  NoMineAt1_8 : MineFact (MkCoord 1 8) (KnownNotMine 2)
  NoMineAt1_9 : MineFact (MkCoord 1 9) (KnownNotMine 1)
  NoMineAt2_5 : MineFact (MkCoord 2 5) (KnownNotMine 1)
  NoMineAt2_6 : MineFact (MkCoord 2 6) (KnownNotMine 1)
  NoMineAt2_7 : MineFact (MkCoord 2 7) (KnownNotMine 1)
  NoMineAt2_8 : MineFact (MkCoord 2 8) (KnownNotMine 1)
  NoMineAt2_9 : MineFact (MkCoord 2 9) (KnownNotMine 0)
  NoMineAt3_5 : MineFact (MkCoord 3 5) (KnownNotMine 1)
  NoMineAt3_6 : MineFact (MkCoord 3 6) (KnownNotMine 0)
  NoMineAt3_7 : MineFact (MkCoord 3 7) (KnownNotMine 0)
  NoMineAt3_8 : MineFact (MkCoord 3 8) (KnownNotMine 0)
  NoMineAt3_9 : MineFact (MkCoord 3 9) (KnownNotMine 0)
  NoMineAt4_5 : MineFact (MkCoord 4 5) (KnownNotMine 2)
  NoMineAt4_6 : MineFact (MkCoord 4 6) (KnownNotMine 2)
  NoMineAt4_7 : MineFact (MkCoord 4 7) (KnownNotMine 2)
  NoMineAt4_8 : MineFact (MkCoord 4 8) (KnownNotMine 3)
  NoMineAt4_9 : MineFact (MkCoord 4 9) (KnownNotMine 2)
  MineAt5_8 : MineFact (MkCoord 5 8) IsMine

-- TODO: See if we can prove this instead of asserting...
notNonMineImpliesMine : Not (MineFact c IsNotMine) -> MineFact c IsMine
notNonMineImpliesMine v = believe_me v
notMineImpliesNonMine : Not (MineFact c IsMine) -> MineFact c IsNotMine
notMineImpliesNonMine v = believe_me v
nonMineImpliesNotMine : MineFact c IsNotMine -> Not (MineFact c IsMine)
nonMineImpliesNotMine v = believe_me v
mineImpliesNotNonMine : MineFact c IsMine -> Not (MineFact c IsNotMine)
mineImpliesNotNonMine v = believe_me v
