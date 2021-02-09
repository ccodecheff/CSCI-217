% Mod File for HW4

module hw4.

typ (all T) :- pi t\ typ t => typ (T t).
of (lam E) (all T) :- pi t\ typ t => of (E t) (T t).
of (app T E) (T' T) :- of E (all T'), typ T.

typ (some T) :- pi t\ typ t => typ (T t).
of (pack T P E) (some T) :- typ P,  pi t\ typ t => typ (T t), of E (T P).
of (open E1 E2) T2 :- of E1 (some T), pi t\ pi x\ typ t => of x (T t) =>
of (E2 t x) T2.

val (lam E).
val (pack T P E) :- val E.

step (app T E) (app T E') :- step E E'.
step (app T (lam E)) (E T).

step (pack T P E) (pack T P E') :- step E E'. 
step (open E1 E2) (open E1' E2) :- step E1 E1'.
step (open (pack T P E) E2) (E2 P E).


