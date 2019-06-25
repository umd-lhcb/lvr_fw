new_project \
    -name {TOP_LVR_GEN3_CNTL} \
    -location {C:\Users\TomO_Laptop\Box Sync\LV_Reg_GEN3_Dig_Cntl_GW\LVRegul_DIg_Cntl\designer\impl1\TOP_LVR_GEN3_CNTL_fp} \
    -mode {single}
set_programming_file -file {C:\Users\TomO_Laptop\Box Sync\LV_Reg_GEN3_Dig_Cntl_GW\LVRegul_DIg_Cntl\designer\impl1\TOP_LVR_GEN3_CNTL.pdb}
set_programming_action -action {PROGRAM}
run_selected_actions
save_project
close_project
