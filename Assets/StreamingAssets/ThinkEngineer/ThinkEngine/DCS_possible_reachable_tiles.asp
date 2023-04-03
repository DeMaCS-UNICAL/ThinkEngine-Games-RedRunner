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

% Identify the tiles that can be reached with valid actions of the agent among the passable tiles
possible_reachable(tile(CurrentStripe,Tile),AgentState) :-
                passable(tile(CurrentStripe,Tile)),
                action(direction(DirectionStripe,DirectionTile),AgentStateDirection,AgentState),
                has_state(tile(CurrentStripe+DirectionStripe,Tile+DirectionTile),AgentStateDirection).

% Utility rule: a projection of `possible_reachable`
possible_reachable(Tile) :- possible_reachable(Tile,AgentState).
