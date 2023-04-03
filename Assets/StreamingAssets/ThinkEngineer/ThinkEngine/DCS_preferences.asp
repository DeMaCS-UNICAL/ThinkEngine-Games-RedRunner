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
unwanted(-W,Priority) :-
        unwanted_level(Priority, _),
        #count{Asset1,Asset2,DirectionStripe,DirectionTile,Priority,StripeID,TileID :
                preference(Asset1,Asset2,direction(DirectionStripe,DirectionTile),Priority),
                current_tile(StripeID,TileID),
                contains_asset(tile(StripeID,TileID),Asset1),
                contains_asset(tile(StripeID+DirectionStripe,TileID+DirectionTile),Asset2) } = W.

% Minimise unwanted arrangements
:~ unwanted(W,UL), unwanted_level(UL, L). [W@L]
