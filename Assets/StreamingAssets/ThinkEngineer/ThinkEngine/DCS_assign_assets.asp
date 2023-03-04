% Assign an asset to each tile
% 
% INPUT:
% tile(X): X is a tile
% max_tile(X): X is the last tile (the height of the scene)
% reachable(X): X is a reachable tile
% passable_asset(X): X is an asset where the player can transit
% inaccessible_asset(X): X is an asset where the player cannot transit
% 
% OUTPUT
% assigned_asset(X,A): tile X contains asset A

1<={ assigned_asset(X,A) : passable_asset(A) }<=1 :- passable(X).
% 1<={ assigned_asset(X,A) : passable_asset(A) }<=1 :- reachable(X).

% 1<={ assigned_asset(X,A) : passable_asset(A) }<=1 :- passable(X), not reachable(X).
1<={ assigned_asset(X,A) : inaccessible_asset(A) }<=1 :- tile(X), not passable(X).

% by default the top tile is sky and the bottom one is dirt
assigned_asset(1,sky).
assigned_asset(X,dirt) :- max_tile(X).
