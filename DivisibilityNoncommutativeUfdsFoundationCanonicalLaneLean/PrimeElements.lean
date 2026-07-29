import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeRing

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

def prime (R : NoncommutativeRing) (p : R.carrier) : Prop :=
  p ≠ R.zero ∧ p ≠ R.one ∧ ∀ a b : R.carrier, divides R p (R.mul a b) → (divides R p a) ∨ (divides R p b)

theorem prime_irreducible (R : NoncommutativeRing) (p : R.carrier) (hp : prime R p) : irreducible R p :=
  by
    refine And.intro hp.left (And.intro hp.right ?_)
    intro b c h
    have hdiv : divides R p (R.mul b c) := by
      rw [h]
      exact divides_refl R p
    have hcases := hp.2.2 b c hdiv
    rcases hcases with (hpb | hpc)
    · left
      exact hpb
    · right
      exact hpc

theorem prime_dvd_of_dvd_mul (R : NoncommutativeRing) (p : R.carrier) (hp : prime R p) (a b : R.carrier) (h : divides R p (R.mul a b)) : (divides R p a) ∨ (divides R p b) :=
  hp.2.2 a b h

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse