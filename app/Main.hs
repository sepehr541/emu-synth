module Main (
  main
  ) where

import PL011Examples (multi1UARTDRExample)
import Synthesizer (measureMultipleRuns)

main :: IO ()
main = do
     -- let result = measureExecutionTime 12 multi1UARTDRExample
     result <- measureMultipleRuns 10 12 multi1UARTDRExample
     print result
     return ()


