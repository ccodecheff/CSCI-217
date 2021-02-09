% System E run-time errors

sig syse-error.
accum_sig syse-small.

type lt      nat -> nat -> o.         % strict less than
type div_op  nat -> nat -> nat -> o.  % integer division operation

type div     exp -> exp -> exp.       % integer division constructor
type error   exp.                     % error constructor

type err     exp -> o.                % run-time error
