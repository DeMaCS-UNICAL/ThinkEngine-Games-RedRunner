% Guess the positions (Tiles) of collectables in the current Stripe
% 
% INPUT:
% reachable(Tile)
% 
% OUTPUT:
% collectable_position(Tile): Tile contains a Collectable

% Assign collectables to Tiles
0<={ collectable_position(Tile) }<=1 :-
            reachable(Tile).

% TODO preferences on collectables distribution (per Tiles and Stripes)
