DATABASE = sales_db.db

DATAFILES = data/AGENTS.csv \
			data/CUSTOMER.csv \
			data/ORDERS.csv

INIT_QUERIES = include/scheme.sql \
			include/data_import.sql \
			include/verify_data.sql

QUERY = bin/sales_for_agent.sql

PLOT_DATA = sales_for_country_month.csv

PLOT_SCRIPT = bin/bar_plot.gp

PLOT = figures/bar_plot.pdf

REPORT_SCRIPT = report/report.tex

REPORT = report.pdf

all: init_db report.pdf
	@echo "The process has been completed"

init_db: $(DATAFILES) $(INIT_QUERIES)
	sqlite3 $(DATABASE) < include/scheme.sql
	sqlite3 $(DATABASE) < include/data_import.sql
	sqlite3 $(DATABASE) < include/verify_data.sql

$(PLOT_DATA): $(DATABASE) $(QUERY)
	sqlite3 $(DATABASE) < $(QUERY)

$(PLOT): $(PLOT_SCRIPT) $(PLOT_DATA)
	gnuplot $(PLOT_SCRIPT)

$(REPORT): $(PLOT) $(REPORT_SCRIPT)
	pdflatex $(REPORT_SCRIPT)
	pdflatex $(REPORT_SCRIPT)
	pdflatex $(REPORT_SCRIPT)

clean:
	rm -f $(DATABASE) $(PLOT_DATA) $(PLOT) *.aux *.log