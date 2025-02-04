@testset "Hohmann transfer" begin
    deltas = maneuver(:hohmann, orbᵢ, orbₖ)
    @test length(deltas) == 2
    @test isapprox(deltas[1], -2440.1237850178413, atol=1e-9)
    @test isapprox(deltas[2], -1472.0484683683676, atol=1e-9)
end
