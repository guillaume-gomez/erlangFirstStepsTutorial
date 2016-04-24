-module(parser).
-compile(export_all).

test([]) -> [];

test([H|T]) -> 
    io:format("Number:~p~n",[H]),
    test(T).

parser([Element]) -> {num, Element - 48};

parser([Head|Tail])->
    case Head of
        40 -> {parser(Tail)};
        41 -> {vc , parser(Tail)};
        42 -> {mul, parser(Tail)};
        43 -> {plus, parser(Tail)};
        45 -> {minus, parser(Tail)};
        47 -> {divide, parser(Tail)};
        _  -> {parser(Tail),parser([Head])} 
    end.
