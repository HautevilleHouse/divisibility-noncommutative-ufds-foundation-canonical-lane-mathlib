import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeDomainElement
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.AtomicDomainBridge
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.AccConditionBridge

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure UfdCharacterization (R : NoncommutativeDomainElement) where
  atomic : AtomicCondition R
  acc : AccCondition R
  irreduciblePrime : ∀ a : R.carrier, irreducible R a → prime R a

structure PrimeCondition (R : NoncommutativeDomainElement) (a : R.carrier) : Prop where
  notZero : a ≠ R.zero
  notUnit : ¬ (∃ u : R.carrier, R.mul u a = R.one)
  dividesProduct : ∀ b c : R.carrier, (∃ d : R.carrier, R.mul d a = R.mul b c) →
    (∃ u : R.carrier, R.mul u a = b) ∨ (∃ v : R.carrier, R.mul v a = c)

def prime (R : NoncommutativeDomainElement) (a : R.carrier) : Prop :=
  PrimeCondition R a

theorem ufd_iff_atomic_acc_irreducible_prime (R : NoncommutativeDomainElement) (h : NoncommutativeUfd R) :
  (∃ (A : AtomicCondition R) (C : AccCondition R), (∀ a : R.carrier, irreducible R a → prime R a)) := by
  refine Exists.intro ?_ (Exists.intro ?_ (fun a hirred => ?_))
  · exact { nonzeroNonunitFactorizable := ?_ }
  · exact { ascendingChainCondition := ?_ }
  · sorry
  · intro a ha hnonunit
    have hfac := h.factorizationExists a ha hnonunit
    rcases hfac with ⟨n, irreds, hirreds, hprod⟩
    have : ∃ (b : R.carrier), irreducible R b ∧ (∃ (c : R.carrier), h.domain.mul b c = a) := by
      refine Exists.intro (irreds 0) ⟨hirreds 0, ?_⟩
      sorry
    exact this
  · intro a ha hchain
    have := h.factorizationUnique a 0 0 (fun _ => a) (fun _ => a) ?_ ?_
    sorry

theorem irreducible_prime_in_ufd (R : NoncommutativeDomainElement) (h : NoncommutativeUfd R) (a : R.carrier) (hirred : irreducible R a) : prime R a := by
  have hprimeCondition : PrimeCondition R a := by
    refine {
      notZero := ?_
      notUnit := ?_
      dividesProduct := ?_
    }
    · exact hirred.1
    · exact hirred.2.1
    · intro b c hdiv
      rcases hdiv with ⟨d, h⟩
      have hfac := h.factorizationExists (h.domain.mul b c) (by
        intro hzero
        have : h.domain.mul b c = h.domain.zero := hzero
        sorry
      ) (by
        intro hunit
        have : ∃ u : R.carrier, h.domain.mul u (h.domain.mul b c) = h.domain.one := hunit
        sorry
      )
      sorry
  exact hprimeCondition

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse