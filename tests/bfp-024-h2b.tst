*Testcase bfp-024-h2b.tst:        TBDR, TBEDR

#Testcase bfp-024-h2b.tst: Convert HFP to BFP (2)
#..Test cases evaluate non-normalized inputs, rounding of long
#..BFP results, and overflow and underflow detection and results
#..for short BFP targets.  Convert HFP to BFP does not generate
#..NaN results, does not use or change the FPCR, and does not
#..trap for IEEE exceptions.


sysclear
archmode esame

loadcore "$(testpath)/bfp-024-h2b.core"

runtest 10.0

# Short BFP basic test results
*Compare
r 1000.10
*Want "TBEDR 0, 1.5,-1.5,20/7"                                00000000 3FC00000 BFC00000 4036DB6D
r 1010.C
*Want "TBEDR -20/7,8nn, -8nn"                                 C036DB6D 41000000 C1000000

r 1080.10
*Want "TBEDR FPCR 0, 1.5,-1.5,20/7"                           F8000000 F8000002 F8000001 F8000002
r 1090.C
*Want "TBEDR FPCR -20/7,8nn, -8nn"                            F8000001 F8000002 F8000001

# Short BFP overflow/underflow test results
*Compare
r 1100.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0x7EFFFFFF00000000"      7F7FFFFF 7F800000 7F7FFFFF 7F800000
r 1110.C
*Want "TBEDR O/U RZ, RP, RM 0x7EFFFFFF00000000"               7F7FFFFF 7F800000 7F7FFFFF
r 1120.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0xFEFFFFFF00000000"      FF7FFFFF FF800000 FF7FFFFF FF800000
r 1130.C
*Want "TBEDR O/U RZ, RP, RM 0xFEFFFFFF00000000"               FF7FFFFF FF7FFFFF FF800000
r 1140.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0x0010000000000000"      00000000 00000000 00000001 00000000
r 1150.C
*Want "TBEDR O/U RZ, RP, RM 0x0010000000000000"               00000000 00000001 00000000
r 1160.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0x8010000000000000"      80000000 80000000 80000001 80000000
r 1170.C
*Want "TBEDR O/U RZ, RP, RM 0x8010000000000000"               80000000 80000000 80000001
r 1180.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0x213FFFFFFFFFFFFF"      007FFFFF 00800000 007FFFFF 00800000
r 1190.C
*Want "TBEDR O/U RZ, RP, RM 0x213FFFFFFFFFFFFF"               007FFFFF 00800000 007FFFFF
r 11A0.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0xA13FFFFFFFFFFFFF"      807FFFFF 80800000 807FFFFF 80800000
r 11B0.C
*Want "TBEDR O/U RZ, RP, RM 0xa13FFFFFFFFFFFFF"               807FFFFF 807FFFFF 80800000
r 11C0.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0x6B3FFFFFFFFFFFFF"      7F7FFFFF 7F800000 7F7FFFFF 7F800000
r 11D0.C
*Want "TBEDR O/U RZ, RP, RM 0x6B3FFFFFFFFFFFFF"               7F7FFFFF 7F800000 7F7FFFFF
r 11E0.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0xEB3FFFFFFFFFFFFF"      FF7FFFFF FF800000 FF7FFFFF FF800000
r 11F0.C
*Want "TBEDR O/U RZ, RP, RM 0xEB3FFFFFFFFFFFFF"               FF7FFFFF FF7FFFFF FF800000
r 1200.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0x213FFFFFE0000000"      007FFFFF 00800000 007FFFFF 00800000
r 1210.C
*Want "TBEDR O/U RZ, RP, RM 0x213FFFFFE0000000"               007FFFFF 00800000 007FFFFF
r 1220.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0xA13FFFFFE0000000"      807FFFFF 80800000 807FFFFF 80800000
r 1230.C
*Want "TBEDR O/U RZ, RP, RM 0xA13FFFFFE0000000"               807FFFFF 807FFFFF 80800000
r 1240.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0x213FFFFFA0000000"      007FFFFF 007FFFFF 007FFFFF 007FFFFF
r 1250.C
*Want "TBEDR O/U RZ, RP, RM 0x213FFFFFA0000000"               007FFFFF 00800000 007FFFFF
r 1260.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0xA13FFFFFA0000000"      807FFFFF 807FFFFF 807FFFFF 807FFFFF
r 1270.C
*Want "TBEDR O/U RZ, RP, RM 0xA13FFFFFA0000000"               807FFFFF 807FFFFF 80800000
r 1280.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0x6B3FFFFFE0000000"      7F7FFFFF 7F800000 7F7FFFFF 7F800000
r 1290.C
*Want "TBEDR O/U RZ, RP, RM 0x6B3FFFFFE0000000"               7F7FFFFF 7F800000 7F7FFFFF
r 12A0.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0xEB3FFFFFE0000000"      FF7FFFFF FF800000 FF7FFFFF FF800000
r 12B0.C
*Want "TBEDR O/U RZ, RP, RM 0xEB3FFFFFE0000000"               FF7FFFFF FF7FFFFF FF800000
r 12C0.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0x6B3FFFFFA0000000"      7F7FFFFF 7F800000 7F7FFFFF 7F800000
r 12D0.C
*Want "TBEDR O/U RZ, RP, RM 0x6B3FFFFFA0000000"               7F7FFFFF 7F800000 7F7FFFFF
r 12E0.10
*Want "TBEDR O/U RZ, RTNA, RFS, RTNE 0xEB3FFFFFA0000000"      FF7FFFFF FF800000 FF7FFFFF FF800000
r 12F0.C
*Want "TBEDR O/U RZ, RP, RM 0xEB3FFFFFA0000000"               FF7FFFFF FF7FFFFF FF800000

r 1500.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0x7EFFFFFF00000000" 00000003 00000003 00000003 00000003
r 1510.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0x7EFFFFFF00000000"          00000003 00000003 00000003
r 1520.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0xFEFFFFFF00000000" 00000003 00000003 00000003 00000003
r 1530.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0xFEFFFFFF00000000"          00000003 00000003 00000003
r 1540.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0x0010000000000000" 00000002 00000002 00000002 00000002
r 1550.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0x0010000000000000"          00000002 00000002 00000002
r 1560.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0x8010000000000000" 00000001 00000001 00000001 00000001
r 1570.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0x8010000000000000"          00000001 00000001 00000001
r 1580.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0x213FFFFFFFFFFFFF" 00000002 00000002 00000002 00000002
r 1590.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0x213FFFFFFFFFFFFF"          00000002 00000002 00000002
r 15A0.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0xA13FFFFFFFFFFFFF" 00000001 00000001 00000001 00000001
r 15B0.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0xa13FFFFFFFFFFFFF"          00000001 00000001 00000001
r 15C0.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0x6B3FFFFFFFFFFFFF" 00000003 00000003 00000003 00000003
r 15D0.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0x6B3FFFFFFFFFFFFF"          00000003 00000003 00000003
r 15E0.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0xEB3FFFFFFFFFFFFF" 00000003 00000003 00000003 00000003
r 15F0.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0xEB3FFFFFFFFFFFFF"          00000003 00000003 00000003
r 1600.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0x213FFFFFE0000000" 00000002 00000002 00000002 00000002
r 1610.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0x213FFFFFE0000000"          00000002 00000002 00000002
r 1620.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0xA13FFFFFE0000000" 00000001 00000001 00000001 00000001
r 1630.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0xA13FFFFFE0000000"          00000001 00000001 00000001
r 1640.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0x213FFFFFA0000000" 00000002 00000002 00000002 00000002
r 1650.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0x213FFFFFA0000000"          00000002 00000002 00000002
r 1660.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0xA13FFFFFA0000000" 00000001 00000001 00000001 00000001
r 1670.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0xA13FFFFFA0000000"          00000001 00000001 00000001
r 1680.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0x6B3FFFFFE0000000" 00000003 00000003 00000003 00000003
r 1690.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0x6B3FFFFFE0000000"          00000003 00000003 00000003
r 16A0.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0xEB3FFFFFE0000000" 00000003 00000003 00000003 00000003
r 16B0.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0xEB3FFFFFE0000000"          00000003 00000003 00000003
r 16C0.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0x6B3FFFFFA0000000" 00000003 00000003 00000003 00000003
r 16D0.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0x6B3FFFFFA0000000"          00000003 00000003 00000003
r 16E0.10
*Want "TBEDR O/U FPCR RZ, RTNA, RFS, RTNE 0xEB3FFFFFA0000000" 00000003 00000003 00000003 00000003
r 16F0.C
*Want "TBEDR O/U FPCR RZ, RP, RM 0xEB3FFFFFA0000000"          00000003 00000003 00000003

# Short BFP rounding test results
*Compare
r 1900.10
*Want "TBEDR Rnd RZ, RTNA, RFS, RTNE 0x412DB6DB6DB6DB6B"      4036DB6D 4036DB6E 4036DB6D 4036DB6E
r 1910.C
*Want "TBEDR Rnd RZ, RP, RM 0x412DB6DB6DB6DB6B"               4036DB6D 4036DB6E 4036DB6D
r 1920.10
*Want "TBEDR Rnd RZ, RTNA, RFS, RTNE 0xC12DB6DB6DB6DB6B"      C036DB6D C036DB6E C036DB6D C036DB6E
r 1930.C
*Want "TBEDR Rnd RZ, RP, RM 0xC12DB6DB6DB6DB6B"               C036DB6D C036DB6D C036DB6E
r 1940.10
*Want "TBEDR Rnd RZ, RTNA, RFS, RTNE 0x4180000000000001"      41000000 41000000 41000001 41000000
r 1950.C
*Want "TBEDR Rnd RZ, RP, RM 0x4180000000000001"               41000000 41000001 41000000
r 1960.10
*Want "TBEDR Rnd RZ, RTNA, RFS, RTNE 0xC180000000000001"      C1000000 C1000000 C1000001 C1000000
r 1970.C
*Want "TBEDR Rnd RZ, RP, RM 0xC180000000000001"               C1000000 C1000000 C1000001
r 1980.10
*Want "TBEDR Rnd RZ, RTNA, RFS, RTNE 0x4190000020000000"      41100000 41100000 41100001 41100000
r 1990.C
*Want "TBEDR Rnd RZ, RP, RM 0x4190000020000000"               41100000 41100001 41100000
r 19A0.10
*Want "TBEDR Rnd RZ, RTNA, RFS, RTNE 0xC190000020000000"      C1100000 C1100000 C1100001 C1100000
r 19B0.C
*Want "TBEDR Rnd RZ, RP, RM 0xC190000020000000"               C1100000 C1100000 C1100001
r 19C0.10
*Want "TBEDR Rnd RZ, RTNA, RFS, RTNE 0x41A0000060000000"      41200000 41200000 41200001 41200000
r 19D0.C
*Want "TBEDR Rnd RZ, RP, RM 0x41A0000060000000"               41200000 41200001 41200000
r 19E0.10
*Want "TBEDR Rnd RZ, RTNA, RFS, RTNE 0xC1A0000060000000"      C1200000 C1200000 C1200001 C1200000
r 19F0.C
*Want "TBEDR Rnd RZ, RP, RM 0xC1A0000060000000"               C1200000 C1200000 C1200001
r 1A00.10
*Want "TBEDR Rnd RZ, RTNA, RFS, RTNE 0x480000000B000002"      41300000 41300000 41300001 41300000
r 1A10.C
*Want "TBEDR Rnd RZ, RP, RM 0x480000000B000002"               41300000 41300001 41300000
r 1A20.10
*Want "TBEDR Rnd RZ, RTNA, RFS, RTNE 0xC80000000B000002"      C1300000 C1300000 C1300001 C1300000
r 1A30.C
*Want "TBEDR Rnd RZ, RP, RM 0xC80000000B000002"               C1300000 C1300000 C1300001

r 1B00.10
*Want "TBEDR Rnd FPCR RZ, RTNA, RFS, RTNE 0x412DB6DB6DB6DB6B" 00000002 00000002 00000002 00000002
r 1B10.C
*Want "TBEDR Rnd FPCR RZ, RP, RM 0x412DB6DB6DB6DB6B"          00000002 00000002 00000002
r 1B20.10
*Want "TBEDR Rnd FPCR RZ, RTNA, RFS, RTNE 0xC12DB6DB6DB6DB6B" 00000001 00000001 00000001 00000001
r 1B30.C
*Want "TBEDR Rnd FPCR RZ, RP, RM 0xC12DB6DB6DB6DB6B"          00000001 00000001 00000001
r 1B40.10
*Want "TBEDR Rnd FPCR RZ, RTNA, RFS, RTNE 0x4180000000000001" 00000002 00000002 00000002 00000002
r 1B50.C
*Want "TBEDR Rnd FPCR RZ, RP, RM 0x4180000000000001"          00000002 00000002 00000002
r 1B60.10
*Want "TBEDR Rnd FPCR RZ, RTNA, RFS, RTNE 0xC180000000000001" 00000001 00000001 00000001 00000001
r 1B70.C
*Want "TBEDR Rnd FPCR RZ, RP, RM 0xC180000000000001"          00000001 00000001 00000001
r 1B80.10
*Want "TBEDR Rnd FPCR RZ, RTNA, RFS, RTNE 0x4190000020000000" 00000002 00000002 00000002 00000002
r 1B90.C
*Want "TBEDR Rnd FPCR RZ, RP, RM 0x4190000020000000"          00000002 00000002 00000002
r 1BA0.10
*Want "TBEDR Rnd FPCR RZ, RTNA, RFS, RTNE 0xC190000020000000" 00000001 00000001 00000001 00000001
r 1BB0.C
*Want "TBEDR Rnd FPCR RZ, RP, RM 0xC190000020000000"          00000001 00000001 00000001
r 1BC0.10
*Want "TBEDR Rnd FPCR RZ, RTNA, RFS, RTNE 0x41A0000060000000" 00000002 00000002 00000002 00000002
r 1BD0.C
*Want "TBEDR Rnd FPCR RZ, RP, RM 0x41A0000060000000"          00000002 00000002 00000002
r 1BE0.10
*Want "TBEDR Rnd FPCR RZ, RTNA, RFS, RTNE 0xC1A0000060000000" 00000001 00000001 00000001 00000001
r 1BF0.C
*Want "TBEDR Rnd FPCR RZ, RP, RM 0xC1A0000060000000"          00000001 00000001 00000001
r 1C00.10
*Want "TBEDR Rnd FPCR RZ, RTNA, RFS, RTNE 0x480000000B000002" 00000002 00000002 00000002 00000002
r 1C10.C
*Want "TBEDR Rnd FPCR RZ, RP, RM 0x480000000B000002"          00000002 00000002 00000002
r 1C20.10
*Want "TBEDR Rnd FPCR RZ, RTNA, RFS, RTNE 0xC80000000B000002" 00000001 00000001 00000001 00000001
r 1C30.C
*Want "TBEDR Rnd FPCR RZ, RP, RM 0xC80000000B000002"          00000001 00000001 00000001

# Long BFP basic test results
*Compare
r 1D00.10
*Want "TBDR 0, 1.5"                                           00000000 00000000 3FF80000 00000000
r 1D10.10
*Want "TBDR -1.5,20/7"                                        BFF80000 00000000 4006DB6D B6DB6DB6
r 1D20.10
*Want "TBDR -20/7,8nn"                                        C006DB6D B6DB6DB6 40200000 00000000
r 1D30.8
*Want "TBDR -8nn"                                             C0200000 00000000
r 1D80.10
*Want "TBDR FPCR 0, 1.5,-1.5,20/7"                            F8000000 F8000002 F8000001 F8000002
r 1D90.C
*Want "TBDR FPCR -20/7,8nn, -8nn"                             F8000001 F8000002 F8000001


# Long BFP rounding test results
*Compare
r 2000.10
*Want "TBDR Rnd RZ, RTNA 0x412DB6DB6DB6DB6B"                  4006DB6D B6DB6DB6 4006DB6D B6DB6DB7
r 2010.10
*Want "TBDR Rnd RFS, RTNE 0x412DB6DB6DB6DB6B"                 4006DB6D B6DB6DB7 4006DB6D B6DB6DB6
r 2020.10
*Want "TBDR Rnd RZ, RP 0x412DB6DB6DB6DB6B"                    4006DB6D B6DB6DB6 4006DB6D B6DB6DB7
r 2030.8
*Want "TBDR Rnd RM 0x412DB6DB6DB6DB6B"                        4006DB6D B6DB6DB6
r 2040.10
*Want "TBDR Rnd RZ, RTNA 0xC12DB6DB6DB6DB6B"                  C006DB6D B6DB6DB6 C006DB6D B6DB6DB7
r 2050.10
*Want "TBDR Rnd RFS, RTNE 0xC12DB6DB6DB6DB6B"                 C006DB6D B6DB6DB7 C006DB6D B6DB6DB6
r 2060.10
*Want "TBDR Rnd RZ, RP 0xC12DB6DB6DB6DB6B"                    C006DB6D B6DB6DB6 C006DB6D B6DB6DB6
r 2070.8
*Want "TBDR Rnd RM 0xC12DB6DB6DB6DB6B"                        C006DB6D B6DB6DB7
r 2080.10
*Want "TBDR Rnd RZ, RTNA 0x4180000000000001"                  40200000 00000000 40200000 00000000
r 2090.10
*Want "TBDR Rnd RFS, RTNE 0x4180000000000001"                 40200000 00000001 40200000 00000000
r 20A0.10
*Want "TBDR Rnd RZ, RP 0x4180000000000001"                    40200000 00000000 40200000 00000001
r 20B0.8
*Want "TBDR Rnd RM 0x4180000000000001"                        40200000 00000000
r 20C0.10
*Want "TBDR Rnd RZ, RTNA 0xC180000000000001"                  C0200000 00000000 C0200000 00000000
r 20D0.10
*Want "TBDR Rnd RFS, RTNE 0xC180000000000001"                 C0200000 00000001 C0200000 00000000
r 20E0.10
*Want "TBDR Rnd RZ, RP 0xC180000000000001"                    C0200000 00000000 C0200000 00000000
r 20F0.8
*Want "TBDR Rnd RM 0xC180000000000001"                        C0200000 00000001
r 2100.10
*Want "TBDR Rnd RZ, RTNA 0x4490000000000004"                  40220000 00000000 40220000 00000001
r 2110.10
*Want "TBDR Rnd RFS, RTNE 0x4490000000000004"                 40220000 00000001 40220000 00000000
r 2120.10
*Want "TBDR Rnd RZ, RP 0x4490000000000004"                    40220000 00000000 40220000 00000001
r 2130.8
*Want "TBDR Rnd RM 0x4490000000000004"                        40220000 00000000
r 2140.10
*Want "TBDR Rnd RZ, RTNA 0xC490000000000004"                  C0220000 00000000 C0220000 00000001
r 2150.10
*Want "TBDR Rnd RFS, RTNE 0xC490000000000004"                 C0220000 00000001 C0220000 00000000
r 2160.10
*Want "TBDR Rnd RZ, RP 0xC490000000000004"                    C0220000 00000000 C0220000 00000000
r 2170.8
*Want "TBDR Rnd RM 0xC490000000000004"                        C0220000 00000001
r 2180.10
*Want "TBDR Rnd RZ, RTNA 0x4CA000000000000C"                  40240000 00000001 40240000 00000002
r 2190.10
*Want "TBDR Rnd RFS, RTNE 0x4CA000000000000C"                 40240000 00000001 40240000 00000002
r 21A0.10
*Want "TBDR Rnd RZ, RP 0x4CA000000000000C"                    40240000 00000001 40240000 00000002
r 21B0.8
*Want "TBDR Rnd RM 0x4CA000000000000C"                        40240000 00000001
r 21C0.10
*Want "TBDR Rnd RZ, RTNA 0xCCA000000000000C"                  C0240000 00000001 C0240000 00000002
r 21D0.10
*Want "TBDR Rnd RFS, RTNE 0xCCA000000000000C"                 C0240000 00000001 C0240000 00000002
r 21E0.10
*Want "TBDR Rnd RZ, RP 0xCCA000000000000C"                    C0240000 00000001 C0240000 00000001
r 21F0.8
*Want "TBDR Rnd RM 0xCCA000000000000C"                        C0240000 00000002


r 2400.10
*Want "TBDR Rnd FPCR RZ, RTNA, RFS, RTNE 0x412DB6DB6DB6DB6B"  00000002 00000002 00000002 00000002
r 2410.C
*Want "TBDR Rnd FPCR RZ, RP, RM 0x412DB6DB6DB6DB6B"           00000002 00000002 00000002
r 2420.10
*Want "TBDR Rnd FPCR RZ, RTNA, RFS, RTNE 0xC12DB6DB6DB6DB6B"  00000001 00000001 00000001 00000001
r 2430.C
*Want "TBDR Rnd FPCR RZ, RP, RM 0xC12DB6DB6DB6DB6B"           00000001 00000001 00000001
r 2440.10
*Want "TBDR Rnd FPCR RZ, RTNA, RFS, RTNE 0x4180000000000001"  00000002 00000002 00000002 00000002
r 2450.C
*Want "TBDR Rnd FPCR RZ, RP, RM 0x4180000000000001"           00000002 00000002 00000002
r 2460.10
*Want "TBDR Rnd FPCR RZ, RTNA, RFS, RTNE 0xC180000000000001"  00000001 00000001 00000001 00000001
r 2470.C
*Want "TBDR Rnd FPCR RZ, RP, RM 0xC180000000000001"           00000001 00000001 00000001
r 2480.10
*Want "TBDR Rnd FPCR RZ, RTNA, RFS, RTNE 0x4490000000000004"  00000002 00000002 00000002 00000002
r 2490.C
*Want "TBDR Rnd FPCR RZ, RP, RM 0x4490000000000004"           00000002 00000002 00000002
r 24A0.10
*Want "TBDR Rnd FPCR RZ, RTNA, RFS, RTNE 0xC490000000000004"  00000001 00000001 00000001 00000001
r 24B0.C
*Want "TBDR Rnd FPCR RZ, RP, RM 0xC490000000000004"           00000001 00000001 00000001
r 24C0.10
*Want "TBDR Rnd FPCR RZ, RTNA, RFS, RTNE 0x4CA000000000000C"  00000002 00000002 00000002 00000002
r 24D0.C
*Want "TBDR Rnd FPCR RZ, RP, RM 0x4CA000000000000C"           00000002 00000002 00000002
r 24E0.10
*Want "TBDR Rnd FPCR RZ, RTNA, RFS, RTNE 0xCCA000000000000C"  00000001 00000001 00000001 00000001
r 24F0.C
*Want "TBDR Rnd FPCR RZ, RP, RM 0xCCA000000000000C"           00000001 00000001 00000001


*Done

