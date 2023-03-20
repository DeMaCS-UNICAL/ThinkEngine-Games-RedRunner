prefabName(-1,"Empty").
has_property(-1,passable).
leftright("Empty","Empty").
abovevelow("Empty","Empty").
prefabName(22538,"Grass").
justabove("Empty","Grass").
leftright("Grass","Empty").
leftright("Grass","Grass").
leftright("Grass","Water").
prefabName(22542,"Dirt").
justabove("Empty","Dirt").
leftright("Dirt","Empty").
abovebelow("Dirt","Dirt").
justabove("Dirt","Grass").
leftright("Dirt","Dept Water 1").
leftright("Dirt","Dirt").
leftright("Dirt","Water").
preference(22542,22542,direction(-1,0),low).
prefabName(22546,"Dept Water 1").
abovebelow("Dept Water 1","Dept Water 1").
justabove("Dept Water 1","Water").
leftright("Dept Water 1","Dept Water 1").
leftright("Dept Water 1","Dirt").
preference(22546,22546,direction(-1,0),low).
prefabName(22550,"Water").
leftright("Water","Water").
leftright("Water","Grass").
preference(22550,22550,direction(-1,0),low).

height(10).

