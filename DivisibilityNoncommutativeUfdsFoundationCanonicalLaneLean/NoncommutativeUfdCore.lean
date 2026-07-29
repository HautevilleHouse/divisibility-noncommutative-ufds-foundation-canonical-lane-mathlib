import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure NoncommutativeUfd (R : Type u) [Ring R] where
  isDomain : IsDomain R
  factorExistence : ∀ a : R, a ≠ 0 → ∃ (b : R) (c : R), a = b * c ∧ IsUnit b ∨ IsUnit c
  factorUniqueness : ∀ (a : R) (p q : R), Prime p → Prime q → p ∣ a → q ∣ a → Associated p q
  isNoncommutative : ¬ CommutativeRing R
  ufdAxiom : Prop
  ufdAxiomTerm : ufdAxiom

structure NoncommutativeUfdEvidence (R : Type u) [Ring R] (U : NoncommutativeUfd R) where
  factorExistenceClosed : U.factorExistence
  factorUniquenessClosed : U.factorUniqueness
  isDomainClosed : U.isDomain

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse
