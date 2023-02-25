% Identify the tiles that could be reached in this stripe
% 
% INPUT:
% passable(X): X is a passable tile (in the current stripe)
% prev_reachable(X,Y): X is a reachable tile (in the previous stripe)
%       Y=g reached staying on the ground
%       Y=j1 reached with a jump (first stipe)
%       Y=j2 reached with a jump (second stipe)
%       Y=f reached falling
% 
% OUTPUT
% possible_reachable(X,Y): X is a possible reachable tile
%       Y=g reached staying on the ground
%       Y=j1 reached with a jump (first stipe)
%       Y=j2 reached with a jump (second stipe)
%       Y=f reached falling:

possible_reachable(X,g) :- prev_reachable(X,g), passable(X).

possible_reachable(X,j2) :- prev_reachable(X,j1), passable(X).
possible_reachable(X-1,j2) :- prev_reachable(X,j1), passable(X-1).

possible_reachable(X+1,f) :- prev_reachable(X,j2), passable(X+1).
possible_reachable(X,f) :- prev_reachable(X,j2), not passable(X+1), passable(X).

possible_reachable(X+1,f) :- prev_reachable(X,f), passable(X+1).
possible_reachable(X,f) :- prev_reachable(X,f), not passable(X+1), passable(X).

% if you can reach a tile, you can also reach all the ones below it (up to a non passable one)
possible_reachable(X+1,f) :- possible_reachable(X,Y), passable(X+1).
