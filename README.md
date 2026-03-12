# CrossModel Example repository
This example integrates [DBT Fusion](https://docs.getdbt.com/docs/fusion) into CrossModel.

# Requirements
* DBT Fusion
* DBT extension
* DuckDB
* [DBT Fusion DuckDB adapter](https://github.com/dimasgonzales/dbt-fusion-duckdb-demo)

# Generation
You can use the entity model template to generate the DBT model files using CrossGenerate.
<img width="1989" height="522" alt="image" src="https://github.com/user-attachments/assets/da04a3c6-6e9d-403f-9732-67a7a01a693e" />

You can also generate empty csv-files to be used as seeds for DBT. There is a small example csv in the 'seeds example' folder.
<img width="1993" height="514" alt="image" src="https://github.com/user-attachments/assets/20d86185-385c-4627-8b2c-a73c7aed82b1" />

# Usage
* Navigate to the DBT directory (~/crossmodel-examples/dbt/BrightGreen)
* Run 'dbt seed' to load the csv-files.
<img width="656" height="324" alt="image" src="https://github.com/user-attachments/assets/0c7e5788-82cc-419f-8297-def5d2e5e88b" />

* Now you can run 'dbt build' to load the seeds into the DuckDB demo database.
<img width="676" height="319" alt="image" src="https://github.com/user-attachments/assets/11066fed-58f0-4465-975e-caf872620ea3" />
