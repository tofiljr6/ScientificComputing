module Diff
    using Plots    
    export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx

    function ilorazyRoznicowe(x :: Vector{Float64}, f :: Vector{Float64})
        # Funckja obliczająca ilorazy różnicowe, bez użycia dwuwymiarowej macierzy
        # Dane:
        # x : wektor długośc n+1 zawierający węzły x_0, ..., x_n
        #     x[1]=x_0,...,x[n+1]=x_n
        # f : wektro długości n+1 zawierający wartości interpolowanej funkcji w wezłach f(x_0),...,f(x_n)
        
        # Wynik:
        # fx : wektro długośći n+1 zawierający obliczone ilorazy różnicowe 
        #      fx[1] = f[x_0],
        #      fx[2] = f[x_0, x_1],
        #      ...
        #      fx[n] = f[x_0,...,x_{n-1}]
        #      fx[n+1] = f[x_0,...,x_n]
        
        len = length(f)
        fx = Vector{Float64}(undef, len)
        
        for i in 1:len
            fx[i] = f[i]
        end
        
        for i in 2:len
            for j in len:-1:i
                fx[j] = (fx[j] - fx[j-1]) / (x[j] - x[j-i+1])
            end    
        end
        
        return fx
    end
    
    
    function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
        # Funckja obliczająca wartości wielomianu interpolacyjnego stopnia n w postaci Newtona
        # N_n(x) w punkcjie x = t za pomocą uogólnionego algorytmu Hornera, w czasie O(n)
        # Implementacja algorytmu z zadania 8 z listy 4 na ćwiczeniach.
        
        # Dane:
        # x : wektor długości n+1 zawierający węzły x_0,...,x_n
        #     x[1]=x_0,...,x[n+1]=x_n
        # fx : wektor długości n+1 zawierający ilorazy różnicowe
        #     fx[1] = f[x_0]
        #     fx[2] = f[x_0, x_1],...,fx[n]=f[x_0,...,x_{n-1}]
        #     fx[n+1] = f[x_0,...,x_n]
        # t : punkt, w którym należy obliczyć wartośc wielomianu
        
        # Wynik:
        # nt : wartość wielomianu w punkcie t
        len = length(x)
        nt = fx[len]
        
        for i in (len - 1):-1:1
            nt = fx[i] + (t - x[i]) * nt
        end
        
        return nt
    end
    
    function naturalna(x::Vector{Float64}, fx::Vector{Float64})
        # Funkcja obliczająca w czasie O(n^2) współczynniki wielomianu postaci a_0, a_1, ..., a_n tzn.
        # a_nx^n + a_{n-1}x^{n-1} + ... + a_1x + a_0. wiedzać tylko o współczynnikach wielomianu 
        # interpolacyjnego w postaci newtona.
        
        # Dane:
        # x : wektro długośc n+1 zawierający węzły x_0,...,x_n
        #     x[1]=x0, ..., x[n+1]=x_n
        # fx : wektor długości n+1 zawierający ilorazy różnicowe
        #     fx[1] = f[x_0]
        #     fx[2] = f[x_0, x_1]
        #     fx[2] = f[x_0, x_1],...,fx[n]=f[x_0,...,x_{n-1}]
        #     fx[n+1] = f[x_0,...,x_n]
        
        # Wynik:
        #     a : wektor długości n+1 zawierający obliczone współczynniki postaci naturalnej
        #     a[1] = a_0
        #     a[2] = a_1,...,a[n]=a_{n-1}
        #     a[n+1] = a_n
        
        len = length(x)
        a = Vector{Float64}(undef, len)
        a[len] = fx[len]
        
        for i in (len-1):-1:1
            a[i] = fx[i] - a[i+1] * x[i]
            println(i, a)
            for j in (i+1):(len-1)
                println(i, j, a)
                a[j] = a[j] - a[j+1] * x[i]
            end
        end
        
        println(a)
        
        return a
    end
    
    function rysujNnfx(f, a::Float64, b::Float64, n::Int, filename::String)
        dist = (b - a) / n
        
        x = Vector{Float64}(undef, n+1)
        y = Vector{Float64}(undef, n+1)
        
        for i in 1:(n+1)
            x[i] = a + (i-1) * dist
            y[i] = f(x[i])
        end
        
        fx = ilorazyRoznicowe(x, y)
        
        numOfPoints = 100
        plot_dist = (b-a) / numOfPoints
        
        fx_val = Vector{Float64}(undef, numOfPoints+1)
        wx_val = Vector{Float64}(undef, numOfPoints+1)
        
        for i in 1:(numOfPoints+1)
            t = a + (i-1) * plot_dist
            fx_val[i] = f(t)
            wx_val[i] = warNewton(x, fx, t) 
        end
        
        plot(range(a, stop=b, length=(numOfPoints + 1)), fx_val, color = "red", label = "f(x)")
        plot!(range(a, stop=b, length=(numOfPoints + 1)), wx_val, color = "blue", label = "w(x)")
        savefig("./l4/plots/$filename.png")
    end
end