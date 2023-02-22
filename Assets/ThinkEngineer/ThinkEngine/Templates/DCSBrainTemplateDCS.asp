%For runtime instantiated GameObject, only the prefab mapping is provided. Use that one substituting the gameobject name accordingly.
 %Sensors.
% Facts assiociated with instantiable DCS Prefab
% prefabName(Index,Name).
isDangerous(Index,Bool).
isWalkable(Index,Bool).
isObstacle(Index,Bool).
canFloat(Index,Bool).
isStackable(Index,Bool).
minDistanceFromGround(Index,Int).
neededSpaceUp(Index,Int).
neededSpaceDown(Index,Int).
neededSpaceLeft(Index,Int).
neededSpaceRight(Index,Int).
% Predicates for Prefab instantiation. PrefabListIndex is the index
% instantiatePrefab(PrefabListIndex,X,Y,Z).
