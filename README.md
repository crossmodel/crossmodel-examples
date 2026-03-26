# CrossModel Example repository
This example integrates [DBT Fusion](https://docs.getdbt.com/docs/fusion) into CrossModel.
DBT is configured to use DuckDB to load the data locally, based on the [DBT Fusion DuckDB adapter demo](https://github.com/dimasgonzales/dbt-fusion-duckdb-demo).

# Requirements
* DBT Fusion
* DBT VSCode extension
* DuckDB

# Generation
You can use the entity model template to generate the DBT model files using CrossGenerate. Source model files should go to the BrightGreen/models/source folder. The DWH models are not needed here, and are generated separately.
<img width="1558" height="521" alt="image" src="https://github.com/user-attachments/assets/0262fac6-87c0-421c-aca6-40a0a25a76d5" />

You can also generate empty csv-files to be used as seeds for the source models. There is a small example csv in the 'seeds example' folder, which can be used to load data in the DuckDB database.
<img width="1554" height="518" alt="image" src="https://github.com/user-attachments/assets/cb4af623-d167-4ec2-8aea-f4879ac88075" />

Generate the mappings, and separately the DWH entities which depend on these mappings.
<img width="1545" height="517" alt="image" src="https://github.com/user-attachments/assets/783f69bf-99cf-4bf4-98d5-33e2d610da85" />
<img width="1551" height="521" alt="image" src="https://github.com/user-attachments/assets/b2938a97-3934-481e-830b-19b400d6bd1c" />

# Usage
* Navigate to the DBT directory (~/crossmodel-examples/dbt/BrightGreen)
* You can configure DBT as you like, for example wether you want to materialize the data as table or as views.
* Run 'dbt seed' to load the csv-files.
<img width="869" height="333" alt="image" src="https://github.com/user-attachments/assets/0a1f580c-c335-4bf2-ae0d-a119bd062bb6" />

* Now you can run 'dbt build' to load the seeds into the DuckDB demo database.
<img width="735" height="490" alt="image" src="https://github.com/user-attachments/assets/1a29178b-0bb5-468f-ac97-7920538299a2" />

The data is now loaded in DuckDB. You can query the DuckDB database to see the data loaded in the DWH table.
<img width="427" height="34" alt="image" src="https://github.com/user-attachments/assets/8f5f856e-9b66-4867-a603-82da206af69a" />

