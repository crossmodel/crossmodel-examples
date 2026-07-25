# CrossModel dbt Example

This repository demonstrates how [CrossModel](https://www.crossmodel.io/) generates a complete [dbt](https://www.getdbt.com/) data pipeline from visual data models. It uses the fictional **BrightGreen** company as an example, with two source systems feeding into a data warehouse, all running locally on [DuckDB](https://duckdb.org/).

## How It Works

This repository is used across two environments:

1. **Modeling environment (CrossModel)** -- A data modeller defines entities and mappings in CrossModel. An engineer creates Nunjucks templates, runs code generation to produce dbt SQL models, and commits the results to this repository.
2. **Execution environment (dbt + DuckDB)** -- A data engineer or analyst pulls the latest changes from the repository and runs `dbtf seed` and `dbtf build` to materialize the pipeline in DuckDB.

This separation allows the modeling team to work in CrossModel without needing dbt installed, while the execution team runs dbt without needing CrossModel. The repository is the handoff point between the two.

### Data Flow
CrossModel generates the following dbt datapipeline based on the modelled entities and mappings:

```text
CSV Seeds  -->  Source Models  -->  Mapping Models  -->  DWH Tables
(raw data)      (views)            (transformations)     (final output)
```

**Example:** The `Customer` entity from the JuiceERP source system flows through a mapping that concatenates `FirstName` and `LastName` into a `FullName`, producing the `CustomerFullName` DWH table.

### Repository Structure

```text
BrightGreen/                        # CrossModel project
  Sources/                          #   Source system definitions (.cm files)
    JuiceERP/                       #     Sales/ERP: Customer, Product, SalesOrder, ...
    PreciseFinance/                 #     Finance: Debtor, Invoice, InvoiceLine
  ExampleDwh/                       #   Data warehouse definitions
    entities/                       #     DWH entities (CustomerFullName, ...)
    mappings/                       #     Transformation mappings (source -> DWH)

BrightGreen/Generation/Templates/dbt/  # Code generation templates
  source_entity_model.sql           #   Template for source layer models
  entity_mapping.sql                #   Template for mapping layer models
  dwh_entity_model.sql              #   Template for DWH layer models
  empty_seed.csv                    #   Template for empty CSV seed files

dbt/BrightGreen/                    # Generated dbt project
  models/source/                    #   Generated source models (views)
  models/mapping/                   #   Generated mapping models (views)
  models/dwh/                       #   Generated DWH models (tables)
  seeds/                            #   CSV seed files with data to ingest
```

## Prerequisites

Depending on which environment you are working in, you need different tools:

| | Modeling environment | Execution environment |
|---|---|---|
| **Tools** | [CrossModel](https://www.crossmodel.io/) | [dbt Fusion](https://docs.getdbt.com/docs/fusion), [DuckDB](https://duckdb.org/) |
| **Who** | Data modeller | Data engineer / analyst |
| **What** | Define models, generate dbt code, commit | Pull changes, run dbt, query results |

You can install the dbt Fusion and the VS code extension by following the official [instructions](https://docs.getdbt.com/docs/local/install-dbt?version=2.0#get-started). You can install duckdb and the dbt adapter using python:

```bash
pip install dbt-duckdb
```

## Modeling: Define and Generate

### 1. Explore the Data Model

Open the project in the CrossModel environment. Browse the `.cm` files under `BrightGreen/` to see the source entities, DWH entities, and mappings that define the data architecture.

### 2. Generate dbt Models

Use the CrossGenerate feature in CrossModel to generate dbt SQL and seed files from the templates. For the example templates, you can use the Nunjucks engine.

### 3. Commit and Push

After generation, commit the updated dbt models and seed files to the repository. The `dbt/BrightGreen/` directory now contains everything the execution environment needs -- no CrossModel installation required.

## Execution: Run dbt

In a separate environment where dbt Fusion and DuckDB are installed, pull the latest changes from the repository.

### 4. Load Sample Data

You can add sample data to the CSV files in `dbt/BrightGreen/seeds/`. A small example is provided in `seeds_example/` for reference, which you can copy to the `dbt/BrightGreen/seeds/` directory.

### 5. Run dbt

Follow to procedures of the dbt fusion extension to login with your dbt account. You can register a free account at the [dbt website](https://www.getdbt.com/signup) 
You can use the command 'dbt' or 'dbtf' depending on how you configured your environment variables. 
Navigate to the dbt project directory and run:

```bash
cd dbt/BrightGreen

# Load the CSV seed data into DuckDB
dbtf seed

# Build all models (source views, mapping views, DWH tables)
dbtf build
```

### 6. Query the Results

The data is now in DuckDB, and you should see tables such as `customerfullname` in the database. You can query it directly:

```bash
python query_duckdb.py
```

This results in the full customer names as defined in the seed file.
Or connect to `demo.duckdb` with any DuckDB client and run:

```sql
SELECT * FROM demo.customerfullname;
```

## Customization

- **Materialization:** The dbt project is configured in `dbt_project.yml` to materialize source and mapping models as views, and DWH models as tables. Adjust this to fit your needs.
- **Add entities:** Define new source, DWH entities or mappings as `.cm` files, then re-run code generation to produce the corresponding dbt models.
- **Templates:** The Nunjucks templates in `BrightGreen/Generation/Templates/dbt/` can be modified to change the generated SQL patterns.
