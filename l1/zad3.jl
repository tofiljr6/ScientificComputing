# bitstring(1.0)


# function experiment(a :: Float64, b :: Float64)
#     current = nextfloat(a)
#     while (current < b)
#         if (nextfloat(current) != current + 2^(-52))
#             return false
#         end
#     end
#     current = nextfloat(current)
# end

# println(experiment(Float64(1.0),Float64(2.0)))

# function numberSpread(first :: Float64, last :: Float64)
#     last = prevfloat(last)
#     firstExp = SubString(bitstring(first), 2:12)
#     lastExp = SubString(bitstring(last), 2:12)
#     # jeżeli eksponenty nie są równe, nie będziemy mieli równego rozmieszczenia
#     if (firstExp != lastExp)
#         # zero jako błąd
#         return 0.0
#     end

#     return ((2.0^(parse(Int, firstExp, base = 2) - 1023))*2.0^(-52))
# end


# println(numberSpread(0.5, 1.0))
# println(numberSpread(1.0, 2.0))
# println(numberSpread(2.0, 4.0))

function numberDistribution(numberA :: Float64, numberB :: Float64)
    numberB = prevfloat(numberB)

    expA = SubString(bitstring(numberA), 2:12)
    expB = SubString(bitstring(numberB), 2:12)

    # exponenty muszą być sobie równe, w przecwinym przypadku rozmieszczenie nie będzie równe
    if (expA != expB)
        return false
    end

    return ((2.0^(parse(Int, expA, base = 2) - 1023))*2.0^(-52))
end

println(nextfloat(1.0))
println(bitstring(nextfloat(Float64(1.0))))
x = bitstring(nextfloat(Float64(1.0)))
println(SubString(x, 2:12))

println(numberDistribution(Float64(1.0), Float64(2.0)))
println(numberDistribution(Float64(0.5), Float64(1.0)))
println(numberDistribution(Float64(2.0), Float64(4.0)))