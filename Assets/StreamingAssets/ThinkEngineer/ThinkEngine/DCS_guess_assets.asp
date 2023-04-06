% Assign an asset to each Tile in the current Stripe
% 
% INPUT:
% passable(Tile)
% has_property(A,P)
% 
% OUTPUT:
% contains_asset(Tile,Asset): Tile contains Asset

% Assign a passable Asset to each passable Tile
1<={ contains_asset(Tile,Asset) :
        has_property(Asset,passable) }<=1 :-
            passable(Tile).

% Assign a non-passable Asset to each non-passable Tile
1<={ contains_asset(Tile,Asset) :
        asset(Asset), not has_property(Asset,passable) }<=1 :-
            nonpassable(Tile).
