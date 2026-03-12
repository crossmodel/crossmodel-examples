# CrossModel Example repository
This example integrates [DBT Fusion](https://docs.getdbt.com/docs/fusion) into CrossModel.
DBT is configured to use DuckDB to load the data locally, based on the [DBT Fusion DuckDB adapter demo](https://github.com/dimasgonzales/dbt-fusion-duckdb-demo).

# Requirements
* DBT Fusion
* DBT VSCode extension
* DuckDB

# Generation
You can use the entity model template to generate the DBT model files using CrossGenerate.
<img width="1980" height="522" alt="image" src="https://github.com/user-attachments/assets/5035f6a5-65a9-4254-b4fc-01d6988a7ede" />

You can also generate empty csv-files to be used as seeds for DBT. There is a small example csv in the 'seeds example' folder.
<img width="1993" height="514" alt="image" src="https://github.com/user-attachments/assets/20d86185-385c-4627-8b2c-a73c7aed82b1" />

# Usage
* Navigate to the DBT directory (~/crossmodel-examples/dbt/BrightGreen)
* Run 'dbt seed' to load the csv-files.
<img width="656" height="324" alt="image" src="https://github.com/user-attachments/assets/0c7e5788-82cc-419f-8297-def5d2e5e88b" />

* Now you can run 'dbt build' to load the seeds into the DuckDB demo database.
<img width="648" height="492" alt="image" src="https://github.com/user-attachments/assets/d0ebdec2-cbdb-446a-9974-2485ae6fc696" />

The data is now loaded in DuckDB.
