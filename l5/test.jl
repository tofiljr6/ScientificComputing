# Mateusz Tofil
# Numer indeksu: 254627
# Informatyka Algorytmiczna
# Wydział Informatyki i Telekomunikacji

include("blocksys.jl")
include("matrixgen.jl")
using .matrixgen
using LinearAlgebra

# function benchmark(n, l, repeats, func)
#     totalTime = 0
#     totalMemory = 0
#     for i in 1:repeats
#         # matrixgen.blockmat(n, l, 10.0, "test.txt")
#         A = Blocksys.readMatrix("A.txt")
#         b = Blocksys.computeRightSideVector(A[1], n, l)
#         # Blocksys.printBToFile("b.txt", b)
#         (_, time, memory) = @timed func(A[1], n, l, b)
#         totalTime += time
#         totalMemory += memory
#     end
#     println(n, ";",totalTime/repeats, ";", totalMemory/repeats)
# end

# # benchmark(16, 4, 3, Blocksys.solveGauss)

# # A = Blocksys.readMatrix("test.txt")
# # b = Blocksys.computeRightSideVector(A[1], 16, 4)
# # Blocksys.printBToFile("b.txt", b)

matrixgen.blockmat(16, 4, 10.0, "/Volumes/SamsungT5/on/l5/test.txt")
A = Blocksys.readMatrix("/Volumes/SamsungT5/on/l5/A.txt")
b = Blocksys.readVector("/Volumes/SamsungT5/on/l5/b.txt")
x = Blocksys.solveGaussWithChoice(A[1], 16, 4, b)
# x = Blocksys.solveGauss(A[1], 16, 4, b)
Blocksys.printXToFile("/Volumes/SamsungT5/on/l5/x.txt", x)


# function benchmark(n, l, repeats, func)
#     totalTime = 0
#     totalMemory = 0
#     for i in 1:repeats
#         matrixgen.blockmat(n, l, 10.0, "test.txt")
#         A = Blocksys.readMatrix("test.txt")
#         b = Blocksys.computeRightSideVector(A[1], n, l)
#         (_, time, memory) = @timed func(A[1], n, l, b)
#         totalTime += time
#         totalMemory += memory
#     end
#     println(n, ";",totalTime/repeats, ";", totalMemory/repeats)
# end

# function lu(A, n, l, b)
#     L, U = Blocksys.lu(A, n, l)
#     return Blocksys.solveLu(U, L, n, l, b)
# end

# function luChoice(A, n, l, b)
#     U, L, perm = Blocksys.luWithChoice(A, n, l)
#     return Blocksys.solveLuWithChoice(U, L, n, l, b, perm)
# end

# function classic(A, n, l, b)
#     return \(Array(A), b)
# end

# functions = [classic, Blocksys.solveGauss, Blocksys.solveGaussWithChoice, lu, luChoice]

# for j in 5:length(functions)
#     println("Algorytm $j")
#     # for k in 100:100:1000
#     #     benchmark(k, 4, 1, functions[j])
#     # end

#     benchmark(1000, 4, 3, functions[j])
        
#     for k in 5000:5000:50000
#         benchmark(k, 4, 4, functions[j])
#     end
# end