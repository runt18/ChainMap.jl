# ChainMap

[![ChainMap](http://pkg.julialang.org/badges/ChainMap_0.4.svg)](http://pkg.julialang.org/?pkg=ChainMap)
[![ChainMap](http://pkg.julialang.org/badges/ChainMap_0.5.svg)](http://pkg.julialang.org/?pkg=ChainMap)
[![Build Status](https://travis-ci.org/bramtayl/ChainMap.jl.svg?branch=master)](https://travis-ci.org/bramtayl/ChainMap.jl)
[![Coverage Status](https://coveralls.io/repos/bramtayl/ChainMap.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/bramtayl/ChainMap.jl?branch=master)
[![Build status](https://ci.appveyor.com/api/projects/status/github/bramtayl/ChainMap.jl?svg=true&branch=master)](https://ci.appveyor.com/project/bramtayl/chainmap-jl/branch/master)

This package attempts to integrate mapping and chaining.
The chaining code owes heavily to one-more-minute/Lazy.jl.
Here is a short example to illustrate the different kind of things you can do with this package.

```{julia}
readme = @l @o @c begin
  ~_
  -(1)
  ^(2, _)
  begin
    a = _ - 1
    b = _ + 1
    (a, b)
  end
  sum
end

readme([1, 2]) == [2, 4]
```

Here is a short list of exported objects and what they do. See docstrings for
more information about each function.

    Macro    Standard evaluation    Description
    ----------------------------------------------------------------------------
    @c       chain                  Chain functions
    @l       lambda                 Turn into a lambda with \_ as the input variable
    @o       over                   Broadcast expression over tildad objects
