% System E (structural) dynamics

module syse-dyn.
accumulate syse-synt.

% Multiple steps
steps E E.                                                             % 5.1a
steps E E'' :- step E E', steps E' E''.                                % 5.1b

% n-times iterated step
nstep z E E.                                                           % 5.2a
nstep (s K) E E'' :- step E E', nstep K E' E''.                        % 5.2b

% Value judgment
val (str S).                                                           % 5.3a
val (num N).                                                           % 5.3b

% Single-step evaluation judgment
step (plus (num N1) (num N2)) (num N) :- plus_op N1 N2 N.              % 5.4a
step (plus E1 E2) (plus E1' E2) :- step E1 E1'.                        % 5.4b
step (plus E1 E2) (plus E1 E2') :- val E1, step E2 E2'.                % 5.4c

step (times (num N1) (num N2)) (num N) :- times_op N1 N2 N.
step (times E1 E2) (times E1' E2) :- step E1 E1'.
step (times E1 E2) (times E1 E2') :- val E1, step E2 E2'.

step (cat (str S1) (str S2)) (str S) :- cat_op S1 S2 S.                % 5.4d
step (cat E1 E2) (cat E1' E2) :- step E1 E1'.                          % 5.4e
step (cat E1 E2) (cat E1 E2') :- val E1, step E2 E2'.                  % 5.4f

step (len (str S)) (num N) :- len_op S N.
step (len E) (len E') :- step E E'.

step (let E1 E2) (E2 E1).                                              % 5.4h

step (letv E1 E2) (letv E1' E2) :- step E1 E1'.                        % [5.4g]
step (letv E1 E2) (E2 E1) :- val E1.                                   % [5.4h]
