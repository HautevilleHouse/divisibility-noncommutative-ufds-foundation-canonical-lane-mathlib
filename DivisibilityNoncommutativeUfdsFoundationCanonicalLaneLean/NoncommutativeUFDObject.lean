import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure NoncommutativeDomainObject where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  isRing : Prop
  isDomain : Prop
  isNoncommutative : Prop
  ringAxioms : isRing
  domainAxioms : isDomain
  noncommutativeAxioms : isNoncommutative

structure NoncommutativeUFDObject extends NoncommutativeDomainObject where
  factorizationExists : Prop
  factorizationUniqueUpToAssociates : Prop
  factorizationExistsProof : factorizationExists
  factorizationUniqueProof : factorizationUniqueUpToAssociates

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse
