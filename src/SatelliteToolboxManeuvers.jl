module SatelliteToolboxManeuvers

using StaticArrays
using Reexport

@reexport using Dates
@reexport using SatelliteToolboxBase


abstract type Maneuver end

abstract type TransferManeuver <: Maneuver end
abstract type MaintainanceManeuver <: Maneuver end


struct HohmannTransfer <: TransferManeuver
    orbitᵢ::KeplerianElements
    orbitₖ::KeplerianElements
end


struct BielipticTransfer <: TransferManeuver
    orbitᵢ::KeplerianElements
    orbitₖ::KeplerianElements
end


maneuver(type::Symbol, args...; kwargs...) = maneuver(Val(type), args...; kwargs...)
include("constants.jl")
include("types.jl")
include("maneuvers/hohmanntransfer.jl")


end