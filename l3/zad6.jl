using .solvingmethod

function f1(x)
    exp(1-x) - 1
end

function pf1(x)
    -exp(1-x)
end

function f2(x)
    x*exp(-x)
end

function pf2(x)
    -exp(-x)*(x-1)
end

delta = 10^(-5)
epsilon = 10^(-5)

println(bisectionmethod(f1, 0.5, 2.0, delta, epsilon))
println(bisectionmethod(f2, -1.5, 0.5, delta, epsilon))

println(newton(f1, pf1, 0.0, delta, epsilon, 100))
println(newton(f2, pf2, -1.0, delta, epsilon, 100))

println(secantmethod(f1, 0.5, 2.0, delta, epsilon, 100))
println(secantmethod(f2, -1.5, 0.5, delta, epsilon, 100))

println(newton(f1, pf1, 100.0, delta, epsilon, 100))
println(newton(f1, pf1, 1000.0, delta, epsilon, 100))
println(newton(f1, pf1, 10000.0, delta, epsilon, 100))


println(newton(f2, pf2, 100.0, delta, epsilon, 100))
println(newton(f2, pf2, 1.0, delta, epsilon, 100))
println(newton(f2, pf2, 10000.0, delta, epsilon, 100))
