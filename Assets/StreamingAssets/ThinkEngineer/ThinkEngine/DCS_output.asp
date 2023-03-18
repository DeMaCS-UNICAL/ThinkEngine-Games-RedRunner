% The query about the Assets of the Tiles of the current Stripe
% 
% INPUT:
% current_stripe(StripeID)
% contains_asset(Tile,Asset)
% 
% OUTPUT:
% current_asset(TileID,Asset): the tile TileID (of the current stripe) contains Asset

current_asset(StripeID,TileID,Asset) :- contains_asset(tile(StripeID,TileID),Asset), current_stripe(StripeID).
% current_asset(TileID,Asset) ?

%#show current_asset/3.