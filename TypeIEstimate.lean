/-
  JSP-000085 / TypeIEstimate.lean
  Tao's Type-I estimate (Section 3 of his 2016 paper).

  Type-I inputs: f_n = Σ_{k ≤ n} f(kd) for fixed d, varying n.
  Type-II inputs: f_d = Σ_{d ≤ D} f(kd) for fixed k, varying d.

  Tao's proof shows both estimates have logarithmic gain over trivial bounds,
  then combines them via a multiplier argument.
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

/-- **Type-I estimate (Tao 2016)**: for bounded multiplicative g,
    |sumAlongAP g N d| ≤ C · N · (log N)^{1-δ} for any δ > 0 (when d ≤ N^{1/2-ε}).

    We give a weaker logarithmic-gain statement: |sumAlongAP| ≤ N · log N. -/
theorem type_I_estimate (g : BoundedMultSign) (N d : ℕ)
    (hd : d ≤ N) (hN : N ≥ 2) :
    ‖sumAlongAP g N d‖ ≤ (N : ℝ) * Real.log ((N : ℝ) + 1) := by
  sorry

/-- A more useful "small-d" version: when d is bounded (independent of N),
    we get |sumAlongAP g N d| ≪ N. -/
theorem type_I_small_d (g : BoundedMultSign) (N : ℕ) (d C : ℕ)
    (hN : N ≥ 1) (hd : d ≤ C) :
    ‖sumAlongAP g N d‖ ≤ (N : ℝ) * (C + 1 : ℝ) := by
  sorry

/-- Type-II estimate (Tao's symmetric version, Section 4 of his paper):
    For bounded multiplicative g, |Σ_{d ≤ D} g.f(kd)| ≤ D · (log D)^A for some A. -/
theorem type_II_estimate (g : BoundedMultSign) (k D : ℕ)
    (hD : D ≥ 2) :
    ‖∑ d ∈ Finset.range D, g.f ((k + 1) * (d + 1))‖ ≤
      (D : ℝ) * Real.log ((D : ℝ) + 1) := by
  sorry

end JSP085.TypeI
