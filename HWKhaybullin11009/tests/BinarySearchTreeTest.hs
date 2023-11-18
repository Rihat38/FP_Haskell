module Main where
import BinarySearchTree
import Test.HUnit
import qualified System.Exit as Exit

testCommonTree :: Test
testCommonTree = TestCase (assertEqual "should return rotated tree" 
                          (Node (Just (Node (Just Empty) 3 (Just Empty))) 4 (Just (Node (Just (Node (Just Empty) 10 (Just Empty))) 7 (Just (Node (Just Empty) 5 (Just Empty)))))) 
                          (rotate $ Node (Just (Node (Just (Node (Just Empty) 5 (Just Empty))) 7 (Just (Node (Just Empty) 10 (Just Empty))))) 4 (Just (Node (Just Empty) 3 (Just Empty)))))

testEmpty :: Test
testEmpty = TestCase (assertEqual "should return empty tree if input is empty tree"
                     (Empty::Tree Int)
                     (rotate $ Empty))

tests :: Test
tests = TestList [TestLabel "test with a regular tree" testCommonTree,
                  TestLabel "empty tree test" testEmpty]

main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then Exit.exitFailure else Exit.exitSuccess