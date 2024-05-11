pos(0..(n*n)-1).

%% Lines
{line(A, B) : pos(A), pos(B)} :- |A-B|=n, |A\n-B\n|<=1, A!=B.
{line(A, B) : pos(A), pos(B)} :- |A-B|=1, |A/n-B/n|<=1, A!=B.

% crea la contraria
:- line(A, B), not line(B, A).

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

esquina(A) :- line(B, A), line(A, C), |B\n-C\n|=1, B!=C.

% Todos los puntos tienen un nodo
:- black(A), not nod(A).
:- white(A), not nod(A).

% Negro es esquina y tiene dos de longitud
:- black(A), not esquina(A).
:- black(B), line(A, B), line(B, C), A!=C, esquina(A).

% Blanco en recta y con una esquina
:- white(A), esquina(A).

:- white(B), line(A, B), line(C, B), A!=C, not esquina(A), not esquina(C).

seg(A,B) :- line(A,B), A<B.

#show.