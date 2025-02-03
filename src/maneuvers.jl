"""
    maneuver(:hohmann, orbᵢ, orbₖ)

Computes the ideal hohmann transfer based on the target orbit orb_k and the initial
orbit orb_i. Returns a Vector of two changes in absolute velocity. Positive values for 
flight angle 0°, negative for flight angle 180°
"""
function SatelliteToolboxManeuvers.maneuver(
    ::Val{:hohmann}, 
    orbᵢ::M, orbₖ::N
) where {M <: Orbit, N <: Orbit}
    rₚ = orbᵢ.a; rₐ = orbₖ.a; μ = GM_EARTH;

    hₜ = √(2 * μ * rₐ * rₚ / (rₐ + rₚ)) #angular momentum
    vₐ = √(μ / rₐ)
    vₚ = √(μ / rₚ)
    vₜₚ = hₜ / rₚ
    vₜₐ = hₜ / rₐ

    Δvₚ = vₚ - vₜₚ 
    Δvₐ = vₜₐ - vₐ

    return collect([Δvₚ, Δvₐ])
end

"""
    maneuver(:bielliptic, orbᵢ, orbₖ)
Computes a bielliptic transfer. The biellptic transfer is slower than a Hohmann transfer,
but requires less ΔV in when rₖ is much greater than rᵢ rₖ/rᵢ > 15.58, it requires an additional
third burn to circularize the final orbit.
"""
function SatelliteToolboxManeuvers.maneuver(
    ::Val{:bielliptic},
     orbᵢ::M,
    orbₖ::N, rₜ
) where {M<:Orbit, N <: Orbit}
    rᵢ = orbᵢ.a
    rₖ = orbₖ.a

    eₜ₁ = (rₜ - rᵢ) / (rₜ + rᵢ)
    hₜ₁ = √(GM_EARTH * rₜ * (1 - eₜ₁))
    vₚₜ₁ = hₜ₁ / rᵢ
    vₐₜ₁ = hₜ₁ / rₜ

    eₜ₂ = (rₜ - rₖ) / (rₖ + rₜ)
    hₜ₂ = √(GM_EARTH * rₜ * (1 - eₜ₂))
    vₚₜ₂ = hₜ₂ / rₖ
    vₐₜ₂ = hₜ₂ / rₜ

    vᵢ = √(GM_EARTH / rᵢ)
    vₖ = √(GM_EARTH / rₖ)

    ΔV = collect([
        vₚₜ₁ - vᵢ,
        vₐₜ₂ - vₐₜ₁,
        vₚₜ₂ - vₖ
    ])

end