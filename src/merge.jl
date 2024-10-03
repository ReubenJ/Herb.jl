using Pkg

Pkg.activate(temp=true)
Pkg.add("Git")

using Git

repos = [
    "HerbConstraints",
    "HerbCore",
    "HerbGrammar",
    "HerbInterpret",
    "HerbSearch",
    "HerbSpecification"
]

herb_repos_dir = mktempdir()

for repo in repos
    url = "git@github.com:Herb-AI/$repo.jl.git"
    path = joinpath(herb_repos_dir, repo)
    run(git(["clone", url, path]))
end

for repo in repos
    src_path = joinpath(herb_repos_dir, repo, "src")
    new_dest_path = joinpath("src", lowercase(repo[5:end]))
    cp(src_path, new_dest_path, force=true)
end

for repo in repos
    test_path = joinpath(herb_repos_dir, repo, "test")
    new_dest_path = joinpath("test", lowercase(repo[5:end]))
    cp(test_path, new_dest_path)
end
