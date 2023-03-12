% Identify the tiles that could be reached in this stripe
% 
% INPUT:
% current_stripe(StripeID)
% tile(StripeID,TileID)
% action(D,Precondition,Effect)
% has_state(Tile,AgentState)
% 
% OUTPUT:
% possible_reachable(Tile,AgentState): in the current stripe it is possible to reach Tile with state AgentState
% possible_reachable(Tile): in the current stripe it is possible to reach Tile

possible_reachable(tile(CurrentStripe,Tile),AgentState) :-
                current_stripe(CurrentStripe), tile(CurrentStripe,Tile),
                action(direction(DirectionStripe,DirectionTile),AgentStateDirection,AgentState),
                has_state(tile(CurrentStripe+DirectionStripe,Tile+DirectionTile),AgentStateDirection).

possible_reachable(Tile) :- possible_reachable(Tile,AgentState).
