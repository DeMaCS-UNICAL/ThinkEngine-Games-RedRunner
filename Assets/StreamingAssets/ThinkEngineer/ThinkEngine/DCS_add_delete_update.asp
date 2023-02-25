% Compute the atoms to keep/remove in the following iterations
% 
% INPUT:
% next_reachable(X,Y): X is a possible reachable tile
%       Y=g reached staying on the ground
%       Y=j1 reached with a jump (first stipe)
%       Y=j2 reached with a jump (second stipe)
%       Y=f reached falling
% 
% OUTPUT
% Add(X): X is an atom that needs to be included in the next iteration
% Delete(X): X is an atom that needs to be removed in the next iteration

Add(prev_reachable(X,Y)) :- next_reachable(X,Y).

Delete(prev_reachable(X,Y)) :- prev_reachable(X,Y).
