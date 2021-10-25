# Mateusz Tofil

# Funkcja obliczająca najmniejszą liczbę która spełnia równanie podane w zadaniu
# na przedziale [1,2]
function subpointA()
    cur = Float64(1.0)
    while nextfloat(cur) * (Float64(1.0)/nextfloat(cur)) == Float64(1.0) && cur < 2
        cur = nextfloat(cur)
    end
    nextfloat(cur)
end

# Funkcja obliczająca najmniejszą liczbę która spełnia równanie podane w zadaniu
# Liczba najmnijesza dodatnia
function subpointB()
    # najmnijejsza wartość większa od 0.0
    cur = nextfloat(Float64(0.0))
    while nextfloat(cur) * (Float64(1.0)/nextfloat(cur)) == Float64(1.0)
        cur = nextfloat(cur)
    end
    nextfloat(cur)
end

# Funkcja obliczająca najmniejszą liczbę która spełnia równanie podane w zadaniu
# Liczba najmnijesza ujemna
function subpointBPrim()
    # najmniejsza wartość w ogólności
    cur = prevfloat(Float64(0.0))
    while prevfloat(cur) * (Float64(1.0)/prevfloat(cur)) == Float64(1.0)
        cur = prevfloat(cur)
    end
    prevfloat(cur)
end

# uruchomineie i wyświetlenie wyników w termialu

println(subpointA())
println(subpointB())
println(subpointBPrim())

x = subpointA()
println(x*(1/x))

x = subpointB()
println(x*(1/x))

x = subpointBPrim()
println(x*(1/x))