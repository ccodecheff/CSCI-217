% Natural numbers and strings (as lists of natural numbers)

sig nat-string.

% Natural numbers
kind nat  type.
type z  nat.
type s  nat -> nat.

% Strings, represented as nat lists (think lists of unicodes)
kind string  type.
type nill  string.
type cons  nat -> string -> string.

% Typing predicates
type nat     nat -> o.
type string  string -> o.

% Primitive operations
type plus_op   nat -> nat -> nat -> o.             % addition
type times_op  nat -> nat -> nat -> o.             % multiplication
type cat_op    string -> string -> string -> o.    % concatenation (append)
type len_op    string -> nat -> o.                 % length
