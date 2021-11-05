
function badanie()
    for i in 30:40
        println(i, " & ", exp(-i), " & ", exp(-i) - eps(), "\\\\")
    end
end

badanie()