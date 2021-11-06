# Mateusz Tofil

using LinearAlgebra

function hilb(n::Int)
    # Function generates the Hilbert matrix  A of size n,
    # Pawel Zielinski
    if n < 1
        error("size n should be >= 1")
    end
    return [1 / (i + j - 1) for i in 1:n, j in 1:n]
end

function matcond(n::Int, c::Float64)
    # Function generates a random square matrix A of size n with
    # a given condition number c.
    # Inputs:
    #	n: size of matrix A, n>1
    #	c: condition of matrix A, c>= 1.0
    #
    # Usage: matcond(10, 100.0)
    #
    # Pawel Zielinski
    if n < 2
        error("size n should be > 1")
    end
    if c< 1.0
        error("condition number  c of a matrix  should be >= 1.0")
    end
    (U,S,V)=svd(rand(n,n))
    return U*diagm(0 =>[LinRange(1.0,c,n);])*V'
end


function hilbertsMatrix(size::Int)
    a = hilb(size)
    x = ones(size)
    b = a * x

    # eliminaja Gaussa
    gauss = a \ b

    # odwrotność
    inverse = inv(a) * b
    
    # println(size, " & " ,rank(a), " & ", round(cond(a), sigdigits=3), " & ", norm(x - gauss)/norm(x), " & ", norm(x - inverse)/norm(x), " \\\\")
    println(size, " & " ,rank(a), " & ", round(cond(a), sigdigits=3), " & ", round(norm(x - gauss)/norm(x), sigdigits=3), " & ", round(norm(x - inverse)/norm(x), sigdigits=3), " \\\\")
end


function randomMatrix(size::Int, c::Float64)
    # size : rozmiar generwoanej macierzy 
    # c : wskaźnik uwarunkowania

    a = matcond(size, c)
    x = ones(size)
    b = a * x

    # elimiacja Gaussa
    gauss = a \ b

    # odwrotność
    inverse = inv(a) * b

    # println(size, " & " ,rank(a), " & ", round(cond(a), sigdigits=3), " & ", norm(x - gauss)/norm(x), " & ", norm(x - inverse)/norm(x), " \\\\")
    println(size, " & " ,rank(a), " & ", round(cond(a), sigdigits=3), " & ", round(norm(x - gauss)/norm(x), sigdigits=3), " & ", round(norm(x - inverse)/norm(x), sigdigits=3), " \\\\")
end


# for i in 1:20
#     hilbertsMatrix(i)
# end

n = [5, 10, 20]
c = [1.0, 10.0, 10^3, 10^7, 10^12, 10^16]

for en in n
    for ce in c
        randomMatrix(en, ce)
        # println(en, "-", ce)
    end
end

