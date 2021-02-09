		% System E statics

module syse-stat.
accumulate syse-synt.

% Typing rules.  Rule 4.1a is implicit. Rule for letv is a duplicate of 4.1h.
of (num N) numt :- nat N.                                        % 4.1b
of (str S) strt :- string S.                                     % 4.1c
of (plus E1 E2) numt :- of E1 numt, of E2 numt.                  % 4.1d
of (times E1 E2) numt :- of E1 numt, of E2 numt.                 % 4.1e
of (cat E1 E2) strt :- of E1 strt, of E2 strt.                   % 4.1f
of (len E) numt :- of E strt.                                    % 4.1g
of (let E1 E2) T2 :- of E1 T1, pi x\ of x T1 => of (E2 x) T2.    % 4.1h
of (letv E1 E2) T2 :- of E1 T1, pi x\ of x T1 => of (E2 x) T2.   % 4.1h
