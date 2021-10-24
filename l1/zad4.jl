function subpointA()
    cur = Float64(1.0)
    while nextfloat(cur) * (Float64(1.0)/nextfloat(cur)) == Float64(1.0) && cur < 2
        cur = nextfloat(cur)
    end
    nextfloat(cur)
end

function subpointB()
    # najmnijejsza wartość większa od 0.0
    cur = nextfloat(Float64(0.0))
    while nextfloat(cur) * (Float64(1.0)/nextfloat(cur)) == Float64(1.0)
        cur = nextfloat(cur)
    end
    nextfloat(cur)
end

function subpointBPrim()
    # najmniejsza wartość w ogólności
    cur = prevfloat(Float64(0.0))
    while prevfloat(cur) * (Float64(1.0)/prevfloat(cur)) == Float64(1.0)
        cur = prevfloat(cur)
    end
    prevfloat(cur)
end

println(subpointA())
println(subpointB())
println(subpointBPrim())

x = subpointA()
println(x*(1/x))

x = subpointB()
println(x*(1/x))

x = subpointBPrim()
println(x*(1/x))