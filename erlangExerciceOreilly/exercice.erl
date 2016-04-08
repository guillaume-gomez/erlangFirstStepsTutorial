-module(exercice).
-export([sum/1, sum/2]).

%Exercice 1
sum(0) -> 0;

sum(Number) when Number > 0 -> 
  sum(Number - 1) + Number.


sum(0, Number) -> sum(Number);

sum(_, 0) -> 0;

sum(Min, Min) -> Min;

sum(Min, Max) when Max > Min ->
  sum(Min, Max - 1) + Max.


