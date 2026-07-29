import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeDomainElement

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure AccCondition (R : NoncommutativeDomainElement) : Prop where
  ascendingChainCondition : ∀ (a : ℕ → R.carrier), (∀ n : ℕ, ∃ b : R.carrier, R.mul (a n) b = a (n+1) ∧ ¬ (∃ u : R.carrier, R.mul u b = R.one)) →
    ∃ N : ℕ, ∀ m : ℕ, m ≥ N → associated R.domain (a m) (a N)

structure AccPackage (R : NoncommutativeDomainElement) where
  accCondition : AccCondition R

def AccClosed (R : NoncommutativeDomainElement) (A : AccPackage R) : Prop :=
  A.accCondition.ascendingChainCondition

theorem acc_closed_from_package (R : NoncommutativeDomainElement) (A : AccPackage R) : AccClosed R A := by
  exact A.accCondition.ascendingChainCondition

theorem acc_preserves_irreducible_factorization (R : NoncommutativeDomainElement) (A : AccPackage R) :
  (∀ a : R.carrier, a ≠ R.zero → ¬ (∃ u : R.carrier, R.mul u a = R.one) →
    ∃ (b : R.carrier), irreducible R b ∧ (∃ (c : R.carrier), R.mul b c = a)) := by
  intro a ha hnonunit
  have hchain : ∀ (a : ℕ → R.carrier), (∀ n : ℕ, ∃ b : R.carrier, R.mul (a n) b = a (n+1) ∧ ¬ (∃ u : R.carrier, R.mul u b = R.one)) →
    ∃ N : ℕ, ∀ m : ℕ, m ≥ N → associated R.domain (a m) (a N) :=
    A.accCondition.ascendingChainCondition
  sorry

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse