pos(0..(n**2)-1).

%% Lines

{line(A, B): pos(A), pos(B)} :- |A-B|=n.
{line(A, B): pos(A), pos(B)} :- |A-B|=1.

% crea la contraria
:- line(A, B), not line(B, A).

% Prohibir bucles
:- line(A, A).

% Moverse una única unidad
:- line(A, B), |A/n-B/n|>1.
:- line(A, B), |A\n-B\n|>1.

% Prohibir diagonales
:- line(A, B), |A\n-B\n|+|A/n-B/n| >1.

% Prohibir multiples salidas de un nodo
:- line(A, B), line(B, C), line(B, D), A!=C, A!=D, C!=D.


%% Reach

reach(A, B) :- line(A, B).
reach(A, C) :- reach(A, B), line(B, C), A!=C.

% Todas las lineas conectadas
:- line(A, B), line(C, D), not reach(B,C), not reach(A,C).


%% Nodes

nod(A) :- line(A, _).

% Todos los nodes tienen 4 conexiones
:- nod(A), not 4{line(_, A); line(A, _)}.

% Todos los puntos tienen un nodo
:- black(A), not nod(A).
:- white(A), not nod(A).

% Negro es esquina y tiene dos de longitud
:- black(A), line(B, A), line(A, C), |B\n-C\n|!=1, B!=C.
:- black(A), line(B, A), line(A, C), line(D, B), A\n!=D\n, A/n!=D/n, A!=D.
:- black(A), line(B, A), line(A, C), line(C, D), A\n!=D\n, A/n!=D/n, A!=D.

% Blanco en recta y con una esquina
:- white(A), line(B, A), line(A, C), B\n!=C\n, B/n!=C/n, B!=C.
:- white(C), line(A, B), line(B, C), line(C, D), line(D, E), A!=C, E!=C, A!=E, |A\n-C\n|+|C\n-E\n|=0.

seg(A,B) :- line(A,B), A<B.

#show line/2.