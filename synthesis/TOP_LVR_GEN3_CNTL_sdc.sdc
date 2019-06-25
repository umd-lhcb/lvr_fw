# Top Level Design Parameters

# Clocks

create_clock -name {TOP_LVR_GEN3_CNTL|CLK40M_OSC} -period 2.867000 -waveform {0.000000 1.434000} CLK40M_OSC
create_clock -name {TOP_LVR_GEN3_CNTL|BUF5M_J11_15_TCONN_inferred_clock} -period 12.875000 -waveform {0.000000 6.438000} BUF5M_J11_15_TCONN_inferred_clock:Y

# False Paths Between Clocks


# False Path Constraints


# Maximum Delay Constraints


# Multicycle Constraints


# Virtual Clocks
# Output Load Constraints
# Driving Cell Constraints
# Wire Loads
# set_wire_load_mode top

# Other Constraints
