****************************************************
* TB: LDO Load Regulation (Transient)
****************************************************
.option post=2
.temp 60

.include "../LDO.sp"

.param VDD_L=1.8
.param VDD_H=2
.param ILOAD_L=1m
.param ILOAD_H=200m

*---------------------------------------------------
* Supplies
*---------------------------------------------------
VDD    vdd   0  'VDD_L'
VDDE   vdde  0  'VDD_L'
VIN    vin   0  'VDD_L'
VSS    vss   0  0
VSSE   vsse  0  0

* Enable / control (avoid floating control)
* voltage=VDD: using VREF_I/ voltage=0: using VREF_E
VCTL   vctl  0  1.8

*---------------------------------------------------
* DUT
*---------------------------------------------------
XU_LDO  vctl  vdd  vdde  vin  vout  vref_e  vref_i  vss  vsse  LDO_Chip

* Off-chip load network: ESR in series with CL
RCESR  vout  net_cl  50m
CL     net_cl  0     4.7u

*---------------------------------------------------
* Load current step: 1 mA -> 200 mA -> 1 mA
*---------------------------------------------------
ILOAD  vout  0  PWL(0     'ILOAD_L'
                   50u   'ILOAD_L'
                   51u   'ILOAD_H'
                   100u  'ILOAD_H'
                   101u  'ILOAD_L'
                   150u  'ILOAD_L')

*---------------------------------------------------
* Transient
*---------------------------------------------------
.tran 10n 150u

*line regulation
.alter
VDD    vdd   0  PWL(0    'VDD_L'
                    50m  'VDD_L'
                    150m 'VDD_H'
                    200m 'VDD_H')
VDDE   vdde  0  PWL(0    'VDD_L'
                    50m  'VDD_L'
                    150m 'VDD_H'
                    200m 'VDD_H')
VIN    vin   0  PWL(0    'VDD_L'
                    50m  'VDD_L'
                    150m 'VDD_H'
                    200m 'VDD_H')

ILOAD vout 0 DC 100m
.tran 1m 250m
.end

