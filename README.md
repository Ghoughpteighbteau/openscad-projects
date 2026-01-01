# OpenSCAD Projects

A repository for organizing all my 3D printed designs created with OpenSCAD.

## Repository Structure

```
openscad-projects/
├── projects/           # All OpenSCAD project files
│   ├── functional/     # Functional prints (organizers, tools, brackets, etc.)
│   ├── decorative/     # Decorative items (art, ornaments, etc.)
│   ├── mechanical/     # Mechanical parts (gears, enclosures, assemblies, etc.)
│   └── prototypes/     # Work-in-progress and experimental designs
├── libraries/          # Reusable OpenSCAD modules and libraries
├── exports/            # Exported STL files ready for printing
│   └── stl/           # STL format exports
├── docs/              # Documentation, notes, and assembly instructions
└── template/          # Template for starting new projects
```

## Getting Started

### Prerequisites

- [OpenSCAD](https://openscad.org/) - Download and install the latest version
- A 3D printer or access to 3D printing services
- Slicer software (e.g., PrusaSlicer, Cura, OrcaSlicer)

### Creating a New Project

1. Copy the template folder from `template/` to the appropriate project category
2. Rename the folder to your project name
3. Edit the `.scad` file with your design
4. Update the README.md in your project folder with specific details

### Exporting Models

To export a model for 3D printing:

1. Open your `.scad` file in OpenSCAD
2. Press F5 to preview (quick render)
3. Press F6 for full render
4. Use File → Export → Export as STL
5. Save to `exports/stl/`

### Best Practices

- **Version control**: Commit your `.scad` source files regularly
- **Parameters**: Use variables at the top of files for easy customization
- **Comments**: Document your code and design decisions
- **Modularity**: Create reusable modules in the `libraries/` folder
- **Testing**: Always preview (F5) before full render (F6)
- **Units**: Be consistent with units (mm is standard for 3D printing)

## Project Organization Tips

- Name files descriptively: `desk-organizer-v2.scad` instead of `model1.scad`
- Include a README.md in each project folder with:
  - Project description
  - Print settings recommendations
  - Assembly instructions (if applicable)
  - Bill of materials for non-printed parts
- Take photos of successful prints and add them to project folders

## Useful Resources

- [OpenSCAD Cheat Sheet](https://openscad.org/cheatsheet/)
- [OpenSCAD Documentation](https://openscad.org/documentation.html)
- [Thingiverse](https://www.thingiverse.com/) - Design inspiration
- [Printables](https://www.printables.com/) - Design sharing platform

## License

Specify your preferred license here (e.g., MIT, Creative Commons, etc.)
