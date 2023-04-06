% Verify that we have a single value for the constants of the game
% 
% INPUT:
% current_stripe(StripeID)
% height(Height)

% Utility facts
unique_value(current_stripe, X) :- current_stripe(X).
unique_value(height, X) :- height(X).

% There must be a single value
:- unique_value(Predicate,X1), unique_value(Predicate,X2), X1 != X2.
