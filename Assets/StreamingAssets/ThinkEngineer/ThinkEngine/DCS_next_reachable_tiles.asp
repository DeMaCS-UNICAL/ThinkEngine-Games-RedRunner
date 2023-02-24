% Compute the new prev_reachable
% 
% INPUT:
% reachable(X): X is a reachable tile
% possible_reachable(X,Y): X is a possible reachable tile
%       Y=g reached staying on the ground
%       Y=j1 reached with a jump (first stipe)
%       Y=j2 reached with a jump (second stipe)
%       Y=f reached falling
% 
% OUTPUT
% next_reachable(X,Y): the atom that needs to be converted to `prev_reachable` for the next stripe

next_reachable(X,Y) :- possible_reachable(X,Y), reachable(X).
