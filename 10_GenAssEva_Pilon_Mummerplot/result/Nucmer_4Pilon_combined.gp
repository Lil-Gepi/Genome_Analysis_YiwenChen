set terminal png tiny size 800,800
set output "Nucmer_4Pilon_combined.png"
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
 "*tig00000001_pilon" 1.0, \
 "tig00000013_pilon" 2775723.0, \
 "tig00000004_pilon" 2785518.0, \
 "*tig00000010_pilon" 3009485.0, \
 "*tig00000006_pilon" 3037954.0, \
 "tig00000011_pilon" 3055912.0, \
 "*tig00000007_pilon" 3081014.0, \
 "tig00000009_pilon" 3121030.0, \
 "tig00000008_pilon" 3138141.0, \
 "" 3153758 \
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
set yrange [1:3153758]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "Nucmer_4Pilon_combined.fplot" title "FWD" w lp ls 1, \
 "Nucmer_4Pilon_combined.rplot" title "REV" w lp ls 2
