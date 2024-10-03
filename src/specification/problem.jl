"""
    struct IOExample

An input-output example.
`in` is a [`Dict`](@ref) of `{Symbol,Any}` where the symbol represents a variable in a program.
`out` can be anything.
"""
struct IOExample
    in::Dict{Symbol, Any}
    out::Any
end

"""
    struct Trace

A trace defining a wanted program execution for program synthesis. 
@TODO combine with Gen.jl
"""
struct Trace
    exec_path::Vector{Any}
end

abstract type AbstractFormalSpecification end

"""
    struct SMTSpecification <: AbstractFormalSpecification

A specification based on a logical formula defined by a SMT solver.
"""
struct SMTSpecification <: AbstractFormalSpecification
    formula::Function
end


abstract type AbstractTypeSpecification end

"""
    struct AbstractDependentTypeSpecification <: AbstractTypeSpecification

Defines a specification through dependent types. Needs a concrete type checker as oracle.
"""
abstract type AbstractDependentTypeSpecification <: AbstractTypeSpecification end

"""
    struct AgdaSpecification <: AbstractDependentTypeSpecification

Defines a specification 
"""
struct AgdaSpecification <: AbstractDependentTypeSpecification
    formula::Function
end

const AbstractSpecification = Union{Vector{IOExample}, AbstractFormalSpecification, Vector{Trace}, AbstractTypeSpecification}

"""
    struct Problem

Program synthesis problem defined by an [`AbstractSpecification`](@ref)s. Has a name and a specification of type `T`.

!!! warning
    Please care that concrete `Problem` types with different values of `T` are never subtypes of each other. 
"""
struct Problem{T <: AbstractSpecification}
    name::AbstractString
    spec::T

    function Problem(spec::T) where T <: AbstractSpecification
        new{T}("", spec)
    end
    function Problem(name::AbstractString, spec::T) where T <: AbstractSpecification
        new{T}(name, spec)
    end
end

"""
    struct MetricProblem{T <: Vector{IOExample}}

Program synthesis problem defined by an specification and a metric. The specification has to be based on input/output examples, while the function needs to return a numerical value.
"""
struct MetricProblem{T <: Vector{IOExample}}
    name::AbstractString
    cost_function::Function
    spec::T

    function MetricProblem(cost_function::Function, spec::T) where T<:Vector{IOExample}
        new{T}("", cost_function, spec)
    end

    function MetricProblem(name::AbstractString, cost_function::Function, spec::T) where T<:Vector{IOExample}
        new{T}(name, cost_function, spec)
    end

end


"""
    Base.getindex(p::Problem{Vector{IOExample}}, indices)

Overwrite `Base.getindex` to allow for slicing of input/output-based problems.
"""
Base.getindex(p::Problem{Vector{IOExample}}, indices) = Problem(p.spec[indices])
Base.getindex(p::MetricProblem{Vector{IOExample}}, indices) = Problem(p.spec[indices])


