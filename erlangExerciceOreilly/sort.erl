-module(sort).
-compile(export_all).

quick_sort([]) -> [];

quick_sort([Single]) -> [Single];

quick_sort([Pivot|Rest]) ->
    {Smallers, Greaters} = quick_sort(Pivot, Rest),
    SortedSmallers = quick_sort(Smallers),
    SortedGreaters = quick_sort(Greaters),
    SortedSmallers ++ [Pivot] ++ SortedGreaters.

quick_sort(Pivot, List) -> quick_sort(Pivot, [], [], List).

quick_sort(_Pivot, Smallers, Greaters, []) -> {Smallers, Greaters};
quick_sort(Pivot, Smallers, Greaters, [First|Rest]) when First < Pivot ->
    quick_sort(Pivot, [First|Smallers], Greaters, Rest);
quick_sort(Pivot, Smallers, Greaters, [First|Rest]) when First >= Pivot ->
    quick_sort(Pivot, Smallers, [First|Greaters], Rest).


merge_sort([Single]) -> [Single];

merge_sort(List) ->
    {Left, Right} = lists:split(round(length(List)/2), List),
    merge( merge_sort(Left), merge_sort(Right)).

merge([], Right) -> Right;

merge(Left, []) -> Left;

merge([HeadLeft | TailLeft], [HeadRight | TailRight]) when HeadLeft < HeadRight ->
    [ HeadLeft | merge(TailLeft, [HeadRight |TailRight] ) ];

merge([HeadLeft | TailLeft], [HeadRight | TailRight]) ->
    [ HeadRight | merge([HeadLeft |TailLeft], TailRight) ].
