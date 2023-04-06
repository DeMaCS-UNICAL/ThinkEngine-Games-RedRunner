% The background knowledge (specific) of the game
% 
% OUTPUT:
% height(H): H is a height of the Scene
% asset(A): A is an Asset
% has_property(A,P): Asset A has property P
% compatible(Asset1,Asset2,D): Asset Asset1 is compatible with Asset Asset2 in Direction D
% action(D,Precondition,Effect): if in Direction D there is the AgentState Precondition, then this tile gets AgentState Effect
% variation(Direction,MinThreshold,MaxThreshold): tiles variation wrt Direction D must be at least MinThreshold and at most MaxThreshold (in percentage, 0..100)
% preference(Asset1,Asset2,D,Priority): Asset Asset1 is Priority preferred with Asset Asset2 in Direction D
% pairs are always related to <Stripe,Tile>

% Bottom tile cannot be passable
:- current_stripe(StripeID), height(TileID), contains_asset(tile(StripeID,TileID),AssetID), has_property(AssetID,passable).

% The only `passable` asset is the Empty one
has_property(AssetID,passable) :- prefabName(AssetID,"Empty").

% Define the ground tiles
has_property(AssetID,ground) :- prefabName(AssetID,"Grass").

% `ground` Tiles cannot overlap with `passable` ones
:- has_property(AssetID,passable), has_property(AssetID,ground).

% Get all the assets from the `prefabName` atoms
asset(AssetID) :- prefabName(AssetID,_).

% Utility atoms and rules to simplify the definition of `compatible` atoms
left_dir(direction(-1,0)).
above_dir(direction(0,-1)).
below_dir(direction(0,1)).

lr_n("Grass","Empty").
lr_n("Grass","Water").
lr_n("Dirt","Empty").
lr_n("Dirt","Grass").
lr_n("Dirt","Water").
lr_n("Dirt","Dept Water 1").
lr_n("NotPassable","Empty").

tb_n("Empty","Grass").
tb_n("Empty","Empty").
tb_n("Dirt","Dirt").
tb_n("Dept Water 1","Dept Water 1").
a_n("Dirt","Grass").
a_n("Dept Water 1","Water").
a_n("Water","NotPassable").
a_n("NotPassable","Empty").

% Check that we have not misplelled any name
check_prefab_name(Name1,Name2) :- lr_n(Name1,Name2).
check_prefab_name(Name1,Name2) :- tb_n(Name1,Name2).
check_prefab_name(Name1,Name2) :- a_n(Name1,Name2).
check_prefab_name(Name1) :- check_prefab_name(Name1,Name2).
check_prefab_name(Name2) :- check_prefab_name(Name1,Name2).
prefab_name(Name) :- prefabName(_,Name).
:- check_prefab_name(Name), not prefab_name(Name).

% From names to IDs
leftright(Asset1,Asset2) :-
        lr_n(Name1,Name2),
        prefabName(Asset1,Name1),
        prefabName(Asset2,Name2).

abovebelow(Asset1,Asset2) :-
        tb_n(Name1,Name2),
        prefabName(Asset1,Name1),
        prefabName(Asset2,Name2).

justabove(Asset1,Asset2) :-
        a_n(Name1,Name2),
        prefabName(Asset1,Name1),
        prefabName(Asset2,Name2).

% Each asset can stay on the left/right of itself
leftright(AssetID,AssetID) :- asset(AssetID).

% Left-Right
leftright(Asset2,Asset1) :- leftright(Asset1,Asset2).
compatible(Asset1,Asset2,Left) :-
        leftright(Asset1,Asset2),
        left_dir(Left).

% Above
justabove(Asset1,Asset2) :- abovebelow(Asset1,Asset2).
justabove(Asset2,Asset1) :- abovebelow(Asset1,Asset2).
compatible(Asset1,Asset2,Above) :-
        justabove(Asset1,Asset2),
        above_dir(Above).

% Defining all the possible actions
% g   on the ground
% j1  jump (first stipe)
% j2  jump (second stipe)
% f   falling
% A jump reaches the peak in two stripes
% Jumps and falls follow 45-degree parabolas

% if you jump vertically from the ground
action(Below,g,g1) :- below_dir(Below).
action(Below,g1,g2) :- below_dir(Below).
% if you press right while going up
action(Left,g1,j2) :- left_dir(Left).
action(Left,g2,j2) :- left_dir(Left).

% if you jump from the ground
action(Above,g,cg) :- above_dir(Above).
% check if the tile on the left has been marked
action(Left,cg,j1) :- left_dir(Left).

% if you want to jump, check if the tile above is passable
action(Above,j1,cj1) :- above_dir(Above).
% if you are jumping
action(Left,cj1,j2) :- left_dir(Left).
% if you press right while going up
action(Left,j1,j2) :- left_dir(Left).

% if you reached the peak of the jump
action(Left,j2,cj2) :- left_dir(Left).
% check if the tile above has been marked
action(Above,cj2,f) :- above_dir(Above).

% if you press right while falling
action(Left,f,cf) :- left_dir(Left).
% check if the tile above has been marked
action(Above,cf,f) :- above_dir(Above).

% if you can reach a tile, you can also reach all the ones below it (when you stop moving forward)
agent_state(g).
agent_state(j1).
agent_state(j2).
agent_state(f).
% action(direction(0,0),AgentState,f) :- agent_state(AgentState).
action(Above,AgentState,f) :- agent_state(AgentState), above_dir(Above).

% check variation wrt the same tile in the previous stripe
variation(Left,10,40) :- left_dir(Left).

% Assets preferences
preference(Grass,Grass,Left,low) :- prefabName(Grass,"Grass"), left(Left).
preference(Water,Grass,Left,low) :- prefabName(Grass,"Grass"), prefabName(Water,"Water"), left(Left).
preference(Dirt,Dirt,Left,low) :- prefabName(Dirt,"Dirt"), left(Left).

% :~ prefabName(Grass,"Grass"), contains_asset(Tile,Grass). [1@100,Tile]

% We cannot express them directly with our current abstraction
% What we are missing is:
% - a way to express (a conjunction of) multiple Preconditions
% - a way to express more 'complex' Preconditions (that are not just based on an AgentState in a specific Direction)

% if you are on the ground, a step of a stripe keeps it on the ground (if you still are above a non passable tile)
action(Left,g,gf) :- left_dir(Left).
ground_tile(Tile) :- contains_asset(Tile,AssetID), has_property(AssetID,ground).
possible_reachable(tile(StripeID,TileID),g) :-
       passable(tile(StripeID,TileID)),
       has_state(tile(StripeID,TileID),gf),
       ground_tile(tile(StripeID,TileID+1)).
% falling otherwise
possible_reachable(tile(StripeID,TileID),f) :-
       passable(tile(StripeID,TileID)),
       has_state(tile(StripeID,TileID),gf),
       passable(tile(StripeID,TileID+1)).

% if you are falling and you reach the ground, you get the ground state
% action(direction(0,0),f,g).
possible_reachable(tile(StripeID,TileID),g) :-
       current_stripe(StripeID),
       has_state(tile(StripeID,TileID),_),
       ground_tile(tile(StripeID,TileID+1)).
