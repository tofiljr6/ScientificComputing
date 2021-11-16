module solvingmethod 
    export bisectionmethod, newton, secantmethod
    
    # Moduł zawierający szukanie miejsc zerowcyh trzema, różnymi metodami: Metodą bisekcji zwanej inaczej połowienia,
    # metodą newtona oraz metodą siecznych
    
    function bisectionmethod(f, a :: Float64, b :: Float64, delta :: Float64, epsilon :: Float64)
        # Metoda bisekcji (połowienia)
        # Dane:
        # f : funckja f(x) zadana jako anonimowa funcja (ang. anonymous function)
        # a, b : końce przedziału początkowego
        # delta, episol, dokładność obliczeń
        
        # Wyniki:
        # (r, v, it, err) - czwórka
        # r : przybliżenie pierwiastka równania f(x) = 0
        # v : wartość f(r)
        # it : liczba wykonanych iteracji
        # err : sygnalizacja błedu 0 - brak błedu, 1 - funkcja nie zmienia znaku w przedziale [a,b]
        
        # iteration 
        it = 0
        
        e = b - a
        u = f(a)
        v = f(b)
        
        if (sign(u) == sign(v))
            return (0,0,0,1)
        end
        
        while true
            it += 1
            e /= 2
            c = a + e
            w = f(c)
           
            if ((abs(e) < delta || abs(w) < epsilon))
                return (c,w,it,0)
            end
            
            if (sign(w) != sign(u))
                b = c;
                v = w;
            else
                a = c
                u = w
            end
        end
    end
    
    function newton(f :: Function, pf :: Function, x0 :: Float64, delta :: Float64, epsilon :: Float64, maxIt :: Int)
        # Metoda Newtona
        # Dane:
        # f, pf : funkcja f(x) oraz pochodna f'(x) zadane jako anonimowe funkcje
        # x0 : przybliżenie początkowe
        # delta, epsilon : dokładności obliczeń
        # maxit : maksymalna dopuszczalna liczba iteracji
        
        # Wyniki:
        # (r, v, it, err) - czwórka 
        # r : przybliżonie pierwiastka równania f(x) = 0
        # v : wartość f(r)
        # it : liczba wykonanych iteracji
        # err : sygnalizacj błedu
        #       0 - metoda zbieżna 
        #       1 - nie osiągnięto wymaganej dokładności w maxit iteracji
        #       2 - pochodna bliska zeru
        
        v = f(x0)
        
        if (abs(v) < epsilon)
            return (x0, v, 0, 0)
        end
        
        for it in 1:maxIt
            if (abs(pf(x0)) < epsilon)
                # pochodna bliksa zeru
                return (x0, v, it, 2)
            end
                
            x1 = x0 - v / pf(x0) 
            v = f(x1)
            if (abs(x1 - x0) < delta || abs(v) < epsilon)
                return (x1, v, it, 0)
            end
            x0 = x1
        end
        return (0, 0, 0, 1)
    end
    
    function secantmethod(f :: Function, a :: Float64, b :: Float64, delta :: Float64, epsilon :: Float64, maxit :: Int)
        # Metoda siecznych
        # Dane:
        # f : funkcja f(x) zadana jako anonimowa funckja
        # a, b, : przybliżenia początkowe
        # delta, epsilon : dokładnośc obliczeń
        # maxit : maksymalna dopuszczalna liczba iteracji
        
        # Wyniki:
        # (r, v, it, err) - czwórka
        # r : przybliżenie pierwiastka równania f(x) = 0
        # v : wartość f(r)
        # it : liczba wykonanych iteracji
        # err : sygnalizacj abłedu
        #       0 - metoda zbieżna
        #       1 - nie osiągnięto wymaganej dokładności w maxit iteracji
        
        fa = f(a)
        fb = f(b)
        
        for i in 1:maxit
            if (abs(fa) > abs(fb))
                a, b = b, a
                fa, fb = fb, fa
            end
            s = (b - a)/(fb - fa)
            b = a
            fb = fa
            a = a - (fa * s)
            fa = f(a)
            if (abs(b - a) < delta || abs(fa) < epsilon)
                return (a, fa, i, 0)
            end
        end
        return (0, 0, 0, 1)
    end
    
end 