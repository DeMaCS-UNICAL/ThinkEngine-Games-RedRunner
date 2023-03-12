% Compute the variation between stripes and then verifies that it is less than the threashold
% 
% INPUT:
% TBC
% 
% OUTPUT:
% TBC

different_tiles(variation(direction(DirectionStripe,DirectionTile),Threshold), tile(CurrentStripe,Tile), tile(CurrentStripe+DirectionStripe,Tile+DirectionTile)) :- variation(direction(DirectionStripe,DirectionTile),Threshold), current_stripe(CurrentStripe), tile(CurrentStripe,Tile), contains_asset(tile(CurrentStripe,Tile),CurrentAsset), contains_asset(tile(CurrentStripe+DirectionStripe,Tile+DirectionTile),DirectionAsset), not same_as(CurrentAsset,DirectionAsset).

:- #count{Direction, Threshold, Tile1, Tile2 : different_tiles(variation(Direction,Threshold),Tile1,Tile2)} = DT, variation(Direction,Threshold), height(H), DT*100/H > Threshold.
