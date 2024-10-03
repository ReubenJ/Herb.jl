using Test
using Herb
using Herb.HerbCore: HerbCore

@testset "Herb.jl" begin
   for (root, dirs, files) in walkdir(".")
      for f in files
         if f == "runtests.jl" && root != "."
            include(joinpath(root, f))
            exit()
         end
      end
   end
end