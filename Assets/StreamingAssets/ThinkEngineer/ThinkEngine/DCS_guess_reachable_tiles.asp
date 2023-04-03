% Guess the reachable Tiles in the current Stripe
% 
% INPUT:
% possible_reachable(Tile)
% 
% OUTPUT:
% reachable(Tile): Tile is a reachable tile

% Guess the `reachable` tiles among the `possible_reachable` ones
1<={ reachable(Tile) : possible_reachable(Tile) }.
