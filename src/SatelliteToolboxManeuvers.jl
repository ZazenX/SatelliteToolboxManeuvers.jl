module SatelliteToolboxManeuvers

using StaticArrays
using Reexport
@reexport using Dates
@reexport using SatelliteToolboxBase

export Maneuver, maneuver, HohmannTransfer, BielipticTransfer

abstract type Maneuver end
abstract type TwoDimensional <: Maneuver end


struct HohmannTransfer <: TwoDimensional 
    orbitᵢ::KeplerianElements
    orbitₖ::KeplerianElements
end


struct BielipticTransfer <: TwoDimensional
    burns::Vector{Float64}
end

function maneuver end

function maneuver(::Val{T}, orbᵢ::M, orbₖ::N) where {T, M<:Orbit, N<:Orbit}
    throw(ArgumentError("Unsupported maneuver type: $T"))
end


maneuver(type::Symbol, args...; kwargs...) = maneuver(Val(type), args...; kwargs...)

include("./maneuvers.jl")
include("./constants.jl")
include("./types.jl")

end