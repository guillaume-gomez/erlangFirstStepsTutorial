-module(sort).
-compile(export_all).

swap(List, indexElem1, indexElem2) when ((indexElem1 > 1) and (indexElem2 > 1)) ->
    {List2,[F|List3]} = lists:split(indexElem1-1, List),
    LT = List2++[lists:nth(indexElem2, List)| List3],
    {List4,[_|List5]} = lists:split(indexElem2-1, LT),
    List4++[F|List5].

%split_loop(List, )

%split(List, First, Last, Pivot) ->
%    List2 = swap(List, Pivot, Last),
