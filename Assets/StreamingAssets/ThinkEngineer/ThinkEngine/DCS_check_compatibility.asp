% Verifies the compatibility requirements for each Tile in the current Stripe
% 
% INPUT:
% current_stripe(StripeID)
% contains_asset(Tile,Asset)
% compatible(Asset1,Asset2,D)

compatible_tiles_to_check(tile(CurrentStripe,Tile),tile(CurrentStripe+DirectionStripe,Tile+DirectionTile),AssetDirection) :- current_stripe(CurrentStripe), tile(CurrentStripe,Tile), contains_asset(tile(CurrentStripe,Tile),Asset), compatible(Asset,AssetDirection,direction(DirectionStripe,DirectionTile)), DirectionStripe <= 0,DirectionTile <= 0, CurrentStripe+DirectionStripe > 0, Tile+DirectionTile > 0.

compatible_tile_checked(CurrentTile,TileDirection) :- compatible_tiles_to_check(CurrentTile,TileDirection,AssetDirection), contains_asset(TileDirection,AssetDirection).

incompatible :- compatible_tiles_to_check(CurrentTile,TileDirection,_), not compatible_tile_checked(CurrentTile,TileDirection).

:- incompatible.

