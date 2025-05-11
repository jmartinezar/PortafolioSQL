DATABASE = sales_db.db

QUERY = bin/Querys.sql

all: init_db run_query
	@echo "The process has been completed"

init_db:
	sqlite3 $(DATABASE) < include/scheme.sql
	sqlite3 $(DATABASE) < include/data_import.sql
	sqlite3 $(DATABASE) < include/verify_data.sql

run_query:
	sqlite3 $(DATABASE) < $(QUERY)

clean:
	rm -f $(DATABASE)