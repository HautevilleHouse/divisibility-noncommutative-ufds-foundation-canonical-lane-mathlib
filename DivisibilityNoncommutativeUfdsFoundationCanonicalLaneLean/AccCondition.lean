import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeDomain

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure AccCondition (A : NoncommutativeDomain) : Prop where
  accOnDivisors : ∀ a : A.carrier, a ≠ 0 → WellFounded (fun x y : A.carrier => 
    y ≠ 0 ∧ ∃ z : A.carrier, z ≠ 0 ∧ IsUnit z → false ∧ 
    (∃ t : A.carrier, y = x * t) ∧ ¬ IsUnit x ∧ ¬ IsUnit y)

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse