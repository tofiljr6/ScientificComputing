using .solvingmethod
using Test

delta = 10^-5
epsilon = 10^-5
maxit = 100

@testset "bisectionmethod() test" begin
    # sprawdzenie czy funkcja zwraca dobry wynik
    @test abs(bisectionmethod(x -> x^2 - 16, 2.0, 5.5, delta, epsilon)[1]) <= 4 + epsilon
    # funkcja nie zmienia znaku na tym przedziale, zwrócenie error
    @test abs(bisectionmethod(x -> x^2 - 16, 2.0, 3.0, delta, epsilon)[4]) == 1
end

@testset "newton() test" begin
    # sprawdzenie czy funckja zwraca dobry wynik
    @test abs(newton(x -> x * exp(-x), x -> -exp(-x) * (x - 1), -1.0, delta, epsilon, maxit)[1]) <= 0 + epsilon
    # metoda zbieżna
    @test abs(newton(x -> x * exp(-x), x -> -exp(-x) * (x - 1), -1.0, delta, epsilon, maxit)[4]) == 0
    # pochodna bliska zeru
    @test abs(newton(x -> x * exp(-x), x -> -exp(-x) * (x - 1), 1.0, delta, epsilon, maxit)[4]) == 2
    # nie osiągnięto wymaganej dokładnośći w maxit iteracjach
    @test abs(newton(x -> x * exp(-x), x -> -exp(-x) * (x - 1), -1.0, delta, epsilon, 1)[4]) == 1
end

@testset "secantmethod() test" begin
    # sprawdzenie czy funkcja zwraca dobry wynik
    @test abs(secantmethod(x -> x * exp(-x), -1.0, 1.0, delta, epsilon, maxit)[1]) <= 0 + epsilon
    # metoda zbieżna
    @test abs(secantmethod(x -> x * exp(-x), -1.0, 1.0, delta, epsilon, maxit)[4]) == 0 
    # nie osiągnięto wymaganej dokładnośći w maxit iteracjach
    @test abs(secantmethod(x -> x * exp(-x), -1.0, 1.0, delta, epsilon, 2)[4]) == 1
end