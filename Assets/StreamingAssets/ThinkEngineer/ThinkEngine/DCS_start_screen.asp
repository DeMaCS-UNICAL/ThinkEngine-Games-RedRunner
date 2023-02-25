% The initial screen of the game
% 
% OUTPUT
% tile(X): X is a tile
% max_tile(X): X is the last tile (the height of the scene)
% prev_reachable(X,Y): X is a reachable tile (in the previous stripe)
%       Y=g reached staying on the ground
%       Y=j1 reached with a jump (first stipe)
%       Y=j2 reached with a jump (second stipe)
%       Y=f reached falling
% passable_asset(X): X is an asset where the player can transit
% inaccessible_asset(X): X is an asset where the player cannot transit

tile(1..10).

max_tile(M) :- #max{X : tile(X)} = M.

prev_reachable(9,g).
prev_reachable(9,f).

prev_reachable(8,j1).
prev_reachable(8,f).

prev_reachable(7,j2).

passable_asset(sky).

inaccessible_asset(dirt).
