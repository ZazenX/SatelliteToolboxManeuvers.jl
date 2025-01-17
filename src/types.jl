abstract type AbstractManeuver end

"""
Does a foo with a bar!
"""
mutable struct HohmannTransfer <: AbstractManeuver
    Δv₁::Float64
    Δv₂::Float64
    orbitᵢ::Union{Orbit, OrbitStateVector, KeplerianElements}
    orbitₑ::Union{Orbit, OrbitStateVector, KeplerianElements}
end




export HohmannTransfer