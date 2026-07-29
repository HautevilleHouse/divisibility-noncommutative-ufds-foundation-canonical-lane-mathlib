import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeDomainElement

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure AtomicCondition (R : NoncommutativeDomainElement) : Prop where
  nonzeroNonunitFactorizable : ∀ a : R.carrier, a ≠ R.zero ∧ ¬ (∃ u : R.carrier, R.mul u a = R.one) →
    ∃ (b : R.carrier), irreducible R b ∧ (∃ (c : R.carrier), R.mul b c = a)

theorem atomic_implies_nonzeroNonunitFactorizable (R : NoncommutativeDomainElement) (h : AtomicCondition R) :
    h.nonzeroNonunitFactorizable := h.nonzeroNonunitFactorizable

structure AtomicDomainPackage (R : NoncommutativeDomainElement) where
  atomicCondition : AtomicCondition R

def AtomicDomainClosed (R : NoncommutativeDomainElement) (A : AtomicDomainPackage R) : Prop :=
  A.atomicCondition.nonzeroNonunitFactorizable

theorem atomic_domain_closed_from_package (R : NoncommutativeDomainElement) (A : AtomicDomainPackage R) :
    AtomicDomainClosed R A := by
  exact A.atomicCondition.nonzeroNonunitFactorizable

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse