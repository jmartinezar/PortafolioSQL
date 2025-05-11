set terminal pdfcairo enhanced
set output 'figures/bar_plot.pdf'
set key under nobox
set style fill solid noborder
set style data histogram
set style histogram rowstacked
set boxwidth 0.6 relative
set grid y
set xtics rotate by -45
set key autotitle columnhead font "Arial,14"
set xtics font "Arial,12"
set ytics font "Arial,12"
set datafile separator "," 
set title "Sales by Country and Month" font "Arial,18"

colors = "#66c2a5 #fc8d62 #8da0cb #e78ac3 #a6d854"

plot for[i=2:6] "sales_for_country_month.csv" u i:xtic(1) lc rgb word(colors, i-1) fc rgb word(colors, i-1)