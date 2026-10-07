/-
  JSP-000085 / MultiplicativeFunction.lean
  Definitions for multiplicative / quasi-multiplicative sign functions.
  These are the building blocks of Tao's Type-I / Type-II estimates.
-/

import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Range
import Mathlib.NumberTheory.ArithmeticFunction
import Mathlib.Tactic

namespace JSP085.Multiplicative

open Finset ArithmeticFunction

/-- An **arithmetic function** a : ℕ → ℂ (we'll specialize to ℤ later for our purposes). -/
abbrev ArithFun := ArithmeticFunction ℂ

/-- A function is **multiplicative** if f(ab) = f(a)f(b) for coprime a, b. -/
def IsMultiplicative (f : ArithFun) : Prop :=
  ∀ ⦃a b : ℕ⦄, Nat.Coprime a b → f (a * b) = f a * f b

/-- **Completely multiplicative**: f(ab) = f(a)f(b) for all a, b. -/
def IsCompletelyMultiplicative (f : ArithFun) : Prop :=
  ∀ ⦃a b : ℕ⦄, f (a * b) = f a * f b

/-- **Quasi-multiplicative**: |f(ab) - f(a)f(b)| ≤ ε for all "most" a, b. -/
def IsQuasiMultiplicative (f : ArithFun) (ε : ℝ) : Prop :=
  ∀ ⦃a b : ℕ⦄, ‖f (a * b) - f a * f b‖ ≤ ε

/-- Bounded multiplicative function: |f(n)| ≤ 1. -/
def IsBounded (f : ArithFun) : Prop :=
  ∀ n : ℕ, ‖f n‖ ≤ 1

end JSP085.Multiplicative
