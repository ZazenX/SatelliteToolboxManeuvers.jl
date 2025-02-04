@testset "bielliptic tranfer" begin
    deltas = maneuver(:bielliptic, orbᵢ, orbₖ, 70_000e3)
    @test 1 + 1 == 2
    @test length(deltas) == 3
    @test deltas[1] ≠ 0.5
    @test deltas[2] ≠ 0.75
    @test deltas[3] ≠ 1.0
end