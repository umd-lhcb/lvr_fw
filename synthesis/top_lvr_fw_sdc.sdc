# Top Level Design Parameters

# Clocks

create_clock -name {clk_5m_gl} -period 200.000000 -waveform {0.000000 100.000000} clk_5m_gl_keep:Y
create_clock -name {sca_clk_out} -period 1000.000000 -waveform {0.000000 500.000000} sca_clk_out
create_clock -name {top_lvr_fw|CLK40M_OSC} -period 20.000000 -waveform {0.000000 10.000000} CLK40M_OSC

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
