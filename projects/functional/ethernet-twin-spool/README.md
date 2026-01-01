# Ethernet Twin Spool

A modular 4-piece cable spool system for storing ethernet cables without damaging them with sharp bends.

## Description

This design allows you to neatly store longer ethernet cables while maintaining a safe bending radius to prevent cable damage. The spool is split into two winding areas, allowing you to store a single long cable efficiently.

## Design Overview

### Components (4 pieces total)

1. **Central Bobbin** (1x) - Hollow cylinder that the cable threads through
2. **Central Plate** (1x) - Divider that snaps onto the bobbin, creating two winding zones
3. **Outer Walls** (2x) - Clip onto the bobbin ends to retain the wound cable
4. **Retaining Clips** (2x) - Clip onto the outer walls to secure cable ends

### Assembly Instructions

1. Thread your ethernet cable through the center hole of the bobbin
2. Slide the bobbin to approximately the middle of your cable
3. Snap the central plate onto the center of the bobbin
4. Wind the cable around the bobbin on both sides of the central plate
5. Clip the outer walls onto both ends of the bobbin
6. Use the retaining clips to secure the cable ends to the outer walls

## Parameters

### Primary Parameters (in the .scad file)

- `cable_length` - Length of cable to store in meters (default: 10m)
- `cable_diameter` - Diameter of your ethernet cable in mm (default: 5.5mm)
  - Cat5e ≈ 5mm
  - Cat6 ≈ 6mm
- `cable_rows` - Number of rows of cable to wind (default: 3)
- `min_bend_radius` - Minimum safe bending radius in mm (default: 30mm)

### Manufacturing Parameters

- `wall_thickness` - Structural wall thickness (default: 2.5mm)
- `snap_tolerance` - Clearance for snap-fit joints (default: 0.25mm)
- `cable_spacing` - Gap between cable wraps (default: 1.0mm)

## Print Settings

### Recommended Settings

- **Layer height**: 0.2mm
- **Infill**: 20% (30% for outer walls if storing heavy cables)
- **Supports**: Likely needed for snap features (test with your slicer)
- **Material**: PLA or PETG
- **Print orientation**:
  - Central Bobbin: On its side (along the axis)
  - Central Plate: Flat
  - Outer Walls: Flat
  - Retaining Clips: Flat

### Print Time

Estimated total: ~6-10 hours depending on size and settings (to be confirmed)

## Current Status

**Status**: Design Phase - Outline Complete

The top-down structure is complete with all modules defined. Implementation of individual components is pending:

- [ ] Implement helper modules (snap connectors, clips)
- [ ] Implement central bobbin geometry
- [ ] Implement central plate with snap features
- [ ] Implement outer wall with clip attachment
- [ ] Implement retaining clips
- [ ] Test and refine snap-fit tolerances
- [ ] Test print and iterate on design

## Design Considerations

### Benefits of Twin Spool Design

- Maintains minimum bend radius throughout storage
- Allows storage of longer cables in compact form
- Central plate provides structural support for manual winding
- Modular design allows for easy printing and assembly

### Potential Challenges

- Snap-fit features need careful design and tolerance testing
- Print orientation critical for snap feature strength
- May need to adjust tolerances based on printer calibration

## Notes

- The central plate divider is somewhat experimental - similar commercial designs don't always use this, but it may provide needed structure for manual winding
- Retaining clips can be placed anywhere on the outer walls since cable end positions will vary
- All snap features should be printed in orientations that allow proper flexibility

## Version History

- v0.1 - Initial design outline and parameter structure
