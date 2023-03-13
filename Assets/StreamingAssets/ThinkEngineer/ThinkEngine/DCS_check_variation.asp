% Compute the variation between stripes and then verifies that it is less than the threashold
% 
% INPUT:
% variation(Direction,MinThreshold,MaxThreshold)
% current_stripe(StripeID)
% contains_asset(Tile,Asset)
% same_as(Asset1,Asset2)

different_tiles(variation(direction(DirectionStripe,DirectionTile),MinThreshold,MaxThreshold), tile(CurrentStripe,Tile), tile(CurrentStripe+DirectionStripe,Tile+DirectionTile)) :- variation(direction(DirectionStripe,DirectionTile),MinThreshold,MaxThreshold), current_stripe(CurrentStripe), tile(CurrentStripe,Tile), contains_asset(tile(CurrentStripe,Tile),CurrentAsset), contains_asset(tile(CurrentStripe+DirectionStripe,Tile+DirectionTile),DirectionAsset), not same_as(CurrentAsset,DirectionAsset).

variation_to_check(DT,MinThreshold,MaxThreshold) :- #count{Direction, MinThreshold, MaxThreshold, Tile1, Tile2 : different_tiles(variation(Direction,MinThreshold,MaxThreshold),Tile1,Tile2)} = DT, variation(Direction,MinThreshold,MaxThreshold).

:- variation_to_check(DT,MinThreshold,MaxThreshold), height(H), DT*100/H < MinThreshold.
:- variation_to_check(DT,MinThreshold,MaxThreshold), height(H), DT*100/H > MaxThreshold.
