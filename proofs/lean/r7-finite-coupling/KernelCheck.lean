import C5T304C5T305

#check C5T304C5T305.diagonalMass
#check C5T304C5T305.transportCost
#check C5T304C5T305.cost_lower_bound
#check C5T304C5T305.strict_cost_implies_positive_diagonal_mass
#check C5T304C5T305.positive_diagonal_mass_implies_common_positive_marginals
#check C5T304C5T305.C5_T3_04_C5_T3_05

section ScalarSpecializations

variable {ι : Type*} [Fintype ι] [Nonempty ι]

#check (C5T304C5T305.C5_T3_04_C5_T3_05 (ι := ι) (𝕜 := ℚ))
#check (C5T304C5T305.C5_T3_04_C5_T3_05 (ι := ι) (𝕜 := ℝ))

end ScalarSpecializations
