% Compute the variation between the current stripe and the previous one and then verifies that it is less than the threashold
% 
% INPUT:
% prev_assigned_asset(X,A): tile X (in the previous stripe) contains asset A
% assigned_asset(X,A): tile X contains asset A
% compatible(A,B): if asset A is compatible with asset B
% variation_threshold(X): the maximum variation allowed (a value in [0,100])
% max_tile(X): X is the last tile (the height of the scene)
% 
% OUTPUT
% different_tiles(X): tile X is not compatible with the one in the previous stripe 

different_tiles(X) :- prev_assigned_asset(X,A), assigned_asset(X,B), not compatible(A,B).

:- #count{X : different_tiles(X)} = DT, variation_threshold(VT), max_tile(MT), DT*100/MT > VT.
