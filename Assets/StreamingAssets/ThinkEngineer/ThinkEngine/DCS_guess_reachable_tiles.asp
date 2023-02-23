% Guess the reachable
% 
% INPUT:
% possible_reachable(X,Y): X is a possible reachable tile
% 
% OUTPUT
% reachable(X): X is a reachable tile

possible_reachable(X) :- possible_reachable(X,Y).

1<={ reachable(X) : possible_reachable(X) }.
