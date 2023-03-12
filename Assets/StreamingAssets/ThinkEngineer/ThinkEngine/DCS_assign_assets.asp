% Assign an asset to each Tile in the current Stripe
% 
% INPUT:
% passable(Tile)
% has_property(A,P)
% 
% OUTPUT:
% contains_asset(Tile,Asset): Tile contains Asset

1<={ contains_asset(Tile,Asset) : has_property(Asset,passable) }<=1 :- passable(Tile).

1<={ contains_asset(tile(CurrentStripe,Tile),Asset) : asset(Asset), not has_property(Asset,passable) }<=1 :- current_stripe(CurrentStripe), tile(CurrentStripe,Tile), not passable(tile(CurrentStripe,Tile)).
