include("module.jl")

f(x) = exp(x)
g(x) = x^2.0 * sin(x)

for i in [5, 10, 15]
    Diff.rysujNnfx(f, 0.0, 1.0, i, "zadanie5f$i")
    Diff.rysujNnfx(g, -1.0, 1.0, i, "zadanie5g$i")
end