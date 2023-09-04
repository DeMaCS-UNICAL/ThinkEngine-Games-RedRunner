% Assign a collectable to each Collectable Tile in the current Stripe
% 
% INPUT:
% collectable_position(Tile)
% collectable(Collectable)
% 
% OUTPUT:
% contains_collectable(Tile,Collectable): Tile contains Collectable

% Assign collectables to Tiles
0<={ contains_collectable(Tile,Collectable) :
        collectable(Collectable) }<=1 :-
            collectable_position(Tile).
