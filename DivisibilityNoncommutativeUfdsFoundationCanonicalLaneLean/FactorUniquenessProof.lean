import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.LeftRightUfdStructure

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure FactorUniquenessProof (R : Type u) [Ring R] where
  leftUniqueFactorization : ∀ (a : R) (factors factors' : List R), a = prod factors → a = prod factors' → (∀ f ∈ factors, LeftPrime f) → (∀ f ∈ factors', LeftPrime f) → Multiset.Equiv (factors : Multiset R) (factors' : Multiset R)
  rightUniqueFactorization : ∀ (a : R) (factors factors' : List R), a = prod factors → a = prod factors' → (∀ f ∈ factors, RightPrime f) → (∀ f ∈ factors', RightPrime f) → Multiset.Equiv (factors : Multiset R) (factors' : Multiset R)
  uniquenessClosed : Prop
  uniquenessClosedTerm : uniquenessClosed

structure FactorUniquenessEvidence {R : Type u} [Ring R] (F : FactorUniquenessProof R) where
  leftUniqueFactorizationClosed : F.leftUniqueFactorization
  rightUniqueFactorizationClosed : F.rightUniqueFactorization

def FactorUniquenessClosed {R : Type u} [Ring R] (F : FactorUniquenessProof R) : Prop :=
  F.leftUniqueFactorization ∧ F.rightUniqueFactorization

theorem factor_uniqueness_closed_from_evidence {R : Type u} [Ring R] (F : FactorUniquenessProof R) (E : FactorUniquenessEvidence F) : FactorUniquenessClosed F :=
  And.intro E.leftUniqueFactorizationClosed E.rightUniqueFactorizationClosed

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse
