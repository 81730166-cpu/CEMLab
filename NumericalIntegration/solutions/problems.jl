include("./../../NumericalIntegration/NumericalIntegration.jl")
using .NumericalIntegration
##
#Problem 2

f(x)=x^2 #inline function in julia
a=0.0
b=1.0
F_analytic=1/3

intrule_midpoint=Midpoint()
F_midpoint=intrule_midpoint(f,a,b)
relerror_midpoint=abs(F_midpoint - F_analytic)
println("Midpoint: F=$F_midpoint, Error=$relerror_midpoint")


##
#problem 4
for n in [1,2,4,8]
    intrule_midpoint= CompositeNewtonCotes(n,Midpoint())
    F_compmidpoint=intrule_compmidpoint(f,a,b)