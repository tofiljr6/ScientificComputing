# Mateusz Tofil

# Funkcja w eksperymentalcny sposób wyznacza odległość między liczbami na przedziale [numberA, numberB].
# Jeżeli odległośći na przedziael będą takie same, funkcja zwróci True, w przeciwnym przypadku False
function stepbystep(numberA :: Float64, numberB :: Float64)
    cur = nextflaot(first)
    while cur < numberB
        if nextfloat(cur) != cur + 2^(-52)
            return false
        end
        cur = nextfloat(cur)
    end
    true
end

# Funkcja wyznacza odległośći między liczbami zmiennopozycyjnymi korzystając ze znajomości IEEE 754
# Funkcja przyjmuje dwa paramenty, początek i koniec przedziału, opisane kolejno [numberA, numberB]
# Dodatkowo funkcja zwraca odległość między liczbami na podanym na wejściu przedziale
function numberDistribution(numberA :: Float64, numberB :: Float64)
    numberB = prevfloat(numberB)

    expA = SubString(bitstring(numberA), 2:12)
    expB = SubString(bitstring(numberB), 2:12)

    # println(expA)
    # println(expB)

    # exponenty muszą być sobie równe, w przecwinym przypadku rozmieszczenie nie będzie równe
    if (expA != expB)
        return 0.0
    end

    return ((2.0^(parse(Int, expA, base = 2) - 1023))*2.0^(-52))
end


println(numberDistribution(Float64(0.5), Float64(1.0)))
println(numberDistribution(Float64(1.0), Float64(2.0)))
println(numberDistribution(Float64(2.0), Float64(4.0)))
println(numberDistribution(Float64(1.0), Float64(4.0)))
