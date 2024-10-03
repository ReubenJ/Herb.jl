module HerbSpecification

include("problem.jl")

export 
    Problem,
    MetricProblem,
    AbstractSpecification,

    IOExample,

    AbstractFormalSpecification,
    SMTSpecification,

    Trace,

    AbstractTypeSpecification,
    DependentTypeSpecification,
    AgdaSpecification

end # module HerbSpecification
