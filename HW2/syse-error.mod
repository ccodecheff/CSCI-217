% System E run-time errors

module syse-error.
accumulate syse-small.

% Strict less than
lt z (s N) :- nat N.
lt (s N) (s M) :- lt N M.

% Integer division by repeated subtraction
% Note that attempted division by zero produces an infinite loop
div_op N1 N2 z :- lt N1 N2.
div_op N1 N2 (s N3) :- plus_op N2 M N1, div_op M N2 N3.    % M = N1 - N2

% Statics and dynamics for div and error
of (div E1 E2) numt :- of E1 numt, of E2 numt.

step (div E1 E2) (div E1 E2') :- step E2 E2'.
step (div E1 E2) (div E1' E2) :- val E2, step E1 E1'.
step (div (num N1) (num N2)) (num N3) :- div_op N1 N2 N3.


% Rules for err
err (plus E1 E2) :- err E1.
err (plus E1 E2) :- val E1, err E2.
err (times E1 E2) :- err E1.
err (times E1 E2) :- val E1, err E2.
err (div E1 (num z)) :- val E1.         % the main error: division by 0
err (div E1 E2) :- err E2.
err (div E1 E2) :- val E2, err E1.
err (len E1) :- err E1.
err (cat E1 E2) :- err E1.
err (cat E1 E2) :- val E1, err E2.
err (letv E1 E2) :- err E1.