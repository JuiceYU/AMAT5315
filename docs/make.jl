using MyFirstPackage
using Documenter

DocMeta.setdocmeta!(MyFirstPackage, :DocTestSetup, :(using MyFirstPackage); recursive=true)

makedocs(;
    modules=[MyFirstPackage],
    authors="JuiceYU",
    sitename="MyFirstPackage.jl",
    format=Documenter.HTML(;
        canonical="https://JuiceYU.github.io/MyFirstPackage.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuiceYU/MyFirstPackage.jl",
    devbranch="main",
)
