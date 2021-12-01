include("module.jl")

f(x) = abs(x)
g(x) = 1.0 / (1.0 + x^2)

for i in [5, 10, 15]
    Diff.rysujNnfx(f, -1.0, 1.0, i, "zadanie6f$i")
    Diff.rysujNnfx(g, -5.0, 5.0, i, "zadanie6g$i")
end