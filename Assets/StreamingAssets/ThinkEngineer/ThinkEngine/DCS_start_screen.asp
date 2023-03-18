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

stripe(14..15).
current_stripe(15).

tile(14..15,1..10).

contains_asset(tile(14,1),-1).
contains_asset(tile(14,2),-1).
contains_asset(tile(14,3),-1).
contains_asset(tile(14,4),-1).
contains_asset(tile(14,5),-1).
contains_asset(tile(14,6),-1).
contains_asset(tile(14,7),-1).
contains_asset(tile(14,8),-1).
contains_asset(tile(14,9),-1).
contains_asset(tile(14,10),Id):-prefabName(Id,"Grass").

has_state(tile(14,10),g).
has_state(tile(14,9),j1).

has_state(tile(14,8),j2).
has_state(tile(14,9),f).

has_state(tile(14,8),f).
