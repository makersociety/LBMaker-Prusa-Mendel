// Gregs PRUSA Mendel  
// X-carriage
// Used for sliding on X axis
// GNU GPL v2
// Greg Frost
//https://github.com/GregFrost/PrusaMendel

include <configuration.scad>

clearance=0.7;

lm8uu_diameter=15+clearance;
lm8uu_length=24+clearance;
lm8uu_support_thickness=3.2; 
lm8uu_end_diameter=m8_diameter+1.5;

lm8uu_holder_width=lm8uu_diameter+2*lm8uu_support_thickness;
lm8uu_holder_length=lm8uu_length+2*lm8uu_support_thickness;
lm8uu_holder_height=lm8uu_diameter*0.75+lm8uu_support_thickness;
lm8uu_holder_gap=(lm8uu_holder_length-6*lm8uu_support_thickness)/2;


zip_tie_thickness=1.5;
zip_tie_width=3.5;

module lm8uu_bearing_holder(flip=-1)
{
	difference()
	{
		cube([lm8uu_holder_width,lm8uu_holder_length,lm8uu_holder_height]);
		translate([lm8uu_holder_width/2,0,lm8uu_holder_width/2])
		rotate([-90,0,0])
		translate([0,0,lm8uu_support_thickness])
		{
		  cylinder(r=lm8uu_diameter/2,h=lm8uu_length,$fn=40);
		  translate([-lm8uu_diameter/2,-lm8uu_diameter,0])
		  cube([lm8uu_diameter,lm8uu_diameter,lm8uu_length]);
		}
		translate([lm8uu_holder_width/2,0,lm8uu_holder_width/2])
		rotate([-90,0,0])
		translate([0,0,-1])
		{
			cylinder(r=lm8uu_end_diameter/2,h=lm8uu_holder_length+2,$fn=40);
			translate([-lm8uu_end_diameter/2,-lm8uu_end_diameter,0])
			cube([lm8uu_end_diameter,lm8uu_end_diameter,lm8uu_holder_length+2]);
		}
		
		lm8uu_holder_cutout();

		lm8uu_zip_tie_holes();
	}
}

module lm8uu_zip_tie_holes()
{

  translate([0,0,-0.3])
  difference()
  {
    intersection() 
    {
      union() {
      translate([-1,2*lm8uu_support_thickness+(lm8uu_holder_gap-zip_tie_width)/2,-lm8uu_holder_width/2])
	cube([lm8uu_holder_width+2,zip_tie_width,
	lm8uu_holder_height+1]);

      translate([-1,4*lm8uu_support_thickness+lm8uu_holder_gap+(lm8uu_holder_gap-zip_tie_width)/2, -lm8uu_holder_width/2])
	cube([lm8uu_holder_width+2,zip_tie_width,
	lm8uu_holder_height+1]);
      }
//      cube([lm8uu_diameter+2*zip_tie_thickness,lm8uu_length,lm8uu_diameter+2*zip_tie_thickness]);
      translate([lm8uu_diameter/2+lm8uu_support_thickness,-1,lm8uu_diameter/2])
      rotate([-90,0,0])
      cylinder(r=lm8uu_diameter/2+zip_tie_thickness,h=lm8uu_length+2,$fn=40);
    }
    translate([lm8uu_diameter/2+lm8uu_support_thickness,-1,lm8uu_diameter/2])
    rotate([-90,0,0])
    cylinder(r=lm8uu_diameter/2,h=lm8uu_length+2,$fn=40);
  }

}


module lm8uu_holder_cutout()
{
  translate([-1,2*lm8uu_support_thickness,lm8uu_support_thickness])
    cube([lm8uu_holder_width+2,lm8uu_holder_gap,
      lm8uu_holder_height-lm8uu_support_thickness+1]);

  translate([-1,4*lm8uu_support_thickness+lm8uu_holder_gap,
    lm8uu_support_thickness])
    cube([lm8uu_holder_width+2,lm8uu_holder_gap,
      lm8uu_holder_height-lm8uu_support_thickness+1]);

}

module lm8uu_mounting_cutout()
{
  translate([0,2*lm8uu_support_thickness,-zip_tie_thickness])
  cube([lm8uu_holder_width,
	4*lm8uu_support_thickness+lm8uu_holder_gap,
	lm8uu_support_thickness+zip_tie_thickness+1]);

}

//lm8uu_bearing_holder();
//lm8uu_mounting_cutout();
//lm8uu_zip_tie_holes();



