import canonicalLaneMathlib.AdmissibleClass
import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeRing

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

def divides (R : NoncommutativeRing) (a b : R.carrier) : Prop :=
  ∃ c : R.carrier, R.mul a c = b

def associated (R : NoncommutativeRing) (a b : R.carrier) : Prop :=
  (divides R a b) ∧ (divides R b a)

theorem divides_refl (R : NoncommutativeRing) (a : R.carrier) : divides R a a :=
  Exists.intro R.one (by
    rw [R.mulOne])

theorem divides_trans (R : NoncommutativeRing) (a b c : R.carrier) (h1 : divides R a b) (h2 : divides R b c) : divides R a c :=
  match h1, h2 with
  | ⟨d, h1_eq⟩, ⟨e, h2_eq⟩ =>
    Exists.intro (R.mul d e) (by
      calc
        R.mul a (R.mul d e) = R.mul (R.mul a d) e := by rw [R.mulAssoc]
        _ = R.mul b e := by rw [h1_eq]
        _ = c := h2_eq
      )

theorem associated_refl (R : NoncommutativeRing) (a : R.carrier) : associated R a a :=
  And.intro (divides_refl R a) (divides_refl R a)

theorem associated_symm (R : NoncommutativeRing) (a b : R.carrier) (h : associated R a b) : associated R b a :=
  And.intro h.right h.left

theorem associated_trans (R : NoncommutativeRing) (a b c : R.carrier) (h1 : associated R a b) (h2 : associated R b c) : associated R a c :=
  And.intro (divides_trans R a b c h1.left h2.left) (divides_trans R c b a h2.right h1.right)

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse