pos(0..(n**2)-1).

%% def lines

{seg(A, B): pos(A), pos(B)}.

% crea la contraria
:- seg(A, B), not seg(B, A).

% Prohibir bucles recursivos
:- seg(A, A).

% Moverse una única unidad
:- seg(A, B), |A/n-B/n|>1.
:- seg(A, B), |A\n-B\n|>1.

% Prohibir diagonales
:- seg(A, B), |A\n-B\n|+|A/n-B/n| >1.

% Prohibir multiples salidas de un nodo
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

% negro es esquina y tiene dos de longitud
:- black(A), seg(B, A), seg(A, C), |B\n-C\n|!=1, B!=C.
:- black(A), seg(B, A), seg(A, C), seg(D, B), A\n!=D\n, A/n!=D/n, A!=D.
:- black(A), seg(B, A), seg(A, C), seg(C, D), A\n!=D\n, A/n!=D/n, A!=D.

% blanco en recta
:- white(A), seg(B, A), seg(A, C), B\n!=C\n, B/n!=C/n, B!=C.
:- white(C), seg(A, B), seg(B, C), seg(C, D), seg(D, E), A!=C, E!=C, A!=E, |A\n-C\n|+|C\n-E\n|=0.

#show seg/2.

