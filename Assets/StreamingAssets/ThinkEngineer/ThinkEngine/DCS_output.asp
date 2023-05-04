% The query about the Assets of the Tiles of the current Stripe
% 
% INPUT:
% current_stripe(StripeID)
% contains_asset(Tile,Asset)
% 
% OUTPUT:
% current_asset(TileID,Asset): the tile TileID (of the current stripe) contains Asset

% The assets of the current stripe
% TODO check if we can avoid the first term
current_asset(StripeID,TileID,Asset) :-
        contains_asset(tile(StripeID,TileID),Asset),
        current_stripe(StripeID).
% current_asset(StripeID,TileID,Asset) ?
custom_instantiation(current_asset(X,Y,Z)) :- current_asset(X,Y,Z).
custom_instantiation(has_state(X,Y)) :- has_state(X,Y).
custom_instantiation(reachable(Tile) ) :- reachable(Tile).