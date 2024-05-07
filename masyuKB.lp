#const n=3.
pos(0..(n**2)-1).

black(0).
white(1).

%% def lines

{seg(A, B): pos(A), pos(B)}.

% crea la contraria
:- seg(A, B), not seg(B, A).

% no a uno mismo
:- seg(A, A).

% solo vecinos
:- seg(A, B), |A/n-B/n|>1.
:- seg(A, B), |A\n-B\n|>1.

% no diagonales
:- seg(A, B), |A\n-B\n|+|A/n-B/n| >1.

% no salir a multiples
:- seg(A, B), seg(B, C), seg(B, D), A!=C, A!=D, C!=D.


%% reach

reach(A, B) :- seg(A, B).
reach(A, C) :- reach(A, B), seg(B, C), A!=C.

% todas las lineas conectadas
:- seg(A, B), seg(C, D), not reach(B,C), not reach(A,C).


%% nodes

nod(A) :- seg(A, _).
:- nod(A), not 4{seg(_, A); seg(A, _)}.


:- black(A), not nod(A).
:- white(A), not nod(A).

% negro es esquina
:- black(A), seg(B, A), seg(A, C), |B\n-C\n|!=1, B!=C.

% blanco en recta
:- white(A), seg(B, A), seg(A, C), B\n!=C\n, B/n!=C/n, B!=C.


%:- white(C), 
%seg(A, B), seg(B, C), A!=C,
%seg(C, D), seg(D, E), C!=E,
%A!=E, A!=D, B!=E, B!=D.

#show seg/2.