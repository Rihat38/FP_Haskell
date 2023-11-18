# FP_Haskell
Repository for home works of Khaybullin Tagir from 11-009 group

For test some exercise you should:
1) In configure file change the "main-is" field in test-suite HWKhaybullin11009-tests, specifying the required file with tests
Example:
  main-is: BinarySearchTreeTest.hs
3) In the file in which the tests will be run, indicate that this is the Main module
Example:
  module Main where
  import BinarySearchTree
  ...

For starting tests:
1) Open terminal in folder of project
2) Execute command "cabal test --test-show-details=direct"
