using Makie, GLMakie, MyFirstPackage
set_theme!(theme_black())

# create a Lorenz system
lz = Lorenz(10, 28, 8/3)

# initial condition
y = MyFirstPackage.Point(1.0, 1.0, 1.0)
 
# `Observable` defines the signal that can be used to update plots efficiently
points = Observable(Point3f[])
colors = Observable(Int[])

# create a figure
fig, ax, l = lines(points, color = colors,
    colormap = :inferno, transparency = true, 
    axis = (; type = Axis3, protrusions = (0, 0, 0, 0), 
              viewmode = :fit, limits = (-30, 30, -30, 30, 0, 50)))

record(fig, "lorenz.mp4", 1:120) do frame
    global y
    for i in 1:50
        # update arrays inplace
        y = integrate_step(lz, RungeKutta{4}(), y, 0.01)
        push!(points[], Point3f(y...))
        push!(colors[], frame)
    end
    ax.azimuth[] = 1.7pi + 0.3 * sin(2pi * frame / 120) # set the view angle of the axis
    notify(points); notify(colors) # tell points and colors that their value has been updated
    l.colorrange = (0, frame) # update plot attribute directly
end