using .HerbCore
using .HerbGrammar
using Test

@testset "HerbGrammar.jl" verbose=true begin
    include("test_csg.jl")
    include("test_rulenode_operators.jl")
    include("test_rulenode2expr.jl")
end
