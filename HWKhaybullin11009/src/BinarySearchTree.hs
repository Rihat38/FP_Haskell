module BinarySearchTree where
import Data.Maybe (fromJust)

data Tree a
  = Empty
  | Node
    { left :: Maybe (Tree a)
    , value :: a
    , right :: Maybe (Tree a)
    }
  deriving (Eq,Show,Read)

empty :: Tree a
empty = Empty

leaf :: a -> Tree a
leaf a = Node Nothing a Nothing

traversal :: Tree a -> [a]
traversal Empty = []
traversal (Node ml v mr)
  = maybe [] traversal ml ++ [v] ++ maybe [] traversal mr

insert :: Ord a => a -> Tree a -> Tree a
insert v Empty = leaf v
insert v t@(Node ml root mr)
  | v < root  = t{ left = Just $ maybe (leaf v) (insert v) ml }
  | otherwise = t{ right= Just $ maybe (leaf v) (insert v) mr }

rotate :: Tree a -> Tree a
rotate Empty        = Empty
rotate (Node l x r) = Node (Just (rotate $ fromJust r)) x (Just (rotate $ fromJust l))