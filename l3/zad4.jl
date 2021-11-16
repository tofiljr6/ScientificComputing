using .solvingmethod

function f(x)
    sin(x) - (1/4) * x^2
end

function pf(x)
    cos(x) - (1/2) * x
end

delta = (1/2) * 10^(-5)
epsilon = (1/2) * 10^(-5)

println(bisectionmethod(f, 1.5, 2.0, delta, epsilon))
println(newton(f, pf, 1.5, delta, epsilon, 100))
println(secantmethod(f, 1.0, 2.0, delta, epsilon, 100))