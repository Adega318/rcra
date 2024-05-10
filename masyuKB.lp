pos(0..(n**2)-1).

%% Lines

{seg(A, B): pos(A), pos(B)} :- |A-B|=n.
{seg(A, B): pos(A), pos(B)} :- |A-B|=1.

% crea la contraria
:- seg(A, B), not seg(B, A).

% Prohibir bucles
:- seg(A, A).

% Moverse una única unidad
:- seg(A, B), |A/n-B/n|>1.
:- seg(A, B), |A\n-B\n|>1.

% Prohibir diagonales
:- seg(A, B), |A\n-B\n|+|A/n-B/n| >1.

% Prohibir multiples salidas de un nodo
:- seg(A, B), seg(B, C), seg(B, D), A!=C, A!=D, C!=D.


%% Reach

reach(A, B) :- seg(A, B).
reach(A, C) :- reach(A, B), seg(B, C), A!=C.

% Todas las lineas conectadas
:- seg(A, B), seg(C, D), not reach(B,C), not reach(A,C).


%% Nodes

nod(A) :- seg(A, _).

% Todos los nodes tienen 4 conexiones
:- nod(A), not 4{seg(_, A); seg(A, _)}.

% Todos los puntos tienen un nodo
:- black(A), not nod(A).
:- white(A), not nod(A).

% Negro es esquina y tiene dos de longitud
:- black(A), seg(B, A), seg(A, C), |B\n-C\n|!=1, B!=C.
:- black(A), seg(B, A), seg(A, C), seg(D, B), A\n!=D\n, A/n!=D/n, A!=D.
:- black(A), seg(B, A), seg(A, C), seg(C, D), A\n!=D\n, A/n!=D/n, A!=D.

% Blanco en recta y con una esquina
:- white(A), seg(B, A), seg(A, C), B\n!=C\n, B/n!=C/n, B!=C.
:- white(C), seg(A, B), seg(B, C), seg(C, D), seg(D, E), A!=C, E!=C, A!=E, |A\n-C\n|+|C\n-E\n|=0.

#show seg/2.