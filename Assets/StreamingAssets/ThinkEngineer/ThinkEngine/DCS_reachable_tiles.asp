% Guess the reachable Tiles in the current Stripe
% 
% INPUT:
% possible_reachable(Tile)
% passable(Tile)
% 
% OUTPUT:
% reachable(Tile): Tile is a reachable tile

% Compute the `reachable` tiles among the passable tiles
reachable(Tile,AgentState) :- possible_reachable(Tile,AgentState), passable(Tile).

% Actions in the current Stripe
reachable(tile(StripeID,TileID-DirectionTile),AgentState) :-
        action(direction(0,DirectionTile),AgentStateDirection,AgentState),
        reachable(tile(StripeID,TileID),AgentStateDirection),
        TileID-DirectionTile > 0,
        passable(tile(StripeID,TileID-DirectionTile)).

% Update AgentState for current Stripe 
has_state(Tile,AgentState) :-
        reachable(Tile,AgentState).

% Only those with a reachable state are considered `reachable`
reachable(Tile) :- reachable(Tile,AgentState), reachable_state(AgentState).

% There must be at least one reachable Tile
at_least_one_reachable :- reachable(Tile).
:- not at_least_one_reachable.
