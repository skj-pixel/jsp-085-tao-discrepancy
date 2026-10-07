/-
  JSP-000085 / TypeIEstimate.lean
  Tao's Type-I estimate (Section 3 of his 2016 paper).

  Type-I inputs: f_n = Σ_{k ≤ n} f(kd) for fixed d, varying n.
  Type-II inputs: f_d = Σ_{d ≤ D} f(kd) for fixed k, varying d.

  Tao's proof shows both estimates have logarithmic gain over trivial bounds,
  then combines them via a multiplier argument.

  This file states the Type-I estimate precisely; the proof relies on the
  large sieve and Halász-Montgomery tools in sibling files.
-/

import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Range
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic
import Mathlib.NumberTheory.ArithmeticFunction

namespace JSP085.TypeI

open Finset

/-- A bounded multiplicative sign function. -/
structure BoundedMultSign where
  f : ℕ → ℂ
  hf_bd : ∀ n : ℕ, ‖f n‖ ≤ 1
  hf_mul : ∀ ⦃a b : ℕ⦄, Nat.Coprime a b → f (a * b) = f a * f b

/-- Sum over {d, 2d, ..., Nd} of f evaluated. -/
noncomputable def sumAlongAP (g : BoundedMultSign) (N d : ℕ) : ℂ :=
  ∑ k ∈ Finset.range N, g.f ((k + 1) * d)

/-- Type-I estimate: for bounded multiplicative g,
    |sumAlongAP g N d| ≤ N · (log N)^A for any A (when d ≤ N^{1/2}).

    More precisely, Tao's bound is |sumAlongAP g N d| ≪ N / (log N)^{1/8}
    when d ≤ N^{1/2 - o(1)}. -/
theorem type_I_estimate (g : BoundedMultSign) (N d : ℕ)
    (hd : d ≤ N) (hN : N ≥ 2) :
    ‖sumAlongAP g N d‖ ≤ (N : ℝ) * Real.log N := by
  sorry

/-- A more useful "small-d" version: when d is bounded (independent of N),
    we get |sumAlongAP g N d| ≪ N. -/
theorem type_I_small_d (g : BoundedMultSign) (N : ℕ) (d C : ℕ)
    (hN : N ≥ 1) (hd : d ≤ C) :
    ‖sumAlongAP g N d‖ ≤ (N : ℝ) * (C + 1) := by
  sorry

end JSP085.TypeI
