module hw3.

of z nat. %9.1b                                                                                     
of (s E) nat :- of E nat. %9.1c                                                                     
of (rec E0 E1 E) T :- of E nat, of E0 T, pi x\ pi y\ of x nat => of y T => of (E1 x y) T.      %9.1d
of (lam T1 E) (arr T1 T2) :- pi x\ of x T1 => of (E x) T2.                                     %9.1e
of (ap E1 E2) T :- of E1 (arr T2 T), of E2 T2.                                                 %9.1f

val z.                  %9.2a
val (s E) :- val E.     %9.2b
val (lam T E).          %9.2c



eval z z.
eval (s E) (s N) :- eval E N.
eval (lam T E) (lam T E).
eval (ap E1 E2) V :- eval E1 (lam T E), eval E2 V2, eval (E V2) V.
eval (rec E0 E1 E) V :- eval E z, eval E0 V.
eval (rec E0 E1 E) V :- eval E (s E'), eval (rec E0 E1 E') V', eval (E1 E' V') V.

step (s E) (s E') :-  step E E'.                               %9.3a
step (ap E1 E2) (ap E1' E2) :- step E1 E1'.                    %9.3b
step (ap E1 E2) (ap E1 E2') :- val E1, step E2 E2'.            %9.3c
step (ap (lam T E) E2) (E E2) :- val E2.                       %9.3d
step (rec E0 E1 E) (rec E0 E1 E') :- step E E'.                %9.3e
step (rec E0 E1 z) E0.                                         %9.3f
step (rec E0 E1 (s E)) (let (rec E0 E1 E) (E1 E)) :- val E.    %let rule


of triv unit.                                         %10.1a
of (pair E1 E2) (prod T1 T2) :- of E1 T1, of E2 T2.   %10.1b
of (fst E) T1 :- of E (prod T1 T2).                   %10.1c
of (snd E) T2 :- of E (prod T1 T2).                   %10.1d


val triv.                             
val (pair E1 E2) :- val E1, val E2.    


step (pair E1 E2) (pair E1' E2) :- step E1 E1'.             %10.2c
step (pair E1 E2) (pair E1 E2') :- val E1, step E2 E2'.     %10.2d
step (fst E) (fst E') :- step E E'.                         %10.2e
step (snd E) (snd E') :- step E E'.                         %10.2f
step (fst (pair E1 E2)) E1 :- val E1, val E2.               %10.2g
step (snd (pair E1 E2)) E2 :- val E1, val E2.               %10.2h


%eval E V.
eval triv triv.
eval (pair E1 E2) (pair V1 V2) :- eval E1 V1, eval E2 V2.
eval (fst E) V1 :- eval E (pair V1 V2).
eval (snd E) V2 :- eval E (pair V1 V2).
eval (fst (pair E1 E2)) V1 :- eval E1 V1, eval E2 V2.
eval (snd (pair E1 E2)) V2 :- eval E1 V1, eval E2 V2.

of (abort T E) T :- of E void.              %11.1a
of (inl T2 E)(sum T1 T2) :- of E T1.        %11.1b
of (inr T1 E)(sum T1 T2) :- of E T2.        %11.1c
of (case E E1 E2 ) T :- of E (sum T1 T2), pi x1\ of x1 T1 => of (E1 x1) T, pi x2\ of x2 T2 => of (E2 x2) T.                                      %11.1d


val (inl T E) :- val E.                              %11.2b
val (inr T E) :- val E.                              %11.2c


step (abort T E) (abort T E') :- step E E'.         %11.2a
step (inl T E) (inl T E') :- step E E'.             %11.2d
step (inr T E) (inr T E') :- step E E'.             %11.2e
step (case E E1 E2) (case E' E1 E2) :- step E E'.   %11.2f
step (case (inl T E) E1 E2) (E1 E) :- val E.        %11.2g
step (case (inr T E) E1 E2) (E2 E) :- val E.        %11.2h

% Big Step rule

eval (inl T E) V :- eval E V.
eval (inr T E) V :- eval E V.
eval (case E E1 E2) V :- eval E (inl T V1), eval (E1 V1) V.
eval (case E E1 E2) V :- eval E (inr T V2), eval (E2 V2) V.


of (let E1 E2) T2 :- of E1 T1, pi x\ of x T1 => of (E2 x) T2.
step (let E1 E2) (let E1' E2) :- step E1 E1'.
step (let E1 E2) (E2 E1) :- val E1.

steps E E.
steps E E'' :- step E E', steps E' E''.