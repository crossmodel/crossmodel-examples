# CrossModel Fabric Example

This repository demonstrates how [CrossModel](https://www.crossmodel.io/) generates a complete Microsoft Fabric pipeline and SQL objects from visual data models. It uses the fictional **BrightGreen** company as an example, with two source systems feeding into a data warehouse running on [Microsoft Fabric](https://www.microsoft.com/en-us/microsoft-fabric).

## How It Works

This repository is used across two environments:

1. **Modeling environment (CrossModel)** -- A data modeller defines entities and mappings in CrossModel. An engineer maintains Nunjucks templates and runs code generation to produce Fabric SQL and a Fabric pipeline definition, then commits the results to this repository.
2. **Execution environment (Microsoft Fabric)** -- Before generation, a data engineer creates an (empty) Data pipeline in the target Fabric workspace and fills in its connection settings and object GUIDs (workspace, lakehouse, SQL database, external connection, pipeline, ...) in the `pipeline.json` template. After generation, the engineer loads the generated `pipeline.json` into that Fabric pipeline using the **Edit JSON** button, and loads the generated SQL tables, views, procedures and seed files into a Fabric Warehouse or Lakehouse.

This separation allows the modeling team to work in CrossModel without needing access to Fabric, while the execution team runs the pipeline and SQL without needing CrossModel. The repository is the handoff point between the two.

### Data Flow

CrossModel generates the following Fabric pipeline and SQL objects based on the modelled entities and mappings:

```text
Seed Files       Staging Tables     SourceVault Tables    DWH View + Procedure    DWH Tables
(Lakehouse)  -->  (Copy activity)  -->  (Fabric SQL DB)  -->  (transformation)  -->  (final output)
```

The seed csv files can be uploaded to the lakehouse. The Fabric pipeline creates and loads the staging tables from the seed files, where the incoming data is represented in a load-friendly form. CrossGenerate generates the SourceVault tables, which sprovide the modeled source-system schema and datatypes before the data is transformed into the DWH layer. You can deploy and run the load procedures in the Fabric datawarehouse to map the data to the final output.
**Example:** The `Customer` and `SalesOrder` entities from the JuiceERP source system are copied by the generated pipeline into `staging`, then into `SourceVault`. A generated view and load procedure then join and aggregate them into the `CustomerWithOrderCount` DWH table.

## Prerequisites

Depending on which environment you are working in, you need different tools:

| | Modeling environment | Execution environment |
| --- | --- | --- |
| **Tools** | [CrossModel](https://www.crossmodel.io/) | Microsoft Fabric workspace (Lakehouse, SQL database/Warehouse, Data pipeline) |
| **Who** | Data modeller / engineer | Data engineer / analyst |
| **What** | Define models, generate SQL and pipeline, commit | Configure the pipeline, load SQL and seed data, run the pipeline |

If you don't have a Fabric workspace yet, you can start a [Microsoft Fabric free trial](https://www.microsoft.com/en-us/microsoft-fabric/getting-started) and create a workspace containing a Lakehouse and a Fabric SQL database (or Warehouse).

## Modeling: Define and Generate

### 1. Explore the Data Model

Open the project in CrossModel. Browse the model files under `BrightGreen/Sources/` and `BrightGreen/ExampleDwh/` to see the source entities, DWH entities, and mappings that define the data architecture.

### 2. Create the Fabric Pipeline and Fill in Connection Settings

Before generating, create an (empty) Data pipeline in your Fabric workspace. Note the GUIDs of the workspace, the Lakehouse holding the seed files, and the Fabric SQL database/Warehouse, and fill them in -- together with the pipeline's own GUID -- into the `CONNECTION SETTINGS` block at the top of `CrossGenerate/template/pipeline.json`.

### 3. Generate Fabric SQL and Pipeline

Use the CrossGenerate feature in CrossModel to generate SQL and the pipeline definition from the templates in `CrossGenerate/template/`, based on the `ExampleDwh` data warehouse model. The generated files are written to `CrossGenerate/target/`. The pipeline contains all source entities required by the mappings of the chosen datawarehouse. 

### 4. Commit and Push

After generation, commit the updated files to the repository. The `CrossGenerate/target/` directory now contains everything the execution environment needs -- no CrossModel installation required.

## Execution: Run in Microsoft Fabric

### 5. Run Setup

Run `Fabric/setup.sql` against your Fabric SQL database/Warehouse once to create the `SourceVault`, `staging` and `dwh` schemas.

### 6. Run the Generated SQL Files

Execute the generated SQL files in the following order:

1. **Source table files** -- `CrossGenerate/target/source_entities/`
2. **DWH table files** -- `CrossGenerate/target/dwh_entities/`
3. **Mapping/view files** -- `CrossGenerate/target/entity_mappings/`
4. **Load procedure files** -- `CrossGenerate/target/load_procedures/`

Execute the generated queries in your Fabric datawarehouse to deploy the tables.

### 7. Load the Pipeline into Fabric

Open the Data pipeline you created in step 2 and use the **Edit JSON** button to load the generated `CrossGenerate/target/pipeline.json`.

### 8. Load Seed Data

Upload seed CSV files into the Lakehouse's `Files/seeds/` folder, named `seed_<entity>.csv` as expected by the pipeline. The empty seed templates in `CrossGenerate/target/seeds/` show the expected columns per entity; `Fabric/example_seed.csv` shows example data for the `Customer` entity.

### 9. Run the Pipeline

Run the pipeline. It copies each seed file into a `staging` table and then into the corresponding `SourceVault` table.

### 10. Run the Load Procedures

Execute the generated `dwh.load_<entity>` stored procedures to transform and load data into the DWH layer. Then verify the result, e.g.:

```sql
SELECT * FROM dwh.CustomerWithOrderCount;
```

## Customization

- **Add entities:** Define new source or DWH entities and mappings as `.cm` files in CrossModel, then re-run code generation to produce the corresponding SQL and pipeline activities.
- **Templates:** The Nunjucks templates in `CrossGenerate/template/` can be modified to change the generated SQL patterns or pipeline structure. For example you can create a pipeline template to execute the load procedures.
- **Connection settings:** If the target Fabric workspace, Lakehouse or SQL database changes, update the `CONNECTION SETTINGS` block in `CrossGenerate/template/pipeline.json` and re-generate.

## Documentation

See [Examples](https://help.crossmodel.io/examples/) for other ready-made workspaces.
