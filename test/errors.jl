@testset "unimplemented" verbose = true begin
    @test_throws ArgumentError maneuver(:stationkeeping, orbᵢ, orbₖ)
end