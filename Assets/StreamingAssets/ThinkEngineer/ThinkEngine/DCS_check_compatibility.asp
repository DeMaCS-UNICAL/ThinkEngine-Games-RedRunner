% Verifies the compatibility requirements for each Tile in the current Stripe
% 
% INPUT:
% current_stripe(StripeID)
% contains_asset(Tile,Asset)
% compatible(Asset1,Asset2,D)

% Identify the compatible tiles that need to be checked 
compatible_tiles_to_check(tile(StripeID,TileID),tile(StripeID+DirectionStripe,TileID+DirectionTile),AssetDirection) :-
        current_tile(StripeID,TileID),
        contains_asset(tile(StripeID,TileID),Asset),
        compatible(Asset,AssetDirection,direction(DirectionStripe,DirectionTile)),
        DirectionStripe <= 0,DirectionTile <= 0,
        StripeID+DirectionStripe > 0,
        TileID+DirectionTile > 0.

% Define the valid tiles among the checked ones
valid_compatible_tile(CurrentTile,TileDirection) :-
        compatible_tiles_to_check(CurrentTile,TileDirection,AssetDirection),
        contains_asset(TileDirection,AssetDirection).

% Utility rule: incompatible if it is a compatible to check but it is not valid
incompatible :-
        compatible_tiles_to_check(CurrentTile,TileDirection,_),
        not valid_compatible_tile(CurrentTile,TileDirection).

% All tiles must be compatible
:- incompatible.
