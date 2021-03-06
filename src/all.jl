export chain_map
"""
    @chain_map(e, associative = \_)

The `@chain_map` macro combines three different macros.

[`with`](@ref) annotates each symbol with `associative`. [`chain`](@ref) chains together
expressions wrapped in a `begin` block. [`@broadcast`](@ref) does broadcasting
of woven expressions.

If a problem is encountered using one of the three macros (i.e. it isn't applicaple) that
macro is ignored.

# Examples
```julia
e = quote
    :b
    sum
    string
    *(~a, " ", _, " ", ~:c)
end

a = ["one", "two"]
result = @chain begin
    Dict(:b => [1, 2], :c => ["I", "II"])
    @chain_map begin
        :b
        sum
        string
        *(~a, " ", _, " ", ~:c)
    end
end

@test result == ["one 3 I", "two 3 II"]

@test 1 == @chain_map 1
```
"""
function chain_map(e, associative = :_)
    try
        e = chain(e)
    end
    try
        e = with(e, associative)
    end
    try
        e = unweave(:broadcast, e)
    end
    e
end

@nonstandard chain_map
export @chain_map
