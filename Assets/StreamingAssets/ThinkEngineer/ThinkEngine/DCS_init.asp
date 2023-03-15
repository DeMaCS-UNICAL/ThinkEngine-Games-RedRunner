% Initialise the environment of the game (Knowledge Completion of the Background Knowledge)
% 
% INPUT:
% compatible(Asset1,Asset2,D)
% asset(A)
% same_as(Asset1,Asset2)
%
% OUTPUT:
% same_as(Asset1,Asset2): if Asset1 has to be considered the same as Asset2 for stripe variation

% max_tile(M) :- #max{X : tile(X)} = M.

% Opposite compatibility
compatible(Asset2,Asset1,direction(-DirectionS,-DirectionT))
    :- compatible(Asset1,Asset2,direction(DirectionS,DirectionT)).

% Reflexivity same as
same_as(Asset,Asset) :- asset(Asset).
% Simmetry same as
same_as(Asset2,Asset1) :- same_as(Asset1,Asset2).
% Transitivity same as
same_as(Asset1,Asset3) :- same_as(Asset1,Asset2), same_as(Asset2,Asset3).