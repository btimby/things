// Diameter of skid (same as motor works well)
diameter        = 23;

// Height of skid, wanna stand tall?
height          = 10;

// Diameter of the sphere used for curved bottom of skid
curvature       = 25;

// Motor mounting hole spacing, first dimension
spacing1        = 12;
// Motor mounting hole spacing, second dimension
spacing2        = 12;

// Motor mounting screw size, adjusted for clearance
holesize        = 2; // [2:M2, 3:M3]

// Additional mounting screw length required to pass through.
length       = 4; // [2:2MM, 3:3MM, 4:4MM]

// Rounded is heavier and stonger and cross is lighter.
style           = 1; // [1:Rounded, 2:Cross]

holesize_r      = holesize/2;
curvature_r     = curvature/2;
diameter_r      = diameter/2;

// Rotate it for correct printing orientation.
rotate([180, 0, 0]) {
    difference() {
        // Skid body
        intersection() {
            translate([0, 0, curvature_r]) sphere(r=curvature_r);
            cylinder(r=diameter_r, h=height);
        }

        // Mounting holes
        // Screw shafts
        translate([spacing1/2, 0, 0]) cylinder(r=holesize_r+holesize_r*0.2, h=height, $fn=20);
        translate([0-spacing1/2, 0, 0]) cylinder(r=holesize_r+holesize_r*0.2, h=height, $fn=20);
        translate([0, spacing2/2, 0]) cylinder(r=holesize_r+holesize_r*0.2, h=height, $fn=20);
        translate([0, 0-spacing2/2, 0]) cylinder(r=holesize_r+holesize_r*0.2, h=height, $fn=20);

        if (style==1) {
            // Style Rounded
            // Screw heads
            translate([spacing1/2, 0, 0]) cylinder(r=holesize_r+1.6, h=height-length, $fn=20);
            translate([0-spacing1/2, 0, 0]) cylinder(r=holesize_r+1.6, h=height-length, $fn=20);
            translate([0, spacing2/2, 0]) cylinder(r=holesize_r+1.6, h=height-length, $fn=20);
            translate([0, 0-spacing2/2, 0]) cylinder(r=holesize_r+1.6, h=height-length, $fn=20);
        } else {
            // Style: Cross
            rotate([0, 0, 45]) translate([1.5, 1.5, -3]) cube([diameter_r, diameter_r, height]);
            rotate([0, 0, -45]) translate([1.5, 1.5, -3]) cube([diameter_r, diameter_r, height]);
            rotate([0, 0, 135]) translate([1.5, 1.5, -3]) cube([diameter_r, diameter_r, height]);
            rotate([0, 0, 225]) translate([1.5, 1.5, -3]) cube([diameter_r, diameter_r, height]);

        }
    }
}