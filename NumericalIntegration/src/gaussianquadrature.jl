using FastGaussQuadrature 

#problem
struct GaussLegendre{F} <: IntegrationRule
    points::Vector{F}
    weights::Vector{F}
end

function GaussLegendre(; order::Int=3)
       x, w = gausslegendre(order) #function from Library
       return GaussLegendre(x,w) #our structure
end

#problem 8
function(rule::GaussLegendre)(f::Function, a::F, b::F)where{F}
    return (a-b)/ 2 * dot(rule.weights, f.((b-a)*rule.points/2 .+ (a+b)/2))
end