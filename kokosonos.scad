// $fn = 25; //rozliseni kruhu
$fn = 250; //rozliseni kruhu
eps = 0.01; //mala hodnota pro presnost

a = 3; //tloustka drzaku (vyska, sirka)
r = 75/2; //polomer drzaku
alpha = 35; //uhel sklonu kuzele
d = 3; //tloustka vidlice
t = 2; //tloustka steny kolem vidlice
b = 38; //sirka vidlice na vstupu
c = 43; //sirka vidlice na konci
h = 35; //vyska vidlice
beta = 22; //uhel sklonu vidlice

kokosonos();
module kokosonos() {
    w = a * tan(alpha);
    difference() {
        union() {
            cylinder(h = a, r1 = r + a, r2 = r + a + w, center = true);
            translate([r - t, 0, 0])
            rotate([0, -beta, 0]) {
                vidlice();
            }

        }
//        cylinder(h = a + eps, r1 = r, r2 = r + w, center = true);        
        translate([0, 0, -r / tan(alpha) - d / 2])
            cylinder(h = 2*r / tan(alpha), r1 = 0, r2 = 2*r,center = false);

            translate([0, 0, -d - d/2])
            cube(size=[3*r, 3*r, 2*d], center=true);

    }
    
}


module vidlice() {
    difference() {                
    color([255/255, 0/255, 0/255], 0.3)     
        translate([0, 0, -(d + t)/2])
            linear_extrude(height = d + t)
                polygon(points = [
                    [0, -c/2 - t],
                    [h + t, -b/2 - t],
                    [h + t, b/2 + t],
                    [0, c/2 + t]
                ]);

    color([0/255, 255/255, 0/255], 0.9)     
        translate([eps, 0, -d/2])
            linear_extrude(height = d)
                polygon(points = [
                    [0 + t, -c/2],
                    [h + t, -b/2],
                    [h + t, b/2],
                    [0 + t, c/2]
                ]);

    }
}