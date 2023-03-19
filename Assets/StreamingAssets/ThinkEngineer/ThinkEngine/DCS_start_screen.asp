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

stripe(S) :- current_stripe(S).
prev_stripe(S-1) :- current_stripe(S).
stripe(S) :- prev_stripe(S).
tile(S,1..10) :- stripe(S).

contains_asset(tile(S,T),-1) :- prev_stripe(S), tile(S,T), T<10.
contains_asset(tile(S,10),Id) :- prefabName(Id,"Grass"), prev_stripe(S).

has_state(tile(S-1,9),g):-current_stripe(S).
has_state(tile(S-1,8),j1):-current_stripe(S).

%has_state(tile(S-1,7),j2):-current_stripe(S).
has_state(tile(S-1,8),f):-current_stripe(S).

has_state(tile(S-1,7),f):-current_stripe(S).
