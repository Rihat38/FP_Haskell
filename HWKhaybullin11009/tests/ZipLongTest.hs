import ZipLong
import Test.HUnit
import qualified System.Exit as Exit

test1 = TestCase (assertEqual "should return [(1,'a'),(2,'b'),(3,'c')]" [(1,'a'),(2,'b'),(3,'c')] (zipLong [1,2,3] "abc"))

test2 :: Test
test2 = TestCase (assertEqual "should return [(1,'a'),(2,'b'),(1,'c'),(2,'d')]" [(1,'a'),(2,'b'),(1,'c'),(2,'d')] (zipLong [1,2] "abcd"))

test3 :: Test
test3 = TestCase (assertEqual "should return []" ([]::[(Int, Char)]) (zipLong [] "abcd"))

tests :: Test
tests = TestList [TestLabel "test1" test1, TestLabel "test2" test2, TestLabel "test3" test3]

main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then Exit.exitFailure else Exit.exitSuccess