% The initial screen of the game
% (for testing purposes only)
% 
% OUTPUT:
% stripe(StripeID): a Stripe is identified by the StripeID
% current_stripe(StripeID): StripeID is the current stripe (the one that needs to be generated)
% tile(StripeID,TileID): a Tile is identified by the StripeID and the TileID
% contains_asset(Tile,Asset): Tile contains Asset
% has_state(Tile,AgentState): Tile has the state AgentState
% pairs are always related to <Stripe,Tile>

% All the stripes of the scene plus one (the one that needs to be generated)
stripe(1..15).

% We assume a height of 10
tile(S,1..10) :- stripe(S).

% A straight line of grass with just empty tiles above
tile_empty(1..14,1..9).
tile_grass(1..14,10).
contains_asset(tile(S,T),-1) :- tile_empty(S,T).
contains_asset(tile(S,T),Id) :- tile_grass(S,T), prefabName(Id,"Grass").

% We assume the agent can only go forward and starts on stripe 10
tile_action(10..14,9,g).
tile_action(11..14,8..9,f).
tile_action(11..14,8,j1).
tile_action(12..14,7,j2).
has_state(tile(S,T),A) :- tile_action(S,T,A).
