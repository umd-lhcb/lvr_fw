# Top Level Design Parameters

# Clocks

create_clock -name {top_lvr_fw|CLK40MHZ_OSC} -period 10.000000 -waveform {0.000000 5.000000} CLK40MHZ_OSC
create_clock -name {top_lvr_fw|SCA_CLK_OUT} -period 10.000000 -waveform {0.000000 5.000000} SCA_CLK_OUT

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
