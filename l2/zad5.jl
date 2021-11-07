# Mateusz Tofil

function p(n, r, p0)
    # n :: liczba iteracji
    # r :: pewna stała
    # p0 :: wielkość populacji stanowiąca procent wielkości populacji dla danego stanu środowiska

    # @INFO
    # r(1-pn) -> czynnik wzrostu populacji

    if n == 0
        return p0
    end
    pn1 = p(n-1, r, p0)
    return pn1 + r * pn1 * (1 - pn1)
end

println("40 iteration Float32: ", p(40, Float32(3), Float32(0.01)))
println("40 iteration Float64: ", p(40, Float64(3), Float64(0.01)))

experiment = p(10, Float32(3), Float32(0.01))
# println(experiment, "  ", Float32(trunc(experiment * 1000) / 1000))

experiment = p(10, Float32(3), Float32(trunc(experiment * 1000) / 1000))
experiment = p(10, Float32(3), Float32(trunc(experiment * 1000) / 1000))
experiment = p(10, Float32(3), Float32(trunc(experiment * 1000) / 1000))
print("4 x 10 iteration FLOAT32: ", experiment)
