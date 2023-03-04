% Verifies the mandatory requirements for the new tiles
% 
% INPUT:
% TO BE DEFINED
% TEMPORARY NAMES USED

% only empty assets can be directly above assets that cannot have anything on top
topped(X) :- assigned_asset(X,A), assigned_asset(X-1,B), not isEmpty(B).
:- assigned_asset(X,A), cannotBeTopped(A), topped(X).

% respect the nearby requirements
invalid_tile(X) :- assigned_asset(X,A), assigned_asset(X+1,B), incompatible_assets(tb,A,B).
invalid_tile(X) :- prev_assigned_asset(X,A), assigned_asset(X,B), incompatible_assets(lr,A,B).
:- invalid_tile(X).
