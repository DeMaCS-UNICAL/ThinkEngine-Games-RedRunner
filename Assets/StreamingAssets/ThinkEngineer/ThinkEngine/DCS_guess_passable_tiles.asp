% Guess the passable Tiles in the current Stripe
% 
% INPUT:
% current_stripe(StripeID)
% tile(StripeID,TileID)
% 
% OUTPUT:
% passable(Tile): Tile is a passable tile

1<={ passable(tile(CurrentStripe,Tile)) : current_stripe(CurrentStripe), tile(CurrentStripe,Tile) }.
