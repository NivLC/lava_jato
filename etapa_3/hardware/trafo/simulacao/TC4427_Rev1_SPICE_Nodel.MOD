.SUBCKT TC4427_I2D_A 1 2 3 4
*                    | | | | 
*                    | | | Negative Supply
*                    | | Positive Supply
*                    | Output
*                    Input
*
********************************************************************************
* Software License Agreement                                                   *
*                                                                              *
* The software supplied herewith by Microchip Technology Incorporated (the     *
* 'Company') is intended and supplied to you, the Company's customer, for use  *
* soley and exclusively on Microchip products.                                 *
*                                                                              *
* The software is owned by the Company and/or its supplier, and is protected   *
* under applicable copyright laws. All rights are reserved. Any use in         *
* violation of the foregoing restrictions may subject the user to criminal     *
* sanctions under applicable laws, as well as to civil liability for the       *
* breach of the terms and conditions of this license.                          *
*                                                                              *
* THIS SOFTWARE IS PROVIDED IN AN 'AS IS' CONDITION. NO WARRANTIES, WHETHER    *
* EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED        *
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO  *
* THIS SOFTWARE. THE COMPANY SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR    *
* SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.     *
********************************************************************************
*
* ORIGINAL MICROCHIP MODEL (PSpice), TC4427_Rev1_SPICE_Nodel.MOD
* Polarity stated in the original header: Inverting (TC4426 template).
* Check the output polarity in simulation before trusting it.
*
* LTSPICE PORT - changes made to the original, circuit topology untouched:
*  - TABLE {expr} ((x,y)...)   -> value={table(expr, x,y, ...)}
*  - VALUE {expr}              -> value={expr}
*  - POLY(1) 3 4 p0 p1 p2      -> value={p0 + p1*x + p2*x*x}, x = V(3,4)
*  - G table=(...) with ctrl   -> value={table(V(ctrl), ...)}
*  - R ... TC a b              -> R ... tc1=a tc2=b
*  - VSWITCH (Von/Voff)        -> SW (Vt/Vh), Vh negative = smooth transition
*  - SS31 had Von < Voff (inverted polarity): Ron/Roff swapped accordingly
*
* Input Impedance/Clamp
R1  4    1    100MEG
C1  4    1    12.0P
G3  3    1    value={table(V(3,1), -770m,-1, -700m,-10m, -630m,-1n, 0,0, 20,1n)}
G4  1    4    value={table(V(1,4), -5.94,-1, -5.4,-10m, -4.86,-1n, 0,0, 20,1n)}
* Threshold
G11 0    30   value={table(V(1,11), -1m,10n, 0,0, 0.78,-0.1, 1.25,-1, 2,-1)}
G12 0    30   value={table(V(1,12), -2,1, -1.2,1, -0.6,0.1, 0,0, 1,-10n)}
G21 0    11   value={table(V(3,4), 0,1.35, 4,1.35, 6,1.5, 10,1.48, 13,1.49, 16,1.5)}
G22 0    12   value={table(V(3,4), 0,1.35, 4,1.16, 6,1.25, 10,1.24, 13,1.24, 16,1.25)}
R21 0    11   1 tc1=504u tc2=2.33u
R22 0    12   1 tc1=231u tc2=-103n
C30 30   0    1n
* HL Circuit
G31 0    31   value={table(V(3,4), 0,146, 4,63.3, 6,43.4, 10,34.8, 14,32.6, 18,28.4)}
R31 31   0    1 tc1=1.93m tc2=-1.89u
G33 0    30   value={table(V(31,30), -1m,-10, 0,0, 1,10n)}
S31 31   30   31 30 SS31
* LH Circuit
G32 32   0    value={table(V(3,4), 0,104, 4,36.8, 6,19.7, 10,12.1, 14,10.2, 18,9.5)}
R32 0    32   1 tc1=2.26m tc2=2.88u
G34 30   0    value={table(V(30,32), -1m,-10, 0,0, 1,10n)}
R30 32   30   1MEG
* DRIVE
G51 0    50   value={table(V(0,30), -5,-1u, -3,-1u, 0,0, 6,1, 18,1.02)}
G52 50   0    value={table(V(30,0), -5,-1u, -3,-1u, 0,0, 6,1.2, 18,1.22)}
R53 0    50   1
G50 51   60   value={V(50,0)*300m/(-700m+18/(V(3,4)+1m))}
R51 51   0    1
G53 3    0    value={table(V(51,0), -100,100, 0,0, 1,1n)}
G54 0    4    value={table(V(0,51), -100,100, 0,0, 1,1n)}
R60 0    60   100MEG
H67 0    69   V67 1
V67 60   59   0
C60 561  60   200P
R59 59   2    8.19
L59 59   2    10.0N
* Shoot-through adjustment (H60 gain = 56)
VC60 56  0    0
RC60 56  561  1m
H60 58   0    VC60 56
G60P 0   3    value={table(V(58,0), -1,-1u, 0,0, 25,10m, 40,0)}
G60N 4   0    value={table(V(0,58), -1,-1u, 0,0, 25,10m, 40,0)}
* Source Output
E67 67   0    value={table(V(69,0), -1.3,-1.3, 0,0, 1,2)}
G63 0    63   value={22.9-1.86*V(3,4)+54.4m*V(3,4)*V(3,4)}
R63 0    63   1 tc1=4.29m tc2=11.7u
E61 61   65   value={V(67,0)*V(63,0)}
V63 65   3    100u
G61 61   60   value={table(V(61,60), -20m,-130, -15m,-65, -10m,-13, 0,0, 10,1n)}
* Sink Output
E68 68   0    value={table(V(69,0), -1,-2, 0,0, 1.5,1.5)}
G64 0    64   value={22.9-1.86*V(3,4)+54.4m*V(3,4)*V(3,4)}
R64 0    64   1 tc1=4.29m tc2=11.7u
E62 62   66   value={V(68,0)*V(64,0)}
V64 66   4    100u
G62 60   62   value={table(V(60,62), -20m,-150, -15m,-75, -10m,-15, 0,0, 10,1n)}
* Bias Current
G55 0    55   value={table(V(3,4), 0,0, 4.5,530u, 10,770u, 14,910u, 18,1.38m)}
G56 3    4    55 0 1
R55 55   0    1 tc1=-1.53m tc2=-407n
G57 0    57   value={table(V(3,4), 0,0, 4.5,70u, 10,80u, 14,90u, 18,120u)}
G58 3    4    57 0 1
R57 57   0    1 tc1=-1.53m tc2=-407n
S59 55   0    1 0 SS59
* Models
* SS59: PSpice Voff=1.2 Von=1.5 -> Vt=1.35 Vh=-0.15 (smooth)
.MODEL SS59 SW(Ron=100Meg Roff=1m Vt=1.35 Vh=-0.15)
* SS31: PSpice Von=0.1 Voff=0.2 (inverted) -> Vt=0.15 Vh=-0.05, Ron/Roff swapped
.MODEL SS31 SW(Ron=100Meg Roff=800 Vt=0.15 Vh=-0.05)
.ENDS TC4427_I2D_A
