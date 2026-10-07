# JSP-000085 Tao Discrepancy — Lean 4.20 Formalization

> **Problem**: Erdős discrepancy problem on homogeneous arithmetic progressions
> **Solver**: Terence Tao (2016) — [paper](https://escholarship.org/content/qt4wr015m0/qt4wr015m0.pdf)
> **JSP bounty**: USD $500
> **Current status**: Solved, Lean proof: No, Eligible: No

## Structure

```
JSP085.lean                     -- Outer statement & main theorem declaration
MultiplicativeFunction.lean     -- Multiplicative / quasi-multiplicative definitions
LargeSieveInequality.lean       -- (TODO) Large sieve estimate
HalaszMontgomery.lean           -- (TODO) Halász-Montgomery inequality
TypeIEstimate.lean              -- (TODO) Tao's Type-I estimate
TypeIIEstimate.lean             -- (TODO) Tao's Type-II estimate
DiscrepancyMain.lean            -- (TODO) Assemble all parts → contradiction
```

## Build

```sh
lake build
```

## Attribution policy

This is **original** Lean formalization by `skj-pixel`, written from Tao's
2016 paper. We do **not** mirror or fork any upstream Lean repository.
The OpenAI `ten-proofs` repository is used *only* as an engineering
reference for Lake project layout and `#print axioms` usage.

Per JSP attribution.md (rule: "actual contributor using their own account"),
this Lean code is the skj-pixel author's contribution and may be submitted
as a JSP-000085 Lean claim after `#print axioms jsp_000085` is verified
to contain only standard Lean axioms (`propext`, `Quot.sound`, `Classical.choice`).
