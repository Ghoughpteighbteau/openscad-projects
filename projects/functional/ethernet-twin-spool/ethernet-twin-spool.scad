// ================================================================
// ETHERNET TWIN SPOOL - Cable Storage System
// ================================================================
// A 4-piece cable spool system for storing ethernet cables without
// damaging them with sharp bends.
//
// Components:
//   1. Central Bobbin (1x) - hollow center for threading cable
//   2. Central Plate (1x) - divides bobbin into two winding areas
//   3. Outer Walls (2x) - clip onto bobbin ends to retain cable
//   4. Retaining Clips (2x) - clip onto outer walls to secure cable ends
//
// Assembly:
//   1. Thread cable through bobbin center
//   2. Slide bobbin to cable middle
//   3. Snap central plate onto bobbin center
//   4. Wind cable on both sides of center plate
//   5. Clip outer walls onto bobbin ends
//   6. Secure cable ends with retaining clips
// ================================================================

// ===== UNITS =====
// All dimensions in millimeters (mm)
// All angles in degrees

// ===== PRIMARY PARAMETERS =====

// Cable specifications
cable_length = 10;              // Length of cable to store (meters)
cable_diameter = 5.5;           // Diameter of ethernet cable (mm)
                                // Cat5e ≈ 5mm, Cat6 ≈ 6mm
cable_rows = 3;                 // Number of rows of cable to wind

// Bending constraints
min_bend_radius = 30;           // Minimum safe bending radius (mm)
                                // Default 30mm prevents cable damage

// Manufacturing parameters
wall_thickness = 2.5;           // Thickness of walls and structural elements (mm)
snap_tolerance = 0.25;          // Clearance for snap-fit joints (mm)
cable_spacing = 1.0;            // Gap between cable wraps (mm)

// Quality settings
$fn = 100;                      // Fragment number for circles

// ===== CALCULATED DIMENSIONS =====

// Bobbin dimensions
bobbin_inner_radius = min_bend_radius;
bobbin_outer_radius = bobbin_inner_radius + wall_thickness;
bobbin_total_width = cable_rows * (cable_diameter + cable_spacing);

// Winding area calculations
// Each side of center plate holds half the cable length
cable_length_per_side_mm = (cable_length * 1000) / 2;  // Convert m to mm
bobbin_circumference = 2 * PI * bobbin_inner_radius;
turns_per_row = cable_length_per_side_mm / (cable_rows * bobbin_circumference);
winding_area_width = bobbin_total_width;  // Width for cable on each side

// Central plate dimensions
center_plate_radius = bobbin_outer_radius + wall_thickness * 2;
center_plate_thickness = wall_thickness * 1.5;

// Outer wall dimensions
outer_wall_radius = bobbin_outer_radius + (cable_diameter * cable_rows) + wall_thickness;
outer_wall_thickness = wall_thickness;
outer_wall_height = bobbin_total_width + (wall_thickness * 2);

// Retaining clip dimensions
clip_width = 15;                // Width of retaining clip
clip_thickness = wall_thickness;
clip_grip_depth = 3;            // How deep clip grips the cable

// Total assembly dimensions (for reference)
total_spool_width = (winding_area_width * 2) + center_plate_thickness;
total_spool_diameter = outer_wall_radius * 2;

// ===== HELPER MODULES =====

// ===== Cable Representation Modules =====

// Create a straight cable section
// Parameters:
//   diameter - diameter of the cable
//   length - length of the straight section
// Centered on origin, extends along Z-axis
module cable_straight(diameter, length) {
    cylinder(d=diameter, h=length, center=true);
}

// Create a curved cable section (arc from a torus)
// Parameters:
//   diameter - diameter of the cable
//   bend_radius - radius to the center of the cable path
//   arc_angle - degrees of arc to create (e.g., 90, 180)
// Arc starts at 0° and sweeps arc_angle degrees in XY plane
// Center of arc is at origin
module cable_arc(diameter, bend_radius, arc_angle) {
    rotate_extrude(angle=arc_angle)
        translate([bend_radius, 0, 0])
            circle(d=diameter);
}

// ===== Snap-fit Modules =====

// Create a snap-fit male connector (protrusion)
// Parameters:
//   height - height of the snap connector
//   width - width of the snap connector base
//   depth - how far the snap protrudes
module snap_male(height, width, depth) {
    // TODO: Implement snap male connector
    // Should have a slight taper and retention lip
}

// Create a snap-fit female connector (receptacle)
// Parameters:
//   height - height of the snap receptacle
//   width - width of the snap receptacle
//   depth - how deep the receptacle goes
//   tolerance - clearance for snap fit
module snap_female(height, width, depth, tolerance=snap_tolerance) {
    // TODO: Implement snap female receptacle
    // Should mate with snap_male with proper tolerance
}

// Create a clip connector for outer wall attachment
// Parameters:
//   radius - radius of surface to clip onto
//   width - width of clip
//   grip - how much the clip grips (interference fit)
module clip_connector(radius, width, grip) {
    // TODO: Implement clip connector
    // C-shaped or horseshoe clip that snaps onto cylindrical surface
}

// ===== COMPONENT MODULES =====

// Central Bobbin - hollow cylinder with snap features
// The cable threads through the center hole
// Has female snap receptacles for the central plate
// Has features for outer wall clips to attach
module central_bobbin() {
    // TODO: Implement central bobbin
    // - Hollow cylinder (inner_radius = bobbin_inner_radius)
    // - Outer radius = bobbin_outer_radius
    // - Total width = total_spool_width
    // - Female snap receptacles at center for central plate
    // - Structural features at ends for outer wall attachment
}

// Central Plate - divides bobbin into two winding areas
// Snaps onto the center of the bobbin
// Creates two separate cable winding zones
module central_plate() {
    // TODO: Implement central plate
    // - Disk shape (radius = center_plate_radius)
    // - Thickness = center_plate_thickness
    // - Central hole to fit around bobbin
    // - Male snap connectors to mate with bobbin
    // - Optional: finger grips for easier winding
}

// Outer Wall - retains wound cable (print 2x)
// Clips onto the ends of the bobbin
// Prevents cable from unwinding
// Provides attachment points for retaining clips
module outer_wall() {
    // TODO: Implement outer wall
    // - Disk/ring shape (radius = outer_wall_radius)
    // - Height/thickness = outer_wall_height
    // - Central opening to fit over bobbin
    // - Clip connectors to attach to bobbin ends
    // - Smooth outer surface for retaining clips
}

// Retaining Clip - secures cable ends (print 2x)
// Clips onto outer wall at any position
// Holds cable end in place without crimping
module retaining_clip() {
    // TODO: Implement retaining clip
    // - Base with clip connector for outer wall
    // - Cable grip/channel (diameter = cable_diameter)
    // - Width = clip_width
    // - Should grip cable gently, not crimp it
}

// ===== ASSEMBLY AND LAYOUT =====

// Assembly view - shows how all parts fit together
module assembly_view() {
    // Central bobbin at origin
    central_bobbin();

    // Central plate snapped onto center of bobbin
    central_plate();

    // Outer walls clipped onto bobbin ends
    translate([-(total_spool_width/2 - outer_wall_height/2), 0, 0])
        rotate([0, 90, 0])
            outer_wall();

    translate([total_spool_width/2 - outer_wall_height/2, 0, 0])
        rotate([0, 90, 0])
            outer_wall();

    // Retaining clips on outer walls (example positions)
    translate([-(total_spool_width/2), outer_wall_radius * 0.7, 0])
        rotate([0, 90, 0])
            retaining_clip();

    translate([total_spool_width/2, -outer_wall_radius * 0.7, 0])
        rotate([0, 90, 180])
            retaining_clip();
}

// Print layout - arranges parts efficiently for printing
module print_layout() {
    // Central bobbin - print on its side for strength
    rotate([0, 90, 0])
        central_bobbin();

    // Central plate - print flat
    translate([0, total_spool_diameter + 10, 0])
        central_plate();

    // Two outer walls - print flat
    translate([total_spool_width/2 + 20, 0, 0])
        outer_wall();

    translate([total_spool_width/2 + 20, outer_wall_radius * 2 + 10, 0])
        outer_wall();

    // Two retaining clips
    translate([0, -(outer_wall_radius + 20), 0])
        retaining_clip();

    translate([clip_width + 10, -(outer_wall_radius + 20), 0])
        retaining_clip();
}

// ===== RENDER CONTROL =====

// Change this to select what to display:
// "assembly" - shows assembled spool
// "print" - shows parts laid out for printing
// "bobbin" - shows only central bobbin
// "plate" - shows only central plate
// "wall" - shows only outer wall
// "clip" - shows only retaining clip
// "cable_test" - shows test cable sections

render_mode = "cable_test";

if (render_mode == "assembly") {
    assembly_view();
} else if (render_mode == "print") {
    print_layout();
} else if (render_mode == "bobbin") {
    rotate([0, 90, 0]) central_bobbin();
} else if (render_mode == "plate") {
    central_plate();
} else if (render_mode == "wall") {
    outer_wall();
} else if (render_mode == "clip") {
    retaining_clip();
} else if (render_mode == "cable_test") {
    // Test straight cable section
    cable_straight(cable_diameter, 50);

    // Test 90-degree arc
    translate([40, 0, 0])
        cable_arc(cable_diameter, min_bend_radius, 90);

    // Test 180-degree arc (half circle)
    translate([100, 0, 0])
        cable_arc(cable_diameter, min_bend_radius, 180);

    // Test S-bend composition (simulating cable through bobbin)
    translate([0, 60, 0]) {
        cable_straight(cable_diameter, 20);
        translate([0, 0, 10])
            rotate([0, 0, 90])
                cable_arc(cable_diameter, 15, 90);
        translate([15, 0, 25])
            rotate([0, 90, 0])
                cable_straight(cable_diameter, 30);
    }
}

// ===== DESIGN NOTES =====
// - All snap fits should be printed with proper orientation for flexibility
// - Test fit tolerance values may need adjustment based on printer
// - Consider adding text labels or version numbers to parts
// - Outer walls need sufficient strength to retain wound cable tension
