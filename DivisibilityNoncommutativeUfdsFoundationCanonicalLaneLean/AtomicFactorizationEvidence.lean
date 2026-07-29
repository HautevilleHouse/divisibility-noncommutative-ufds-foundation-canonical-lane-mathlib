import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeDomainObjects

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure AtomicFactorizationPackage (D : NoncommutativeUfdDomain) where
  irreducibleFactorization : Prop
  uniquenessUpToUnits : Prop
  finiteFactorization : Prop

structure AtomicFactorizationEvidence {D : NoncommutativeUfdDomain} (P : AtomicFactorizationPackage D) where
  irreducibleFactorizationClosed : P.irreducibleFactorization
  uniquenessUpToUnitsClosed : P.uniquenessUpToUnits
  finiteFactorizationClosed : P.finiteFactorization

def AtomicFactorizationClosed {D : NoncommutativeUfdDomain} (P : AtomicFactorizationPackage D) : Prop :=
  P.irreducibleFactorization ∧ P.uniquenessUpToUnits ∧ P.finiteFactorization

theorem atomic_factoization_closed_from_evidence
    {D : NoncommutativeUfdDomain} (P : AtomicFactorizationPackage D) (E : AtomicFactorizationEvidence P) :
    AtomicFactorizationClosed P := by
  exact And.intro E.irreducibleFactorizationClosed
    (And.intro E.uniquenessUpToUnitsClosed E.finiteFactorizationClosed)

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse