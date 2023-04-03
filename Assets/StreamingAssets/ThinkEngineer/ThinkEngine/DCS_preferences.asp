% The preferences about the results
% 
% INPUT:
% unwanted(X,Y): X is an unwanted value
%       Y=low lowest level
%       Y=medium medium level
%       Y=high high level

% Utility atoms to facilitate preference definition
unwanted_level(low, 10).
unwanted_level(medium, 20).
unwanted_level(high, 30).

% Compute weight and priority for preferences
unwanted(-W,Priority) :- unwanted_level(Priority, _), #count{Asset1,Asset2,DirectionStripe,DirectionTile,Priority,CurrentStripe,Tile : preference(Asset1,Asset2,direction(DirectionStripe,DirectionTile),Priority), current_stripe(CurrentStripe), tile(CurrentStripe,Tile), contains_asset(tile(CurrentStripe,Tile),Asset1), contains_asset(tile(CurrentStripe+DirectionStripe,Tile+DirectionTile),Asset2) } = W.

% Minimise unwanted arrangements
:~ unwanted(W,UL), unwanted_level(UL, L). [W@L]
