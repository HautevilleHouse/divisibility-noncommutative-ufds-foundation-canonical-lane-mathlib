import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeDomainElement

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure UfdFactorization {R : NoncommutativeDomainElement} (hR : NoncommutativeUfd R) (a : R.carrier) where
  nonZeroCondition : a ≠ hR.domain.zero → a ∉ {x : R.carrier | ∃ u : R.carrier, hR.domain.mul u x = hR.domain.one}
  factorCount : ℕ
  factors : Fin factorCount → R.carrier
  irreducible : ∀ i : Fin factorCount, irreducible hR.domain (factors i)
  productUnit : R.carrier
  unitCondition : associated hR.domain hR.domain.one productUnit
  productEq : hR.domain.mul (Fin.foldr hR.domain.mul hR.domain.one factors) productUnit = a

structure IrreducibleFactorizationData {R : NoncommutativeDomainElement} (hR : NoncommutativeUfd R) where
  element : R.carrier
  factorization : UfdFactorization hR element

def factorizationUniqueUpToUnit {R : NoncommutativeDomainElement} (hR : NoncommutativeUfd R)
    (a : R.carrier) (fact1 fact2 : UfdFactorization hR a) : Prop :=
  fact1.factorCount = fact2.factorCount ∧
  ∃ (σ : Fin fact1.factorCount → Fin fact2.factorCount), Bijective σ ∧
    ∀ i : Fin fact1.factorCount, associated hR.domain (fact1.factors i) (fact2.factors (σ i))

lemma factorization_unique_lemma {R : NoncommutativeDomainElement} (hR : NoncommutativeUfd R)
    (a : R.carrier) (fact1 fact2 : UfdFactorization hR a) : factorizationUniqueUpToUnit hR a fact1 fact2 := by
  exact hR.factorizationUnique a fact1.factorCount fact2.factorCount fact1.factors fact2.factors
    (by intro i; exact fact1.irreducible i)
    (by intro j; exact fact2.irreducible j)
    (by
      refine Exists.intro (hR.domain.mul (hR.domain.mul (Fin.foldr hR.domain.mul hR.domain.one fact1.factors) fact1.productUnit) (someElement?)) ?_
      sorry)
  -- This lemma needs the product equality and the fact that productUnit is associated to 1

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse