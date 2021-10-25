# Mateusz Tofil

# teza Khana dla epsilon maszynoweo dla typu Float16
function khanMacheps16()
    number = Float16(1.0)
    number = 3 * number * ((4 * number)/(3 * number) - number) - number
end

# teza Khana dla epsilon maszynoweo dla typu Float32
function khanMacheps32()
    number = Float32(1.0)
    number = 3 * number * ((4 * number)/(3 * number) - number) - number
end

# teza Khana dla epsilon maszynoweo dla typu Float16
function khanMacheps64()
    number = Float64(1.0)
    number = 3 * number * ((4 * number)/(3 * number) - number) - number
end

# odpalenie funkcji i wyświetlenie wyników w termialu

println(khanMacheps16())
println(khanMacheps32())
println(khanMacheps64())