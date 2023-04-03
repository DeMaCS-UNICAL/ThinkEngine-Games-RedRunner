% Guess the reachable Tiles in the current Stripe
% 
% INPUT:
% possible_reachable(Tile)
% 
% OUTPUT:
% reachable(Tile): Tile is a reachable tile

% Guess the `reachable` tiles among the `possible_reachable` ones
% 1<={ reachable(Tile) : possible_reachable(Tile) }.

reachable(Tile,AgentState) :- possible_reachable(Tile,AgentState), passable(Tile).

% Update AgentState for current Stripe 
has_state(Tile,AgentState) :-
        reachable(Tile,AgentState).

% Actions in the current Stripe
has_state(tile(StripeID,TileID),AgentState) :-
        action(direction(0,DirectionTile),AgentStateDirection,AgentState),
        reachable(tile(StripeID,TileID),AgentStateDirection),
        TileID-DirectionTile > 0,
        passable(StripeID,TileID-DirectionTile).
