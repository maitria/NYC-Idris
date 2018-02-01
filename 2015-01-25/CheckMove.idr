module CheckMove
  import ProofSweeperBase
  import ProofSweeperKnown
  import ProofSweeperPlay
  total
  checkMove : MineFact (MkCoord 5 8) IsMine
  checkMove = mineAt_5_8
