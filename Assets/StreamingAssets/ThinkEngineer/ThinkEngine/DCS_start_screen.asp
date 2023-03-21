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
stripe(1..15).
%prev_stripe(S-1) :- current_stripe(S).

tile(S,1..10) :- stripe(S).

tile_empty(1..14,1..9).
tile_grass(1..14,10).
contains_asset(tile(S,T),-1):-tile_empty(S,T).
contains_asset(tile(S,T),Id):-tile_grass(S,T), prefabName(Id,"Grass").


tile_action(1..14,9,g).
tile_action(1..14,8..9,f).
tile_action(1..14,8,j1).
tile_action(1..14,7,j2).
has_state(tile(S,T),A):-tile_action(S,T,A).
