module PL011Spec
    (
      readUARTDR,
      writeUARTDR
    ) where

import Lib
import PL011Registers

-- initialState :: State
-- initialState = Map.fromList
--  [
--    (rUARTDR, Map.fromList [
--        ("DATA", Word 0),
--        ("FE", Bit False),
--        ("PE", Bit False),
--        ("BE", Bit False),
--        ("OE", Bit False)
--        ]),
--    (rUARTLCRH, 0),
--    (rUARTRSR, 0),
--    (rUARTDMACR, 0),
--    (rUARTILPR, 0),
--    (rUARTIBRD, 0),
--    (rUARTFBRD, 0),
--    (rUARTIFLS, 0x12),
--    (rUARTCR, 0x300),
--    (rUARTFR, 0)
--  ]


readUARTDR :: HTriple
readUARTDR = HTriple
  [
    -- UART must be enabled
    assertSingleBit rUARTCR "UARTEN" bit1,
    -- RX must be enabled
    assertSingleBit rUARTCR "RXE" bit1
  ]
  (Read rUARTDR)
  [
    -- FIFO will become empty
    assertSingleBit rUARTFR "RXFE" (Bit True),
    -- FIFO will not be full
    assertSingleBit rUARTFR "RXFF" (Bit False)
  ]

writeUARTDR :: HTriple
writeUARTDR = HTriple
 [
   
 ]
 (Write rUARTDR)
 [
   
 ]


