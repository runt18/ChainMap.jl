





@doc run

@doc """
    @nonstandard(fs...)

Will create a nonstandard evaluation macro for each of the fs functions.

Each function should be a function that takes and returns expressions. The
nonstandard macro will have the same name but will take in code, not
expressions, and will evaluate the result locally when the macro is called. Will
copy over the docstrings from the standard version to the nonstandard version.

#Examples
```julia
binaryfun(a, b, c) = :(\$b(\$a, \$c))
chainback(a, b, c) = :(\$c(\$b, \$a))

@nonstandard binaryfun chainback

@test (@binaryfun 1 p 2) == 3
@test (@chainback 2 3 minus) == 1
```
""" :(@nonstandard)
