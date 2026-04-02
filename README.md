# CrossModel dbt Example

This repository demonstrates how [CrossModel](https://www.crossmodel.io/) generates a complete [dbt](https://www.getdbt.com/) data pipeline from visual data models. It uses the fictional **BrightGreen** company as an example, with two source systems feeding into a data warehouse, all running locally on [DuckDB](https://duckdb.org/).

## How It Works

This repository is used across two environments:

1. **Modeling environment (CrossModel)** -- A data modeller defines entities and mappings in CrossModel. An engineer creates Nunjucks templates, runs code generation to produce dbt SQL models, and commits the results to this repository.
2. **Execution environment (dbt + DuckDB)** -- A data engineer or analyst pulls the latest changes from the repository and runs `dbt seed` and `dbt build` to materialize the pipeline in DuckDB.

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

CrossGenerate/templates/            # Code generation templates
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

Use the CrossGenerate feature in CrossModel to generate dbt SQL files from the templates. There are four generation steps:

**Source models** -- Generate one SQL model per source entity. These create views that select from the raw CSV seeds.The source views are written to the dbt folder `dbt/BrightGreen/models/source/`.

<img width="1558" height="521" alt="Generate source models" src="https://github.com/user-attachments/assets/0262fac6-87c0-421c-aca6-40a0a25a76d5" />

**Seed files** -- Generate empty CSV files with the correct column headers for each source entity.  They are written to `dbt/BrightGreen/seeds/`

<img width="1554" height="518" alt="Generate seed files" src="https://github.com/user-attachments/assets/cb4af623-d167-4ec2-8aea-f4879ac88075" />

**Mapping models** -- Generate the transformation logic that maps source data to DWH entities (joins, expressions, aggregations). The mappings are written to the dbt folder `dbt/BrightGreen/models/mapping/`.

<img width="1545" height="517" alt="Generate mapping models" src="https://github.com/user-attachments/assets/783f69bf-99cf-4bf4-98d5-33e2d610da85" />

**DWH models** -- Generate the final DWH layer models that reference the mappings. The files are written to `dbt/BrightGreen/models/dwh/`.

<img width="1551" height="521" alt="Generate DWH models" src="https://github.com/user-attachments/assets/b2938a97-3934-481e-830b-19b400d6bd1c" />

### 3. Commit and Push

After generation, commit the updated dbt models and seed files to the repository. The `dbt/BrightGreen/` directory now contains everything the execution environment needs -- no CrossModel installation required.

## Execution: Run dbt

In a separate environment where dbt Fusion and DuckDB are installed, pull the latest changes from the repository.

### 4. Load Sample Data

Add sample data to the CSV files in `dbt/BrightGreen/seeds/`. A small example is provided in `seeds_example/` for reference.

### 5. Run dbt

Navigate to the dbt project directory and run:

```bash
cd dbt/BrightGreen

# Load the CSV seed data into DuckDB
dbt seed
```

<img width="869" height="333" alt="dbt seed output" src="https://github.com/user-attachments/assets/0a1f580c-c335-4bf2-ae0d-a119bd062bb6" />

```bash
# Build all models (source views, mapping views, DWH tables)
dbt build
```

<img width="735" height="490" alt="dbt build output" src="https://github.com/user-attachments/assets/1a29178b-0bb5-468f-ac97-7920538299a2" />

### 6. Query the Results

The data is now in DuckDB, and you should see tables such as `customerfullname` in the database. You can query it directly:

```bash
python query_duckdb.py
```

<img width="427" height="34" alt="Query result" src="https://github.com/user-attachments/assets/8f5f856e-9b66-4867-a603-82da206af69a" />

Or connect to `demo.duckdb` with any DuckDB client and run:

```sql
SELECT * FROM demo.customerfullname;
```

## Customization

- **Materialization:** The dbt project is configured in `dbt_project.yml` to materialize source and mapping models as views, and DWH models as tables. Adjust this to fit your needs.
- **Add entities:** Define new source, DWH entities or mappings as `.cm` files, then re-run code generation to produce the corresponding dbt models.
- **Templates:** The Nunjucks templates in `CrossGenerate/templates/` can be modified to change the generated SQL patterns.
