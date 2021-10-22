function subpointA()
    cur = Float64(1.0)
    while nextfloat(cur) * (Float64(1.0)/nextfloat(cur)) == Float64(1.0) && cur < 2
        cur = nextfloat(cur)
    end
    nextfloat(cur)
end

function subpointB()
    cur = nextfloat(Float64(0.0))
    while nextfloat(cur) * (Float64(1.0)/nextfloat(cur)) == Float64(1.0)
        cur = nextfloat(cur)
    end
    nextfloat(cur)
end

println(subpointA())
println(subpointB())

x = subpointB()
println(x*(1/x))