module hw1.

nat z.
nat (s N) :- nat N.

leq z N :- nat N.                               % leq, variation 0
leq (s N) (s M) :- leq N M.                     %

plus z M M :- nat M.                            % plus, variation 0
plus (s N) M (s R) :- plus N M R.               %

times z M z :- nat M.                           % times, variation 00
times (s N) M R :- times N M NM, plus NM M R.   %
