import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeDomain

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure AtomicDomain extends NoncommutativeDomain where
  factorizationExists : ∀ a : carrier, a ≠ 0 → ∃ (n : ℕ) (irrs : Fin n → carrier),
    (∀ i, Irreducible (irrs i)) ∧ a = ∏ i : Fin n, irrs i

def Irreducible {A : NoncommutativeDomain} (a : A.carrier) : Prop :=
  a ≠ 0 ∧ ¬ IsUnit a ∧ ∀ x y, a = x * y → IsUnit x ∨ IsUnit y

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse