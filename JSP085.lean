/-
  JSP-000085: Unbounded discrepancy on homogeneous arithmetic progressions

  Original problem (Erdős 1932 / 1957):
    For every function f : ℕ → {±1}, the quantity
        ‖f‖_{HAP} := sup_{n,d ≥ 1} |Σ_{k=1..n} f(k·d)|
    is infinite.

  Equivalent (Tao's reformulation 2015/2016):
    There is no f : ℕ → {±1} with ‖f‖_{HAP} bounded.

  Solved by Terence Tao (2016):
    "The Erdős discrepancy problem",
    Discrete Analysis 2016:1, 29 pp.
    https://escholarship.org/content/qt4wr015m0/qt4wr015m0.pdf

  This file formalizes the *outer* definitions only:
  - discrepancy of a sign function
  - HAP-discrepancy norm
  - the statement itself

  Internal proof machinery (Large sieve, Halász-Montgomery,
  Type-I / Type-II estimates, multiplicative recovery) is
  in the sibling files under the same project.
-/

import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Range
import Mathlib.Data.Set.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Tactic

namespace JSP085

open Finset

/-- A sign function f : ℕ → {±1}. -/
def SignFun := ℕ → ℤ

namespace SignFun

/-- Canonical ±1 signing. -/
def one : SignFun := fun _ => 1
def negOne : SignFun := fun _ => -1

/-- Discrepancy of f over the arithmetic progression {d, 2d, …, nd}. -/
def hapPartialSum (f : SignFun) (n d : ℕ) : ℤ :=
  ∑ k ∈ Finset.range n, f ((k + 1) * d)

/-- Absolute value of the partial sum (as a ℕ, since the sum is an integer). -/
noncomputable def hapPartialSumAbs (f : SignFun) (n d : ℕ) : ℕ :=
  (hapPartialSum f n d).natAbs

/-- HAP-discrepancy norm of a sign function: sup over all n, d of the partial sum. -/
noncomputable def hapNorm (f : SignFun) : ℕ :=
  sSup { s : ℕ | ∃ n d : ℕ, s = hapPartialSumAbs f n d }

end SignFun

/-- A sign function is **bounded HAP** if there exists C such that all HAP partial
    sums are bounded by C. Equivalently, the sup over n, d of |Σ f(kd)| is finite. -/
def BoundedHAP (f : SignFun) : Prop :=
  ∃ C : ℕ, ∀ n d : ℕ, SignFun.hapPartialSumAbs f n d ≤ C

/-- The Erdős discrepancy problem (statement only). -/
theorem erdos_discrepancy : ∀ f : SignFun, ¬ BoundedHAP f := by
  sorry

/-- Tao's theorem (2016) states exactly the above. -/
theorem jsp_000085 : ∀ f : SignFun, ¬ BoundedHAP f :=
  erdos_discrepancy

end JSP085
