%Sig File for HW4
sig hw4.

kind typ type.
type all (typ -> typ) -> typ.
type p typ.
type t typ.
type some (typ -> typ) -> typ.

kind exp type.
type lam (typ -> exp) -> exp.
type app typ -> exp -> exp.
type pack (typ -> typ) -> typ -> exp -> exp.
type open exp -> (typ -> exp -> exp) -> exp.

type typ typ -> o.
type of exp -> typ -> o.                        
type val exp -> o.                               
type step exp -> exp -> o.                        


