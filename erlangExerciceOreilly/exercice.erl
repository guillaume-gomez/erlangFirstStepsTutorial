-module(exercice).
-export([sum/1, sum/2, create/1, reverse_create/1, mytool/2, side_effect/1]).

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

create(0) -> [];

create(Number) when Number > 0 -> lists:flatten([create(Number -1 ), Number ]).


reverse_create(0) -> [];

reverse_create(Number) when Number > 0 -> lists:flatten([Number, create(Number - 1)]).

%reverse_create(Number) lists:reverse(create(Number)).


%Exercice 3
side_effect(Number) ->
  N = mytool(Number, []),
  io:format("Number:~p~n",[N]).

mytool(0, Acc) -> Acc;

mytool(Number, Acc) -> mytool(Number-1, [Number|Acc]).
