{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE DeriveGeneric #-}

module PL011Spec (
  PL011State(PL011State, Crash),
  pushFIFO,
  popFIFO,
  Action(Push, Pop),
  pl011Actions
  ) where

import Control.Monad.State hiding (state)
import GHC.Generics (Generic)
import Control.DeepSeq (NFData)

data PL011State =
  PL011State [Int]
  | Crash
  deriving (Show, Eq)

popFIFO :: State PL011State (Maybe Int)
popFIFO = get >>= \case
    Crash -> return Nothing
    PL011State [] -> put Crash >> return Nothing
    PL011State (x:xs) -> put (PL011State xs) >> return (Just x)


pushFIFO :: Int -> State PL011State (Maybe Int)
pushFIFO value = get >>= \case
    Crash -> return Nothing
    PL011State fifo ->
      case length fifo of
        32 -> put Crash >> return Nothing
        -- Synthesizer debugged : (value:fifo) 
        _ -> put (PL011State (fifo ++ [value])) >> return (Just value)

data Action = Push Int | Pop
  deriving (Show, Generic)

instance NFData Action

pl011Actions = [Pop, Push 1, Push 2, Push 3]
