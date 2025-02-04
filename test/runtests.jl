using Test
using SatelliteToolboxManeuvers
using SatelliteToolboxBase

#LEO TO GEO test data
jd = date_to_jd(2025, 1, 1, 12, 0, 0)
orbᵢ = KeplerianElements(jd, 6628e3, 0., 0., 0., 0., 0.)
orbₖ = KeplerianElements(jd, 42164.154e3, 0., 0., 0., 0., 0.)

@testset "Simple 2d maneuvers" verbose = true begin
    include("./hohmann.jl")
    include("./bielliptic.jl")
end

@testset "Errors" verbose = true begin
    include("./errors.jl")
end