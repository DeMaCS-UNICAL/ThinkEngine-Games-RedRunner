% Guess the passable
% 
% INPUT:
% tile(X): X is a tile
% 
% OUTPUT
% passable(X): X is a passable tile

1<={ passable(X) : tile(X) }.

:- passable(X), max_tile(X).
