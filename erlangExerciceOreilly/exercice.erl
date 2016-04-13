-module(exercice).
-export([sum/1, sum/2, create/1, reverse_create/1, reverse_create2/1, create2/2]).

%Exercice 1
sum(0) -> 0;

sum(Number) when Number > 0 -> 
  sum(Number - 1) + Number.


sum(0, Number) -> sum(Number);

sum(_, 0) -> 0;

sum(Min, Min) -> Min;

sum(Min, Max) when Max > Min ->
  sum(Min, Max - 1) + Max.


%Exercice 2

% With `Lists module`
create(0) -> [];

create(Number) when Number > 0 -> lists:flatten([create(Number -1 ), Number ]).

reverse_create(0) -> [];

reverse_create(Number) when Number > 0 -> lists:flatten([Number, create(Number - 1)]).

%reverse_create(Number) lists:reverse(create(Number)).

% with tool function

reverse_create2(0) -> [];

reverse_create2(Number) when Number > 0 ->
  [Number | reverse_create2(Number - 1)].

create2(0, Acc) ->
  Acc;

create2(Number, Acc) ->
  create2(Number-1, [Number| Acc]).

%Exercice 3