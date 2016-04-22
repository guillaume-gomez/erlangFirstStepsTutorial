-module(sort).
-compile(export_all).

swap(List, IndexElem1, IndexElem2) when ((IndexElem1 > 1) and (IndexElem2 > 1)) ->
    {List2,[F|List3]} = lists:split(IndexElem1-1, List),
    LT = List2++[lists:nth(IndexElem2, List)| List3],
    {List4,[_|List5]} = lists:split(IndexElem2-1, LT),
    List4++[F|List5].

%split_loop(List, )

%split(List, First, Last, Pivot) ->
%    List2 = swap(List, Pivot, Last),

