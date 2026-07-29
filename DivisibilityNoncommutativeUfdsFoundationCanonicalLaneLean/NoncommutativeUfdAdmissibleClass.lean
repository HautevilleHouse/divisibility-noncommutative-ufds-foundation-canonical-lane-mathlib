import DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean.NoncommutativeDomainObjects

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedNoncommutativeUfdObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NoncommutativeUfdWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse