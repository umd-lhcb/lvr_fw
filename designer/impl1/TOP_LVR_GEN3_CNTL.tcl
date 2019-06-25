# Created by Microsemi Libero Software 11.9.2.1
# Tue Jun 25 09:07:34 2019

# (OPEN DESIGN)

open_design "TOP_LVR_GEN3_CNTL.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "TOP_LVR_GEN3_CNTL_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {Z:\windows\LVR_firmware\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"


# import of input files
import_source  \
-format "edif" -edif_flavor "GENERIC" -netlist_naming "VHDL" {../../synthesis/TOP_LVR_GEN3_CNTL.edn} \
-format "pdc"  {..\..\constraint\TOP_LV_REGUL_CNTL_a3pN250.pdc} -merge_physical "yes" -merge_timing "yes"
compile
report -type "status" {TOP_LVR_GEN3_CNTL_compile_report.txt}
report -type "pin" -listby "name" {TOP_LVR_GEN3_CNTL_report_pin_byname.txt}
report -type "pin" -listby "number" {TOP_LVR_GEN3_CNTL_report_pin_bynumber.txt}

save_design
