function f(x :: Float64)
    return sqrt(x^2+1) -1
end

function g(x :: Float64)
    return x^2.0/(sqrt(x^2.0 + 1.0) + 1.0)
end

for i in 1:10
    println(i, "\\\\", f(8^(Float64(-i))), " \\\\ ", g(8^(Float64(-i))))
end


for i in 10:10:200
    println(i, "\\\\", f(8^(Float64(-i))), " \\\\ ", g(8^(Float64(-i))))
end
