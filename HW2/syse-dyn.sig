% System E (structural) dynamics

sig syse-dyn.
accum_sig syse-synt.

type steps  exp -> exp -> o.                % e1 |-->* e2
type nstep  nat -> exp -> exp -> o.         % e1 |-->^k e2

type val    exp -> o.                       % e val
type step   exp -> exp -> o.                % e1 |--> e2
