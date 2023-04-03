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
:- current_tile(StripeID,TileID), height(TileID), contains_asset(tile(StripeID,TileID),AssetID), has_property(AssetID,passable).

% The only `passable` asset is the Empty one
has_property(AssetID,passable) :- prefabName(AssetID,"Empty").

% Get all the assets from the `prefabName` atoms
asset(AssetID) :- prefabName(AssetID,_).

% Utility atoms and rules to simplify the definition of `compatible` atoms
left_dir(direction(-1,0)).
above_dir(direction(0,-1)).    

lr_n("Grass","Empty").
% lr_n("Grass","Water").
% lr_n("Dirt","Empty").
% lr_n("Dirt","Water").
% lr_n("Dirt","Dept Water 1").

tb_n("Empty","Grass").
tb_n("Empty","Empty").
% tb_n("Dirt","Dirt").
% tb_n("Dept Water 1","Dept Water 1").
% % a_n("Empty","Dirt").
% a_n("Dirt","Grass").
% a_n("Dept Water 1","Water").
% a_n("Water","NotPassable").

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

agent_state(g).
agent_state(j1).
agent_state(j2).
agent_state(f).

% if you jump from the ground
action(direction(-1,1),g,j1).

% if you are jumping
action(direction(-1,1),j1,j2).
% if you press right while going up
action(direction(-1,0),j1,j2).

% if you reached the peak of the jump
action(direction(-1,-1),j2,f).

% if you press right while falling
action(direction(-1,-1),f,f).

% if you can reach a tile, you can also reach all the ones below it (when you stop moving forward)
action(direction(0,0),AgentState,f) :- agent_state(AgentState).
action(direction(0,-1),AgentState,f) :- agent_state(AgentState).

% check variation wrt the same tile in the previous stripe
variation(direction(-1,0),10,40).

% Assets preferences
% preference(Dirt,Dirt,Left,low) :- prefabName(Dirt,"Dirt"), left(Left).
% preference(DeptWater,DeptWater,Left,low) :- prefabName(DeptWater,"Dept Water 1"), left(Left).
% preference(Water,Water,Left,low) :- prefabName(Water,"Water"), left(Left).


% We cannot express them directly with our current abstraction

% if you are on the ground, a step of a stripe keeps it on the ground (if you still are above a non passable tile)
action(direction(-1,0),g,gf).
has_state(tile(StripeID,TileID),g) :-
       passable(tile(StripeID,TileID)),
       has_state(tile(StripeID-1,TileID),g),
       nonpassable(tile(StripeID,TileID+1)).
% falling otherwise
has_state(tile(StripeID,TileID),f) :-
       passable(tile(StripeID,TileID)),
       has_state(tile(StripeID-1,TileID),g),
       passable(tile(StripeID,TileID+1)).

% if you are falling and you reach the ground, you get the ground state
% action(direction(0,0),f,g).
has_state(tile(StripeID,TileID),g) :-
       current_stripe(StripeID),
       has_state(tile(StripeID,TileID),f),
       nonpassable(tile(StripeID,TileID+1)).
