#clock  :   y9
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports clk]


# leds  :   t22 t21 u22 u21 v22 w22 u19 u14
set_property PACKAGE_PIN U14 [get_ports {out[7]}]
set_property PACKAGE_PIN U19 [get_ports {out[6]}]
set_property PACKAGE_PIN W22 [get_ports {out[5]}]
set_property PACKAGE_PIN V22 [get_ports {out[4]}]
set_property PACKAGE_PIN U21 [get_ports {out[3]}]
set_property PACKAGE_PIN U22 [get_ports {out[2]}]
set_property PACKAGE_PIN T21 [get_ports {out[1]}]
set_property PACKAGE_PIN T22 [get_ports {out[0]}]

set_property IOSTANDARD LVCMOS18 [get_ports {out[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {out[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {out[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {out[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {out[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {out[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {out[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {out[0]}]  

#push buttons   :   p16 r16 n15 r18 t18
set_property IOSTANDARD LVCMOS18 [get_ports enter]
set_property IOSTANDARD LVCMOS18 [get_ports start]
set_property PACKAGE_PIN P16 [get_ports {start}];
set_property PACKAGE_PIN R16 [get_ports {enter}];

#DIP switches   :   f22 g22 h22 f21 h19 h18 h17 m15
set_property IOSTANDARD LVCMOS18 [get_ports {input_value[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {input_value[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {input_value[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {input_value[0]}]

set_property PACKAGE_PIN F21 [get_ports {input_value[3]}]
set_property PACKAGE_PIN H22 [get_ports {input_value[2]}]
set_property PACKAGE_PIN G22 [get_ports {input_value[1]}]
set_property PACKAGE_PIN F22 [get_ports {input_value[0]}]
