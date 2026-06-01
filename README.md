## Project Execution Flow (From Scratch)

### Step 1: Create Azure Resources

Create the following Azure services:

* Azure Data Factory
* Azure Data Lake Storage Gen2
* Azure Databricks (or Databricks Free Edition)
* Azure Synapse Analytics
* Power BI Workspace

---

### Step 2: Configure Storage

1. Create a Storage Account with Hierarchical Namespace enabled.
2. Create containers for:

   * bronze
   * silver
   * gold
3. Verify storage access.

---

### Step 3: Configure Security

1. Open Microsoft Entra ID.
2. Create an App Registration.
3. Generate a Client Secret.
4. Copy:

   * Tenant ID
   * Client ID
   * Client Secret
5. Assign **Storage Blob Data Contributor** role to the Service Principal through IAM.

---

### Step 4: Build Data Ingestion Pipeline

1. Create HTTP Linked Service in Azure Data Factory.
2. Create ADLS Gen2 Linked Service.
3. Create datasets for source and destination.
4. Create pipeline parameters.
5. Configure dynamic file paths.
6. Add ForEach activity.
7. Add Copy Data activity inside ForEach.
8. Execute pipeline.
9. Verify data is loaded into the Bronze layer.

---

### Step 5: Validate Bronze Layer

Check ADLS Gen2:

bronze/
├── customers
├── products
├── sales
└── calendar

Verify all files are successfully ingested.

---

### Step 6: Create Silver Layer in Databricks

1. Connect Databricks to ADLS Gen2.
2. Read Bronze layer files.
3. Apply transformations:

   * Remove duplicates
   * Handle null values
   * Standardize data types
   * Rename columns
   * Create derived columns
4. Save transformed data as Parquet files.
5. Store output in Silver layer.

Example Structure:

silver/
├── customers
├── products
├── sales
└── calendar

---

### Step 7: Validate Silver Layer

Verify:

* Data quality improvements
* Correct schema
* Successful transformation results

---

### Step 8: Create Gold Layer in Synapse Analytics

1. Connect Synapse to Silver layer.
2. Create SQL Views using OPENROWSET.
3. Validate view results.
4. Create External Tables using CETAS.
5. Store analytical datasets in Gold layer.

Example Structure:

gold/
├── customers
├── products
├── sales
└── calendar

---

### Step 9: Validate Gold Layer

Run SQL queries on:

* Customer Analysis
* Product Analysis
* Sales Analysis
* Revenue Analysis

Ensure all datasets return expected results.

---

### Step 10: Connect Power BI

1. Open Power BI Desktop.
2. Connect to Azure Synapse Analytics.
3. Import Gold layer tables.
4. Create relationships.
5. Build dashboard visuals.
6. Publish reports.

---

### Step 11: Dashboard Verification

Validate:

* KPI Cards
* Revenue Trends
* Product Performance
* Customer Insights
* Sales Analysis

---

### Step 12: End-to-End Pipeline Execution

Execution Order:

HTTP Source
↓
ADF Dynamic Pipeline
↓
Bronze Layer (ADLS Gen2)
↓
Databricks Transformations
↓
Silver Layer
↓
Synapse Views
↓
CETAS External Tables
↓
Gold Layer
↓
Power BI Dashboard

---

### Project Success Criteria

✓ Dynamic data ingestion completed

✓ Bronze layer populated

✓ Silver layer transformations completed

✓ Gold layer created successfully

✓ Synapse views validated

✓ External tables generated using CETAS

✓ Power BI dashboard connected

✓ End-to-end analytics pipeline operational
