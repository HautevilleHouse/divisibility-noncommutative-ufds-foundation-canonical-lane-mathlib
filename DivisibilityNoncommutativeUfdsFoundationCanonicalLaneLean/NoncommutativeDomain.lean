import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure NoncommutativeDomain where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  addCommGroup : AddCommGroup carrier
  mulMonoid : Monoid carrier
  leftDistrib : ∀ a b c : carrier, a * (b + c) = a * b + a * c
  rightDistrib : ∀ a b c : carrier, (a + b) * c = a * c + b * c
  zeroNeqOne : (0 : carrier) ≠ (1 : carrier)
  noZeroDivisors : ∀ a b : carrier, a * b = 0 → a = 0 ∨ b = 0

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse