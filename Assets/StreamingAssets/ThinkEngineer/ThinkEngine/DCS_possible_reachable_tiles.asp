% Identify the tiles that could be reached in this stripe
% 
% INPUT:
% current_tile(StripeID,TileID)
% action(D,Precondition,Effect)
% has_state(Tile,AgentState)
% 
% OUTPUT:
% possible_reachable(Tile,AgentState): in the current stripe it is possible to reach Tile with state AgentState
% possible_reachable(Tile): in the current stripe it is possible to reach Tile

% Identify the tiles that can be reached with valid actions of the agent
possible_reachable(tile(StripeID,TileID),AgentState) :-
                current_tile(StripeID,TileID),
                action(direction(DirectionStripe,DirectionTile),AgentStateDirection,AgentState),
                DirectionStripe < 0,
                has_state(tile(StripeID+DirectionStripe,TileID+DirectionTile),AgentStateDirection).

% Utility rule: a projection of `possible_reachable`
possible_reachable(Tile) :- possible_reachable(Tile,AgentState).
