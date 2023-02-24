% Assign an asset to each tile
% 
% INPUT:
% tile(X): X is a tile
% reachable(X): X is a reachable tile
% passable_asset(X): X is an asset where the player can transit
% inaccessible_asset(X): X is an asset where the player cannot transit
% 
% OUTPUT
% assigned_asset(X,A): the X tile contains the A asset

1<={ assigned_asset(X,A) : passable_asset(A) }<=1 :- reachable(X).

1<={ assigned_asset(X,A) : passable_asset(A) }<=1 :- passable(X), not reachable(X).
1<={ assigned_asset(X,A) : inaccessible_asset(A) }<=1 :- tile(X), not passable(X).
