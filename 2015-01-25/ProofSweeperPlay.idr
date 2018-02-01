module ProofSweeperPlay
import ProofSweeperKnown
import ProofSweeperBase
import ProofSweeperLemmas

%access public export

claimNotMines : (cNeigh : Coord) -> (elem cNeigh [MkCoord 4 7, MkCoord 4 9, MkCoord 3 7, MkCoord 3 8, MkCoord 3 9] = True) -> MineFact cNeigh IsNotMine
claimNotMines cNeigh prf = trueForAllListElems5 (\coord => MineFact coord IsNotMine) eqTestIsEqCoord (MkCoord 4 7) (MkCoord 4 9) (MkCoord 3 7) (MkCoord 3 8) (MkCoord 3 9) (KnownNotMineIsNotMine NoMineAt4_7) (KnownNotMineIsNotMine NoMineAt4_9) (KnownNotMineIsNotMine NoMineAt3_7) (KnownNotMineIsNotMine NoMineAt3_8) (KnownNotMineIsNotMine NoMineAt3_9) cNeigh prf

prf3 : (cNeigh10 : Coord) -> (elem cNeigh10 [MkCoord 4 7, MkCoord 4 9, MkCoord 3 7, MkCoord 3 8, MkCoord 3 9] = True) -> elem cNeigh10 (mineNeighboursForSize (MkCoord 4 8)) = True
prf3 cNeigh10 prf = trueForAllListElems5 (\coord => elem coord (mineNeighboursForSize (MkCoord 4 8)) = True) eqTestIsEqCoord (MkCoord 4 7) (MkCoord 4 9) (MkCoord 3 7) (MkCoord 3 8) (MkCoord 3 9) Refl Refl Refl Refl Refl cNeigh10 prf

mineAt_5_8 : MineFact (MkCoord 5 8) IsMine
mineAt_5_8 = AllNonMinesAccountedFor (MkCoord 4 8) (MkCoord 5 8) NoMineAt4_8 [(MkCoord 4 7), (MkCoord 4 9), (MkCoord 3 7), (MkCoord 3 8), (MkCoord 3 9)] Refl claimNotMines prf3 Refl Refl
