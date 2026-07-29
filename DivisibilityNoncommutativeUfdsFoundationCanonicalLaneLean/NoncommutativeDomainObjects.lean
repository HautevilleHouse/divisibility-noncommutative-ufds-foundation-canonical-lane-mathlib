import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure NoncommutativeUfdDomain where
  carrier : Type u
  ringStructure : Ring carrier
  integralDomain : IsDomain carrier
  atomic : Prop
  factorizationUnique : Prop
  noncommutative : ¬ CommutativeRing carrier
  factorizationUniqueTerm : factorizationUnique

structure AdmittedNoncommutativeUfdObject where
  domain : NoncommutativeUfdDomain
  conclusion : domain.factorizationUnique

def NoncommutativeUfdWitnessClosed (O : AdmittedNoncommutativeUfdObject) : Prop :=
  O.domain.factorizationUnique

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse