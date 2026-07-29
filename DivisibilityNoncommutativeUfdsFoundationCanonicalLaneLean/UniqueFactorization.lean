import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.AtomicDomain

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure UniqueFactorizationDomain extends AtomicDomain where
  uniquenessCondition : ∀ (a : carrier) (n m : ℕ) (irrs : Fin n → carrier) (jrrs : Fin m → carrier),
    (∀ i, Irreducible (irrs i)) → (∀ j, Irreducible (jrrs j)) →
    a = ∏ i, irrs i → a = ∏ j, jrrs j →
    n = m ∧ ∃ (σ : Fin n ≃ Fin n), ∀ i, Associated (irrs i) (jrrs (σ i))

def Associated {A : NoncommutativeDomain} (x y : A.carrier) : Prop :=
  ∃ u : A.carrier, IsUnit u ∧ x = u * y

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse