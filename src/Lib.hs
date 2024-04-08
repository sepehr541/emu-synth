module Lib
    (
      Field(Field, Reserved),
      Register(Register),
      AccessMode(RO, WO, RW),
      Command(Read, Write),
      Value(Bit, Word),
      State,
      Offset(Offset),
      HTriple(HTriple),
      Position(Single, Range),
      Assertion,
      Example(Example),
      someFunc
    ) where

-- import qualified Data.Map.Strict as Map
import Control.Monad.State as State

type Name = String

data Position = Single Int | Range Int Int 
  deriving (Eq, Ord, Show)


data Field = Field Name Position | Reserved Position
  deriving (Eq, Ord, Show)

newtype Offset = Offset Int
  deriving (Eq, Ord, Show)
  
data AccessMode = RO | WO | RW
  deriving (Eq, Ord, Show)

data Register = Register Name Offset AccessMode [Field]
  deriving (Eq, Ord, Show)

data Command = Read Register | Write Register


data Value = Bit Bool | Word Int
  deriving (Eq, Ord, Show)

-- type Assertion a = a -> Bool
type Assertion s a = State s a -> Bool
data Example s = Example s s
  deriving (Show, Eq)

data HTriple s a = HTriple [Assertion s a] Command [Assertion s a]

someFunc :: IO ()
someFunc = putStrLn "someFunc"
