import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean

structure NoncommutativeDomainElement where
  carrier : Type
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  addComm : ∀ a b : carrier, add a b = add b a
  zeroAdd : ∀ a : carrier, add zero a = a
  addZero : ∀ a : carrier, add a zero = a
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  oneMul : ∀ a : carrier, mul one a = a
  mulOne : ∀ a : carrier, mul a one = a
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)

structure NoncommutativeUfd where
  domain : NoncommutativeDomainElement
  noZeroDivisors : ∀ a b : domain.carrier, domain.mul a b = domain.zero → a = domain.zero ∨ b = domain.zero
  factorizationExists : ∀ a : domain.carrier, a ≠ domain.zero → a ∉ {x : domain.carrier | ∃ u : domain.carrier, domain.mul u x = domain.one} →
    ∃ (n : ℕ) (irreds : Fin n → domain.carrier), (∀ i, irreducible domain irreds i) ∧ (domain.mul (Fin.foldr domain.mul domain.one irreds) (someUnit) = a)
  factorizationUnique : ∀ a : domain.carrier, ∀ (n m : ℕ) (p : Fin n → domain.carrier) (q : Fin m → domain.carrier),
    (∀ i, irreducible domain p i) → (∀ j, irreducible domain q j) →
    (∃ (u : domain.carrier), associated domain u domain.one ∧ domain.mul (Fin.foldr domain.mul domain.one p) u = domain.mul (Fin.foldr domain.mul domain.one q) (domain.one)) → n = m

def irreducible (R : NoncommutativeDomainElement) (a : R.carrier) : Prop :=
  a ≠ R.zero ∧ a ∉ {x : R.carrier | ∃ u : R.carrier, R.mul u x = R.one} ∧
  ∀ b c : R.carrier, R.mul b c = a → b ∈ {x : R.carrier | ∃ u : R.carrier, R.mul u x = R.one} ∨ c ∈ {x : R.carrier | ∃ u : R.carrier, R.mul u x = R.one}

def associated (R : NoncommutativeDomainElement) (a b : R.carrier) : Prop :=
  ∃ u : R.carrier, (∃ v : R.carrier, R.mul u v = R.one) ∧ R.mul u a = b

end DivisibilityNoncommutativeUfdsFoundationCanonicalLaneLean
end HautevilleHouse