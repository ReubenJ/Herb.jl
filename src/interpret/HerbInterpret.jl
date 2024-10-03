module HerbInterpret

include("../core/HerbCore.jl")
include("../grammar/HerbGrammar.jl")
include("../specification/HerbSpecification.jl")

using .HerbCore
using .HerbGrammar
using .HerbSpecification

include("interpreter.jl")

export 
    SymbolTable,
    interpret,

    execute_on_input

end # module HerbInterpret
