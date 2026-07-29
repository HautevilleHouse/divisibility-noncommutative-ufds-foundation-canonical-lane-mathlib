import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.UfdDefinition
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.PrimeElements

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

theorem prime_in_ufd (R : NoncommutativeRing) (U : Ufd R) (a : R.carrier) (h : irreducible R a) : prime R a :=
  by
    refine And.intro h.left (And.intro h.right.1 ?_)
    intro b c hdiv
    -- Use factorization uniqueness property
    sorry

theorem ufd_irreducible_prime_equiv (R : NoncommutativeRing) (U : Ufd R) (a : R.carrier) (h : a ≠ R.zero ∧ a ≠ R.one) : irreducible R a ↔ prime R a :=
  by
    constructor
    · intro hirr; exact prime_in_ufd R U a hirr
    · intro hp; exact prime_irreducible R a hp

-- Additional lemma: greatest common divisor exists in UFD
theorem ufd_gcd_exists (R : NoncommutativeRing) (U : Ufd R) (a b : R.carrier) : ∃ d : R.carrier, divides R d a ∧ divides R d b ∧ ∀ c : R.carrier, (divides R c a ∧ divides R c b) → divides R c d :=
  sorry

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse