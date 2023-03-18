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

stripe(S):-current_stripe(S).
stripe(S-1):-current_stripe(S).
%current_stripe(15).
tile_number(1..10).
tile(S,N):-stripe(S),tile_number(N).

contains_asset(tile(S-1,1),-1):-current_stripe(S).
contains_asset(tile(S-1,2),-1):-current_stripe(S).
contains_asset(tile(S-1,3),-1):-current_stripe(S).
contains_asset(tile(S-1,4),-1):-current_stripe(S).
contains_asset(tile(S-1,5),-1):-current_stripe(S).
contains_asset(tile(S-1,6),-1):-current_stripe(S).
contains_asset(tile(S-1,7),-1):-current_stripe(S).
contains_asset(tile(S-1,8),-1):-current_stripe(S).
contains_asset(tile(S-1,9),-1):-current_stripe(S).
contains_asset(tile(S-1,10),Id):-prefabName(Id,"Grass"),current_stripe(S).

has_state(tile(S-1,9),g):-current_stripe(S).
has_state(tile(S-1,8),j1):-current_stripe(S).

has_state(tile(S-1,7),j2):-current_stripe(S).
has_state(tile(S-1,8),f):-current_stripe(S).

has_state(tile(S-1,7),f):-current_stripe(S).
