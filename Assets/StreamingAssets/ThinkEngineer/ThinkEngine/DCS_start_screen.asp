% The initial screen of the game
% (for testing purposes only)
% 
% OUTPUT:
% stripe(StripeID): a Stripe is identified by the StripeID
% tile(StripeID,TileID): a Tile is identified by the StripeID and the TileID
% contains_asset(Tile,Asset): Tile contains Asset
% has_state(Tile,AgentState): Tile has the state AgentState
% pairs are always related to <Stripe,Tile>

% All the stripes of the scene plus one (the one that needs to be generated)
stripe(1..15).

% The tiles
% tile(S,T) :- stripe(S), height(H), &int(1,H;T).
tile(S,1..9) :- stripe(S).

% A straight line of grass with just empty tiles above
% tile_grass(1..14,H) :- height(H).
% tile_empty(S,T) :- tile(S,T), not tile_grass(S,T).
tile_empty(1..14,1..8).
tile_grass(1..14,9).
contains_asset(tile(S,T),-1) :- tile_empty(S,T).
contains_asset(tile(S,T),Id) :- tile_grass(S,T), prefabName(Id,"Grass").

% We assume the agent can only go forward and starts on stripe 10
% tile_action(10..14,H-1,g) :- height(H).
tile_action(10..14,8,g) :- height(H).
tile_action(10..14,7,cg).
tile_action(11..14,7..8,f).
tile_action(11..14,7,j1).
tile_action(12..14,6,j2).
has_state(tile(S,T),A) :- tile_action(S,T,A).

% current_stripe(15).
