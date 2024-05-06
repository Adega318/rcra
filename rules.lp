#const n=4.
#const r=2.
pos(0..n-1).
dot(w; b; e).

%% def lines

{line(A, B): pos(A), pos(B)}.

% crea la contraria
:- line(A, B), not line(B, A).

% no a uno mismo
:- line(A, A).

% solo vecinos
:- line(A, B), |A/r-B/r|>1.
:- line(A, B), |A\r-B\r|>1.

% no diagonales
:- line(A, B), |A\r-B\r|+|A/r-B/r| >1.

% no salir a multiples
:- line(A, B), line(B, C), line(B, D), A!=C, A!=D, C!=D.


%% reach

reach(A, B) :- line(A, B).
reach(A, C) :- reach(A, B), line(B, C), A!=C.

:- line(A, B), line(C, D), not reach(B,C), not reach(A,C).


%% nodes

4{nod(A): pos(A)}n .

% nodo entre lineas
:- line(A, B), line(B, A), line(B, C), line(C, B), not nod(B), A!=C.

% no nodos extremos
:- nod(B), not line(_, B), not line(B, _).


%% def points

%1{point(A, D): dot(D)}1 :- pos(A).
%
%
%
%point(1, e).
%point(2, e).
%point(3, e).
%point(4, e).
%point(5, e).
%point(6, e).
%point(7, e).
%point(8, e).
%point(9, e).

#show line/2.
#show nod/1.