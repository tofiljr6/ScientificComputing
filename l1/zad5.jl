xFloat64 = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
yFloat64 = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

xFloat32 = map((d) -> Float32(d), xFloat64)
yFloat32 = map((d) -> Float32(d), yFloat64)

function subpointA(x :: Array, y :: Array)
    s = 0.0
    for i in 1:length(x)
        s += x[i] * y[i]
    end
    s
end

function subpointB(x :: Array, y :: Array)
    s = 0.0
    for i in reverse(1:length(x))
        s += x[i] * y[i]
    end
    s
end

# od najwiękdzego do nahmniejszego (dodaj dodatnie liczby w porządku od największego do najmniejszego, dodaj ujemne liczby w porządku od najmniejsego do największego, a nastęonie daj do siebie obliczone sumy częśćiowe)
function subpointC(x :: Array, y :: Array)
    parts = [x[i]*y[i] for i in (1:length(x))]
    parts = sort(parts, rev=true)

    ind = findfirst(x->x<0, parts)

    # suma częściowa dodatnich liczb w porządku od największego do najmniejszego
    sumPositiv = Float32(0.0)
    for i in 1:(ind-1)
        sumPositiv += parts[i]
    end

    # suma częściowa ujemnych liczb w porządku od najmniejszego do największego
    sumNegativ = Float32(0.0)
    for i in reverse(ind:length(parts))
        sumNegativ += parts[i]
    end

    # ostateczne dodanie sum częściowych
    result = sumPositiv + sumNegativ
    result
end


function subpointD(x :: Array, y :: Array)
    parts = [x[i]*y[i] for i in reverse(1:length(x))]
    parts = sort(parts)

    ind = findfirst(x->x>0, parts)

    # suma częśćiowa ujemnych liczb w porządku od najmniejszej do największej
    sumNegativ = Float32(0.0)
    for i in 1:(ind-1)
        sumNegativ += parts[i]
    end

    # suma częściowa dodatnich liczb w porządku od najwiekszego do najmniejszego
    sumPositiv = Float32(0.0)
    for i in reverse(ind:length(parts))
        sumPositiv += parts[i]
    end

    # ostateczne dodanie sum częśćiowych
    result = sumNegativ + sumPositiv
    result
end

println("A Float64  ", subpointA(xFloat64, yFloat64))
println("A Float32  ", subpointA(xFloat32, yFloat32))

println("B Float64  ", subpointB(xFloat64, yFloat64))
println("B Float32  ", subpointB(xFloat32, yFloat32))

println("C Float64  ", subpointC(xFloat64, yFloat64))
println("C Float32  ", subpointC(xFloat32, yFloat32))

println("D Float64 ", subpointD(xFloat64, yFloat64))
println("D Float32 ", subpointD(xFloat32, yFloat32))