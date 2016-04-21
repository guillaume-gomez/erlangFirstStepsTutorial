-module(db).
-compile(export_all).

new() -> [].

destroy(_) -> [].

write(Key, Element, Db) -> [ {Key, Element} | Db ].

my_reverse( [Head | Tail], Acc ) -> my_reverse(Tail, [ Head | Acc]);

my_reverse( [], Acc) -> Acc.

delete( _, [], Acc) -> my_reverse(Acc, []);

delete(Key, [ Head| Tail], Acc) -> 
    case Head of
        Key -> delete(Key, Tail, Acc);
        _   -> delete(Key, Tail, [Head | Acc])
    end.

delete(Key, List) -> delete(Key, List, []).

read(_, []) -> {error, instance};

read(Key, [ Head | Tail]) -> 
    case element(1, Head) of
        Key -> {ok, element(2, Head) };
        _   -> read(Key, Tail)
    end.

match(_, []) ->[];

match(Element, List) -> match_acc(Element, List, []).

match_acc(_, [], Acc) -> my_reverse(Acc, []);

match_acc(Element, [Head | Tail], Acc) ->
    case element(2, Head) of
        Element -> match_acc(Element, Tail, [ Head | Acc]);
        _       -> match_acc(Element, Tail, Acc)
    end.