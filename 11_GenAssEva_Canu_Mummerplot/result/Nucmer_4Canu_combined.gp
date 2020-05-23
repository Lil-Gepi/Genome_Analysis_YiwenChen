set terminal png tiny size 800,800
set output "Nucmer_4Canu_combined.png"
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
 "*tig00000001" 1.0, \
 "tig00000013" 2775628.0, \
 "tig00000004" 2785414.0, \
 "*tig00000010" 3009357.0, \
 "*tig00000006" 3037818.0, \
 "tig00000011" 3055771.0, \
 "*tig00000007" 3080861.0, \
 "tig00000009" 3120876.0, \
 "tig00000008" 3137981.0, \
 "" 3153598 \
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
set yrange [1:3153598]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "Nucmer_4Canu_combined.fplot" title "FWD" w lp ls 1, \
 "Nucmer_4Canu_combined.rplot" title "REV" w lp ls 2
