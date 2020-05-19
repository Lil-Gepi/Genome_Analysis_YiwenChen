set terminal png tiny size 800,800
set output "Nucmer_4Spades.png"
set xtics rotate ( \
 "NZ_CP014529.1" 1.0, \
 "NZ_CP014534.1" 2765010.0, \
 "NZ_CP014530.1" 2820176.0, \
 "NZ_CP014535.1" 3043863.0, \
 "NZ_CP014531.1" 3109420.0, \
 "NZ_CP014533.1" 3141842.0, \
 "NZ_CP014532.1" 3159095.0, \
 "" 3168410 \
)
set ytics ( \
 "*NODE_38_length_110_cov_26.145455" 1.0, \
 "NODE_40_length_109_cov_34.500000" 110.0, \
 "NODE_16_length_1429_cov_27.793304" 218.0, \
 "NODE_1_length_986763_cov_43.494015" 1646.0, \
 "*NODE_42_length_107_cov_27.942308" 988408.0, \
 "NODE_5_length_164595_cov_65.919916" 988514.0, \
 "NODE_18_length_519_cov_32.366379" 1153108.0, \
 "*NODE_12_length_5232_cov_70.113772" 1153626.0, \
 "*NODE_19_length_352_cov_38.013468" 1158857.0, \
 "NODE_20_length_341_cov_30.041958" 1159208.0, \
 "NODE_2_length_840748_cov_42.698417" 1159548.0, \
 "NODE_34_length_112_cov_52.877193" 2000295.0, \
 "NODE_6_length_150922_cov_42.321628" 2000406.0, \
 "NODE_7_length_88799_cov_43.513274" 2151327.0, \
 "*NODE_32_length_118_cov_31.507937" 2240125.0, \
 "*NODE_28_length_161_cov_67.075472" 2240242.0, \
 "*NODE_26_length_187_cov_34.416667" 2240402.0, \
 "*NODE_37_length_111_cov_42.196429" 2240588.0, \
 "*NODE_30_length_128_cov_31.561644" 2240698.0, \
 "NODE_22_length_234_cov_33.156425" 2240825.0, \
 "*NODE_36_length_112_cov_28.438596" 2241058.0, \
 "NODE_39_length_109_cov_36.462963" 2241169.0, \
 "*NODE_29_length_134_cov_28.455696" 2241277.0, \
 "*NODE_23_length_224_cov_32.189349" 2241410.0, \
 "*NODE_31_length_126_cov_32.957746" 2241633.0, \
 "*NODE_33_length_113_cov_28.155172" 2241758.0, \
 "NODE_3_length_500609_cov_47.960903" 2241870.0, \
 "*NODE_4_length_266941_cov_102.662627" 2742478.0, \
 "*NODE_13_length_5228_cov_42.845544" 3009418.0, \
 "*NODE_21_length_261_cov_31.368932" 3014645.0, \
 "*NODE_41_length_109_cov_27.870370" 3014905.0, \
 "*NODE_8_length_62897_cov_74.024920" 3015013.0, \
 "NODE_9_length_31334_cov_224.503597" 3077909.0, \
 "*NODE_24_length_197_cov_121.774648" 3109242.0, \
 "NODE_17_length_886_cov_350.894103" 3109438.0, \
 "NODE_10_length_12383_cov_107.950438" 3110323.0, \
 "NODE_11_length_9325_cov_146.068608" 3122705.0, \
 "NODE_48_length_62_cov_3.000000" 3132029.0, \
 "NODE_51_length_59_cov_373.750000" 3132090.0, \
 "NODE_27_length_174_cov_47.050420" 3132148.0, \
 "NODE_49_length_62_cov_1.428571" 3132321.0, \
 "NODE_14_length_3460_cov_267.035242" 3132382.0, \
 "NODE_43_length_95_cov_28.800000" 3135841.0, \
 "NODE_15_length_3214_cov_234.269706" 3135935.0, \
 "NODE_44_length_80_cov_144.920000" 3139148.0, \
 "NODE_47_length_73_cov_247.777778" 3139227.0, \
 "NODE_25_length_194_cov_70.956835" 3139299.0, \
 "NODE_35_length_112_cov_40.964912" 3139492.0, \
 "NODE_50_length_59_cov_406.000000" 3139603.0, \
 "NODE_46_length_73_cov_616.555556" 3139661.0, \
 "NODE_52_length_56_cov_68.000000" 3139733.0, \
 "NODE_45_length_77_cov_30.727273" 3139788.0, \
 "" 3139915 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "REF"
set ylabel "QRY"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
if(GPVAL_VERSION < 5) { set mouse clipboardformat "[%.0f, %.0f]" }
set xrange [1:3168410]
set yrange [1:3139915]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "Nucmer_4Spades.fplot" title "FWD" w lp ls 1, \
 "Nucmer_4Spades.rplot" title "REV" w lp ls 2
