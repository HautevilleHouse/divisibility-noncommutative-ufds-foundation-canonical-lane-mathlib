import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.AtomicDomain

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure PrimeElementClassification (R : Type u) [Ring R] where
  irreducibleImpliesPrime : ∀ a : R, Irreducible a → Prime a
  primeImpliesIrreducible : ∀ a : R, Prime a → Irreducible a
  primeDivisorExists : ∀ a : R, a ≠ 0 → ¬ IsUnit a → ∃ p : R, Prime p ∧ p ∣ a
  classificationClosed : Prop
  classificationClosedTerm : classificationClosed

structure PrimeElementClassificationEvidence {R : Type u} [Ring R] (P : PrimeElementClassification R) where
  irreducibleImpliesPrimeClosed : P.irreducibleImpliesPrime
  primeImpliesIrreducibleClosed : P.primeImpliesIrreducible
  primeDivisorExistsClosed : P.primeDivisorExists

def PrimeElementClassificationClosed {R : Type u} [Ring R] (P : PrimeElementClassification R) : Prop :=
  P.irreducibleImpliesPrime ∧ P.primeImpliesIrreducible ∧ P.primeDivisorExists

theorem prime_element_classification_closed_from_evidence {R : Type u} [Ring R] (P : PrimeElementClassification R) (E : PrimeElementClassificationEvidence P) : PrimeElementClassificationClosed P :=
  And.intro E.irreducibleImpliesPrimeClosed (And.intro E.primeImpliesIrreducibleClosed E.primeDivisorExistsClosed)

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse
