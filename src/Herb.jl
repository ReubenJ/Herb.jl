module Herb

modules = [
    "core/HerbCore.jl",
    "grammar/HerbGrammar.jl",
    "constraints/HerbConstraints.jl",
    "interpret/HerbInterpret.jl",
    "search/HerbSearch.jl",
    "specification/HerbSpecification.jl",
]

for m in modules
    include(m)
end

# using HerbCore
# using HerbConstraints
# using HerbGrammar
# using HerbInterpret
# using HerbSearch
# using HerbSpecification

export 
    HerbCore,
    HerbConstraints,
    HerbGrammar,
    HerbInterpret,
    HerbSearch,
    HerbSpecification
    
end # module
