include("module.jl")
using Test

# dane testowe do zadania 1
x1 = [3.0, 1.0, 5.0, 6.0]
f1 = [1.0, -3.0, 2.0, 4.0]
ans1 = [1.0, 2.0, -3.0 / 8.0, 7.0 / 40.0]

x2 = [-1.0, 0.0, 1.0, 2.0, 3.0]
f2 = [2.0, 1.0, 2.0, -7.0, 10.0]
ans2 = [2.0, -1.0, 1.0, -2.0, 2.0]

# dane testowe do zadania 2
fx2 = Diff.ilorazyRoznicowe(x2, f2)
fx3 = Diff.ilorazyRoznicowe(Float64[-1,0,1], Float64[5,6,4])
fx4 = Diff.ilorazyRoznicowe(Float64[-1,0,1,2], Float64[3,4,1,0])

print(fx2)
print("siewma",fx4)

# dane testowe do zadania 3
ans3 = [1.0, 6.0, -1.0, -6.0, 2.0]

@testset "Ilorazy roznicowe" begin
    @test isapprox(Diff.ilorazyRoznicowe(x1, f1), ans1)
    @test isapprox(Diff.ilorazyRoznicowe(x2, f2), ans2)
end

@testset "Wartosc wielomianu Newtona" begin
    # sprawdzenie "oczywistych" wartości na punktów początkowych
    @test isapprox(Diff.warNewton(x2, fx2, -1.0), 2.0)
    @test isapprox(Diff.warNewton(x2, fx2, 0.0), 1.0)
    @test isapprox(Diff.warNewton(x2, fx2, 1.0), 2.0)
    @test isapprox(Diff.warNewton(x2, fx2, 2.0), -7.0)
    @test isapprox(Diff.warNewton(x2, fx2, 3.0), 10.0)
    
    # sprawdzenie wartości dla losowych argumentów
    @test isapprox(Diff.warNewton(x2, fx2, -5.0), 1946.0)
    @test isapprox(Diff.warNewton(x2, fx2, -4.0), 857.0)
    @test isapprox(Diff.warNewton(x2, fx2, 4.0), 137.0)
    @test isapprox(Diff.warNewton(x2, fx2, 5.0), 506.0)
    @test isapprox(Diff.warNewton(x2, fx2, -20.0), 367481.0)
    @test isapprox(Diff.warNewton(x2, fx2, -16.0), 155297.0)
    @test isapprox(Diff.warNewton(x2, fx2, -12.0), 51625.0)
    @test isapprox(Diff.warNewton(x2, fx2, 12.0), 31033.0)
    @test isapprox(Diff.warNewton(x2, fx2, 16.0), 106337.0)
    @test isapprox(Diff.warNewton(x2, fx2, 20.0), 271721.0) 
    
    @test isapprox(Diff.warNewton(Float64[-1,0,1,2], fx4, -1.0), 3.0)
    @test isapprox(Diff.warNewton(Float64[-1,0,1,2], fx4, 0.0), 4.0)
    @test isapprox(Diff.warNewton(Float64[-1,0,1,2], fx4, 1.0), 1.0)
    @test isapprox(Diff.warNewton(Float64[-1,0,1,2], fx4, 2.0), 0.0)
end

@testset "Wspolczynniki w postaci normalnej z postaci Newtona" begin
    @test isapprox(Diff.naturalna(x2, fx2), ans3)
end