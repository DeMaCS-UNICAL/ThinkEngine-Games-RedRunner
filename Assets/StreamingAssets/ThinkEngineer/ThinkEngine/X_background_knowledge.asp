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

height(10).

asset(sky).
asset(dirt).
has_property(sky,passable).

compatible(dirt,dirt,direction(-1,0)). % i.e., dirt is compatible with dirt on the left
compatible(dirt,dirt,direction(0,-1)). % i.e., dirt is compatible with dirt above
compatible(dirt,sky,direction(0,-1)). % i.e., dirt is compatible with sky above
compatible(sky,sky,direction(-1,0)). % i.e., sky is compatible with sky on the left
compatible(sky,sky,direction(0,1)). % i.e., sky is compatible with sky below
compatible(dirt,sky,direction(-1,0)). % i.e., dirt is compatible with dirt on the left

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

% if on the ground
action(direction(-1,0),g,g). % i.e., if the agent is on the ground, a step of a stripe keeps it on the ground

% if in j1
action(direction(-1,1),j1,j2).
action(direction(-1,0),j1,j2).
% TODO possible_reachable(X-1,j2) :- prev_reachable(X,j1), passable(X-1).

% if in j2
action(direction(-1,-1),j2,f).
% TODO possible_reachable(X,f) :- prev_reachable(X,j2), not passable(X+1), passable(X).

% if in f
action(direction(-1,-1),f,f).
% TODO possible_reachable(X,f) :- prev_reachable(X,f), not passable(X+1), passable(X).

% if you can reach a tile, you can also reach all the ones below it (up to a non passable one)
action(direction(0,-1),AgentState,f) :- agent_state(AgentState).

% check variation wrt the same tile in the previous stripe
variation(direction(-1,0),10,40).

% create a climb
preference(dirt,dirt,direction(-1,1),low).
