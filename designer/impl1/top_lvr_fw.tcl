# Created by Microsemi Libero Software 11.9.2.1
# Thu Sep 19 12:32:06 2019

# (OPEN DESIGN)

open_design "top_lvr_fw.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "top_lvr_fw_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {Z:\windows\lvr_fw\lvr_fw_sep2\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"


# import of input files
import_source  \
-format "edif" -edif_flavor "GENERIC" -netlist_naming "VHDL" {../../synthesis/top_lvr_fw.edn} -merge_physical "yes" -merge_timing "yes"
compile
report -type "status" {top_lvr_fw_compile_report.txt}
report -type "pin" -listby "name" {top_lvr_fw_report_pin_byname.txt}
report -type "pin" -listby "number" {top_lvr_fw_report_pin_bynumber.txt}

save_design
