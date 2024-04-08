module Synthesizer (
  measureExecutionTime,
  measureMultipleRuns
                   ) where

import Control.DeepSeq (deepseq)
import System.Clock (Clock(Monotonic), getTime, diffTimeSpec, toNanoSecs)
import System.TimeIt(timeItT)
import Control.Monad (replicateM)
import Control.Monad.State hiding (state)
import Data.List (find)

import Lib (Example(Example))
import PL011Examples (PL011Example)
import PL011Spec (PL011State(Crash), pushFIFO, popFIFO, Action(Push, Pop), pl011Actions)

runAction :: Action -> State PL011State (Maybe Int)
runAction (Push value) = pushFIFO value
runAction Pop = popFIFO

runActions :: PL011State -> [Action] -> [(Maybe Int, PL011State)]
runActions state actions = evalState (mapM runActionAndCaptureState actions) state
  where
    runActionAndCaptureState action = do
      result <- runAction action
      state <- get
      return (result, state)

getLastState :: [(Maybe Int, PL011State)] -> (Maybe Int, PL011State)
getLastState [] = (Nothing, Crash)
getLastState [s] = s
getLastState (_: ss) = getLastState ss


-- Generate all sequences of actions up to a given depth
generateActionSequences :: [Action] -> Int -> [[Action]]
generateActionSequences actions depth = concatMap permutations [1..depth]
  where
    permutations d = replicateM d actions


runActionsList :: PL011State -> [[Action]] -> [([Action], (Maybe Int, PL011State))]
runActionsList state actions = zip actions results
  where 
  results = map (getLastState . runActions state) actions

findSatisfyingSequence :: [[Action]] -> PL011Example -> Maybe [Action]
findSatisfyingSequence actions (Example (_, initialState) desiredState) =
  case find (\(_, state) -> state == desiredState) results of
    Nothing -> Nothing
    Just (actionSeq, _) -> Just actionSeq
  where
    results = runActionsList initialState actions


runExample :: Int -> PL011Example -> Maybe [Action]
runExample = findSatisfyingSequence . (generateActionSequences pl011Actions)


measureExecutionTime :: Int -> PL011Example -> IO Double
measureExecutionTime depth example = do
    (time, result) <- timeItT $ return $! (runExample depth example)
    return time


measureMultipleRuns :: Int -> Int -> PL011Example -> IO [Double]
measureMultipleRuns runs d e = replicateM runs (measureExecutionTime d e) 


