import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeRing

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure Ufd (R : NoncommutativeRing) where
  noZeroDivisors : ∀ a b : R.carrier, R.mul a b = R.zero → a = R.zero ∨ b = R.zero
  factorExistence : ∀ a : R.carrier, a ≠ R.zero → (∃ (u : R.carrier) (irrs : List R.carrier), 
    R.mul u (List.foldr (fun x y => R.mul x y) R.one irrs) = a ∧ (∀ x ∈ irrs, irreducible R x))
  factorUniqueness : ∀ (a : R.carrier) (irrs1 irrs2 : List R.carrier) (u1 u2 : R.carrier),
    R.mul u1 (List.foldr (fun x y => R.mul x y) R.one irrs1) = a →
    R.mul u2 (List.foldr (fun x y => R.mul x y) R.one irrs2) = a →
    (∃ (σ : List.Perm R.carrier), irrs1 = σ irrs2) 

def irreducible (R : NoncommutativeRing) (a : R.carrier) : Prop :=
  a ≠ R.zero ∧ a ≠ R.one ∧ ∀ b c : R.carrier, R.mul b c = a → (irreducible R b) ∨ (irreducible R c)

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse