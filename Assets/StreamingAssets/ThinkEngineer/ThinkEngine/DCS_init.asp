% Initialise the environment of the game (Knowledge Completion of the Background Knowledge)
% 
% INPUT:
% compatible(Asset1,Asset2,Direction)
% asset(A)
% same_as(Asset1,Asset2)
% current_stripe(StripeID)
% tile(StripeID,TileID)
%
% OUTPUT:
% compatible(Asset1,Asset2,Direction): Asset Asset1 is compatible with Asset Asset2 in Direction D
% same_as(Asset1,Asset2): if Asset1 has to be considered the same as Asset2 for stripe variation
% current_tile(StripeID,TileID): the Tiles of the current Stripe (identified by their StripeID and TileID)

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
current_tile(StripeID,TileID) :-
        current_stripe(StripeID),
        tile(StripeID,TileID).
