function rysujNnfx(f, a::Float64, b::Float64, n::Int)
    dist = (b - a) / n
    
    x = Vector{Float64}(undef, n+1)
    y = Vector{Float64}(undef, n+1)
    
    for i in 1:(n+1)
        x[i] = a + (i-1) * dist
        y[i] = f(x[i])
    end
    
    fx = 
end