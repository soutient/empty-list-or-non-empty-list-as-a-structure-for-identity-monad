# Empty list or non empty list as a structure for identity monad.

 Since GADTs can accurately represent the type differences between the cases n=0 (no point) and n=1 (single-pointed) in Haskell, providing arity-dependent structure at the type level, the following notation for a list term is possible:

Cons {head = 1, tail = Cons {head = 5, tail = null }} : List Int

Where the list term Cons {head = 1, tail = Cons {head = 5, tail = null }} : List Int and its null tails can be represented using n=0 (unpointed) for empty lists and n=1 (single-pointed) for cons cells within the C_multi category framework shown at https://mathoverflow.net/questions/254605.

This means that the list appears as Recursive Multipointed Structure:

Non-empty lists are single-pointed objects in C_{/*} (n=1): a cons cell Cons h t carries the underlying list object t :: List a equipped with a distinguished "head" point h :: a via the basepoint inclusion head :: * → List a. The empty list null is unpointed (n=0) in C itself—no basepoint structure exists, mirroring the identity monad where T_0(X) = X with trivial algebra α = id :: X → X.
​
GADT Encoding in Haskell:

data Arity = Zero | One
data ListArity(n::Arity) a where 
Null :: ListArity Zero a                           -- n=0: unpointed empty 
Cons :: a -> ListArity n a -> ListArity One a      -- n=1: pointed cons

The term becomes Cons 1 (Cons 5 (Null :: ListArity Zero Int)) :: ListArity One Int. Pattern matching enforces arity: destructuring Cons h t proves the tail t has some arity n (here Zero for innermost), while Null rejects basepoint access.

- Stability   :  The project is under development. I invite you to coauthorship the completion of this project.

- Maintainer  :  retablies@hotmail.com
