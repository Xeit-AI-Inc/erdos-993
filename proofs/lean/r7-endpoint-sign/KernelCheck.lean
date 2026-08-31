import C5T103

#check C5T103.C5_T1_03

example :
    forall (p ell : Nat) (Gamma Delta D : Int),
      1 <= p ->
      1 <= ell ->
      D = (p : Int) * ((p : Int) + 1) *
        (Gamma - (ell : Int) * Delta) ->
      0 <= Gamma ->
      Delta < 0 ->
      0 < D :=
  C5T103.C5_T1_03
