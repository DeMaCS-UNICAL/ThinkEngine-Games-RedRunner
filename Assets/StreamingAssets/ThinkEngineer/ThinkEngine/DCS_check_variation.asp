% Compute the variation between stripes and then verifies that it is less than the thresholds
% 
% INPUT:
% variation(Direction,MinThreshold,MaxThreshold)
% current_stripe(StripeID)
% contains_asset(Tile,Asset)
% same_as(Asset1,Asset2)

% Identify different tiles based on `variation` atoms
different_tiles(variation(direction(DirectionStripe,DirectionTile),MinThreshold,MaxThreshold), tile(StripeID,TileID), tile(StripeID+DirectionStripe,TileID+DirectionTile)) :-
        variation(direction(DirectionStripe,DirectionTile),MinThreshold,MaxThreshold),
        current_tile(StripeID,TileID),
        contains_asset(tile(StripeID,TileID),CurrentAsset),
        contains_asset(tile(StripeID+DirectionStripe,TileID+DirectionTile),DirectionAsset),
        not same_as(CurrentAsset,DirectionAsset).

% Utility rule: count the variations for each `variation` direction
variation_to_check(DT,MinThreshold,MaxThreshold) :-
        #count{Direction, MinThreshold, MaxThreshold, Tile1, Tile2 :
                different_tiles(variation(Direction,MinThreshold,MaxThreshold),Tile1,Tile2)} = DT,
        variation(Direction,MinThreshold,MaxThreshold).

% Variation must be within the thresholds
:- variation_to_check(DT,MinThreshold,MaxThreshold), height(H), DT*100/H < MinThreshold.
:- variation_to_check(DT,MinThreshold,MaxThreshold), height(H), DT*100/H > MaxThreshold.
