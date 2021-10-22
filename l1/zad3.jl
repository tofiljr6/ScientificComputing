function numberDistribution(numberA :: Float64, numberB :: Float64)
    numberB = prevfloat(numberB)

    expA = SubString(bitstring(numberA), 2:12)
    expB = SubString(bitstring(numberB), 2:12)

    println(expA)
    println(expB)

    # exponenty muszą być sobie równe, w przecwinym przypadku rozmieszczenie nie będzie równe
    if (expA != expB)
        return 0.0
    end

    return ((2.0^(parse(Int, expA, base = 2) - 1023))*2.0^(-52))
end

println(nextfloat(Float32(1.0)))
println(nextfloat(Float64(1.0)))
println(bitstring(nextfloat(Float64(1.0))))
x = bitstring(nextfloat(Float64(1.0)))
println(SubString(x, 2:12))

println(numberDistribution(Float64(0.5), Float64(1.0)))
println(numberDistribution(Float64(1.0), Float64(2.0)))
println(numberDistribution(Float64(2.0), Float64(4.0)))
println(numberDistribution(Float64(1.0), Float64(4.0)))

println(bitstring(Float64(10.0)))