using TrainingBook
using Documenter

DocMeta.setdocmeta!(TrainingBook, :DocTestSetup, :(using TrainingBook); recursive=true)

makedocs(;
    modules=[TrainingBook],
    authors="Jonathan Miller jonathan.miller@fieldofnodes.com",
    sitename="TrainingBook.jl",
    format=Documenter.HTML(;
        canonical="https://fieldofnodes.github.io/TrainingBook.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/fieldofnodes/TrainingBook.jl",
    devbranch="main",
)
