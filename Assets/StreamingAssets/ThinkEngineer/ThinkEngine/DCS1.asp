instantiatePrefab(0,0,0,0,0,0,0,0).
count:-count(X).
Add(count(0)):- not count.
Update(count(X),count(X+1)):-count(X).