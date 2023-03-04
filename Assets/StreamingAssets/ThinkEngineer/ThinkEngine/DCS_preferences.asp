% The preferences about the results
% 
% INPUT:
% unwanted(X,Y): X is an unwanted value
%       Y=low lowest level
%       Y=medium medium level
%       Y=high high level

unwanted_level(low, 10).
unwanted_level(medium, 20).
unwanted_level(high, 30).

:~ unwanted(W,UL), unwanted_level(UL, L). [W@L]
