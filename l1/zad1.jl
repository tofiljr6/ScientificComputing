# Mateusz Tofil 

function machepsFloat16()
    number = Float16(1.0)
    while Float16(1.0) + number / 2 != Float16(1.0)
        number /= 2
    end
    number
end

function machepsFloat32()
    number = Float32(1.0)
    while Float32(1.0) + number / 2 != Float32(1.0)
        number /= 2
    end
    number
end

function machepsFloat64()
    number = Float64(1.0)
    while Float64(1.0) + number / 2 != Float64(1.0)
        number /= 2
    end
    number
end

function etaFloat16()
    number = Float16(1.0)
    while number / 2 > Float16(0.0)
        number /= 2
    end
    number
end

function etaFloat32()
    number = Float32(1.0)
    while number / 2 > Float32(0.0)
        number /= 2
    end
    number
end

function etaFloat64()
    number = Float64(1.0)
    while number / 2 > Float64(0.0)
        number /= 2
    end
    number
end

function maxFloat16()
    number = Float16(1.0)
    while !isinf(number * 2)
        number *= 2
    end

    space = number / 2
    while !isinf(number + space) && space >= Float16(1.0)
        number += space
        space /= 2
    end
    number
end

function maxFloat32()
    number = Float32(1.0)
    while !isinf(number * 2)
        number *= 2
    end

    space = number / 2
    while !isinf(number + space) && space >= Float32(1.0)
        number += space
        space /= 2
    end
    number
end

function maxFloat64()
    number = Float64(1.0)
    while !isinf(number * 2)
        number *= 2
    end

    space = number / 2
    while !isinf(number + space) && space >= Float64(1.0)
        number += space
        space /= 2
    end
    number
end

println("Macheps 16 ", machepsFloat16())
println("Macheps 32 ", machepsFloat32())
println("Macheps 64 ", machepsFloat64())

println(eps(Float16))
println(eps(Float32))
println(eps(Float64))


println("Eta 16 ", etaFloat16())
println("Eta 32 ", etaFloat32())
println("Eta 64 ", etaFloat64())

println(nextfloat(Float16(0.0)))
println(nextfloat(Float32(0.0)))
println(nextfloat(Float64(0.0)))

println("max16 ", maxFloat16())
println("max32 ",maxFloat32())
println("max64 ",maxFloat64())

println(floatmax(Float16))
println(floatmax(Float32))
println(floatmax(Float64))

println("floatmin32 ", floatmin(Float32))
println("floatmin64 ", floatmin(Float64))