function d(fun, x0, h)
    return (fun(x0+h)-fun(x0))/h
end

function f(x)
    return sin(x) + cos(3*x)
end

function fp(x)
    return cos(x) - 3*sin(3*x)
end


mathapproximation = fp(1.0)
println(mathapproximation)
function test()
    for i in 0:54
        tmp = d(f, 1.0, 2.0^(Float64(-i)))
        println(1.0 + 2.0^(-i), "\t", tmp, "\t", abs(mathapproximation - tmp))
    end
end
test()