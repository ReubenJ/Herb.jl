# Tests for IOExample
@testset "IOExample Tests" begin
    input_dict = Dict(:var1 => 42, :var2 => "value")
    output_value = "test output"
    io_example = IOExample(input_dict, output_value)

    @test io_example.in == input_dict
    @test io_example.out == output_value
end

# Tests for Problem
@testset "Problem Tests" begin
    # Create a vector of IOExample instances as specification
    spec = [IOExample(Dict(:var1 => 1, :var2 => 2), 3), IOExample(Dict(:var1 => 4, :var2 => 5), 6)]

    # Test constructor without a name
    problem1 = Problem(spec)
    @test problem1.name == ""
    @test problem1.spec === spec

    # Test constructor with a name
    problem_name = "Test Problem"
    problem2 = Problem(problem_name, spec)
    @test problem2.name == problem_name
    @test problem2.spec === spec
end
