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

prefabName(-1,"-1").

leftright("Grass","-1").
leftright("Grass","Water").
leftright("Dirt","-1").
leftright("Dirt","Water").
leftright("Dirt","Dept Water 1").
leftright(AssetID,AssetID) :- asset(AssetID).
leftright(Name2,Name1) :- leftright(Name1,Name2).
compatible(Asset1,Asset2,Left) :-
                        leftright(Name1,Name2), left(Left),
                        prefabName(Asset1,Name1), prefabName(Asset2,Name2).

abovebelow("-1","Grass").
abovebelow("-1","-1").
abovebelow("Dirt","Dirt").
abovebelow("Dept Water 1","Dept Water 1").
justabove("-1","Dirt").
justabove("Dirt","Grass").
justabove("Dept Water 1","Water").
justabove("Water","-1").
justabove(Name1,Name2) :- abovebelow(Name1,Name2).
justabove(Name2,Name1) :- abovebelow(Name1,Name2).
compatible(Asset1,Asset2,Above) :-
                        justabove(Name1,Name2), above(Above),
                        prefabName(Asset1,Name1), prefabName(Asset2,Name2).

preference(Dirt,Dirt,Left,low) :- prefabName(Dirt,"Dirt"), left(Left).
preference(DeptWater,DeptWater,Left,low) :- prefabName(DeptWater,"Dept Water 1"), left(Left).
preference(Water,Water,Left,low) :- prefabName(Water,"Water"), left(Left).
