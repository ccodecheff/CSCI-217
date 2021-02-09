% Natural numbers and strings (as lists of natural numbers)

module nat-string.

nat z.
nat (s N) :- nat N.

string nill.
string (cons N L) :- nat N, string L.

plus_op z N N.
plus_op (s N1) N2 (s N3) :- plus_op N1 N2 N3.

times_op z N z.
times_op (s N1) N2 N :- times_op N1 N2 N3, plus_op N3 N2 N.

cat_op nill L L.
cat_op (cons N L1) L2 (cons N L3) :- cat_op L1 L2 L3.

len_op nill z.
len_op (cons N L) (s M) :- len_op L M.
