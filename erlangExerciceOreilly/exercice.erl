-module(exercice).
-compile(export_all).

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

%Exercice 5

%1
filter(Arr, N) ->
  filter(Arr, [], N).

filter([], Acc, _) ->
  lists:reverse(Acc);

filter([H | T ], Acc, N) when H =< N ->
  filter(T, [H | Acc], N);

filter([_ | T ], Acc, N) ->
  filter(T, Acc, N).

%2
reverse(Acc) -> reverse(Acc, []).

reverse([], Acc) -> Acc;

reverse([H | T], Acc) -> reverse(T, [ H | Acc ] ).

%3
concatenate_acc([], Acc) -> exercice:reverse(Acc);

concatenate_acc([H | T] , Acc) -> 
  case H of
    [] -> concatenate_acc(T, Acc);
    _  -> concatenate_acc(T, [H | Acc])
  end.  

concatenate(List) -> concatenate_acc(List, []).

%4
flatten( [] ) -> [];

flatten( [H | T] ) ->
  case H of
    [Head|_] -> flatten(Head);
    _ -> [concatenate(H), flatten(T)]
  end.

  


