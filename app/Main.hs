module Main (
  main
  ) where

import PL011Examples (
  PL011Example,
  readUARTDRExample,
  readEmptyUARTDRExample,
  writeUARTDRExample,
  mixedUARTDRExample,
  multi1UARTDRExample,
  multi2UARTDRExample
  )
  
import Synthesizer (measureMultipleRuns)


benchmark :: String -> PL011Example -> IO ()
benchmark name example = do
     result <- measureMultipleRuns 10 12 example
     print $ (name ++ ": " ++ show result)
     return ()

main :: IO ()
main = do
     benchmark "readUARTDRExample" readUARTDRExample
     benchmark "readEmptyUARTDRExample" readEmptyUARTDRExample
     benchmark "writeUARTDRExample" writeUARTDRExample
     benchmark "mixedUARTDRExample" mixedUARTDRExample
     benchmark "multi1UARTDRExample" multi1UARTDRExample
     benchmark "multi2UARTDRExample" multi2UARTDRExample
     return ()
