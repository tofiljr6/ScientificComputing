# Mateusz Tofil

function khanMacheps16()
    number = Float16(1.0)
    number = 3 * number * ((4 * number)/(3 * number) - number) - number
end

function khanMacheps32()
    number = Float32(1.0)
    number = 3 * number * ((4 * number)/(3 * number) - number) - number
end

function khanMacheps64()
    number = Float64(1.0)
    number = 3 * number * ((4 * number)/(3 * number) - number) - number
end

println(khanMacheps16())
println(khanMacheps32())
println(khanMacheps64())