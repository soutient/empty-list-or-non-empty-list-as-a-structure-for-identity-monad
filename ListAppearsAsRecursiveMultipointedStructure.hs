--ListAppearsAsRecursiveMultipointedStructure.hs
------------------------------------------------------------------
data Arity = Zero | One
data ListArity(n::Arity) a where 
Null :: ListArity Zero a                          -- n=0: unpointed empty 
Cons :: a -> ListArity n a -> ListArity One a     -- n=1: pointed cons

