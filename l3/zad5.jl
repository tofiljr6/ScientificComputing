using .solvingmethod

function f(x)
    exp(x) - 3*x
end

delta = 10^(-4)
epsilon = 10^(-4)

println(bisectionmethod(f, 0.0, 1.0, delta, epsilon))
println(bisectionmethod(f, 1.0, 2.0, delta, epsilon))

