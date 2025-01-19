export maneuver

"""
    maneuver(:hohmann, orb_i, orb_k)

Computes the ideal hohmann transfer based on the target orbit orb_k and the initial
orbit orb_i. Returns a tuple of two changes in absolute velocity. Positive values for 
flight angle 0°, negative for flight angle 180°
"""
function maneuver(::Val{:hohmann}, orbᵢ::KeplerianElements, orbₖ::KeplerianElements)::NTuple{2, Float64}
    rᵢ = orbᵢ.a
    rₖ = orbₖ.a

    Δvᵢ = 10.0
    Δvₖ = 20.0
    print("Here's your orbit dude!" * "\n")

    return Δvᵢ, Δvₖ
end
    

function maneuver()
    print("Hello from base maneuver")

end