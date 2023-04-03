% Guess the passable Tiles in the current Stripe
% 
% INPUT:
% current_stripe(StripeID)
% tile(StripeID,TileID)
% 
% OUTPUT:
% passable(Tile): Tile is a passable tile

% Guess the passable tiles among the ones in the current stripe
1<={ passable(tile(StripeID,TileID)) : current_tile(StripeID,TileID) }.
