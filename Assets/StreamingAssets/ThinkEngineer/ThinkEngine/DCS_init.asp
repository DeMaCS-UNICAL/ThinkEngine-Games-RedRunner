% Initialise the environment of the game (Knowledge Completion of the Background Knowledge)
% 
% INPUT:
% compatible(Asset1,Asset2,D)
% asset(A)
% same_as(Asset1,Asset2)
%
% OUTPUT:
% same_as(Asset1,Asset2): if Asset1 has to be considered the same as Asset2 for stripe variation

% Opposite compatibility
compatible(Asset2,Asset1,direction(-DirectionS,-DirectionT))
    :- compatible(Asset1,Asset2,direction(DirectionS,DirectionT)).

% Reflexivity `same_as`
same_as(Asset,Asset) :- asset(Asset).
% Symmetry `same_as`
same_as(Asset2,Asset1) :- same_as(Asset1,Asset2).
% Transitivity `same_as`
same_as(Asset1,Asset3) :- same_as(Asset1,Asset2), same_as(Asset2,Asset3).

% Utility atom: the Tiles of the current Stripe
current_tile(StripeID,TileID) :- current_stripe(StripeID), tile(StripeID,TileID).
