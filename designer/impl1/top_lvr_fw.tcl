# Created by Microsemi Libero Software 11.9.2.1
# Mon Jul 22 19:21:01 2019

# (OPEN DESIGN)

open_design "top_lvr_fw.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "top_lvr_fw_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {Z:\windows\lvr_fw\lvr_fw\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"


layout -timing_driven
report -type "status" {top_lvr_fw_place_and_route_report.txt}
report -type "globalnet" {top_lvr_fw_globalnet_report.txt}
report -type "globalusage" {top_lvr_fw_globalusage_report.txt}
report -type "iobank" {top_lvr_fw_iobank_report.txt}
report -type "pin" -listby "name" {top_lvr_fw_report_pin_byname.txt}
report -type "pin" -listby "number" {top_lvr_fw_report_pin_bynumber.txt}

save_design
