sig hw3.

/*-------Chapter 9----------*/
kind typ type.
kind exp type.

type nat typ.

type arr typ -> typ -> typ.
type z exp.
type s exp -> exp.
type n exp -> exp.
type lam typ -> (exp -> exp) -> exp.
type ap exp -> exp -> exp.
type rec exp -> (exp -> exp -> exp) -> exp -> exp.
type let exp -> (exp -> exp) -> exp.
type of exp -> typ -> o.
type val exp -> o.
type step exp -> exp -> o.
type eval exp -> exp -> o.

/*-------Chapter 10----------*/
type unit typ.
type prod typ -> typ -> typ.

type triv exp.
type pair exp -> exp -> exp.
type fst exp -> exp.
type snd exp -> exp.

/*-------Chapter 11----------*/
type void typ.
type sum typ -> typ -> typ.
type case exp -> (exp -> exp) -> (exp -> exp) -> exp.
type inl typ -> exp -> exp.
type inr typ -> exp -> exp.

type abort typ -> exp -> exp.

type steps exp -> exp -> o.