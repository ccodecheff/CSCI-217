% System E syntax - equality judgment for by-value fragment

module syse-synt.
accumulate nat-string.

% Equality judgment for the by-value fragement
eq (num N) (num N).
eq (str S) (str S).
eq (plus E1 E2) (plus E1' E2') :- eq E1 E1', eq E2 E2'.
eq (times E1 E2) (times E1' E2') :- eq E1 E1', eq E2 E2'.
eq (cat E1 E2) (cat E1' E2') :- eq E1 E1', eq E2 E2'.
eq (len E) (len E') :- eq E E'.
eq (letv E1 E2) (letv E1' E2') :-
  eq E1 E1',
  pi x\ pi y\ eq x y => eq (E2 x) (E2' y).
