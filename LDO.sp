*LDO.sp

// Cell name: VREF_SEL
// View name: schematic
.subckt VREF_SEL VCTL VDD VREF VREF_E VREF_I VSS
C0   net1   VSS   mimcaps_mm  W=20u  L=19.7u  M=1
M6   VREF   net7  VREF_I  VDD   p_18_mm  W=2u  L=1u  NF=1  M=1
M4   net7   VCTL  VDD     VDD   p_18_mm  W=2u  L=1u  NF=1  M=1
M5   VREF   VCTL  net1    VDD   p_18_mm  W=2u  L=1u  NF=1  M=1
R2   VREF_E net1  rnppo_mm  WR=500n  LR=690n  M=1
M2   VREF   VCTL  VREF_I  VSS   n_18_mm  W=1u  L=1u  NF=1  M=1
M0   net7   VCTL  VSS     VSS   n_18_mm  W=1u  L=1u  NF=1  M=1
M1   VREF   net7  net1    VSS   n_18_mm  W=1u  L=1u  NF=1  M=1
.ENDS

// Cell name: OP_B
// View name: schematic
.subckt OP_B VDD VIN VIP VOUT VSS
R0   VDD   net1   rnhr1000_mm  WR=180n  LR=11.38u  M=1
RZ   net66 net65  rnhr1000_mm  WR=180n  LR=1.94u   M=1
R1   net1  net71  rnhr1000_mm  WR=180n  LR=11.38u  M=1
R2   VDD   net68  rnhr1000_mm  WR=180n  LR=4.28u   M=1
R3   net68 net67  rnhr1000_mm  WR=180n  LR=4.28u   M=1
R4   net67 net69  rnhr1000_mm  WR=180n  LR=4.28u   M=1
M2   net65 VIP   net64 VSS  n_18_mm  W=3u    L=1u    NF=1  M=1
M1   net62 VIN   net64 VSS  n_18_mm  W=3u    L=1u    NF=1  M=1
M7   VOUT  net63 VSS   VSS  n_18_mm  W=5u    L=500n  NF=1  M=2
M5   net64 net63 VSS   VSS  n_18_mm  W=2u    L=1u    NF=1  M=2
M13  net69 net63 VSS   VSS  n_18_mm  W=7u    L=1u    NF=1  M=1
M12  net70 net69 VSS   VSS  n_18_mm  W=1u    L=1u    NF=1  M=1
M9   net70 net63 VSS   VSS  n_18_mm  W=2u    L=1u    NF=1  M=1
M15  net63 net63 VSS   VSS  n_18_mm  W=2u    L=1u    NF=1  M=1
M6   VOUT  net65 VDD   VDD  p_18_mm  W=7.98u L=500n  NF=1  M=4
M4   net65 net62 VDD   VDD  p_18_mm  W=4u    L=1u    NF=1  M=1
M3   net62 net62 VDD   VDD  p_18_mm  W=4u    L=1u    NF=1  M=1
M11  net70 net70 VDD   VDD  p_18_mm  W=2u    L=1u    NF=1  M=1
M10  net63 net70 net71 net71 p_18_mm W=8u    L=1u    NF=1  M=1
CC   net66 VOUT  mimcaps_mm  W=20u  L=22.18u  M=1
.ends

// Cell name: BGR
// View name: schematic
.subckt BGR VDD1 VDD_BGR VREF VSS
X13  VDD1  net1  net4  net5  VSS  OP_B
Q3   VSS   VSS   net3  pnp_v50x50_mm  M=1
Q2   VSS   VSS   net2  pnp_v50x50_mm  M=8
Q1   VSS   VSS   net1  pnp_v50x50_mm  M=1
R2   VREF  net3  rnhr1000_mm  WR=400n  LR=65.45u  M=1
R1   net4  net2  rnhr1000_mm  WR=1u    LR=18.59u  M=1
M3   VREF  net5  VDD_BGR  VDD_BGR  p_18_mm  W=8u  L=1u  NF=1  M=1
M1   net1  net5  VDD_BGR  VDD_BGR  p_18_mm  W=8u  L=1u  NF=1  M=1
M2   net4  net5  VDD_BGR  VDD_BGR  p_18_mm  W=8u  L=1u  NF=1  M=1
.ENDS 

// Cell name: EA
// View name: schematic
.subckt EA VDD VIN VIP VOUT VSS
M2   net11 VIP   net1  VSS  n_18_mm  W=3u    L=1u    NF=1  M=1
M1   net2  VIN   net1  VSS  n_18_mm  W=3u    L=1u    NF=1  M=1
M7   VOUT  net5  VSS   VSS  n_18_mm  W=5u    L=500n  NF=1  M=2
M5   net1  net5  VSS   VSS  n_18_mm  W=2u    L=1u    NF=1  M=2
M13  net8  net5  VSS   VSS  n_18_mm  W=7u    L=1u    NF=1  M=1
M12  net9  net8  VSS   VSS  n_18_mm  W=1u    L=1u    NF=1  M=1
M9   net9  net5  VSS   VSS  n_18_mm  W=2u    L=1u    NF=1  M=1
M15  net5  net5  VSS   VSS  n_18_mm  W=2u    L=1u    NF=1  M=1
R4   net7   net8   rnhr1000_mm  WR=180n  LR=4.28u   M=1
R3   net6   net7   rnhr1000_mm  WR=180n  LR=4.28u   M=1
R2   VDD    net6   rnhr1000_mm  WR=180n  LR=4.28u   M=1
R1   net281 net10  rnhr1000_mm  WR=180n  LR=11.38u  M=1
R0   VDD    net281 rnhr1000_mm  WR=180n  LR=11.38u  M=1
M6   VOUT  net11  VDD   VDD  p_18_mm  W=7.98u  L=500n  NF=1  M=4
M4   net11 net2   VDD   VDD  p_18_mm  W=4u     L=1u    NF=1  M=1
M3   net2  net2   VDD   VDD  p_18_mm  W=4u     L=1u    NF=1  M=1
M11  net9  net9   VDD   VDD  p_18_mm  W=2u     L=1u    NF=1  M=1
M10  net5  net9   net10 net10 p_18_mm W=8u     L=1u    NF=1  M=1
.ENDS

// Cell name: LDO_Chip
// View name: schematic
.subckt LDO_Chip VCTL VDD VDDE VIN VOUT VREF_E VREF_I VSS VSSE
RF1   VOUT   net28  rnppo_mm  WR=180n   LR=11.05u  M=1
RF2   net28  VSS    rnppo_mm  WR=180n   LR=47.88u  M=1
X8    VCTL_B VDD  net27  VREF_E  VREF_I  VSS  VREF_SEL
X0    VDD  VDD  VREF_I VSS BGR
MP    VOUT  net29  VIN   VIN   p_18_mm  W=25u   L=180n  NF=22  M=8
X2    VDD  net27  net28  net29  VSS  EA
X1    VSSE  VDDE  VDDE_18
X3    VSSE  VDDE  VSSE_18
X4    VSSE  VDDE  VDD  VDDI_18
X5    VSSE  VSS   VSSI_18
X6    VSSE  VREF_E  VDDE  AIN_18
X7    VSSE  VCTL_B  VCTL  VDDE  DIN_18
.ENDS

****************************************************
* I/O Pads
* Pads are instantiated from foundry I/O pad library.
* Internal pad circuitry is not included in this netlist.
****************************************************

* Example (actual pad cells provided by PDK in ADE environment)
* XPAD_VIN   vin_core vin vss PAD_VIN
* XPAD_VOUT  vout_core vout vss PAD_VOUT