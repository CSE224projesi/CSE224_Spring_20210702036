set ::env(DESIGN_NAME) TopModule

set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

set ::env(CLOCK_PORT) clk
set ::env(CLOCK_NET) clk
set ::env(CLOCK_PERIOD) "10.0"

set ::env(FP_IO_VOLTAGE) 3.3
set ::env(FP_CORE_UTIL) 30
set ::env(FP_PDN_CORE_RING) 1

set ::env(FP_PIN_ORDER_CFG) $::env(DESIGN_DIR)/pin_order.cfg
