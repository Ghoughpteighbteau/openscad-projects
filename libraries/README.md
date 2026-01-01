# OpenSCAD Libraries

This folder contains reusable OpenSCAD modules and functions that can be included in your projects.

## Using Libraries

To use a library in your project, add an `include` or `use` statement at the top of your .scad file:

```openscad
// Include brings in all variables and modules
include <../../libraries/common-shapes.scad>

// Use only brings in modules/functions (preferred for libraries)
use <../../libraries/common-shapes.scad>
```

**Difference between `include` and `use`:**
- `include`: Imports everything and executes all code (like copy-paste)
- `use`: Only imports modules and functions, doesn't execute code (cleaner)

## Available Libraries

### common-shapes.scad

Useful geometric shapes and primitives:
- `rounded_cube(size, radius)` - Cube with rounded corners
- `hollow_box(outer_size, wall_thickness)` - Box with hollow interior
- `chamfered_cylinder(h, r, chamfer)` - Cylinder with chamfered edges

## Creating Your Own Libraries

When creating libraries:
1. Use descriptive module/function names
2. Add comments explaining parameters
3. Comment out example usage code
4. Keep modules focused and reusable
5. Test thoroughly before using in projects

## Example

```openscad
use <../../libraries/common-shapes.scad>

// Use a library module in your design
rounded_cube([50, 30, 20], radius=3);
```
