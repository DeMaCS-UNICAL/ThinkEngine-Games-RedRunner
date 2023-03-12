% The initial screen of the game
% (for testing purposes only)
% 
% OUTPUT:
% stripe(StripeID): a Stripe is identified by the StripeID
% current_stripe(StripeID): StripeID is the current stripe (the one that needs to be generated)
% tile(StripeID,TileID): a Tile is identified by the StripeID and the TileID
% has_state(Tile,AgentState): Tile has the state AgentState
% pairs are always related to <Stripe,Tile>

stripe(2..3).
current_stripe(3).

tile(2..3,1..10).

contains_asset(tile(2,1),sky).
contains_asset(tile(2,2),sky).
contains_asset(tile(2,3),sky).
contains_asset(tile(2,4),sky).
contains_asset(tile(2,5),sky).
contains_asset(tile(2,6),sky).
contains_asset(tile(2,7),sky).
contains_asset(tile(2,8),sky).
contains_asset(tile(2,9),sky).
contains_asset(tile(2,10),dirt).

has_state(tile(2,9),g).
has_state(tile(2,9),f).

has_state(tile(2,8),j1).
has_state(tile(2,8),f).

has_state(tile(2,7),j2).
