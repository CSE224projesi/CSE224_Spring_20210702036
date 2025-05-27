# Tasarım adı (top-level modül ismi ile aynı olmalı)
set ::env(DESIGN_NAME) "top"

# Verilog kaynak dosyaları (ALU, RegisterFile, top)
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

# Saat portu ve periyodu
set ::env(CLOCK_PORT) "CLK"
set ::env(CLOCK_PERIOD) "10" ;# ns cinsinden

# Giriş ve çıkış pin düzenlemelerini otomatik ayarlamak istersen:
set ::env(FP_PIN_ORDER_CFG) "$::env(DESIGN_DIR)/pin_order.cfg"

# Core area ve IO yerleşimi otomatik ayarlanacak
set ::env(PL_TARGET_DENSITY) "0.60"
