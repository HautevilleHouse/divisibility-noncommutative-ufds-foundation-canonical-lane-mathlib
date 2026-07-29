import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

open NoncommutativeUFDObject

structure AdmissibleClass where
  object : NoncommutativeUFDObject
  factorizationClosed : Prop
  remainderRecorded : Prop
  gateWitness : factorizationClosed ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.factorizationClosed ∧ (A.factorizationClosed ∨ A.remainderRecorded)

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse
