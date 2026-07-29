import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure AdmittedObject where
  domain : Type
  factorizationWitness : Prop
  irreducibilityStructure : Prop
  conclusion : factorizationWitness ∧ irreducibilityStructure

def DivisibiltyWitnessClosed (O : AdmittedObject) : Prop :=
  O.factorizationWitness ∧ O.irreducibilityStructure

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse