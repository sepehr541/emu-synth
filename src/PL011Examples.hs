module PL011Examples (
  PL011Example,
  readUARTDRExample,
  readEmptyUARTDRExample,
  writeUARTDRExample,
  mixedUARTDRExample,
  multi1UARTDRExample,
  multi2UARTDRExample
                     ) where

import Lib (Example(Example))
import PL011Spec (PL011State(PL011State))

type PL011Example = Example (Maybe Int, PL011State)

readUARTDRExample :: PL011Example
readUARTDRExample = Example
  (Nothing, PL011State [1])
  (Just 1, PL011State [])

readEmptyUARTDRExample :: PL011Example
readEmptyUARTDRExample = Example
  (Nothing, PL011State [])
  (Just 1, PL011State [])


writeUARTDRExample :: PL011Example
writeUARTDRExample = Example
  (Nothing, PL011State [])
  (Just 1, PL011State [1, 1, 1])

mixedUARTDRExample :: PL011Example
mixedUARTDRExample = Example
  (Nothing, PL011State [1])
  (Just 1, PL011State [2, 1, 1])


multi1UARTDRExample :: PL011Example
multi1UARTDRExample = Example
  (Nothing, PL011State [1, 2, 3, 3, 3, 2, 1])
  (Just 1, PL011State [3, 3, 2, 2])

multi2UARTDRExample :: PL011Example
multi2UARTDRExample = Example
  (Nothing, PL011State [1, 2, 3, 2, 1])
  (Just 1, PL011State [3, 2, 2])
