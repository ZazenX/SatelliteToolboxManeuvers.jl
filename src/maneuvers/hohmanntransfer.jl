export maneuver

"""
Makes a rocket go fast twice tho
"""
function maneuver(burn_type::T) where {T<:AbstractManeuver}
    print("Rocket go fast, wosh!")
end

function maneuver()
    print("Hello from base maneuver")

end