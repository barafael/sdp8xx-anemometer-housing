$fn = 400;

angle1 = 180+60.5;
angle2 = 120.5;

height = 64;

module torus2(r1, r2) {
    rotate_extrude() translate([r1,0,0]) circle(r2);
}

difference() {
    union() {
        cylinder(d=54, h=height);
        translate([0, 27, 0]) cylinder(d=11, h=height, $fn=100);
        rotate([0, 0, angle1]) translate([0, 27, 0]) cylinder(d=11, h=height, $fn=100);
        rotate([0, 0, angle2]) translate([0, 27, 0]) cylinder(d=11, h=height, $fn=100);
    }

    rotate([0, 0, 60]) translate([0, 32, -10]) cylinder(d=50, h=100);
    rotate([0, 0, 180]) translate([0, 32, -10]) cylinder(d=50, h=100);
    rotate([0, 0, 300]) translate([0, 32, -10]) cylinder(d=50, h=100);

    // H3
    translate([0, 27, -1]) cylinder(d=3, h=100, $fn=50);
    translate([0, 27, 5]) cylinder(d=6.3, h=100, $fn=6);

    // H2
    rotate([0, 0, angle1]) translate([0, 27, -1]) cylinder(d=3, h=100, $fn=50);
    rotate([0, 0, angle1]) translate([0, 27, 5]) cylinder(d=6.3, h=100, $fn=6);

    // H1
    rotate([0, 0, angle2]) translate([0, 27, -1]) cylinder(d=3, h=100, $fn=50);
    rotate([0, 0, angle2]) translate([0, 27, 5]) cylinder(d=6.3, h=100, $fn=6);

    union() {
        translate([0, 30, 105]) scale([1, 0.5, 2]) rotate([0, 90, 0]) cylinder(d=100, h=20, center=true);
        translate([0, 32, 15]) scale([1, 0.5, 2]) rotate([0, 90, 0]) cube(size=[10, 10, 20], center=true);
    }
    union() {
        rotate([60, 90, 0]) translate([-105, -30, 0]) scale([2, 0.5, 1]) cylinder(d=100, h=20, center=true);
        rotate([60, 90, 0]) translate([-15, -32, 0]) scale([2, 0.5, 1]) cube(size=[10, 10, 20], center=true);
    }

    union() {
        rotate([120, 90, 0]) translate([-105, 30, 0]) scale([2, 0.5, 1]) cylinder(d=100, h=20, center=true);
        rotate([120, 90, 0]) translate([-15, 32, 0]) scale([2, 0.5, 1]) cube(size=[10, 10, 20], center=true);
    }

    translate([0, 0, 7]) torus2(18,4, $fn=6);
    translate([0, 0, 17]) torus2(12,3, $fn=6);
}
