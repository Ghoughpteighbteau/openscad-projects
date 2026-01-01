// Common Shapes Library
// A collection of useful shapes and modules for OpenSCAD projects

// Rounded cube with customizable corner radius
module rounded_cube(size, radius=2) {
    $fn = 50;
    hull() {
        translate([radius, radius, radius])
            sphere(r=radius);
        translate([size[0]-radius, radius, radius])
            sphere(r=radius);
        translate([radius, size[1]-radius, radius])
            sphere(r=radius);
        translate([size[0]-radius, size[1]-radius, radius])
            sphere(r=radius);
        translate([radius, radius, size[2]-radius])
            sphere(r=radius);
        translate([size[0]-radius, radius, size[2]-radius])
            sphere(r=radius);
        translate([radius, size[1]-radius, size[2]-radius])
            sphere(r=radius);
        translate([size[0]-radius, size[1]-radius, size[2]-radius])
            sphere(r=radius);
    }
}

// Hollow box with walls
module hollow_box(outer_size, wall_thickness=2) {
    difference() {
        cube(outer_size);
        translate([wall_thickness, wall_thickness, wall_thickness])
            cube([
                outer_size[0] - 2*wall_thickness,
                outer_size[1] - 2*wall_thickness,
                outer_size[2]
            ]);
    }
}

// Chamfered cylinder
module chamfered_cylinder(h, r, chamfer=1) {
    $fn = 100;
    hull() {
        translate([0, 0, chamfer])
            cylinder(h=h-2*chamfer, r=r);
        translate([0, 0, 0])
            cylinder(h=0.01, r=r-chamfer);
        translate([0, 0, h-0.01])
            cylinder(h=0.01, r=r-chamfer);
    }
}

// Example usage (comment out when using as library):
// rounded_cube([30, 40, 20], radius=3);
// translate([50, 0, 0]) hollow_box([30, 40, 20], wall_thickness=2);
// translate([100, 0, 0]) chamfered_cylinder(h=30, r=10, chamfer=2);
