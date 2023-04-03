% Guess the reachable Tiles in the current Stripe
% 
% INPUT:
% possible_reachable(Tile)
% passable(Tile)
% 
% OUTPUT:
% reachable(Tile): Tile is a reachable tile

% Compute the `reachable` tiles
reachable(Tile,AgentState) :- possible_reachable(Tile,AgentState), passable(Tile).

% Update AgentState for current Stripe 
has_state(Tile,AgentState) :-
        reachable(Tile,AgentState).

% Actions in the current Stripe
has_state(tile(StripeID,TileID-DirectionTile),AgentState) :-
        action(direction(0,DirectionTile),AgentStateDirection,AgentState),
        reachable(tile(StripeID,TileID),AgentStateDirection),
        TileID-DirectionTile > 0,
        passable(tile(StripeID,TileID-DirectionTile)).

% Utility rule: a projection of `reachable`
reachable(Tile) :- reachable(Tile,AgentState).
