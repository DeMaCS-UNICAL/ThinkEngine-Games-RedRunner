% Compute the atoms to keep/remove in the following iterations
% 
% INPUT:
% stripe(StripeID)
% current_stripe(StripeID)
% tile(StripeID,TileID)
% reachable(Tile)
% possible_reachable(Tile,AgentState)
% 
% OUTPUT:
% Add(X): X is an atom that needs to be included in the next iteration
% Delete(X): X is an atom that needs to be removed in the next iteration
% Update(X,Y): X is an atom that needs to be updated to Y in the next iteration

% Add a new Stripe
Add(stripe(StripeID+1)) :-
        current_stripe(StripeID).
Delete(stripe(StripeID-1)) :- current_stripe(StripeID).
% Update current Stripe
% Add(current_stripe(StripeID+1)) :- current_stripe(StripeID).
% Delete(current_stripe(StripeID)) :- current_stripe(StripeID).
Update(current_stripe(StripeID),current_stripe(StripeID+1)) :-
        current_stripe(StripeID).

% Add new Tiles
Add(tile(StripeID+1,TileID)) :-
        current_tile(StripeID,TileID).
Delete(tile(StripeID-1,TileID)) :- current_tile(StripeID,TileID).


% Update Asset for all Tiles in current Stripe 
Add(contains_asset(Tile,Asset)) :-
        current_tile(Tile),
        contains_asset(Tile,Asset).
        
Delete(contains_asset(tile(StripeID-1,TileID),Asset)) :-
        current_tile(tile(StripeID,TileID)),
        contains_asset(tile(StripeID-1,TileID),Asset).

% Update AgentState for current Stripe 
Add(has_state(Tile,AgentState)) :-
        current_tile(Tile),
        has_state(Tile,AgentState).

Delete(has_state(tile(StripeID-1,TileID),AgentState)) :-
        current_tile(tile(StripeID,TileID)),
        has_state(tile(StripeID-1,TileID),AgentState).
