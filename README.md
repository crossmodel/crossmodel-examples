# CrossModel Snowflake Example

This repository demonstrates how [CrossModel](https://www.crossmodel.io/) generates a complete Snowflake SQL pipeline from visual data models. It uses the fictional **BrightGreen** company as an example, with two source systems feeding into a data warehouse running on [Snowflake](https://www.snowflake.com/).

## How It Works

This repository is used across two environments:

1. **Modeling environment (CrossModel)** -- A data modeller defines entities and mappings in CrossModel. An engineer creates Nunjucks templates, runs code generation to produce Snowflake SQL, and commits the results to this repository.
2. **Execution environment (Snowflake)** -- A data engineer uploads the generated SQL files to their Snowflake workspace and runs them to materialize the pipeline.

This separation allows the modeling team to work in CrossModel without needing access to Snowflake, while the execution team runs SQL without needing CrossModel. The repository is the handoff point between the two.

### Data Flow

CrossModel generates the following Snowflake pipeline based on the modelled entities and mappings:

```text
Source Tables  -->  Entity Mappings  -->  DWH Tables
(raw data)         (transformations)      (final output)
```

**Example:** The `Customer` entity from the JuiceERP source system flows through a mapping that concatenates `FirstName` and `LastName` into a `FullName`, producing the `CustomerFullName` DWH table.

### Repository Structure

```text
BrightGreen/                            # CrossModel project
  Sources/                              #   Source system definitions (.cm files)
    JuiceERP/                           #     Sales/ERP: Customer, Product, SalesOrder, ...
    PreciseFinance/                     #     Finance: Debtor, Invoice, InvoiceLine
  ExampleDwh/                           #   Data warehouse definitions
    entities/                           #     DWH entities (CustomerFullName, ...)
    mappings/                           #     Transformation mappings (source -> DWH)
  target/                               #   Generated Snowflake SQL (upload this to Snowflake)
    source_entities/                    #     Source table DDL
    entity_mappings/                    #     Mapping/transformation SQL
    dwh_entities/                       #     DWH table DDL
    load_procedures/                    #     Stored procedures to load data

CrossGenerate/template/                 # Code generation templates (Nunjucks)
  source_entity_model.sql               #   Template for source layer tables
  entity_mapping.sql                    #   Template for mapping layer
  dwh_entity_model.sql                  #   Template for DWH layer tables
  load_procedure.sql                    #   Template for load stored procedures

Snowflake/                              # Snowflake utility scripts
  setup.sql                             #   One-time database and schema setup
  sample_data.sql                       #   Sample data for testing
  run_load_procedure.sql                #   Executes the load procedure
```

## Prerequisites

Depending on which environment you are working in, you need different tools:

| | Modeling environment | Execution environment |
| --- | --- | --- |
| **Tools** | [CrossModel](https://www.crossmodel.io/) | Snowflake workspace |
| **Who** | Data modeller / engineer | Data engineer / analyst |
| **What** | Define models, generate SQL, commit | Upload SQL, run scripts, query results |

If you don't have a Snowflake account yet, you can register for a 30-day free trial at [signup.snowflake.com](https://signup.snowflake.com/). Choose any cloud provider and region. Once your account is active, open a worksheet in the [Snowflake web UI](https://app.snowflake.com/) to run the SQL files in this repository.

## Modeling: Define and Generate

### 1. Explore the Data Model

Open the project in CrossModel. Browse the `.cm` files under `BrightGreen/Sources/` and `BrightGreen/ExampleDwh/` to see the source entities, DWH entities, and mappings that define the data architecture.

### 2. Generate Snowflake SQL

Use the CrossGenerate feature in CrossModel to generate Snowflake SQL from the Nunjucks templates in `CrossGenerate/template/`. The generated files are written to `BrightGreen/target/`.

### 3. Commit and Push

After generation, commit the updated SQL files to the repository. The `BrightGreen/target/` directory now contains everything the execution environment needs -- no CrossModel installation required.

## Execution: Run in Snowflake

### 4. Upload Files to Snowflake

Upload the following folders to your Snowflake workspace:

- `BrightGreen/target/`
- `Snowflake/`

### 5. Run Setup

Run `Snowflake/setup.sql` once to create the `CrossModel` database and its schemas (`dwh` and `SourceVault`).

### 6. Run the Generated SQL Files

Execute the generated SQL files in the following order:

1. **Source table files** -- `BrightGreen/target/source_entities/`
2. **DWH table files** -- `BrightGreen/target/dwh_entities/`
3. **Mapping files** -- `BrightGreen/target/entity_mappings/`
4. **Load procedure files** -- `BrightGreen/target/load_procedures/`

### 7. Load Sample Data

Load sample data into your tables. You can run `Snowflake/sample_data.sql` to insert sample records into the source table Customer.

### 8. Run the Load Procedure

Run `Snowflake/run_load_procedure.sql` to execute the stored procedure that transforms and loads data into the DWH layer. Then verify the result:

```sql
SELECT * FROM CustomerFullName;
```

You should see the full customer names as defined in the sample data.

## Customization

- **Add entities:** Define new source or DWH entities and mappings as `.cm` files in CrossModel, then re-run code generation to produce the corresponding SQL files.
- **Templates:** The Nunjucks templates in `CrossGenerate/template/` can be modified to change the generated SQL patterns.
- **Sample data:** Extend `Snowflake/sample_data.sql` with additional rows to test more scenarios.

## Documentation

This example is written up in the CrossModel knowledge base, with the background and
context that does not belong in a README:

  **[Generating Snowflake SQL](https://www.crossmodel.io/knowledgebase/examples/generating-snowflake-sql/)**

See [Examples](https://www.crossmodel.io/knowledgebase/examples/) for the other ready-made workspaces.
