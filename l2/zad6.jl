# Mateusz Tofil

function rec(c, x0)
    y = [x0]
    for i in 1:40
        append!(y, y[i]^2 + c)
    end
    return y
end

combos = [
    [-2, 1],
    [-2, 2],
    [-2, 1.99999999999999],
    [-1, 1],
    [-1, -1],
    [-1, 0.75],
    [-1, 0.25]
]


for i in 1:length(combos)
    println(combos[i], "  & ", rec(combos[i][1], combos[i][2]))
end


# println(combos[1], "_......>", rec(combos[1][1], combos[1][2]))