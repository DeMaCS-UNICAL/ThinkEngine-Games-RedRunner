height(10).

asset(-1).
has_property(-1,passable).

prefabName(22530,"Grass").
prefabName(22534,"Dirt").
prefabName(22540,"Dept Water 1").
prefabName(22544,"Water").

asset(AssetID) :- prefabName(AssetID,_).

left(direction(-1,0)).
above(direction(0,-1)).

compatible(AssetID,AssetID,Left) :- asset(AssetID), left(Left).

compatible(-1,-1,Above) :- above(Above).
compatible(-1,Grass,Above) :- prefabName(Grass,"Grass"), above(Above).
compatible(-1,Dirt,Above) :- prefabName(Dirt,"Dirt"), above(Above).
% compatible(-1,-1,Left) :- left(Left).

compatible(Grass,-1,Above) :- prefabName(Grass,"Grass"), above(Above).
compatible(Grass,-1,Left) :- prefabName(Grass,"Grass"), left(Left).
% compatible(Grass,Grass,Left) :- prefabName(Grass,"Grass"), left(Left).
compatible(Grass,Water,Left) :- prefabName(Grass,"Grass"), prefabName(Water,"Water"), left(Left).

compatible(Dirt,Grass,Above) :- prefabName(Dirt,"Dirt"), prefabName(Grass,"Grass"), above(Above).
compatible(Dirt,Dirt,Above) :- prefabName(Dirt,"Dirt"), above(Above).
compatible(Dirt,-1,Left) :- prefabName(Dirt,"Dirt"), left(Left).
% compatible(Dirt,Dirt,Left) :- prefabName(Dirt,"Dirt"), left(Left).
compatible(Dirt,DeptWater,Left) :- prefabName(Dirt,"Dirt"), prefabName(DeptWater,"Dept Water 1"), left(Left).
compatible(Dirt,Water,Left) :- prefabName(Dirt,"Dirt"), prefabName(Water,"Water"), left(Left).

compatible(DeptWater,Water,Above) :- prefabName(DeptWater,"Dept Water 1"), prefabName(Water,"Water"), above(Above).
compatible(DeptWater,DeptWater,Above) :- prefabName(DeptWater,"Dept Water 1"), above(Above).
% compatible(DeptWater,DeptWater,Left) :- prefabName(DeptWater,"Dept Water 1"), left(Left).
compatible(DeptWater,Dirt,Left) :- prefabName(DeptWater,"Dept Water 1"), prefabName(Dirt,"Dirt"), left(Left).

compatible(Water,-1,Above) :- prefabName(Water,"Water"), above(Above).
% compatible(Water,Water,Left) :- prefabName(Water,"Water"), left(Left).
compatible(Water,Grass,Left) :- prefabName(Water,"Water"), prefabName(Grass,"Grass"), left(Left).

preference(Dirt,Dirt,Left,low) :- prefabName(Dirt,"Dirt"), left(Left).
preference(DeptWater,DeptWater,Left,low) :- prefabName(DeptWater,"Dept Water 1"), left(Left).
preference(Water,Water,Left,low) :- prefabName(Water,"Water"), left(Left).
