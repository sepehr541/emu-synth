module Lib
    (
      Field(SingleBit, MultiBit),
      Register(Register),
      AccessMode(RO, WO, RW),
      Command(Read, Write),
      Value(Bit, Word),
      State,
      HTriple(HTriple),
      assertSingleBit,
      bit0,
      bit1,
      someFunc
    ) where

import qualified Data.Map.Strict as Map

type Name = String
type Position = Int
type Start = Position
type End = Position
data Field = SingleBit Name Position | MultiBit Name Start End
  deriving (Eq, Ord, Show)


type Offset = Int
data AccessMode = RO | WO | RW deriving (Eq, Ord, Show)
data Register = Register Name Offset AccessMode [Field]
  deriving (Eq, Ord, Show)

data Command = Read Register | Write Register

data Value = Bit Bool | Word Int
  deriving (Eq, Ord, Show)
-- What is the type of state?
type State = Map.Map Register (Map.Map String Value)

-- type Assertion a = a -> Bool
type Assertion = State -> Bool

data HTriple = HTriple [Assertion] Command [Assertion]

-- Sequential
-- newtype SeqProgram = SeqProgram [HTriple]


assertSingleBit :: Register -> Name -> Value -> Assertion
assertSingleBit register field value state = case Map.lookup register state of
  Just fieldMap -> case Map.lookup field fieldMap of
    Just v -> v == value
    Nothing -> error ("Invalid Field: " ++ field)
  Nothing -> error ("Invalid Register: " ++ show register)

bit1 :: Value
bit1 = Bit True

bit0 :: Value
bit0 = Bit False

someFunc :: IO ()
someFunc = putStrLn "someFunc"
