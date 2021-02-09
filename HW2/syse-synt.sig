% System E syntax

sig syse-synt.
accum_sig nat-string.

% Types
kind typ   type.
type strt  typ.                             % str, as a type
type numt  typ.                             % num, as a type

% Expressions
kind exp    type.
type num    nat -> exp.                     % num[n]
type str    string -> exp.                  % str[s]
type plus   exp -> exp -> exp.              % plus(e1;e2)
type times  exp -> exp -> exp.              % times(e1;e2)
type cat    exp -> exp -> exp.              % cat(e1;e2)
type len    exp -> exp.                     % len(e1)
type let    exp -> (exp -> exp) -> exp.     % let(e1;x.e2), by name
type letv   exp -> (exp -> exp) -> exp.     % let(e1;x.e2), by value

% Equality judgment, used for simultaneous substitutions
type eq     exp -> exp -> o.                % e1 = e2
