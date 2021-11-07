# Mateusz Tofil


# import Pkg; Pkg.add("Polynomials")
# using Pkg
# Pkg.update()
# Pkg.status()
# Pkg.rm("Polynomials")

using Polynomials

coefficients=[1,
    #  -210.0,
    -210-2^(-23),
    20615.0,-1256850.0,
    53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,          
    11310276995381.0, -135585182899530.0,
    1307535010540395.0,     -10142299865511450.0,
    63030812099294896.0,     -311333643161390640.0,
    1206647803780373360.0,     -3599979517947607200.0,
    8037811822645051776.0,      -12870931245150988800.0,
    13803759753640704000.0,      -8752948036761600000.0,
    2432902008176640000.0]


# Polynomial(reverse(coefficients)) = Polynomial(2432902008176640000 + ... -210*x^19 + x^20)
fromCoefficients = Polynomial(reverse(coefficients))

# fromroots([1,2,3]) = (x-1)(x-2)(x-3)
fromRoots = fromroots(collect(Float64, 1:20))

calculatedRoots = roots(fromCoefficients)

for k in 1:20
    println(k, " & ", abs(fromCoefficients(calculatedRoots[k])), " & ", abs(fromRoots(calculatedRoots[k])), " & ", abs(calculatedRoots[k] - k), " \\\\")
    # println(calculatedRoots[k]) # imagine number?!?!
end