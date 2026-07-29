import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeUfdCore

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure LeftRightUfdStructure (R : Type u) [Ring R] where
  leftUfd : NoncommutativeUfd R
  rightUfd : NoncommutativeUfd R
  leftRightCompatible : ∀ (a b : R), (Prime a ∧ a ∣ b) ↔ (Prime a ∧ ∃ x : R, b = a * x)
  leftFactorizationUnique : ∀ (a : R) (p q : R), LeftPrime p → LeftPrime q → p ∣ a → q ∣ a → Associated p q
  rightFactorizationUnique : ∀ (a : R) (p q : R), RightPrime p → RightPrime q → a ∣ p → a ∣ q → Associated p q

structure LeftRightUfdEvidence {R : Type u} [Ring R] (S : LeftRightUfdStructure R) where
  leftUfdClosed : NoncommutativeUfd._sizeIncluding? S.leftUfd = 0
  rightUfdClosed : NoncommutativeUfd._sizeIncluding? S.rightUfd = 0
  leftRightCompatibleClosed : S.leftRightCompatible
  leftFactorizationUniqueClosed : S.leftFactorizationUnique
  rightFactorizationUniqueClosed : S.rightFactorizationUnique

def LeftRightUfdClosed {R : Type u} [Ring R] (S : LeftRightUfdStructure R) : Prop :=
  S.leftRightCompatible ∧ S.leftFactorizationUnique ∧ S.rightFactorizationUnique

theorem left_right_ufd_closed_from_evidence {R : Type u} [Ring R] (S : LeftRightUfdStructure R) (E : LeftRightUfdEvidence S) : LeftRightUfdClosed S :=
  And.intro E.leftRightCompatibleClosed (And.intro E.leftFactorizationUniqueClosed E.rightFactorizationUniqueClosed)

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse
